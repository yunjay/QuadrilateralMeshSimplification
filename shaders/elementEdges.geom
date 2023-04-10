#version 460
layout (lines_adjacency) in;
layout (line_strip, max_vertices = 8) out;
in VS_OUT{
    vec4	vertex;
	vec3	Normal;		// per vertex normal vector
	//vec4	color;
}gs_in[4];
void main(){
    //traingle fan needs ordering. 0-1-3-2 or 1-0-2-3 etc
    //If a geometry shader is present, gl_PrimitiveID needs to be defined, or will be undefined.
    //gl_PrimitiveIDIn is a built in input.
    //gl_Position=gs_in[0].vertex;
    
    //gl_Position=gs_in[1].vertex;
    
    gl_Position=gl_in[0].gl_Position;
    EmitVertex();
    gl_Position=gl_in[1].gl_Position;
    EmitVertex();
    EndPrimitive();

    gl_Position=gl_in[1].gl_Position;
    EmitVertex();
    gl_Position=gl_in[2].gl_Position;
    EmitVertex();
    EndPrimitive();

    gl_Position=gl_in[2].gl_Position;
    EmitVertex();
	gl_Position=gl_in[3].gl_Position;
	EmitVertex();
	EndPrimitive();

    gl_Position=gl_in[3].gl_Position;
	EmitVertex();
    gl_Position=gl_in[0].gl_Position;
    EmitVertex();
    EndPrimitive();
}