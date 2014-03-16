#!/bin/bash

echo -e "\n-------------------------"
echo "Executing build script..."
echo -e "-------------------------"

echo -e "\n\nCleaning kernel source code"
make mrproper

echo -e "\n\nGenerating defconfig"
make cm_golden_defconfig

echo -e "\n\nBuilding kernel with duration"
time make -j5

echo -e "\n\nCopying zImage to generated folder"
cp arch/arm/boot/zImage generated/zImage

echo -e "\n\nCopying modules to generated folder"
find . -name "*.ko" -exec cp {} generated \;

echo -e "\n\nDone\n"
