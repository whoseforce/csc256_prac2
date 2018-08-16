    .data
        endl:    .asciiz  "\n"   # used for cout << endl;
        albl:    .asciiz  "Value of a: " # label for a
        blbl:    .asciiz  "Value of b: " # label for b
        clbl:    .asciiz  "Value of c: " # label for c
        dlbl:    .asciiz  "Value of d: " # label for d
    .text

# a --> $s0
# b --> $s1
# c --> $s2
# d --> $s3
main:    
    li   $s0, 5               # initialization
    li   $s1, 6
    li   $s2, 7
    li   $s3, -1
    li   $t0, 10

    bge  $s0, $t0, else0      # if (a >= 10), then jump to else0
    addi $s0, $s0, 1          # a++
    j    afterif0             # jump to afterif0
else0:
    addi $s0, $s0, -1         # a--
afterif0:
    add  $s3, $s0, $s2        # d = a + c
    add  $s2, $s0, $s3        # c = a + d

    bge  $s1, $t0, else1      # if (b >= 10), then jump to else1
    addi $s1, $s1, 1          # b++
    addi $s2, $s2, -1         # c--
    j    afterif1             # jump to afterif1
else1:
    addi $s1, $s1, -1         # b--
    addi $s2, $s2, 1          # c++
afterif1:
    add  $s0, $s2, $s1        # a = c + b
    add  $s1, $s2, $s3        # b = c + d

    bge  $s1, $s2, elseif2_0  # if (b >= c), then jump to elseif2_0
    ble  $s1, $s0, elseif2_0  # if (b <= a), then jump to elseif2_0
    add  $s3, $s0, $s1        # d = a + b
    j    exit                 # jump to exit
elseif2_0:
    bgt  $s1, $s2, elseif2_1  # if (b > c), then jump to elseif2_1
    bge  $s2, $s0, exit       # if (c >= a), then jump to exit
elseif2_1:
    add  $s3, $s1, $s2        # d = b + c

exit:
    la   $a0, albl      # puts albl into arg0 (a0 register) for cout
    addi $v0, $0, 4     # puts 4 in v0 which denotes we are printing a string
    syscall             # make a syscall to system
    
    move $a0, $s0       # puts a into arg0 (a0 register) for cout
    addi $v0, $0, 1     # puts 1 in v0 to denote we are printing an int 
    syscall             # make a syscall to system

    la   $a0, endl      # puts the address of the string endl into a0
    addi $v0, $0, 4     # puts 4 into v0 saying we are printing a string
    syscall

    la   $a0, blbl      # puts blbl into arg0 (a0 register) for cout
    addi $v0, $0, 4     # puts 4 in v0 which denotes we are printing an string
    syscall             # make a syscall to system
    
    move $a0, $s1       # puts b into arg0 (a0 register) for cout
    addi $v0, $0, 1     # puts 1 in v0 to denote we are printing an int 
    syscall             # make a syscall to system

    la   $a0, endl      # puts the address of the string endl into a0
    addi $v0, $0, 4     # puts 4 into v0 saying we are printing a string
    syscall

    la   $a0, clbl      # puts clbl into arg0 (a0 register) for cout
    addi $v0, $0, 4     # puts 4 in v0 which denotes we are printing a string
    syscall             # make a syscall to system
    
    move $a0, $s2       # puts c into arg0 (a0 register) for cout
    addi $v0, $0, 1     # puts 1 in v0 to denote we are printing an int 
    syscall             # make a syscall to system

    la   $a0, endl      # puts the address of the string endl into a0
    addi $v0, $0, 4     # puts 4 into v0 saying we are printing a string
    syscall

    la   $a0, dlbl      # puts dlbl into arg0 (a0 register) for cout
    addi $v0, $0, 4     # puts 4 in v0 which denotes we are printing a string
    syscall             # make a syscall to system
    
    move $a0, $s3       # puts d into arg0 (a0 register) for cout
    addi $v0, $0, 1     # puts 1 in v0 to denote we are printing an int 
    syscall             # make a syscall to system

    la   $a0, endl      # puts the address of the string endl into a0
    addi $v0, $0, 4     # puts 4 into v0 saying we are printing a string
    syscall
   
    addi $v0,$0, 10
    syscall