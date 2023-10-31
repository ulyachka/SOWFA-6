#!/usr/bin/env bash

# NB: %intel@18.0.4 has been removed at every line

# install dependencies for OpenFOAM-6
#nice spack install --only dependencies openfoam-org@6 +int64 +metis %intel@18.0.4
spack install --only dependencies openfoam-org@6 +int64 +metis
# install parmetis
spack install parmetis@4.0.3 +int64 +shared
# install CGAL (includes dependencies: boost, gmp, mpfr)
spack install cgal@4.13

# install OpenFAST dependencies
# no PIC (PIE) variant on my machine
#spack install hdf5@1.10.6 +cxx +fortran +hl -mpi +pic +shared +szip
#spack install hdf5@1.10.6 +cxx +fortran +hl -mpi +shared +szip

spack install hdf5@1.10.6 +cxx +fortran +hl ~ipo ~java -mpi +shared +szip +threadsafe +tool

# it will fail on build and require to crutch-patch two C headers,
# watch the build messages...
spack install libxml2@2.9.10 +python 

spack install yaml-cpp@0.6.3

# not found, but newer version should not hurt
#spack install zlib@1.2.11
spack install zlib@1.3

return

# all requirements mentoined in SOWFA enviroment script
spack install openmpi@4.0.4
spack install cgal@4.12
spack install boost@1.69.0
spack install mpfr@4.0.1
spack install gmp@6.1.2
spack install scotch@6.0.6
spack install metis@5.1.0
spack install parmetis@4.0.3
spack install flex@2.6.3
spack install hdf5@1.10.6
spack install openblas@0.3.5
spack install yaml-cpp@0.6.2
#spack install zlib@1.2.11
spack install libxml2@2.9.8
spack install cmake@3.13.3
spack install zoltan@3.83
