Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.24454.1608473714248266822
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 421B638C13C6
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:15 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.2.162.0 FAILED
Message-ID: <MADEUP.16527252BFF5F434.5278@lists.openembedded.org>
X-Groupsio-MsgNum: 145975
Content-Type: multipart/mixed; boundary="===============4186909543582277685=="

--===============4186909543582277685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-tools* to *1.2.162.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.2.154.0-1.2.162.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============4186909543582277685==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.2.154.0-1.2.162.0.patch"

From e3b0fa54bc9e8a3428997d36ee37e25ec62a17f4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 09:11:09 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.2.154.0 -> 1.2.162.0

---
 .../{vulkan-tools_1.2.154.0.bb => vulkan-tools_1.2.162.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.2.154.0.bb => vulkan-tools_1.2.162.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.0.bb
index 0fc3494eea..972859c934 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.0.bb
@@ -5,8 +5,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.154"
-SRCREV = "10d757bb1072416ddfbe4c24b43d4cd2f808a5c7"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.162"
+SRCREV = "9e9d7c24ed8b321815f77f31c100bbf9462193b4"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


--===============4186909543582277685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1416 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (806 cached, 1 parsed). 1416 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-4021d01fe283abd9054958e230f94036b23f6dd9"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4021d01fe283abd9054958e230f94036b23f6dd9"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 216 Found 207 Missed 9 Current 515 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1562 of 2304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.0.bb:do_fetch)
NOTE: recipe vulkan-tools-1.2.162.0-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.2.162.0-r0: task do_fetch: Succeeded
NOTE: Running task 2290 of 2304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.0.bb:do_unpack)
NOTE: Running task 2291 of 2304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.2.162.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.2.162.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.2.162.0-r0: task do_unpack: Succeeded
NOTE: Running task 2292 of 2304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.0.bb:do_patch)
NOTE: recipe vulkan-tools-1.2.162.0-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.2.162.0-r0: task do_patch: Succeeded
NOTE: Running task 2293 of 2304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.0.bb:do_generate_toolchain_file)
NOTE: Running task 2294 of 2304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2295 of 2304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.0.bb:do_populate_lic)
NOTE: recipe vulkan-tools-1.2.162.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.2.162.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.2.162.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.2.162.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-tools-1.2.162.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.2.162.0-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-tools-1.2.162.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2296 of 2304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.2.162.0-r0: task do_configure: Started
NOTE: recipe vulkan-tools-1.2.162.0-r0: task do_configure: Succeeded
NOTE: Running task 2297 of 2304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.0.bb:do_compile)
NOTE: recipe vulkan-tools-1.2.162.0-r0: task do_compile: Started
ERROR: vulkan-tools-1.2.162.0-r0 do_compile: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/temp/run.do_compile.2131' failed with exit code 1:
[1/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-too
 ls/1.2.162.0-r0=/usr/src/debug/vulkan-tools/1.2.162.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0=/usr/src/debug/vulkan-tools/1.2.162.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wi
 mplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp
FAILED: vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2
 .162.0-r0=/usr/src/debug/vulkan-tools/1.2.162.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0=/usr/src/debug/vulkan-tools/1.2.162.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplici
 t-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:980:89: error: 'VkPhysicalDeviceAccelerationStructureFeaturesKHR' has not been declared
  980 | void DumpVkPhysicalDeviceAccelerationStructureFeaturesKHR(Printer &p, std::string name, VkPhysicalDeviceAccelerationStructureFeaturesKHR &obj) {
      |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceAccelerationStructureFeaturesKHR(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:982:67: error: request for member 'accelerationStructure' in 'obj', which is of non-class type 'int'
  982 |     p.PrintKeyBool("accelerationStructure", static_cast<bool>(obj.accelerationStructure), 53);
      |                                                                   ^~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:983:80: error: request for member 'accelerationStructureCaptureReplay' in 'obj', which is of non-class type 'int'
  983 |     p.PrintKeyBool("accelerationStructureCaptureReplay", static_cast<bool>(obj.accelerationStructureCaptureReplay), 53);
      |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:984:80: error: request for member 'accelerationStructureIndirectBuild' in 'obj', which is of non-class type 'int'
  984 |     p.PrintKeyBool("accelerationStructureIndirectBuild", static_cast<bool>(obj.accelerationStructureIndirectBuild), 53);
      |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:985:79: error: request for member 'accelerationStructureHostCommands' in 'obj', which is of non-class type 'int'
  985 |     p.PrintKeyBool("accelerationStructureHostCommands", static_cast<bool>(obj.accelerationStructureHostCommands), 53);
      |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:986:99: error: request for member 'descriptorBindingAccelerationStructureUpdateAfterBind' in 'obj', which is of non-class type 'int'
  986 |     p.PrintKeyBool("descriptorBindingAccelerationStructureUpdateAfterBind", static_cast<bool>(obj.descriptorBindingAccelerationStructureUpdateAfterBind), 53);
      |                                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:988:91: error: 'VkPhysicalDeviceAccelerationStructurePropertiesKHR' has not been declared
  988 | void DumpVkPhysicalDeviceAccelerationStructurePropertiesKHR(Printer &p, std::string name, VkPhysicalDeviceAccelerationStructurePropertiesKHR &obj) {
      |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceAccelerationStructurePropertiesKHR(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:990:45: error: request for member 'maxGeometryCount' in 'obj', which is of non-class type 'int'
  990 |     p.PrintKeyValue("maxGeometryCount", obj.maxGeometryCount, 58);
      |                                             ^~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:991:45: error: request for member 'maxInstanceCount' in 'obj', which is of non-class type 'int'
  991 |     p.PrintKeyValue("maxInstanceCount", obj.maxInstanceCount, 58);
      |                                             ^~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:992:46: error: request for member 'maxPrimitiveCount' in 'obj', which is of non-class type 'int'
  992 |     p.PrintKeyValue("maxPrimitiveCount", obj.maxPrimitiveCount, 58);
      |                                              ^~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:993:72: error: request for member 'maxPerStageDescriptorAccelerationStructures' in 'obj', which is of non-class type 'int'
  993 |     p.PrintKeyValue("maxPerStageDescriptorAccelerationStructures", obj.maxPerStageDescriptorAccelerationStructures, 58);
      |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:994:87: error: request for member 'maxPerStageDescriptorUpdateAfterBindAccelerationStructures' in 'obj', which is of non-class type 'int'
  994 |     p.PrintKeyValue("maxPerStageDescriptorUpdateAfterBindAccelerationStructures", obj.maxPerStageDescriptorUpdateAfterBindAccelerationStructures, 58);
      |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:995:67: error: request for member 'maxDescriptorSetAccelerationStructures' in 'obj', which is of non-class type 'int'
  995 |     p.PrintKeyValue("maxDescriptorSetAccelerationStructures", obj.maxDescriptorSetAccelerationStructures, 58);
      |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:996:82: error: request for member 'maxDescriptorSetUpdateAfterBindAccelerationStructures' in 'obj', which is of non-class type 'int'
  996 |     p.PrintKeyValue("maxDescriptorSetUpdateAfterBindAccelerationStructures", obj.maxDescriptorSetUpdateAfterBindAccelerationStructures, 58);
      |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:997:75: error: request for member 'minAccelerationStructureScratchOffsetAlignment' in 'obj', which is of non-class type 'int'
  997 |     p.PrintKeyValue("minAccelerationStructureScratchOffsetAlignment", obj.minAccelerationStructureScratchOffsetAlignment, 58);
      |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1110:86: error: 'VkPhysicalDeviceDeviceMemoryReportFeaturesEXT' has not been declared
 1110 | void DumpVkPhysicalDeviceDeviceMemoryReportFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceDeviceMemoryReportFeaturesEXT &obj) {
      |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceDeviceMemoryReportFeaturesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1112:64: error: request for member 'deviceMemoryReport' in 'obj', which is of non-class type 'int'
 1112 |     p.PrintKeyBool("deviceMemoryReport", static_cast<bool>(obj.deviceMemoryReport), 18);
      |                                                                ^~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1240:87: error: 'VkPhysicalDeviceFragmentShadingRateFeaturesKHR' has not been declared
 1240 | void DumpVkPhysicalDeviceFragmentShadingRateFeaturesKHR(Printer &p, std::string name, VkPhysicalDeviceFragmentShadingRateFeaturesKHR &obj) {
      |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceFragmentShadingRateFeaturesKHR(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1242:73: error: request for member 'pipelineFragmentShadingRate' in 'obj', which is of non-class type 'int'
 1242 |     p.PrintKeyBool("pipelineFragmentShadingRate", static_cast<bool>(obj.pipelineFragmentShadingRate), 29);
      |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1243:74: error: request for member 'primitiveFragmentShadingRate' in 'obj', which is of non-class type 'int'
 1243 |     p.PrintKeyBool("primitiveFragmentShadingRate", static_cast<bool>(obj.primitiveFragmentShadingRate), 29);
      |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1244:75: error: request for member 'attachmentFragmentShadingRate' in 'obj', which is of non-class type 'int'
 1244 |     p.PrintKeyBool("attachmentFragmentShadingRate", static_cast<bool>(obj.attachmentFragmentShadingRate), 29);
      |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1246:89: error: 'VkPhysicalDeviceFragmentShadingRatePropertiesKHR' has not been declared
 1246 | void DumpVkPhysicalDeviceFragmentShadingRatePropertiesKHR(Printer &p, std::string name, VkPhysicalDeviceFragmentShadingRatePropertiesKHR &obj) {
      |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceFragmentShadingRatePropertiesKHR(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1248:72: error: request for member 'minFragmentShadingRateAttachmentTexelSize' in 'obj', which is of non-class type 'int'
 1248 |     DumpVkExtent2D(p, "minFragmentShadingRateAttachmentTexelSize", obj.minFragmentShadingRateAttachmentTexelSize);
      |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1249:72: error: request for member 'maxFragmentShadingRateAttachmentTexelSize' in 'obj', which is of non-class type 'int'
 1249 |     DumpVkExtent2D(p, "maxFragmentShadingRateAttachmentTexelSize", obj.maxFragmentShadingRateAttachmentTexelSize);
      |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1250:81: error: request for member 'maxFragmentShadingRateAttachmentTexelSizeAspectRatio' in 'obj', which is of non-class type 'int'
 1250 |     p.PrintKeyValue("maxFragmentShadingRateAttachmentTexelSizeAspectRatio", obj.maxFragmentShadingRateAttachmentTexelSizeAspectRatio, 52);
      |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1251:95: error: request for member 'primitiveFragmentShadingRateWithMultipleViewports' in 'obj', which is of non-class type 'int'
 1251 |     p.PrintKeyBool("primitiveFragmentShadingRateWithMultipleViewports", static_cast<bool>(obj.primitiveFragmentShadingRateWithMultipleViewports), 52);
      |                                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1252:75: error: request for member 'layeredShadingRateAttachments' in 'obj', which is of non-class type 'int'
 1252 |     p.PrintKeyBool("layeredShadingRateAttachments", static_cast<bool>(obj.layeredShadingRateAttachments), 52);
      |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1253:86: error: request for member 'fragmentShadingRateNonTrivialCombinerOps' in 'obj', which is of non-class type 'int'
 1253 |     p.PrintKeyBool("fragmentShadingRateNonTrivialCombinerOps", static_cast<bool>(obj.fragmentShadingRateNonTrivialCombinerOps), 52);
      |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1254:46: error: request for member 'maxFragmentSize' in 'obj', which is of non-class type 'int'
 1254 |     DumpVkExtent2D(p, "maxFragmentSize", obj.maxFragmentSize);
      |                                              ^~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1255:55: error: request for member 'maxFragmentSizeAspectRatio' in 'obj', which is of non-class type 'int'
 1255 |     p.PrintKeyValue("maxFragmentSizeAspectRatio", obj.maxFragmentSizeAspectRatio, 52);
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1256:66: error: request for member 'maxFragmentShadingRateCoverageSamples' in 'obj', which is of non-class type 'int'
 1256 |     p.PrintKeyValue("maxFragmentShadingRateCoverageSamples", obj.maxFragmentShadingRateCoverageSamples, 52);
      |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1257:84: error: request for member 'maxFragmentShadingRateRasterizationSamples' in 'obj', which is of non-class type 'int'
 1257 |     DumpVkSampleCountFlagBits(p, "maxFragmentShadingRateRasterizationSamples", obj.maxFragmentShadingRateRasterizationSamples, 52);
      |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1258:93: error: request for member 'fragmentShadingRateWithShaderDepthStencilWrites' in 'obj', which is of non-class type 'int'
 1258 |     p.PrintKeyBool("fragmentShadingRateWithShaderDepthStencilWrites", static_cast<bool>(obj.fragmentShadingRateWithShaderDepthStencilWrites), 52);
      |                                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1259:79: error: request for member 'fragmentShadingRateWithSampleMask' in 'obj', which is of non-class type 'int'
 1259 |     p.PrintKeyBool("fragmentShadingRateWithSampleMask", static_cast<bool>(obj.fragmentShadingRateWithSampleMask), 52);
      |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1260:85: error: request for member 'fragmentShadingRateWithShaderSampleMask' in 'obj', which is of non-class type 'int'
 1260 |     p.PrintKeyBool("fragmentShadingRateWithShaderSampleMask", static_cast<bool>(obj.fragmentShadingRateWithShaderSampleMask), 52);
      |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1261:94: error: request for member 'fragmentShadingRateWithConservativeRasterization' in 'obj', which is of non-class type 'int'
 1261 |     p.PrintKeyBool("fragmentShadingRateWithConservativeRasterization", static_cast<bool>(obj.fragmentShadingRateWithConservativeRasterization), 52);
      |                                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1262:92: error: request for member 'fragmentShadingRateWithFragmentShaderInterlock' in 'obj', which is of non-class type 'int'
 1262 |     p.PrintKeyBool("fragmentShadingRateWithFragmentShaderInterlock", static_cast<bool>(obj.fragmentShadingRateWithFragmentShaderInterlock), 52);
      |                                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1263:90: error: request for member 'fragmentShadingRateWithCustomSampleLocations' in 'obj', which is of non-class type 'int'
 1263 |     p.PrintKeyBool("fragmentShadingRateWithCustomSampleLocations", static_cast<bool>(obj.fragmentShadingRateWithCustomSampleLocations), 52);
      |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1264:87: error: request for member 'fragmentShadingRateStrictMultiplyCombiner' in 'obj', which is of non-class type 'int'
 1264 |     p.PrintKeyBool("fragmentShadingRateStrictMultiplyCombiner", static_cast<bool>(obj.fragmentShadingRateStrictMultiplyCombiner), 52);
      |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1578:76: error: 'VkPhysicalDeviceRayQueryFeaturesKHR' has not been declared
 1578 | void DumpVkPhysicalDeviceRayQueryFeaturesKHR(Printer &p, std::string name, VkPhysicalDeviceRayQueryFeaturesKHR &obj) {
      |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRayQueryFeaturesKHR(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1580:54: error: request for member 'rayQuery' in 'obj', which is of non-class type 'int'
 1580 |     p.PrintKeyBool("rayQuery", static_cast<bool>(obj.rayQuery), 8);
      |                                                      ^~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1582:86: error: 'VkPhysicalDeviceRayTracingPipelineFeaturesKHR' has not been declared
 1582 | void DumpVkPhysicalDeviceRayTracingPipelineFeaturesKHR(Printer &p, std::string name, VkPhysicalDeviceRayTracingPipelineFeaturesKHR &obj) {
      |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRayTracingPipelineFeaturesKHR(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1584:64: error: request for member 'rayTracingPipeline' in 'obj', which is of non-class type 'int'
 1584 |     p.PrintKeyBool("rayTracingPipeline", static_cast<bool>(obj.rayTracingPipeline), 53);
      |                                                                ^~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1585:94: error: request for member 'rayTracingPipelineShaderGroupHandleCaptureReplay' in 'obj', which is of non-class type 'int'
 1585 |     p.PrintKeyBool("rayTracingPipelineShaderGroupHandleCaptureReplay", static_cast<bool>(obj.rayTracingPipelineShaderGroupHandleCaptureReplay), 53);
      |                                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1586:99: error: request for member 'rayTracingPipelineShaderGroupHandleCaptureReplayMixed' in 'obj', which is of non-class type 'int'
 1586 |     p.PrintKeyBool("rayTracingPipelineShaderGroupHandleCaptureReplayMixed", static_cast<bool>(obj.rayTracingPipelineShaderGroupHandleCaptureReplayMixed), 53);
      |                                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1587:81: error: request for member 'rayTracingPipelineTraceRaysIndirect' in 'obj', which is of non-class type 'int'
 1587 |     p.PrintKeyBool("rayTracingPipelineTraceRaysIndirect", static_cast<bool>(obj.rayTracingPipelineTraceRaysIndirect), 53);
      |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1588:74: error: request for member 'rayTraversalPrimitiveCulling' in 'obj', which is of non-class type 'int'
 1588 |     p.PrintKeyBool("rayTraversalPrimitiveCulling", static_cast<bool>(obj.rayTraversalPrimitiveCulling), 53);
      |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1590:88: error: 'VkPhysicalDeviceRayTracingPipelinePropertiesKHR' has not been declared
 1590 | void DumpVkPhysicalDeviceRayTracingPipelinePropertiesKHR(Printer &p, std::string name, VkPhysicalDeviceRayTracingPipelinePropertiesKHR &obj) {
      |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRayTracingPipelinePropertiesKHR(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1592:50: error: request for member 'shaderGroupHandleSize' in 'obj', which is of non-class type 'int'
 1592 |     p.PrintKeyValue("shaderGroupHandleSize", obj.shaderGroupHandleSize, 34);
      |                                                  ^~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1593:49: error: request for member 'maxRayRecursionDepth' in 'obj', which is of non-class type 'int'
 1593 |     p.PrintKeyValue("maxRayRecursionDepth", obj.maxRayRecursionDepth, 34);
      |                                                 ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1594:49: error: request for member 'maxShaderGroupStride' in 'obj', which is of non-class type 'int'
 1594 |     p.PrintKeyValue("maxShaderGroupStride", obj.maxShaderGroupStride, 34);
      |                                                 ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1595:53: error: request for member 'shaderGroupBaseAlignment' in 'obj', which is of non-class type 'int'
 1595 |     p.PrintKeyValue("shaderGroupBaseAlignment", obj.shaderGroupBaseAlignment, 34);
      |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1596:63: error: request for member 'shaderGroupHandleCaptureReplaySize' in 'obj', which is of non-class type 'int'
 1596 |     p.PrintKeyValue("shaderGroupHandleCaptureReplaySize", obj.shaderGroupHandleCaptureReplaySize, 34);
      |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1597:58: error: request for member 'maxRayDispatchInvocationCount' in 'obj', which is of non-class type 'int'
 1597 |     p.PrintKeyValue("maxRayDispatchInvocationCount", obj.maxRayDispatchInvocationCount, 34);
      |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1598:55: error: request for member 'shaderGroupHandleAlignment' in 'obj', which is of non-class type 'int'
 1598 |     p.PrintKeyValue("shaderGroupHandleAlignment", obj.shaderGroupHandleAlignment, 34);
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1599:51: error: request for member 'maxRayHitAttributeSize' in 'obj', which is of non-class type 'int'
 1599 |     p.PrintKeyValue("maxRayHitAttributeSize", obj.maxRayHitAttributeSize, 34);
      |                                                   ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1678:90: error: 'VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT' has not been declared
 1678 | void DumpVkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT &obj) {
      |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1680:69: error: request for member 'shaderImageInt64Atomics' in 'obj', which is of non-class type 'int'
 1680 |     p.PrintKeyBool("shaderImageInt64Atomics", static_cast<bool>(obj.shaderImageInt64Atomics), 23);
      |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1681:69: error: request for member 'sparseImageInt64Atomics' in 'obj', which is of non-class type 'int'
 1681 |     p.PrintKeyBool("sparseImageInt64Atomics", static_cast<bool>(obj.sparseImageInt64Atomics), 23);
      |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1687:93: error: 'VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR' has not been declared
 1687 | void DumpVkPhysicalDeviceShaderTerminateInvocationFeaturesKHR(Printer &p, std::string name, VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR &obj) {
      |                                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderTerminateInvocationFeaturesKHR(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1689:71: error: request for member 'shaderTerminateInvocation' in 'obj', which is of non-class type 'int'
 1689 |     p.PrintKeyBool("shaderTerminateInvocation", static_cast<bool>(obj.shaderTerminateInvocation), 25);
      |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'pNextChainInfos get_chain_infos()':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1972:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR'?
 1972 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR, sizeof(VkPhysicalDeviceAccelerationStructurePropertiesKHR)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1972:90: error: 'VkPhysicalDeviceAccelerationStructurePropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceAccelerationStructurePropertiesKHR'?
 1972 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR, sizeof(VkPhysicalDeviceAccelerationStructurePropertiesKHR)},
      |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                          DumpVkPhysicalDeviceAccelerationStructurePropertiesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1984:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
 1984 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR, sizeof(VkPhysicalDeviceFragmentShadingRatePropertiesKHR)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1984:89: error: 'VkPhysicalDeviceFragmentShadingRatePropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceFragmentShadingRatePropertiesKHR'?
 1984 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR, sizeof(VkPhysicalDeviceFragmentShadingRatePropertiesKHR)},
      |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                         DumpVkPhysicalDeviceFragmentShadingRatePropertiesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1998:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_KHR'?
 1998 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR, sizeof(VkPhysicalDeviceRayTracingPipelinePropertiesKHR)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1998:88: error: 'VkPhysicalDeviceRayTracingPipelinePropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRayTracingPipelinePropertiesKHR'?
 1998 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR, sizeof(VkPhysicalDeviceRayTracingPipelinePropertiesKHR)},
      |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                        DumpVkPhysicalDeviceRayTracingPipelinePropertiesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2010:5: error: no match for 'operator=' (operand types are 'std::vector<pNextChainBuildingBlockInfo>' and '<brace-enclosed initializer list>')
 2010 |     };
      |     ^
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/vector:72,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.h:39,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/vector.tcc:198:5: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(const std::vector<_Tp, _Alloc>&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
  198 |     vector<_Tp, _Alloc>::
      |     ^~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/vector.tcc:199:42: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'const std::vector<pNextChainBuildingBlockInfo>&'
  199 |     operator=(const vector<_Tp, _Alloc>& __x)
      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/vector:67,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.h:39,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:709:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::vector<_Tp, _Alloc>&&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
  709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
      |       ^~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:709:26: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::vector<pNextChainBuildingBlockInfo>&&'
  709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
      |                 ~~~~~~~~~^~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:730:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::initializer_list<_Tp>) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
  730 |       operator=(initializer_list<value_type> __l)
      |       ^~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:730:46: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::initializer_list<pNextChainBuildingBlockInfo>'
  730 |       operator=(initializer_list<value_type> __l)
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2019:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR'?
 2019 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR, sizeof(VkPhysicalDeviceAccelerationStructureFeaturesKHR)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2019:88: error: 'VkPhysicalDeviceAccelerationStructureFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceAccelerationStructureFeaturesKHR'?
 2019 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR, sizeof(VkPhysicalDeviceAccelerationStructureFeaturesKHR)},
      |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                        DumpVkPhysicalDeviceAccelerationStructureFeaturesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2027:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT'?
 2027 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT, sizeof(VkPhysicalDeviceDeviceMemoryReportFeaturesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2027:86: error: 'VkPhysicalDeviceDeviceMemoryReportFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceDeviceMemoryReportFeaturesEXT'?
 2027 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT, sizeof(VkPhysicalDeviceDeviceMemoryReportFeaturesEXT)},
      |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                      DumpVkPhysicalDeviceDeviceMemoryReportFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2032:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT'?
 2032 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR, sizeof(VkPhysicalDeviceFragmentShadingRateFeaturesKHR)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2032:87: error: 'VkPhysicalDeviceFragmentShadingRateFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceFragmentShadingRateFeaturesKHR'?
 2032 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR, sizeof(VkPhysicalDeviceFragmentShadingRateFeaturesKHR)},
      |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                       DumpVkPhysicalDeviceFragmentShadingRateFeaturesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2049:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR'?
 2049 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR, sizeof(VkPhysicalDeviceRayQueryFeaturesKHR)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2049:75: error: 'VkPhysicalDeviceRayQueryFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRayQueryFeaturesKHR'?
 2049 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR, sizeof(VkPhysicalDeviceRayQueryFeaturesKHR)},
      |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                           DumpVkPhysicalDeviceRayQueryFeaturesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2050:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR'?
 2050 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR, sizeof(VkPhysicalDeviceRayTracingPipelineFeaturesKHR)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2050:86: error: 'VkPhysicalDeviceRayTracingPipelineFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRayTracingPipelineFeaturesKHR'?
 2050 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR, sizeof(VkPhysicalDeviceRayTracingPipelineFeaturesKHR)},
      |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                      DumpVkPhysicalDeviceRayTracingPipelineFeaturesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2061:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
 2061 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT, sizeof(VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2061:91: error: 'VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT'?
 2061 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT, sizeof(VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT)},
      |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                           DumpVkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2063:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
 2063 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR, sizeof(VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2063:93: error: 'VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderTerminateInvocationFeaturesKHR'?
 2063 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR, sizeof(VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR)},
      |                                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                             DumpVkPhysicalDeviceShaderTerminateInvocationFeaturesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2076:5: error: no match for 'operator=' (operand types are 'std::vector<pNextChainBuildingBlockInfo>' and '<brace-enclosed initializer list>')
 2076 |     };
      |     ^
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/vector:72,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.h:39,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/vector.tcc:198:5: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(const std::vector<_Tp, _Alloc>&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
  198 |     vector<_Tp, _Alloc>::
      |     ^~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/vector.tcc:199:42: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'const std::vector<pNextChainBuildingBlockInfo>&'
  199 |     operator=(const vector<_Tp, _Alloc>& __x)
      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/vector:67,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.h:39,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:709:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::vector<_Tp, _Alloc>&&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
  709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
      |       ^~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:709:26: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::vector<pNextChainBuildingBlockInfo>&&'
  709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
      |                 ~~~~~~~~~^~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:730:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::initializer_list<_Tp>) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
  730 |       operator=(initializer_list<value_type> __l)
      |       ^~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:730:46: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::initializer_list<pNextChainBuildingBlockInfo>'
  730 |       operator=(initializer_list<value_type> __l)
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_props2(Printer&, AppInstance&, AppGpu&, void*, VulkanVersion)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2093:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR'?
 2093 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2094:54: error: 'VK_KHR_ACCELERATION_STRUCTURE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_COPY_ACCELERATION_STRUCTURE_MODE_CLONE_NV'?
 2094 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_ACCELERATION_STRUCTURE_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_COPY_ACCELERATION_STRUCTURE_MODE_CLONE_NV
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2095:13: error: 'VkPhysicalDeviceAccelerationStructurePropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceAccelerationStructurePropertiesKHR'?
 2095 |             VkPhysicalDeviceAccelerationStructurePropertiesKHR* props = (VkPhysicalDeviceAccelerationStructurePropertiesKHR*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceAccelerationStructurePropertiesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2095:65: error: 'props' was not declared in this scope
 2095 |             VkPhysicalDeviceAccelerationStructurePropertiesKHR* props = (VkPhysicalDeviceAccelerationStructurePropertiesKHR*)structure;
      |                                                                 ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2095:125: error: expected primary-expression before ')' token
 2095 |             VkPhysicalDeviceAccelerationStructurePropertiesKHR* props = (VkPhysicalDeviceAccelerationStructurePropertiesKHR*)structure;
      |                                                                                                                             ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2169:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
 2169 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2170:54: error: 'VK_KHR_FRAGMENT_SHADING_RATE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME'?
 2170 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_FRAGMENT_SHADING_RATE_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2171:13: error: 'VkPhysicalDeviceFragmentShadingRatePropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceFragmentShadingRatePropertiesKHR'?
 2171 |             VkPhysicalDeviceFragmentShadingRatePropertiesKHR* props = (VkPhysicalDeviceFragmentShadingRatePropertiesKHR*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceFragmentShadingRatePropertiesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2171:63: error: 'props' was not declared in this scope
 2171 |             VkPhysicalDeviceFragmentShadingRatePropertiesKHR* props = (VkPhysicalDeviceFragmentShadingRatePropertiesKHR*)structure;
      |                                                               ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2171:121: error: expected primary-expression before ')' token
 2171 |             VkPhysicalDeviceFragmentShadingRatePropertiesKHR* props = (VkPhysicalDeviceFragmentShadingRatePropertiesKHR*)structure;
      |                                                                                                                         ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2247:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_KHR'?
 2247 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2248:54: error: 'VK_KHR_RAY_TRACING_PIPELINE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_RAY_TRACING_EXTENSION_NAME'?
 2248 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_RAY_TRACING_PIPELINE_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_KHR_RAY_TRACING_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2249:13: error: 'VkPhysicalDeviceRayTracingPipelinePropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRayTracingPipelinePropertiesKHR'?
 2249 |             VkPhysicalDeviceRayTracingPipelinePropertiesKHR* props = (VkPhysicalDeviceRayTracingPipelinePropertiesKHR*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceRayTracingPipelinePropertiesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2249:62: error: 'props' was not declared in this scope
 2249 |             VkPhysicalDeviceRayTracingPipelinePropertiesKHR* props = (VkPhysicalDeviceRayTracingPipelinePropertiesKHR*)structure;
      |                                                              ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2249:119: error: expected primary-expression before ')' token
 2249 |             VkPhysicalDeviceRayTracingPipelinePropertiesKHR* props = (VkPhysicalDeviceRayTracingPipelinePropertiesKHR*)structure;
      |                                                                                                                       ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, void*, VulkanVersion)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2367:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR'?
 2367 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2368:54: error: 'VK_KHR_ACCELERATION_STRUCTURE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_COPY_ACCELERATION_STRUCTURE_MODE_CLONE_NV'?
 2368 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_ACCELERATION_STRUCTURE_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_COPY_ACCELERATION_STRUCTURE_MODE_CLONE_NV
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2369:13: error: 'VkPhysicalDeviceAccelerationStructureFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceAccelerationStructureFeaturesKHR'?
 2369 |             VkPhysicalDeviceAccelerationStructureFeaturesKHR* props = (VkPhysicalDeviceAccelerationStructureFeaturesKHR*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceAccelerationStructureFeaturesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2369:63: error: 'props' was not declared in this scope
 2369 |             VkPhysicalDeviceAccelerationStructureFeaturesKHR* props = (VkPhysicalDeviceAccelerationStructureFeaturesKHR*)structure;
      |                                                               ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2369:121: error: expected primary-expression before ')' token
 2369 |             VkPhysicalDeviceAccelerationStructureFeaturesKHR* props = (VkPhysicalDeviceAccelerationStructureFeaturesKHR*)structure;
      |                                                                                                                         ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2417:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT'?
 2417 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2418:54: error: 'VK_EXT_DEVICE_MEMORY_REPORT_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEBUG_REPORT_EXTENSION_NAME'?
 2418 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_DEVICE_MEMORY_REPORT_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_EXT_DEBUG_REPORT_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2419:13: error: 'VkPhysicalDeviceDeviceMemoryReportFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceDeviceMemoryReportFeaturesEXT'?
 2419 |             VkPhysicalDeviceDeviceMemoryReportFeaturesEXT* props = (VkPhysicalDeviceDeviceMemoryReportFeaturesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceDeviceMemoryReportFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2419:60: error: 'props' was not declared in this scope
 2419 |             VkPhysicalDeviceDeviceMemoryReportFeaturesEXT* props = (VkPhysicalDeviceDeviceMemoryReportFeaturesEXT*)structure;
      |                                                            ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2419:115: error: expected primary-expression before ')' token
 2419 |             VkPhysicalDeviceDeviceMemoryReportFeaturesEXT* props = (VkPhysicalDeviceDeviceMemoryReportFeaturesEXT*)structure;
      |                                                                                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2447:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT'?
 2447 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2448:54: error: 'VK_KHR_FRAGMENT_SHADING_RATE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME'?
 2448 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_FRAGMENT_SHADING_RATE_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2449:13: error: 'VkPhysicalDeviceFragmentShadingRateFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceFragmentShadingRateFeaturesKHR'?
 2449 |             VkPhysicalDeviceFragmentShadingRateFeaturesKHR* props = (VkPhysicalDeviceFragmentShadingRateFeaturesKHR*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceFragmentShadingRateFeaturesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2449:61: error: 'props' was not declared in this scope
 2449 |             VkPhysicalDeviceFragmentShadingRateFeaturesKHR* props = (VkPhysicalDeviceFragmentShadingRateFeaturesKHR*)structure;
      |                                                             ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2449:117: error: expected primary-expression before ')' token
 2449 |             VkPhysicalDeviceFragmentShadingRateFeaturesKHR* props = (VkPhysicalDeviceFragmentShadingRateFeaturesKHR*)structure;
      |                                                                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2542:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR'?
 2542 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2543:54: error: 'VK_KHR_RAY_QUERY_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_RAY_TRACING_EXTENSION_NAME'?
 2543 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_RAY_QUERY_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_KHR_RAY_TRACING_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2544:13: error: 'VkPhysicalDeviceRayQueryFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRayQueryFeaturesKHR'?
 2544 |             VkPhysicalDeviceRayQueryFeaturesKHR* props = (VkPhysicalDeviceRayQueryFeaturesKHR*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceRayQueryFeaturesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2544:50: error: 'props' was not declared in this scope
 2544 |             VkPhysicalDeviceRayQueryFeaturesKHR* props = (VkPhysicalDeviceRayQueryFeaturesKHR*)structure;
      |                                                  ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2544:95: error: expected primary-expression before ')' token
 2544 |             VkPhysicalDeviceRayQueryFeaturesKHR* props = (VkPhysicalDeviceRayQueryFeaturesKHR*)structure;
      |                                                                                               ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2548:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR'?
 2548 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2549:54: error: 'VK_KHR_RAY_TRACING_PIPELINE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_RAY_TRACING_EXTENSION_NAME'?
 2549 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_RAY_TRACING_PIPELINE_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_KHR_RAY_TRACING_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2550:13: error: 'VkPhysicalDeviceRayTracingPipelineFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRayTracingPipelineFeaturesKHR'?
 2550 |             VkPhysicalDeviceRayTracingPipelineFeaturesKHR* props = (VkPhysicalDeviceRayTracingPipelineFeaturesKHR*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceRayTracingPipelineFeaturesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2550:60: error: 'props' was not declared in this scope
 2550 |             VkPhysicalDeviceRayTracingPipelineFeaturesKHR* props = (VkPhysicalDeviceRayTracingPipelineFeaturesKHR*)structure;
      |                                                            ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2550:115: error: expected primary-expression before ')' token
 2550 |             VkPhysicalDeviceRayTracingPipelineFeaturesKHR* props = (VkPhysicalDeviceRayTracingPipelineFeaturesKHR*)structure;
      |                                                                                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2619:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
 2619 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2620:54: error: 'VK_EXT_SHADER_IMAGE_ATOMIC_INT64_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME'?
 2620 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_SHADER_IMAGE_ATOMIC_INT64_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2621:13: error: 'VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT'?
 2621 |             VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT* props = (VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2621:64: error: 'props' was not declared in this scope
 2621 |             VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT* props = (VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT*)structure;
      |                                                                ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2621:123: error: expected primary-expression before ')' token
 2621 |             VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT* props = (VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT*)structure;
      |                                                                                                                           ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2632:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
 2632 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2633:54: error: 'VK_KHR_SHADER_TERMINATE_INVOCATION_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME'?
 2633 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_SHADER_TERMINATE_INVOCATION_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2634:13: error: 'VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderTerminateInvocationFeaturesKHR'?
 2634 |             VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR* props = (VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceShaderTerminateInvocationFeaturesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2634:67: error: 'props' was not declared in this scope
 2634 |             VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR* props = (VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR*)structure;
      |                                                                   ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2634:129: error: expected primary-expression before ')' token
 2634 |             VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR* props = (VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR*)structure;
      |                                                                                                                                 ^
[2/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd -Iicd -I. -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.
 162.0-r0=/usr/src/debug/vulkan-tools/1.2.162.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0=/usr/src/debug/vulkan-tools/1.2.162.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit
 -fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp
FAILED: icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd -Iicd -I. -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-
 r0=/usr/src/debug/vulkan-tools/1.2.162.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0=/usr/src/debug/vulkan-tools/1.2.162.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallt
 hrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:22:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:1872:5: error: 'VkPhysicalDeviceFragmentShadingRateKHR' has not been declared
 1872 |     VkPhysicalDeviceFragmentShadingRateKHR*     pFragmentShadingRates);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:1877:11: error: 'VkFragmentShadingRateCombinerOpKHR' does not name a type
 1877 |     const VkFragmentShadingRateCombinerOpKHR    combinerOps[2]);
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2863:5: error: 'VkFragmentShadingRateNV' has not been declared
 2863 |     VkFragmentShadingRateNV                     shadingRate,
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2864:11: error: 'VkFragmentShadingRateCombinerOpKHR' does not name a type
 2864 |     const VkFragmentShadingRateCombinerOpKHR    combinerOps[2]);
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2900:11: error: 'VkAccelerationStructureBuildRangeInfoKHR' does not name a type; did you mean 'VkAccelerationStructureBuildOffsetInfoKHR'?
 2900 |     const VkAccelerationStructureBuildRangeInfoKHR* const* ppBuildRangeInfos);
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           VkAccelerationStructureBuildOffsetInfoKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2915:11: error: 'VkAccelerationStructureBuildRangeInfoKHR' does not name a type; did you mean 'VkAccelerationStructureBuildOffsetInfoKHR'?
 2915 |     const VkAccelerationStructureBuildRangeInfoKHR* const* ppBuildRangeInfos);
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           VkAccelerationStructureBuildOffsetInfoKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2967:11: error: 'VkAccelerationStructureVersionInfoKHR' does not name a type; did you mean 'VkAccelerationStructureVersionKHR'?
 2967 |     const VkAccelerationStructureVersionInfoKHR* pVersionInfo,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           VkAccelerationStructureVersionKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2968:5: error: 'VkAccelerationStructureCompatibilityKHR' has not been declared
 2968 |     VkAccelerationStructureCompatibilityKHR*    pCompatibility);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2975:5: error: 'VkAccelerationStructureBuildSizesInfoKHR' has not been declared
 2975 |     VkAccelerationStructureBuildSizesInfoKHR*   pSizeInfo);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2980:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
 2980 |     const VkStridedDeviceAddressRegionKHR*      pRaygenShaderBindingTable,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           VkStridedBufferRegionKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2981:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
 2981 |     const VkStridedDeviceAddressRegionKHR*      pMissShaderBindingTable,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           VkStridedBufferRegionKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2982:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
 2982 |     const VkStridedDeviceAddressRegionKHR*      pHitShaderBindingTable,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           VkStridedBufferRegionKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2983:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
 2983 |     const VkStridedDeviceAddressRegionKHR*      pCallableShaderBindingTable,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           VkStridedBufferRegionKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:3007:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
 3007 |     const VkStridedDeviceAddressRegionKHR*      pRaygenShaderBindingTable,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           VkStridedBufferRegionKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:3008:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
 3008 |     const VkStridedDeviceAddressRegionKHR*      pMissShaderBindingTable,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           VkStridedBufferRegionKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:3009:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
 3009 |     const VkStridedDeviceAddressRegionKHR*      pHitShaderBindingTable,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           VkStridedBufferRegionKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:3010:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
 3010 |     const VkStridedDeviceAddressRegionKHR*      pCallableShaderBindingTable,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           VkStridedBufferRegionKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:3017:5: error: 'VkShaderGroupShaderKHR' has not been declared
 3017 |     VkShaderGroupShaderKHR                      groupShader);
      |     ^~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:27:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2043:31: error: 'VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderAtomicInt64FeaturesKHR'?
 2043 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceShaderAtomicInt64FeaturesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2043:83: error: template argument 1 is invalid
 2043 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR> {
      |                                                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2047:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
 2047 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2047:106: error: template argument 1 is invalid
 2047 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR> {
      |                                                                                                          ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2052:31: error: 'VkFragmentShadingRateAttachmentInfoKHR' was not declared in this scope
 2052 | template <> struct LvlTypeMap<VkFragmentShadingRateAttachmentInfoKHR> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2052:69: error: template argument 1 is invalid
 2052 | template <> struct LvlTypeMap<VkFragmentShadingRateAttachmentInfoKHR> {
      |                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2056:32: error: 'VK_STRUCTURE_TYPE_FRAGMENT_SHADING_RATE_ATTACHMENT_INFO_KHR' was not declared in this scope
 2056 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_FRAGMENT_SHADING_RATE_ATTACHMENT_INFO_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2056:91: error: template argument 1 is invalid
 2056 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_FRAGMENT_SHADING_RATE_ATTACHMENT_INFO_KHR> {
      |                                                                                           ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2061:31: error: 'VkPipelineFragmentShadingRateStateCreateInfoKHR' was not declared in this scope; did you mean 'VkPipelineViewportShadingRateImageStateCreateInfoNV'?
 2061 | template <> struct LvlTypeMap<VkPipelineFragmentShadingRateStateCreateInfoKHR> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPipelineViewportShadingRateImageStateCreateInfoNV
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2061:78: error: template argument 1 is invalid
 2061 | template <> struct LvlTypeMap<VkPipelineFragmentShadingRateStateCreateInfoKHR> {
      |                                                                              ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2065:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_STATE_CREATE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_SHADING_RATE_IMAGE_STATE_CREATE_INFO_NV'?
 2065 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_STATE_CREATE_INFO_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_SHADING_RATE_IMAGE_STATE_CREATE_INFO_NV
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2065:102: error: template argument 1 is invalid
 2065 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_STATE_CREATE_INFO_KHR> {
      |                                                                                                      ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2070:31: error: 'VkPhysicalDeviceFragmentShadingRateFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT'?
 2070 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRateFeaturesKHR> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceFragmentDensityMap2FeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2070:77: error: template argument 1 is invalid
 2070 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRateFeaturesKHR> {
      |                                                                             ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2074:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT'?
 2074 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2074:100: error: template argument 1 is invalid
 2074 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR> {
      |                                                                                                    ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2079:31: error: 'VkPhysicalDeviceFragmentShadingRatePropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT'?
 2079 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRatePropertiesKHR> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceFragmentDensityMap2PropertiesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2079:79: error: template argument 1 is invalid
 2079 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRatePropertiesKHR> {
      |                                                                               ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2083:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
 2083 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2083:102: error: template argument 1 is invalid
 2083 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR> {
      |                                                                                                      ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2088:31: error: 'VkPhysicalDeviceFragmentShadingRateKHR' was not declared in this scope
 2088 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRateKHR> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2088:69: error: template argument 1 is invalid
 2088 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRateKHR> {
      |                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2092:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR'?
 2092 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2092:91: error: template argument 1 is invalid
 2092 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_KHR> {
      |                                                                                           ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3578:31: error: 'VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderAtomicInt64FeaturesKHR'?
 3578 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceShaderAtomicInt64FeaturesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3578:80: error: template argument 1 is invalid
 3578 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT> {
      |                                                                                ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3582:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
 3582 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3582:104: error: template argument 1 is invalid
 3582 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT> {
      |                                                                                                        ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3944:31: error: 'VkPhysicalDeviceDeviceMemoryReportFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMemoryPriorityFeaturesEXT'?
 3944 | template <> struct LvlTypeMap<VkPhysicalDeviceDeviceMemoryReportFeaturesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceMemoryPriorityFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3944:76: error: template argument 1 is invalid
 3944 | template <> struct LvlTypeMap<VkPhysicalDeviceDeviceMemoryReportFeaturesEXT> {
      |                                                                            ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3948:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT'?
 3948 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3948:99: error: template argument 1 is invalid
 3948 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT> {
      |                                                                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3953:31: error: 'VkDeviceMemoryReportCallbackDataEXT' was not declared in this scope
 3953 | template <> struct LvlTypeMap<VkDeviceMemoryReportCallbackDataEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3953:66: error: template argument 1 is invalid
 3953 | template <> struct LvlTypeMap<VkDeviceMemoryReportCallbackDataEXT> {
      |                                                                  ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3957:32: error: 'VK_STRUCTURE_TYPE_DEVICE_MEMORY_REPORT_CALLBACK_DATA_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CALLBACK_DATA_EXT'?
 3957 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_MEMORY_REPORT_CALLBACK_DATA_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CALLBACK_DATA_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3957:88: error: template argument 1 is invalid
 3957 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_MEMORY_REPORT_CALLBACK_DATA_EXT> {
      |                                                                                        ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3962:31: error: 'VkDeviceDeviceMemoryReportCreateInfoEXT' was not declared in this scope
 3962 | template <> struct LvlTypeMap<VkDeviceDeviceMemoryReportCreateInfoEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3962:70: error: template argument 1 is invalid
 3962 | template <> struct LvlTypeMap<VkDeviceDeviceMemoryReportCreateInfoEXT> {
      |                                                                      ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3966:32: error: 'VK_STRUCTURE_TYPE_DEVICE_DEVICE_MEMORY_REPORT_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO_EXT'?
 3966 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_DEVICE_MEMORY_REPORT_CREATE_INFO_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3966:93: error: template argument 1 is invalid
 3966 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_DEVICE_MEMORY_REPORT_CREATE_INFO_EXT> {
      |                                                                                             ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4070:31: error: 'VkPhysicalDeviceFragmentShadingRateEnumsFeaturesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV'?
 4070 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRateEnumsFeaturesNV> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4070:81: error: template argument 1 is invalid
 4070 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRateEnumsFeaturesNV> {
      |                                                                                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4074:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_FEATURES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV'?
 4074 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_FEATURES_NV> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4074:105: error: template argument 1 is invalid
 4074 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_FEATURES_NV> {
      |                                                                                                         ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4079:31: error: 'VkPhysicalDeviceFragmentShadingRateEnumsPropertiesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceShadingRateImagePropertiesNV'?
 4079 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRateEnumsPropertiesNV> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceShadingRateImagePropertiesNV
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4079:83: error: template argument 1 is invalid
 4079 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRateEnumsPropertiesNV> {
      |                                                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4083:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_PROPERTIES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_PROPERTIES_NV'?
 4083 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_PROPERTIES_NV> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_PROPERTIES_NV
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4083:107: error: template argument 1 is invalid
 4083 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_PROPERTIES_NV> {
      |                                                                                                           ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4088:31: error: 'VkPipelineFragmentShadingRateEnumStateCreateInfoNV' was not declared in this scope; did you mean 'VkPipelineViewportShadingRateImageStateCreateInfoNV'?
 4088 | template <> struct LvlTypeMap<VkPipelineFragmentShadingRateEnumStateCreateInfoNV> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPipelineViewportShadingRateImageStateCreateInfoNV
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4088:81: error: template argument 1 is invalid
 4088 | template <> struct LvlTypeMap<VkPipelineFragmentShadingRateEnumStateCreateInfoNV> {
      |                                                                                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4092:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_ENUM_STATE_CREATE_INFO_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_SHADING_RATE_IMAGE_STATE_CREATE_INFO_NV'?
 4092 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_ENUM_STATE_CREATE_INFO_NV> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_SHADING_RATE_IMAGE_STATE_CREATE_INFO_NV
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4092:106: error: template argument 1 is invalid
 4092 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_ENUM_STATE_CREATE_INFO_NV> {
      |                                                                                                          ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4115:31: error: 'VkCopyCommandTransformInfoQCOM' was not declared in this scope
 4115 | template <> struct LvlTypeMap<VkCopyCommandTransformInfoQCOM> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4115:61: error: template argument 1 is invalid
 4115 | template <> struct LvlTypeMap<VkCopyCommandTransformInfoQCOM> {
      |                                                             ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4119:32: error: 'VK_STRUCTURE_TYPE_COPY_COMMAND_TRANSFORM_INFO_QCOM' was not declared in this scope
 4119 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_COMMAND_TRANSFORM_INFO_QCOM> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4119:82: error: template argument 1 is invalid
 4119 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_COMMAND_TRANSFORM_INFO_QCOM> {
      |                                                                                  ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4207:20: error: redefinition of 'struct LvlTypeMap<VkWriteDescriptorSetAccelerationStructureKHR>'
 4207 | template <> struct LvlTypeMap<VkWriteDescriptorSetAccelerationStructureKHR> {
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3131:20: note: previous definition of 'struct LvlTypeMap<VkWriteDescriptorSetAccelerationStructureKHR>'
 3131 | template <> struct LvlTypeMap<VkWriteDescriptorSetAccelerationStructureNV> {
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4211:20: error: redefinition of 'struct LvlSTypeMap<VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_KHR>'
 4211 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_KHR> {
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3135:20: note: previous definition of 'struct LvlSTypeMap<VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_KHR>'
 3135 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_NV> {
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4216:31: error: 'VkPhysicalDeviceAccelerationStructureFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceTimelineSemaphoreFeaturesKHR'?
 4216 | template <> struct LvlTypeMap<VkPhysicalDeviceAccelerationStructureFeaturesKHR> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceTimelineSemaphoreFeaturesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4216:79: error: template argument 1 is invalid
 4216 | template <> struct LvlTypeMap<VkPhysicalDeviceAccelerationStructureFeaturesKHR> {
      |                                                                               ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4220:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR'?
 4220 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4220:101: error: template argument 1 is invalid
 4220 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR> {
      |                                                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4225:31: error: 'VkPhysicalDeviceAccelerationStructurePropertiesKHR' was not declared in this scope; did you mean 'vkWriteAccelerationStructuresPropertiesKHR'?
 4225 | template <> struct LvlTypeMap<VkPhysicalDeviceAccelerationStructurePropertiesKHR> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               vkWriteAccelerationStructuresPropertiesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4225:81: error: template argument 1 is invalid
 4225 | template <> struct LvlTypeMap<VkPhysicalDeviceAccelerationStructurePropertiesKHR> {
      |                                                                                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4229:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR'?
 4229 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4229:103: error: template argument 1 is invalid
 4229 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR> {
      |                                                                                                       ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4243:31: error: 'VkAccelerationStructureVersionInfoKHR' was not declared in this scope; did you mean 'VkAccelerationStructureVersionKHR'?
 4243 | template <> struct LvlTypeMap<VkAccelerationStructureVersionInfoKHR> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkAccelerationStructureVersionKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4243:68: error: template argument 1 is invalid
 4243 | template <> struct LvlTypeMap<VkAccelerationStructureVersionInfoKHR> {
      |                                                                    ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4247:32: error: 'VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_VERSION_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_VERSION_KHR'?
 4247 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_VERSION_INFO_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_VERSION_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4247:89: error: template argument 1 is invalid
 4247 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_VERSION_INFO_KHR> {
      |                                                                                         ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4279:31: error: 'VkAccelerationStructureBuildSizesInfoKHR' was not declared in this scope; did you mean 'VkAccelerationStructureBuildOffsetInfoKHR'?
 4279 | template <> struct LvlTypeMap<VkAccelerationStructureBuildSizesInfoKHR> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkAccelerationStructureBuildOffsetInfoKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4279:71: error: template argument 1 is invalid
 4279 | template <> struct LvlTypeMap<VkAccelerationStructureBuildSizesInfoKHR> {
      |                                                                       ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4283:32: error: 'VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_GEOMETRY_INFO_KHR'?
 4283 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_GEOMETRY_INFO_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4283:93: error: template argument 1 is invalid
 4283 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR> {
      |                                                                                             ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4315:31: error: 'VkPhysicalDeviceRayTracingPipelineFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceRayTracingFeaturesKHR'?
 4315 | template <> struct LvlTypeMap<VkPhysicalDeviceRayTracingPipelineFeaturesKHR> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceRayTracingFeaturesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4315:76: error: template argument 1 is invalid
 4315 | template <> struct LvlTypeMap<VkPhysicalDeviceRayTracingPipelineFeaturesKHR> {
      |                                                                            ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4319:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR'?
 4319 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4319:99: error: template argument 1 is invalid
 4319 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR> {
      |                                                                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4324:31: error: 'VkPhysicalDeviceRayTracingPipelinePropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceRayTracingPropertiesKHR'?
 4324 | template <> struct LvlTypeMap<VkPhysicalDeviceRayTracingPipelinePropertiesKHR> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceRayTracingPropertiesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4324:78: error: template argument 1 is invalid
 4324 | template <> struct LvlTypeMap<VkPhysicalDeviceRayTracingPipelinePropertiesKHR> {
      |                                                                              ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4328:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_KHR'?
 4328 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4328:101: error: template argument 1 is invalid
 4328 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR> {
      |                                                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4333:31: error: 'VkPhysicalDeviceRayQueryFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceRayTracingFeaturesKHR'?
 4333 | template <> struct LvlTypeMap<VkPhysicalDeviceRayQueryFeaturesKHR> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceRayTracingFeaturesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4333:66: error: template argument 1 is invalid
 4333 | template <> struct LvlTypeMap<VkPhysicalDeviceRayQueryFeaturesKHR> {
      |                                                                  ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4337:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR'?
 4337 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4337:88: error: template argument 1 is invalid
 4337 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR> {
      |                                                                                        ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:3150:5: error: 'VkPhysicalDeviceFragmentShadingRateKHR' has not been declared
 3150 |     VkPhysicalDeviceFragmentShadingRateKHR*     pFragmentShadingRates)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:3159:11: error: 'VkFragmentShadingRateCombinerOpKHR' does not name a type
 3159 |     const VkFragmentShadingRateCombinerOpKHR    combinerOps[2])
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4682:5: error: 'VkFragmentShadingRateNV' has not been declared
 4682 |     VkFragmentShadingRateNV                     shadingRate,
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4683:11: error: 'VkFragmentShadingRateCombinerOpKHR' does not name a type
 4683 |     const VkFragmentShadingRateCombinerOpKHR    combinerOps[2])
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4739:11: error: 'VkAccelerationStructureBuildRangeInfoKHR' does not name a type; did you mean 'VkAccelerationStructureBuildOffsetInfoKHR'?
 4739 |     const VkAccelerationStructureBuildRangeInfoKHR* const* ppBuildRangeInfos)
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           VkAccelerationStructureBuildOffsetInfoKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4760:11: error: 'VkAccelerationStructureBuildRangeInfoKHR' does not name a type; did you mean 'VkAccelerationStructureBuildOffsetInfoKHR'?
 4760 |     const VkAccelerationStructureBuildRangeInfoKHR* const* ppBuildRangeInfos)
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           VkAccelerationStructureBuildOffsetInfoKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4848:11: error: 'VkAccelerationStructureVersionInfoKHR' does not name a type; did you mean 'VkAccelerationStructureVersionKHR'?
 4848 |     const VkAccelerationStructureVersionInfoKHR* pVersionInfo,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           VkAccelerationStructureVersionKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4849:5: error: 'VkAccelerationStructureCompatibilityKHR' has not been declared
 4849 |     VkAccelerationStructureCompatibilityKHR*    pCompatibility)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4859:5: error: 'VkAccelerationStructureBuildSizesInfoKHR' has not been declared
 4859 |     VkAccelerationStructureBuildSizesInfoKHR*   pSizeInfo)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4867:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
 4867 |     const VkStridedDeviceAddressRegionKHR*      pRaygenShaderBindingTable,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           VkStridedBufferRegionKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4868:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
 4868 |     const VkStridedDeviceAddressRegionKHR*      pMissShaderBindingTable,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           VkStridedBufferRegionKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4869:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
 4869 |     const VkStridedDeviceAddressRegionKHR*      pHitShaderBindingTable,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           VkStridedBufferRegionKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4870:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
 4870 |     const VkStridedDeviceAddressRegionKHR*      pCallableShaderBindingTable,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           VkStridedBufferRegionKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4908:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
 4908 |     const VkStridedDeviceAddressRegionKHR*      pRaygenShaderBindingTable,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           VkStridedBufferRegionKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4909:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
 4909 |     const VkStridedDeviceAddressRegionKHR*      pMissShaderBindingTable,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           VkStridedBufferRegionKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4910:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
 4910 |     const VkStridedDeviceAddressRegionKHR*      pHitShaderBindingTable,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           VkStridedBufferRegionKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4911:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
 4911 |     const VkStridedDeviceAddressRegionKHR*      pCallableShaderBindingTable,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           VkStridedBufferRegionKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4921:5: error: 'VkShaderGroupShaderKHR' has not been declared
 4921 |     VkShaderGroupShaderKHR                      groupShader)
      |     ^~~~~~~~~~~~~~~~~~~~~~
ninja: build stopped: subcommand failed.
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/temp/log.do_compile.2131
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/build --target all --
| [1/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-t
 ools/1.2.162.0-r0=/usr/src/debug/vulkan-tools/1.2.162.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0=/usr/src/debug/vulkan-tools/1.2.162.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -
 Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp
| FAILED: vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1
 .2.162.0-r0=/usr/src/debug/vulkan-tools/1.2.162.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0=/usr/src/debug/vulkan-tools/1.2.162.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimpli
 cit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:980:89: error: 'VkPhysicalDeviceAccelerationStructureFeaturesKHR' has not been declared
|   980 | void DumpVkPhysicalDeviceAccelerationStructureFeaturesKHR(Printer &p, std::string name, VkPhysicalDeviceAccelerationStructureFeaturesKHR &obj) {
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceAccelerationStructureFeaturesKHR(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:982:67: error: request for member 'accelerationStructure' in 'obj', which is of non-class type 'int'
|   982 |     p.PrintKeyBool("accelerationStructure", static_cast<bool>(obj.accelerationStructure), 53);
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:983:80: error: request for member 'accelerationStructureCaptureReplay' in 'obj', which is of non-class type 'int'
|   983 |     p.PrintKeyBool("accelerationStructureCaptureReplay", static_cast<bool>(obj.accelerationStructureCaptureReplay), 53);
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:984:80: error: request for member 'accelerationStructureIndirectBuild' in 'obj', which is of non-class type 'int'
|   984 |     p.PrintKeyBool("accelerationStructureIndirectBuild", static_cast<bool>(obj.accelerationStructureIndirectBuild), 53);
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:985:79: error: request for member 'accelerationStructureHostCommands' in 'obj', which is of non-class type 'int'
|   985 |     p.PrintKeyBool("accelerationStructureHostCommands", static_cast<bool>(obj.accelerationStructureHostCommands), 53);
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:986:99: error: request for member 'descriptorBindingAccelerationStructureUpdateAfterBind' in 'obj', which is of non-class type 'int'
|   986 |     p.PrintKeyBool("descriptorBindingAccelerationStructureUpdateAfterBind", static_cast<bool>(obj.descriptorBindingAccelerationStructureUpdateAfterBind), 53);
|       |                                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:988:91: error: 'VkPhysicalDeviceAccelerationStructurePropertiesKHR' has not been declared
|   988 | void DumpVkPhysicalDeviceAccelerationStructurePropertiesKHR(Printer &p, std::string name, VkPhysicalDeviceAccelerationStructurePropertiesKHR &obj) {
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceAccelerationStructurePropertiesKHR(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:990:45: error: request for member 'maxGeometryCount' in 'obj', which is of non-class type 'int'
|   990 |     p.PrintKeyValue("maxGeometryCount", obj.maxGeometryCount, 58);
|       |                                             ^~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:991:45: error: request for member 'maxInstanceCount' in 'obj', which is of non-class type 'int'
|   991 |     p.PrintKeyValue("maxInstanceCount", obj.maxInstanceCount, 58);
|       |                                             ^~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:992:46: error: request for member 'maxPrimitiveCount' in 'obj', which is of non-class type 'int'
|   992 |     p.PrintKeyValue("maxPrimitiveCount", obj.maxPrimitiveCount, 58);
|       |                                              ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:993:72: error: request for member 'maxPerStageDescriptorAccelerationStructures' in 'obj', which is of non-class type 'int'
|   993 |     p.PrintKeyValue("maxPerStageDescriptorAccelerationStructures", obj.maxPerStageDescriptorAccelerationStructures, 58);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:994:87: error: request for member 'maxPerStageDescriptorUpdateAfterBindAccelerationStructures' in 'obj', which is of non-class type 'int'
|   994 |     p.PrintKeyValue("maxPerStageDescriptorUpdateAfterBindAccelerationStructures", obj.maxPerStageDescriptorUpdateAfterBindAccelerationStructures, 58);
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:995:67: error: request for member 'maxDescriptorSetAccelerationStructures' in 'obj', which is of non-class type 'int'
|   995 |     p.PrintKeyValue("maxDescriptorSetAccelerationStructures", obj.maxDescriptorSetAccelerationStructures, 58);
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:996:82: error: request for member 'maxDescriptorSetUpdateAfterBindAccelerationStructures' in 'obj', which is of non-class type 'int'
|   996 |     p.PrintKeyValue("maxDescriptorSetUpdateAfterBindAccelerationStructures", obj.maxDescriptorSetUpdateAfterBindAccelerationStructures, 58);
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:997:75: error: request for member 'minAccelerationStructureScratchOffsetAlignment' in 'obj', which is of non-class type 'int'
|   997 |     p.PrintKeyValue("minAccelerationStructureScratchOffsetAlignment", obj.minAccelerationStructureScratchOffsetAlignment, 58);
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1110:86: error: 'VkPhysicalDeviceDeviceMemoryReportFeaturesEXT' has not been declared
|  1110 | void DumpVkPhysicalDeviceDeviceMemoryReportFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceDeviceMemoryReportFeaturesEXT &obj) {
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceDeviceMemoryReportFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1112:64: error: request for member 'deviceMemoryReport' in 'obj', which is of non-class type 'int'
|  1112 |     p.PrintKeyBool("deviceMemoryReport", static_cast<bool>(obj.deviceMemoryReport), 18);
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1240:87: error: 'VkPhysicalDeviceFragmentShadingRateFeaturesKHR' has not been declared
|  1240 | void DumpVkPhysicalDeviceFragmentShadingRateFeaturesKHR(Printer &p, std::string name, VkPhysicalDeviceFragmentShadingRateFeaturesKHR &obj) {
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceFragmentShadingRateFeaturesKHR(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1242:73: error: request for member 'pipelineFragmentShadingRate' in 'obj', which is of non-class type 'int'
|  1242 |     p.PrintKeyBool("pipelineFragmentShadingRate", static_cast<bool>(obj.pipelineFragmentShadingRate), 29);
|       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1243:74: error: request for member 'primitiveFragmentShadingRate' in 'obj', which is of non-class type 'int'
|  1243 |     p.PrintKeyBool("primitiveFragmentShadingRate", static_cast<bool>(obj.primitiveFragmentShadingRate), 29);
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1244:75: error: request for member 'attachmentFragmentShadingRate' in 'obj', which is of non-class type 'int'
|  1244 |     p.PrintKeyBool("attachmentFragmentShadingRate", static_cast<bool>(obj.attachmentFragmentShadingRate), 29);
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1246:89: error: 'VkPhysicalDeviceFragmentShadingRatePropertiesKHR' has not been declared
|  1246 | void DumpVkPhysicalDeviceFragmentShadingRatePropertiesKHR(Printer &p, std::string name, VkPhysicalDeviceFragmentShadingRatePropertiesKHR &obj) {
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceFragmentShadingRatePropertiesKHR(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1248:72: error: request for member 'minFragmentShadingRateAttachmentTexelSize' in 'obj', which is of non-class type 'int'
|  1248 |     DumpVkExtent2D(p, "minFragmentShadingRateAttachmentTexelSize", obj.minFragmentShadingRateAttachmentTexelSize);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1249:72: error: request for member 'maxFragmentShadingRateAttachmentTexelSize' in 'obj', which is of non-class type 'int'
|  1249 |     DumpVkExtent2D(p, "maxFragmentShadingRateAttachmentTexelSize", obj.maxFragmentShadingRateAttachmentTexelSize);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1250:81: error: request for member 'maxFragmentShadingRateAttachmentTexelSizeAspectRatio' in 'obj', which is of non-class type 'int'
|  1250 |     p.PrintKeyValue("maxFragmentShadingRateAttachmentTexelSizeAspectRatio", obj.maxFragmentShadingRateAttachmentTexelSizeAspectRatio, 52);
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1251:95: error: request for member 'primitiveFragmentShadingRateWithMultipleViewports' in 'obj', which is of non-class type 'int'
|  1251 |     p.PrintKeyBool("primitiveFragmentShadingRateWithMultipleViewports", static_cast<bool>(obj.primitiveFragmentShadingRateWithMultipleViewports), 52);
|       |                                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1252:75: error: request for member 'layeredShadingRateAttachments' in 'obj', which is of non-class type 'int'
|  1252 |     p.PrintKeyBool("layeredShadingRateAttachments", static_cast<bool>(obj.layeredShadingRateAttachments), 52);
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1253:86: error: request for member 'fragmentShadingRateNonTrivialCombinerOps' in 'obj', which is of non-class type 'int'
|  1253 |     p.PrintKeyBool("fragmentShadingRateNonTrivialCombinerOps", static_cast<bool>(obj.fragmentShadingRateNonTrivialCombinerOps), 52);
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1254:46: error: request for member 'maxFragmentSize' in 'obj', which is of non-class type 'int'
|  1254 |     DumpVkExtent2D(p, "maxFragmentSize", obj.maxFragmentSize);
|       |                                              ^~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1255:55: error: request for member 'maxFragmentSizeAspectRatio' in 'obj', which is of non-class type 'int'
|  1255 |     p.PrintKeyValue("maxFragmentSizeAspectRatio", obj.maxFragmentSizeAspectRatio, 52);
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1256:66: error: request for member 'maxFragmentShadingRateCoverageSamples' in 'obj', which is of non-class type 'int'
|  1256 |     p.PrintKeyValue("maxFragmentShadingRateCoverageSamples", obj.maxFragmentShadingRateCoverageSamples, 52);
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1257:84: error: request for member 'maxFragmentShadingRateRasterizationSamples' in 'obj', which is of non-class type 'int'
|  1257 |     DumpVkSampleCountFlagBits(p, "maxFragmentShadingRateRasterizationSamples", obj.maxFragmentShadingRateRasterizationSamples, 52);
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1258:93: error: request for member 'fragmentShadingRateWithShaderDepthStencilWrites' in 'obj', which is of non-class type 'int'
|  1258 |     p.PrintKeyBool("fragmentShadingRateWithShaderDepthStencilWrites", static_cast<bool>(obj.fragmentShadingRateWithShaderDepthStencilWrites), 52);
|       |                                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1259:79: error: request for member 'fragmentShadingRateWithSampleMask' in 'obj', which is of non-class type 'int'
|  1259 |     p.PrintKeyBool("fragmentShadingRateWithSampleMask", static_cast<bool>(obj.fragmentShadingRateWithSampleMask), 52);
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1260:85: error: request for member 'fragmentShadingRateWithShaderSampleMask' in 'obj', which is of non-class type 'int'
|  1260 |     p.PrintKeyBool("fragmentShadingRateWithShaderSampleMask", static_cast<bool>(obj.fragmentShadingRateWithShaderSampleMask), 52);
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1261:94: error: request for member 'fragmentShadingRateWithConservativeRasterization' in 'obj', which is of non-class type 'int'
|  1261 |     p.PrintKeyBool("fragmentShadingRateWithConservativeRasterization", static_cast<bool>(obj.fragmentShadingRateWithConservativeRasterization), 52);
|       |                                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1262:92: error: request for member 'fragmentShadingRateWithFragmentShaderInterlock' in 'obj', which is of non-class type 'int'
|  1262 |     p.PrintKeyBool("fragmentShadingRateWithFragmentShaderInterlock", static_cast<bool>(obj.fragmentShadingRateWithFragmentShaderInterlock), 52);
|       |                                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1263:90: error: request for member 'fragmentShadingRateWithCustomSampleLocations' in 'obj', which is of non-class type 'int'
|  1263 |     p.PrintKeyBool("fragmentShadingRateWithCustomSampleLocations", static_cast<bool>(obj.fragmentShadingRateWithCustomSampleLocations), 52);
|       |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1264:87: error: request for member 'fragmentShadingRateStrictMultiplyCombiner' in 'obj', which is of non-class type 'int'
|  1264 |     p.PrintKeyBool("fragmentShadingRateStrictMultiplyCombiner", static_cast<bool>(obj.fragmentShadingRateStrictMultiplyCombiner), 52);
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1578:76: error: 'VkPhysicalDeviceRayQueryFeaturesKHR' has not been declared
|  1578 | void DumpVkPhysicalDeviceRayQueryFeaturesKHR(Printer &p, std::string name, VkPhysicalDeviceRayQueryFeaturesKHR &obj) {
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRayQueryFeaturesKHR(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1580:54: error: request for member 'rayQuery' in 'obj', which is of non-class type 'int'
|  1580 |     p.PrintKeyBool("rayQuery", static_cast<bool>(obj.rayQuery), 8);
|       |                                                      ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1582:86: error: 'VkPhysicalDeviceRayTracingPipelineFeaturesKHR' has not been declared
|  1582 | void DumpVkPhysicalDeviceRayTracingPipelineFeaturesKHR(Printer &p, std::string name, VkPhysicalDeviceRayTracingPipelineFeaturesKHR &obj) {
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRayTracingPipelineFeaturesKHR(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1584:64: error: request for member 'rayTracingPipeline' in 'obj', which is of non-class type 'int'
|  1584 |     p.PrintKeyBool("rayTracingPipeline", static_cast<bool>(obj.rayTracingPipeline), 53);
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1585:94: error: request for member 'rayTracingPipelineShaderGroupHandleCaptureReplay' in 'obj', which is of non-class type 'int'
|  1585 |     p.PrintKeyBool("rayTracingPipelineShaderGroupHandleCaptureReplay", static_cast<bool>(obj.rayTracingPipelineShaderGroupHandleCaptureReplay), 53);
|       |                                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1586:99: error: request for member 'rayTracingPipelineShaderGroupHandleCaptureReplayMixed' in 'obj', which is of non-class type 'int'
|  1586 |     p.PrintKeyBool("rayTracingPipelineShaderGroupHandleCaptureReplayMixed", static_cast<bool>(obj.rayTracingPipelineShaderGroupHandleCaptureReplayMixed), 53);
|       |                                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1587:81: error: request for member 'rayTracingPipelineTraceRaysIndirect' in 'obj', which is of non-class type 'int'
|  1587 |     p.PrintKeyBool("rayTracingPipelineTraceRaysIndirect", static_cast<bool>(obj.rayTracingPipelineTraceRaysIndirect), 53);
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1588:74: error: request for member 'rayTraversalPrimitiveCulling' in 'obj', which is of non-class type 'int'
|  1588 |     p.PrintKeyBool("rayTraversalPrimitiveCulling", static_cast<bool>(obj.rayTraversalPrimitiveCulling), 53);
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1590:88: error: 'VkPhysicalDeviceRayTracingPipelinePropertiesKHR' has not been declared
|  1590 | void DumpVkPhysicalDeviceRayTracingPipelinePropertiesKHR(Printer &p, std::string name, VkPhysicalDeviceRayTracingPipelinePropertiesKHR &obj) {
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRayTracingPipelinePropertiesKHR(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1592:50: error: request for member 'shaderGroupHandleSize' in 'obj', which is of non-class type 'int'
|  1592 |     p.PrintKeyValue("shaderGroupHandleSize", obj.shaderGroupHandleSize, 34);
|       |                                                  ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1593:49: error: request for member 'maxRayRecursionDepth' in 'obj', which is of non-class type 'int'
|  1593 |     p.PrintKeyValue("maxRayRecursionDepth", obj.maxRayRecursionDepth, 34);
|       |                                                 ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1594:49: error: request for member 'maxShaderGroupStride' in 'obj', which is of non-class type 'int'
|  1594 |     p.PrintKeyValue("maxShaderGroupStride", obj.maxShaderGroupStride, 34);
|       |                                                 ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1595:53: error: request for member 'shaderGroupBaseAlignment' in 'obj', which is of non-class type 'int'
|  1595 |     p.PrintKeyValue("shaderGroupBaseAlignment", obj.shaderGroupBaseAlignment, 34);
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1596:63: error: request for member 'shaderGroupHandleCaptureReplaySize' in 'obj', which is of non-class type 'int'
|  1596 |     p.PrintKeyValue("shaderGroupHandleCaptureReplaySize", obj.shaderGroupHandleCaptureReplaySize, 34);
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1597:58: error: request for member 'maxRayDispatchInvocationCount' in 'obj', which is of non-class type 'int'
|  1597 |     p.PrintKeyValue("maxRayDispatchInvocationCount", obj.maxRayDispatchInvocationCount, 34);
|       |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1598:55: error: request for member 'shaderGroupHandleAlignment' in 'obj', which is of non-class type 'int'
|  1598 |     p.PrintKeyValue("shaderGroupHandleAlignment", obj.shaderGroupHandleAlignment, 34);
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1599:51: error: request for member 'maxRayHitAttributeSize' in 'obj', which is of non-class type 'int'
|  1599 |     p.PrintKeyValue("maxRayHitAttributeSize", obj.maxRayHitAttributeSize, 34);
|       |                                                   ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1678:90: error: 'VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT' has not been declared
|  1678 | void DumpVkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT &obj) {
|       |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1680:69: error: request for member 'shaderImageInt64Atomics' in 'obj', which is of non-class type 'int'
|  1680 |     p.PrintKeyBool("shaderImageInt64Atomics", static_cast<bool>(obj.shaderImageInt64Atomics), 23);
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1681:69: error: request for member 'sparseImageInt64Atomics' in 'obj', which is of non-class type 'int'
|  1681 |     p.PrintKeyBool("sparseImageInt64Atomics", static_cast<bool>(obj.sparseImageInt64Atomics), 23);
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1687:93: error: 'VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR' has not been declared
|  1687 | void DumpVkPhysicalDeviceShaderTerminateInvocationFeaturesKHR(Printer &p, std::string name, VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR &obj) {
|       |                                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderTerminateInvocationFeaturesKHR(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1689:71: error: request for member 'shaderTerminateInvocation' in 'obj', which is of non-class type 'int'
|  1689 |     p.PrintKeyBool("shaderTerminateInvocation", static_cast<bool>(obj.shaderTerminateInvocation), 25);
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'pNextChainInfos get_chain_infos()':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1972:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR'?
|  1972 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR, sizeof(VkPhysicalDeviceAccelerationStructurePropertiesKHR)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1972:90: error: 'VkPhysicalDeviceAccelerationStructurePropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceAccelerationStructurePropertiesKHR'?
|  1972 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR, sizeof(VkPhysicalDeviceAccelerationStructurePropertiesKHR)},
|       |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                          DumpVkPhysicalDeviceAccelerationStructurePropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1984:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
|  1984 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR, sizeof(VkPhysicalDeviceFragmentShadingRatePropertiesKHR)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1984:89: error: 'VkPhysicalDeviceFragmentShadingRatePropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceFragmentShadingRatePropertiesKHR'?
|  1984 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR, sizeof(VkPhysicalDeviceFragmentShadingRatePropertiesKHR)},
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                         DumpVkPhysicalDeviceFragmentShadingRatePropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1998:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_KHR'?
|  1998 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR, sizeof(VkPhysicalDeviceRayTracingPipelinePropertiesKHR)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1998:88: error: 'VkPhysicalDeviceRayTracingPipelinePropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRayTracingPipelinePropertiesKHR'?
|  1998 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR, sizeof(VkPhysicalDeviceRayTracingPipelinePropertiesKHR)},
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                        DumpVkPhysicalDeviceRayTracingPipelinePropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2010:5: error: no match for 'operator=' (operand types are 'std::vector<pNextChainBuildingBlockInfo>' and '<brace-enclosed initializer list>')
|  2010 |     };
|       |     ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/vector:72,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/vector.tcc:198:5: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(const std::vector<_Tp, _Alloc>&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   198 |     vector<_Tp, _Alloc>::
|       |     ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/vector.tcc:199:42: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'const std::vector<pNextChainBuildingBlockInfo>&'
|   199 |     operator=(const vector<_Tp, _Alloc>& __x)
|       |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/vector:67,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:709:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::vector<_Tp, _Alloc>&&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:709:26: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::vector<pNextChainBuildingBlockInfo>&&'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |                 ~~~~~~~~~^~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:730:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::initializer_list<_Tp>) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   730 |       operator=(initializer_list<value_type> __l)
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:730:46: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::initializer_list<pNextChainBuildingBlockInfo>'
|   730 |       operator=(initializer_list<value_type> __l)
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2019:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR'?
|  2019 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR, sizeof(VkPhysicalDeviceAccelerationStructureFeaturesKHR)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2019:88: error: 'VkPhysicalDeviceAccelerationStructureFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceAccelerationStructureFeaturesKHR'?
|  2019 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR, sizeof(VkPhysicalDeviceAccelerationStructureFeaturesKHR)},
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                        DumpVkPhysicalDeviceAccelerationStructureFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2027:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT'?
|  2027 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT, sizeof(VkPhysicalDeviceDeviceMemoryReportFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2027:86: error: 'VkPhysicalDeviceDeviceMemoryReportFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceDeviceMemoryReportFeaturesEXT'?
|  2027 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT, sizeof(VkPhysicalDeviceDeviceMemoryReportFeaturesEXT)},
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                      DumpVkPhysicalDeviceDeviceMemoryReportFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2032:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT'?
|  2032 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR, sizeof(VkPhysicalDeviceFragmentShadingRateFeaturesKHR)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2032:87: error: 'VkPhysicalDeviceFragmentShadingRateFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceFragmentShadingRateFeaturesKHR'?
|  2032 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR, sizeof(VkPhysicalDeviceFragmentShadingRateFeaturesKHR)},
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                       DumpVkPhysicalDeviceFragmentShadingRateFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2049:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR'?
|  2049 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR, sizeof(VkPhysicalDeviceRayQueryFeaturesKHR)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2049:75: error: 'VkPhysicalDeviceRayQueryFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRayQueryFeaturesKHR'?
|  2049 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR, sizeof(VkPhysicalDeviceRayQueryFeaturesKHR)},
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                           DumpVkPhysicalDeviceRayQueryFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2050:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR'?
|  2050 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR, sizeof(VkPhysicalDeviceRayTracingPipelineFeaturesKHR)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2050:86: error: 'VkPhysicalDeviceRayTracingPipelineFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRayTracingPipelineFeaturesKHR'?
|  2050 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR, sizeof(VkPhysicalDeviceRayTracingPipelineFeaturesKHR)},
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                      DumpVkPhysicalDeviceRayTracingPipelineFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2061:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  2061 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT, sizeof(VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2061:91: error: 'VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT'?
|  2061 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT, sizeof(VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT)},
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                           DumpVkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2063:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  2063 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR, sizeof(VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2063:93: error: 'VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderTerminateInvocationFeaturesKHR'?
|  2063 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR, sizeof(VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR)},
|       |                                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                             DumpVkPhysicalDeviceShaderTerminateInvocationFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2076:5: error: no match for 'operator=' (operand types are 'std::vector<pNextChainBuildingBlockInfo>' and '<brace-enclosed initializer list>')
|  2076 |     };
|       |     ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/vector:72,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/vector.tcc:198:5: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(const std::vector<_Tp, _Alloc>&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   198 |     vector<_Tp, _Alloc>::
|       |     ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/vector.tcc:199:42: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'const std::vector<pNextChainBuildingBlockInfo>&'
|   199 |     operator=(const vector<_Tp, _Alloc>& __x)
|       |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/vector:67,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:709:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::vector<_Tp, _Alloc>&&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:709:26: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::vector<pNextChainBuildingBlockInfo>&&'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |                 ~~~~~~~~~^~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:730:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::initializer_list<_Tp>) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   730 |       operator=(initializer_list<value_type> __l)
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:730:46: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::initializer_list<pNextChainBuildingBlockInfo>'
|   730 |       operator=(initializer_list<value_type> __l)
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_props2(Printer&, AppInstance&, AppGpu&, void*, VulkanVersion)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2093:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR'?
|  2093 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2094:54: error: 'VK_KHR_ACCELERATION_STRUCTURE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_COPY_ACCELERATION_STRUCTURE_MODE_CLONE_NV'?
|  2094 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_ACCELERATION_STRUCTURE_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_COPY_ACCELERATION_STRUCTURE_MODE_CLONE_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2095:13: error: 'VkPhysicalDeviceAccelerationStructurePropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceAccelerationStructurePropertiesKHR'?
|  2095 |             VkPhysicalDeviceAccelerationStructurePropertiesKHR* props = (VkPhysicalDeviceAccelerationStructurePropertiesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceAccelerationStructurePropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2095:65: error: 'props' was not declared in this scope
|  2095 |             VkPhysicalDeviceAccelerationStructurePropertiesKHR* props = (VkPhysicalDeviceAccelerationStructurePropertiesKHR*)structure;
|       |                                                                 ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2095:125: error: expected primary-expression before ')' token
|  2095 |             VkPhysicalDeviceAccelerationStructurePropertiesKHR* props = (VkPhysicalDeviceAccelerationStructurePropertiesKHR*)structure;
|       |                                                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2169:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
|  2169 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2170:54: error: 'VK_KHR_FRAGMENT_SHADING_RATE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME'?
|  2170 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_FRAGMENT_SHADING_RATE_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2171:13: error: 'VkPhysicalDeviceFragmentShadingRatePropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceFragmentShadingRatePropertiesKHR'?
|  2171 |             VkPhysicalDeviceFragmentShadingRatePropertiesKHR* props = (VkPhysicalDeviceFragmentShadingRatePropertiesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceFragmentShadingRatePropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2171:63: error: 'props' was not declared in this scope
|  2171 |             VkPhysicalDeviceFragmentShadingRatePropertiesKHR* props = (VkPhysicalDeviceFragmentShadingRatePropertiesKHR*)structure;
|       |                                                               ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2171:121: error: expected primary-expression before ')' token
|  2171 |             VkPhysicalDeviceFragmentShadingRatePropertiesKHR* props = (VkPhysicalDeviceFragmentShadingRatePropertiesKHR*)structure;
|       |                                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2247:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_KHR'?
|  2247 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2248:54: error: 'VK_KHR_RAY_TRACING_PIPELINE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_RAY_TRACING_EXTENSION_NAME'?
|  2248 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_RAY_TRACING_PIPELINE_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_RAY_TRACING_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2249:13: error: 'VkPhysicalDeviceRayTracingPipelinePropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRayTracingPipelinePropertiesKHR'?
|  2249 |             VkPhysicalDeviceRayTracingPipelinePropertiesKHR* props = (VkPhysicalDeviceRayTracingPipelinePropertiesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceRayTracingPipelinePropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2249:62: error: 'props' was not declared in this scope
|  2249 |             VkPhysicalDeviceRayTracingPipelinePropertiesKHR* props = (VkPhysicalDeviceRayTracingPipelinePropertiesKHR*)structure;
|       |                                                              ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2249:119: error: expected primary-expression before ')' token
|  2249 |             VkPhysicalDeviceRayTracingPipelinePropertiesKHR* props = (VkPhysicalDeviceRayTracingPipelinePropertiesKHR*)structure;
|       |                                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, void*, VulkanVersion)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2367:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR'?
|  2367 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2368:54: error: 'VK_KHR_ACCELERATION_STRUCTURE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_COPY_ACCELERATION_STRUCTURE_MODE_CLONE_NV'?
|  2368 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_ACCELERATION_STRUCTURE_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_COPY_ACCELERATION_STRUCTURE_MODE_CLONE_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2369:13: error: 'VkPhysicalDeviceAccelerationStructureFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceAccelerationStructureFeaturesKHR'?
|  2369 |             VkPhysicalDeviceAccelerationStructureFeaturesKHR* props = (VkPhysicalDeviceAccelerationStructureFeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceAccelerationStructureFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2369:63: error: 'props' was not declared in this scope
|  2369 |             VkPhysicalDeviceAccelerationStructureFeaturesKHR* props = (VkPhysicalDeviceAccelerationStructureFeaturesKHR*)structure;
|       |                                                               ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2369:121: error: expected primary-expression before ')' token
|  2369 |             VkPhysicalDeviceAccelerationStructureFeaturesKHR* props = (VkPhysicalDeviceAccelerationStructureFeaturesKHR*)structure;
|       |                                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2417:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT'?
|  2417 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2418:54: error: 'VK_EXT_DEVICE_MEMORY_REPORT_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEBUG_REPORT_EXTENSION_NAME'?
|  2418 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_DEVICE_MEMORY_REPORT_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_DEBUG_REPORT_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2419:13: error: 'VkPhysicalDeviceDeviceMemoryReportFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceDeviceMemoryReportFeaturesEXT'?
|  2419 |             VkPhysicalDeviceDeviceMemoryReportFeaturesEXT* props = (VkPhysicalDeviceDeviceMemoryReportFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceDeviceMemoryReportFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2419:60: error: 'props' was not declared in this scope
|  2419 |             VkPhysicalDeviceDeviceMemoryReportFeaturesEXT* props = (VkPhysicalDeviceDeviceMemoryReportFeaturesEXT*)structure;
|       |                                                            ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2419:115: error: expected primary-expression before ')' token
|  2419 |             VkPhysicalDeviceDeviceMemoryReportFeaturesEXT* props = (VkPhysicalDeviceDeviceMemoryReportFeaturesEXT*)structure;
|       |                                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2447:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT'?
|  2447 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2448:54: error: 'VK_KHR_FRAGMENT_SHADING_RATE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME'?
|  2448 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_FRAGMENT_SHADING_RATE_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2449:13: error: 'VkPhysicalDeviceFragmentShadingRateFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceFragmentShadingRateFeaturesKHR'?
|  2449 |             VkPhysicalDeviceFragmentShadingRateFeaturesKHR* props = (VkPhysicalDeviceFragmentShadingRateFeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceFragmentShadingRateFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2449:61: error: 'props' was not declared in this scope
|  2449 |             VkPhysicalDeviceFragmentShadingRateFeaturesKHR* props = (VkPhysicalDeviceFragmentShadingRateFeaturesKHR*)structure;
|       |                                                             ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2449:117: error: expected primary-expression before ')' token
|  2449 |             VkPhysicalDeviceFragmentShadingRateFeaturesKHR* props = (VkPhysicalDeviceFragmentShadingRateFeaturesKHR*)structure;
|       |                                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2542:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR'?
|  2542 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2543:54: error: 'VK_KHR_RAY_QUERY_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_RAY_TRACING_EXTENSION_NAME'?
|  2543 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_RAY_QUERY_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_RAY_TRACING_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2544:13: error: 'VkPhysicalDeviceRayQueryFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRayQueryFeaturesKHR'?
|  2544 |             VkPhysicalDeviceRayQueryFeaturesKHR* props = (VkPhysicalDeviceRayQueryFeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceRayQueryFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2544:50: error: 'props' was not declared in this scope
|  2544 |             VkPhysicalDeviceRayQueryFeaturesKHR* props = (VkPhysicalDeviceRayQueryFeaturesKHR*)structure;
|       |                                                  ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2544:95: error: expected primary-expression before ')' token
|  2544 |             VkPhysicalDeviceRayQueryFeaturesKHR* props = (VkPhysicalDeviceRayQueryFeaturesKHR*)structure;
|       |                                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2548:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR'?
|  2548 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2549:54: error: 'VK_KHR_RAY_TRACING_PIPELINE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_RAY_TRACING_EXTENSION_NAME'?
|  2549 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_RAY_TRACING_PIPELINE_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_RAY_TRACING_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2550:13: error: 'VkPhysicalDeviceRayTracingPipelineFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRayTracingPipelineFeaturesKHR'?
|  2550 |             VkPhysicalDeviceRayTracingPipelineFeaturesKHR* props = (VkPhysicalDeviceRayTracingPipelineFeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceRayTracingPipelineFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2550:60: error: 'props' was not declared in this scope
|  2550 |             VkPhysicalDeviceRayTracingPipelineFeaturesKHR* props = (VkPhysicalDeviceRayTracingPipelineFeaturesKHR*)structure;
|       |                                                            ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2550:115: error: expected primary-expression before ')' token
|  2550 |             VkPhysicalDeviceRayTracingPipelineFeaturesKHR* props = (VkPhysicalDeviceRayTracingPipelineFeaturesKHR*)structure;
|       |                                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2619:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  2619 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2620:54: error: 'VK_EXT_SHADER_IMAGE_ATOMIC_INT64_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME'?
|  2620 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_SHADER_IMAGE_ATOMIC_INT64_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2621:13: error: 'VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT'?
|  2621 |             VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT* props = (VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2621:64: error: 'props' was not declared in this scope
|  2621 |             VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT* props = (VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT*)structure;
|       |                                                                ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2621:123: error: expected primary-expression before ')' token
|  2621 |             VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT* props = (VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT*)structure;
|       |                                                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2632:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  2632 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2633:54: error: 'VK_KHR_SHADER_TERMINATE_INVOCATION_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME'?
|  2633 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_SHADER_TERMINATE_INVOCATION_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2634:13: error: 'VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderTerminateInvocationFeaturesKHR'?
|  2634 |             VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR* props = (VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceShaderTerminateInvocationFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2634:67: error: 'props' was not declared in this scope
|  2634 |             VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR* props = (VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR*)structure;
|       |                                                                   ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2634:129: error: expected primary-expression before ')' token
|  2634 |             VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR* props = (VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR*)structure;
|       |                                                                                                                                 ^
| [2/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd -Iicd -I. -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.
 2.162.0-r0=/usr/src/debug/vulkan-tools/1.2.162.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0=/usr/src/debug/vulkan-tools/1.2.162.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplic
 it-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp
| FAILED: icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd -Iicd -I. -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.
 0-r0=/usr/src/debug/vulkan-tools/1.2.162.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0=/usr/src/debug/vulkan-tools/1.2.162.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fal
 lthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:22:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:1872:5: error: 'VkPhysicalDeviceFragmentShadingRateKHR' has not been declared
|  1872 |     VkPhysicalDeviceFragmentShadingRateKHR*     pFragmentShadingRates);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:1877:11: error: 'VkFragmentShadingRateCombinerOpKHR' does not name a type
|  1877 |     const VkFragmentShadingRateCombinerOpKHR    combinerOps[2]);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2863:5: error: 'VkFragmentShadingRateNV' has not been declared
|  2863 |     VkFragmentShadingRateNV                     shadingRate,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2864:11: error: 'VkFragmentShadingRateCombinerOpKHR' does not name a type
|  2864 |     const VkFragmentShadingRateCombinerOpKHR    combinerOps[2]);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2900:11: error: 'VkAccelerationStructureBuildRangeInfoKHR' does not name a type; did you mean 'VkAccelerationStructureBuildOffsetInfoKHR'?
|  2900 |     const VkAccelerationStructureBuildRangeInfoKHR* const* ppBuildRangeInfos);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkAccelerationStructureBuildOffsetInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2915:11: error: 'VkAccelerationStructureBuildRangeInfoKHR' does not name a type; did you mean 'VkAccelerationStructureBuildOffsetInfoKHR'?
|  2915 |     const VkAccelerationStructureBuildRangeInfoKHR* const* ppBuildRangeInfos);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkAccelerationStructureBuildOffsetInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2967:11: error: 'VkAccelerationStructureVersionInfoKHR' does not name a type; did you mean 'VkAccelerationStructureVersionKHR'?
|  2967 |     const VkAccelerationStructureVersionInfoKHR* pVersionInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkAccelerationStructureVersionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2968:5: error: 'VkAccelerationStructureCompatibilityKHR' has not been declared
|  2968 |     VkAccelerationStructureCompatibilityKHR*    pCompatibility);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2975:5: error: 'VkAccelerationStructureBuildSizesInfoKHR' has not been declared
|  2975 |     VkAccelerationStructureBuildSizesInfoKHR*   pSizeInfo);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2980:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  2980 |     const VkStridedDeviceAddressRegionKHR*      pRaygenShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2981:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  2981 |     const VkStridedDeviceAddressRegionKHR*      pMissShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2982:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  2982 |     const VkStridedDeviceAddressRegionKHR*      pHitShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2983:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  2983 |     const VkStridedDeviceAddressRegionKHR*      pCallableShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:3007:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  3007 |     const VkStridedDeviceAddressRegionKHR*      pRaygenShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:3008:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  3008 |     const VkStridedDeviceAddressRegionKHR*      pMissShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:3009:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  3009 |     const VkStridedDeviceAddressRegionKHR*      pHitShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:3010:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  3010 |     const VkStridedDeviceAddressRegionKHR*      pCallableShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:3017:5: error: 'VkShaderGroupShaderKHR' has not been declared
|  3017 |     VkShaderGroupShaderKHR                      groupShader);
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2043:31: error: 'VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderAtomicInt64FeaturesKHR'?
|  2043 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderAtomicInt64FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2043:83: error: template argument 1 is invalid
|  2043 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2047:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  2047 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2047:106: error: template argument 1 is invalid
|  2047 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR> {
|       |                                                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2052:31: error: 'VkFragmentShadingRateAttachmentInfoKHR' was not declared in this scope
|  2052 | template <> struct LvlTypeMap<VkFragmentShadingRateAttachmentInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2052:69: error: template argument 1 is invalid
|  2052 | template <> struct LvlTypeMap<VkFragmentShadingRateAttachmentInfoKHR> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2056:32: error: 'VK_STRUCTURE_TYPE_FRAGMENT_SHADING_RATE_ATTACHMENT_INFO_KHR' was not declared in this scope
|  2056 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_FRAGMENT_SHADING_RATE_ATTACHMENT_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2056:91: error: template argument 1 is invalid
|  2056 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_FRAGMENT_SHADING_RATE_ATTACHMENT_INFO_KHR> {
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2061:31: error: 'VkPipelineFragmentShadingRateStateCreateInfoKHR' was not declared in this scope; did you mean 'VkPipelineViewportShadingRateImageStateCreateInfoNV'?
|  2061 | template <> struct LvlTypeMap<VkPipelineFragmentShadingRateStateCreateInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPipelineViewportShadingRateImageStateCreateInfoNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2061:78: error: template argument 1 is invalid
|  2061 | template <> struct LvlTypeMap<VkPipelineFragmentShadingRateStateCreateInfoKHR> {
|       |                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2065:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_STATE_CREATE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_SHADING_RATE_IMAGE_STATE_CREATE_INFO_NV'?
|  2065 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_STATE_CREATE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_SHADING_RATE_IMAGE_STATE_CREATE_INFO_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2065:102: error: template argument 1 is invalid
|  2065 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_STATE_CREATE_INFO_KHR> {
|       |                                                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2070:31: error: 'VkPhysicalDeviceFragmentShadingRateFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT'?
|  2070 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRateFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceFragmentDensityMap2FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2070:77: error: template argument 1 is invalid
|  2070 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRateFeaturesKHR> {
|       |                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2074:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT'?
|  2074 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2074:100: error: template argument 1 is invalid
|  2074 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR> {
|       |                                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2079:31: error: 'VkPhysicalDeviceFragmentShadingRatePropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT'?
|  2079 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRatePropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceFragmentDensityMap2PropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2079:79: error: template argument 1 is invalid
|  2079 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRatePropertiesKHR> {
|       |                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2083:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
|  2083 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2083:102: error: template argument 1 is invalid
|  2083 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR> {
|       |                                                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2088:31: error: 'VkPhysicalDeviceFragmentShadingRateKHR' was not declared in this scope
|  2088 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRateKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2088:69: error: template argument 1 is invalid
|  2088 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRateKHR> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2092:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR'?
|  2092 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2092:91: error: template argument 1 is invalid
|  2092 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_KHR> {
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3578:31: error: 'VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderAtomicInt64FeaturesKHR'?
|  3578 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderAtomicInt64FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3578:80: error: template argument 1 is invalid
|  3578 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT> {
|       |                                                                                ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3582:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  3582 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3582:104: error: template argument 1 is invalid
|  3582 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT> {
|       |                                                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3944:31: error: 'VkPhysicalDeviceDeviceMemoryReportFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMemoryPriorityFeaturesEXT'?
|  3944 | template <> struct LvlTypeMap<VkPhysicalDeviceDeviceMemoryReportFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMemoryPriorityFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3944:76: error: template argument 1 is invalid
|  3944 | template <> struct LvlTypeMap<VkPhysicalDeviceDeviceMemoryReportFeaturesEXT> {
|       |                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3948:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT'?
|  3948 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3948:99: error: template argument 1 is invalid
|  3948 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT> {
|       |                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3953:31: error: 'VkDeviceMemoryReportCallbackDataEXT' was not declared in this scope
|  3953 | template <> struct LvlTypeMap<VkDeviceMemoryReportCallbackDataEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3953:66: error: template argument 1 is invalid
|  3953 | template <> struct LvlTypeMap<VkDeviceMemoryReportCallbackDataEXT> {
|       |                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3957:32: error: 'VK_STRUCTURE_TYPE_DEVICE_MEMORY_REPORT_CALLBACK_DATA_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CALLBACK_DATA_EXT'?
|  3957 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_MEMORY_REPORT_CALLBACK_DATA_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CALLBACK_DATA_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3957:88: error: template argument 1 is invalid
|  3957 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_MEMORY_REPORT_CALLBACK_DATA_EXT> {
|       |                                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3962:31: error: 'VkDeviceDeviceMemoryReportCreateInfoEXT' was not declared in this scope
|  3962 | template <> struct LvlTypeMap<VkDeviceDeviceMemoryReportCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3962:70: error: template argument 1 is invalid
|  3962 | template <> struct LvlTypeMap<VkDeviceDeviceMemoryReportCreateInfoEXT> {
|       |                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3966:32: error: 'VK_STRUCTURE_TYPE_DEVICE_DEVICE_MEMORY_REPORT_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO_EXT'?
|  3966 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_DEVICE_MEMORY_REPORT_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3966:93: error: template argument 1 is invalid
|  3966 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_DEVICE_MEMORY_REPORT_CREATE_INFO_EXT> {
|       |                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4070:31: error: 'VkPhysicalDeviceFragmentShadingRateEnumsFeaturesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV'?
|  4070 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRateEnumsFeaturesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4070:81: error: template argument 1 is invalid
|  4070 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRateEnumsFeaturesNV> {
|       |                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4074:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_FEATURES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV'?
|  4074 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_FEATURES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4074:105: error: template argument 1 is invalid
|  4074 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_FEATURES_NV> {
|       |                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4079:31: error: 'VkPhysicalDeviceFragmentShadingRateEnumsPropertiesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceShadingRateImagePropertiesNV'?
|  4079 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRateEnumsPropertiesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShadingRateImagePropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4079:83: error: template argument 1 is invalid
|  4079 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRateEnumsPropertiesNV> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4083:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_PROPERTIES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_PROPERTIES_NV'?
|  4083 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_PROPERTIES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_PROPERTIES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4083:107: error: template argument 1 is invalid
|  4083 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_PROPERTIES_NV> {
|       |                                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4088:31: error: 'VkPipelineFragmentShadingRateEnumStateCreateInfoNV' was not declared in this scope; did you mean 'VkPipelineViewportShadingRateImageStateCreateInfoNV'?
|  4088 | template <> struct LvlTypeMap<VkPipelineFragmentShadingRateEnumStateCreateInfoNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPipelineViewportShadingRateImageStateCreateInfoNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4088:81: error: template argument 1 is invalid
|  4088 | template <> struct LvlTypeMap<VkPipelineFragmentShadingRateEnumStateCreateInfoNV> {
|       |                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4092:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_ENUM_STATE_CREATE_INFO_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_SHADING_RATE_IMAGE_STATE_CREATE_INFO_NV'?
|  4092 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_ENUM_STATE_CREATE_INFO_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_SHADING_RATE_IMAGE_STATE_CREATE_INFO_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4092:106: error: template argument 1 is invalid
|  4092 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_ENUM_STATE_CREATE_INFO_NV> {
|       |                                                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4115:31: error: 'VkCopyCommandTransformInfoQCOM' was not declared in this scope
|  4115 | template <> struct LvlTypeMap<VkCopyCommandTransformInfoQCOM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4115:61: error: template argument 1 is invalid
|  4115 | template <> struct LvlTypeMap<VkCopyCommandTransformInfoQCOM> {
|       |                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4119:32: error: 'VK_STRUCTURE_TYPE_COPY_COMMAND_TRANSFORM_INFO_QCOM' was not declared in this scope
|  4119 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_COMMAND_TRANSFORM_INFO_QCOM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4119:82: error: template argument 1 is invalid
|  4119 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_COMMAND_TRANSFORM_INFO_QCOM> {
|       |                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4207:20: error: redefinition of 'struct LvlTypeMap<VkWriteDescriptorSetAccelerationStructureKHR>'
|  4207 | template <> struct LvlTypeMap<VkWriteDescriptorSetAccelerationStructureKHR> {
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3131:20: note: previous definition of 'struct LvlTypeMap<VkWriteDescriptorSetAccelerationStructureKHR>'
|  3131 | template <> struct LvlTypeMap<VkWriteDescriptorSetAccelerationStructureNV> {
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4211:20: error: redefinition of 'struct LvlSTypeMap<VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_KHR>'
|  4211 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_KHR> {
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3135:20: note: previous definition of 'struct LvlSTypeMap<VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_KHR>'
|  3135 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_NV> {
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4216:31: error: 'VkPhysicalDeviceAccelerationStructureFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceTimelineSemaphoreFeaturesKHR'?
|  4216 | template <> struct LvlTypeMap<VkPhysicalDeviceAccelerationStructureFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceTimelineSemaphoreFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4216:79: error: template argument 1 is invalid
|  4216 | template <> struct LvlTypeMap<VkPhysicalDeviceAccelerationStructureFeaturesKHR> {
|       |                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4220:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR'?
|  4220 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4220:101: error: template argument 1 is invalid
|  4220 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR> {
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4225:31: error: 'VkPhysicalDeviceAccelerationStructurePropertiesKHR' was not declared in this scope; did you mean 'vkWriteAccelerationStructuresPropertiesKHR'?
|  4225 | template <> struct LvlTypeMap<VkPhysicalDeviceAccelerationStructurePropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               vkWriteAccelerationStructuresPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4225:81: error: template argument 1 is invalid
|  4225 | template <> struct LvlTypeMap<VkPhysicalDeviceAccelerationStructurePropertiesKHR> {
|       |                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4229:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR'?
|  4229 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4229:103: error: template argument 1 is invalid
|  4229 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR> {
|       |                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4243:31: error: 'VkAccelerationStructureVersionInfoKHR' was not declared in this scope; did you mean 'VkAccelerationStructureVersionKHR'?
|  4243 | template <> struct LvlTypeMap<VkAccelerationStructureVersionInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkAccelerationStructureVersionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4243:68: error: template argument 1 is invalid
|  4243 | template <> struct LvlTypeMap<VkAccelerationStructureVersionInfoKHR> {
|       |                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4247:32: error: 'VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_VERSION_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_VERSION_KHR'?
|  4247 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_VERSION_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_VERSION_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4247:89: error: template argument 1 is invalid
|  4247 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_VERSION_INFO_KHR> {
|       |                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4279:31: error: 'VkAccelerationStructureBuildSizesInfoKHR' was not declared in this scope; did you mean 'VkAccelerationStructureBuildOffsetInfoKHR'?
|  4279 | template <> struct LvlTypeMap<VkAccelerationStructureBuildSizesInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkAccelerationStructureBuildOffsetInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4279:71: error: template argument 1 is invalid
|  4279 | template <> struct LvlTypeMap<VkAccelerationStructureBuildSizesInfoKHR> {
|       |                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4283:32: error: 'VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_GEOMETRY_INFO_KHR'?
|  4283 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_GEOMETRY_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4283:93: error: template argument 1 is invalid
|  4283 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR> {
|       |                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4315:31: error: 'VkPhysicalDeviceRayTracingPipelineFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceRayTracingFeaturesKHR'?
|  4315 | template <> struct LvlTypeMap<VkPhysicalDeviceRayTracingPipelineFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceRayTracingFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4315:76: error: template argument 1 is invalid
|  4315 | template <> struct LvlTypeMap<VkPhysicalDeviceRayTracingPipelineFeaturesKHR> {
|       |                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4319:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR'?
|  4319 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4319:99: error: template argument 1 is invalid
|  4319 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR> {
|       |                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4324:31: error: 'VkPhysicalDeviceRayTracingPipelinePropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceRayTracingPropertiesKHR'?
|  4324 | template <> struct LvlTypeMap<VkPhysicalDeviceRayTracingPipelinePropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceRayTracingPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4324:78: error: template argument 1 is invalid
|  4324 | template <> struct LvlTypeMap<VkPhysicalDeviceRayTracingPipelinePropertiesKHR> {
|       |                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4328:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_KHR'?
|  4328 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4328:101: error: template argument 1 is invalid
|  4328 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR> {
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4333:31: error: 'VkPhysicalDeviceRayQueryFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceRayTracingFeaturesKHR'?
|  4333 | template <> struct LvlTypeMap<VkPhysicalDeviceRayQueryFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceRayTracingFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4333:66: error: template argument 1 is invalid
|  4333 | template <> struct LvlTypeMap<VkPhysicalDeviceRayQueryFeaturesKHR> {
|       |                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4337:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR'?
|  4337 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4337:88: error: template argument 1 is invalid
|  4337 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR> {
|       |                                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:3150:5: error: 'VkPhysicalDeviceFragmentShadingRateKHR' has not been declared
|  3150 |     VkPhysicalDeviceFragmentShadingRateKHR*     pFragmentShadingRates)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:3159:11: error: 'VkFragmentShadingRateCombinerOpKHR' does not name a type
|  3159 |     const VkFragmentShadingRateCombinerOpKHR    combinerOps[2])
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4682:5: error: 'VkFragmentShadingRateNV' has not been declared
|  4682 |     VkFragmentShadingRateNV                     shadingRate,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4683:11: error: 'VkFragmentShadingRateCombinerOpKHR' does not name a type
|  4683 |     const VkFragmentShadingRateCombinerOpKHR    combinerOps[2])
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4739:11: error: 'VkAccelerationStructureBuildRangeInfoKHR' does not name a type; did you mean 'VkAccelerationStructureBuildOffsetInfoKHR'?
|  4739 |     const VkAccelerationStructureBuildRangeInfoKHR* const* ppBuildRangeInfos)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkAccelerationStructureBuildOffsetInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4760:11: error: 'VkAccelerationStructureBuildRangeInfoKHR' does not name a type; did you mean 'VkAccelerationStructureBuildOffsetInfoKHR'?
|  4760 |     const VkAccelerationStructureBuildRangeInfoKHR* const* ppBuildRangeInfos)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkAccelerationStructureBuildOffsetInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4848:11: error: 'VkAccelerationStructureVersionInfoKHR' does not name a type; did you mean 'VkAccelerationStructureVersionKHR'?
|  4848 |     const VkAccelerationStructureVersionInfoKHR* pVersionInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkAccelerationStructureVersionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4849:5: error: 'VkAccelerationStructureCompatibilityKHR' has not been declared
|  4849 |     VkAccelerationStructureCompatibilityKHR*    pCompatibility)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4859:5: error: 'VkAccelerationStructureBuildSizesInfoKHR' has not been declared
|  4859 |     VkAccelerationStructureBuildSizesInfoKHR*   pSizeInfo)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4867:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  4867 |     const VkStridedDeviceAddressRegionKHR*      pRaygenShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4868:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  4868 |     const VkStridedDeviceAddressRegionKHR*      pMissShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4869:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  4869 |     const VkStridedDeviceAddressRegionKHR*      pHitShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4870:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  4870 |     const VkStridedDeviceAddressRegionKHR*      pCallableShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4908:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  4908 |     const VkStridedDeviceAddressRegionKHR*      pRaygenShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4909:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  4909 |     const VkStridedDeviceAddressRegionKHR*      pMissShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4910:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  4910 |     const VkStridedDeviceAddressRegionKHR*      pHitShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4911:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  4911 |     const VkStridedDeviceAddressRegionKHR*      pCallableShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4921:5: error: 'VkShaderGroupShaderKHR' has not been declared
|  4921 |     VkShaderGroupShaderKHR                      groupShader)
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| ninja: build stopped: subcommand failed.
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/temp/run.do_compile.2131' failed with exit code 1:
| [1/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-t
 ools/1.2.162.0-r0=/usr/src/debug/vulkan-tools/1.2.162.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0=/usr/src/debug/vulkan-tools/1.2.162.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -
 Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp
| FAILED: vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1
 .2.162.0-r0=/usr/src/debug/vulkan-tools/1.2.162.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0=/usr/src/debug/vulkan-tools/1.2.162.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimpli
 cit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:980:89: error: 'VkPhysicalDeviceAccelerationStructureFeaturesKHR' has not been declared
|   980 | void DumpVkPhysicalDeviceAccelerationStructureFeaturesKHR(Printer &p, std::string name, VkPhysicalDeviceAccelerationStructureFeaturesKHR &obj) {
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceAccelerationStructureFeaturesKHR(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:982:67: error: request for member 'accelerationStructure' in 'obj', which is of non-class type 'int'
|   982 |     p.PrintKeyBool("accelerationStructure", static_cast<bool>(obj.accelerationStructure), 53);
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:983:80: error: request for member 'accelerationStructureCaptureReplay' in 'obj', which is of non-class type 'int'
|   983 |     p.PrintKeyBool("accelerationStructureCaptureReplay", static_cast<bool>(obj.accelerationStructureCaptureReplay), 53);
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:984:80: error: request for member 'accelerationStructureIndirectBuild' in 'obj', which is of non-class type 'int'
|   984 |     p.PrintKeyBool("accelerationStructureIndirectBuild", static_cast<bool>(obj.accelerationStructureIndirectBuild), 53);
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:985:79: error: request for member 'accelerationStructureHostCommands' in 'obj', which is of non-class type 'int'
|   985 |     p.PrintKeyBool("accelerationStructureHostCommands", static_cast<bool>(obj.accelerationStructureHostCommands), 53);
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:986:99: error: request for member 'descriptorBindingAccelerationStructureUpdateAfterBind' in 'obj', which is of non-class type 'int'
|   986 |     p.PrintKeyBool("descriptorBindingAccelerationStructureUpdateAfterBind", static_cast<bool>(obj.descriptorBindingAccelerationStructureUpdateAfterBind), 53);
|       |                                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:988:91: error: 'VkPhysicalDeviceAccelerationStructurePropertiesKHR' has not been declared
|   988 | void DumpVkPhysicalDeviceAccelerationStructurePropertiesKHR(Printer &p, std::string name, VkPhysicalDeviceAccelerationStructurePropertiesKHR &obj) {
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceAccelerationStructurePropertiesKHR(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:990:45: error: request for member 'maxGeometryCount' in 'obj', which is of non-class type 'int'
|   990 |     p.PrintKeyValue("maxGeometryCount", obj.maxGeometryCount, 58);
|       |                                             ^~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:991:45: error: request for member 'maxInstanceCount' in 'obj', which is of non-class type 'int'
|   991 |     p.PrintKeyValue("maxInstanceCount", obj.maxInstanceCount, 58);
|       |                                             ^~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:992:46: error: request for member 'maxPrimitiveCount' in 'obj', which is of non-class type 'int'
|   992 |     p.PrintKeyValue("maxPrimitiveCount", obj.maxPrimitiveCount, 58);
|       |                                              ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:993:72: error: request for member 'maxPerStageDescriptorAccelerationStructures' in 'obj', which is of non-class type 'int'
|   993 |     p.PrintKeyValue("maxPerStageDescriptorAccelerationStructures", obj.maxPerStageDescriptorAccelerationStructures, 58);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:994:87: error: request for member 'maxPerStageDescriptorUpdateAfterBindAccelerationStructures' in 'obj', which is of non-class type 'int'
|   994 |     p.PrintKeyValue("maxPerStageDescriptorUpdateAfterBindAccelerationStructures", obj.maxPerStageDescriptorUpdateAfterBindAccelerationStructures, 58);
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:995:67: error: request for member 'maxDescriptorSetAccelerationStructures' in 'obj', which is of non-class type 'int'
|   995 |     p.PrintKeyValue("maxDescriptorSetAccelerationStructures", obj.maxDescriptorSetAccelerationStructures, 58);
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:996:82: error: request for member 'maxDescriptorSetUpdateAfterBindAccelerationStructures' in 'obj', which is of non-class type 'int'
|   996 |     p.PrintKeyValue("maxDescriptorSetUpdateAfterBindAccelerationStructures", obj.maxDescriptorSetUpdateAfterBindAccelerationStructures, 58);
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:997:75: error: request for member 'minAccelerationStructureScratchOffsetAlignment' in 'obj', which is of non-class type 'int'
|   997 |     p.PrintKeyValue("minAccelerationStructureScratchOffsetAlignment", obj.minAccelerationStructureScratchOffsetAlignment, 58);
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1110:86: error: 'VkPhysicalDeviceDeviceMemoryReportFeaturesEXT' has not been declared
|  1110 | void DumpVkPhysicalDeviceDeviceMemoryReportFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceDeviceMemoryReportFeaturesEXT &obj) {
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceDeviceMemoryReportFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1112:64: error: request for member 'deviceMemoryReport' in 'obj', which is of non-class type 'int'
|  1112 |     p.PrintKeyBool("deviceMemoryReport", static_cast<bool>(obj.deviceMemoryReport), 18);
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1240:87: error: 'VkPhysicalDeviceFragmentShadingRateFeaturesKHR' has not been declared
|  1240 | void DumpVkPhysicalDeviceFragmentShadingRateFeaturesKHR(Printer &p, std::string name, VkPhysicalDeviceFragmentShadingRateFeaturesKHR &obj) {
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceFragmentShadingRateFeaturesKHR(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1242:73: error: request for member 'pipelineFragmentShadingRate' in 'obj', which is of non-class type 'int'
|  1242 |     p.PrintKeyBool("pipelineFragmentShadingRate", static_cast<bool>(obj.pipelineFragmentShadingRate), 29);
|       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1243:74: error: request for member 'primitiveFragmentShadingRate' in 'obj', which is of non-class type 'int'
|  1243 |     p.PrintKeyBool("primitiveFragmentShadingRate", static_cast<bool>(obj.primitiveFragmentShadingRate), 29);
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1244:75: error: request for member 'attachmentFragmentShadingRate' in 'obj', which is of non-class type 'int'
|  1244 |     p.PrintKeyBool("attachmentFragmentShadingRate", static_cast<bool>(obj.attachmentFragmentShadingRate), 29);
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1246:89: error: 'VkPhysicalDeviceFragmentShadingRatePropertiesKHR' has not been declared
|  1246 | void DumpVkPhysicalDeviceFragmentShadingRatePropertiesKHR(Printer &p, std::string name, VkPhysicalDeviceFragmentShadingRatePropertiesKHR &obj) {
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceFragmentShadingRatePropertiesKHR(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1248:72: error: request for member 'minFragmentShadingRateAttachmentTexelSize' in 'obj', which is of non-class type 'int'
|  1248 |     DumpVkExtent2D(p, "minFragmentShadingRateAttachmentTexelSize", obj.minFragmentShadingRateAttachmentTexelSize);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1249:72: error: request for member 'maxFragmentShadingRateAttachmentTexelSize' in 'obj', which is of non-class type 'int'
|  1249 |     DumpVkExtent2D(p, "maxFragmentShadingRateAttachmentTexelSize", obj.maxFragmentShadingRateAttachmentTexelSize);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1250:81: error: request for member 'maxFragmentShadingRateAttachmentTexelSizeAspectRatio' in 'obj', which is of non-class type 'int'
|  1250 |     p.PrintKeyValue("maxFragmentShadingRateAttachmentTexelSizeAspectRatio", obj.maxFragmentShadingRateAttachmentTexelSizeAspectRatio, 52);
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1251:95: error: request for member 'primitiveFragmentShadingRateWithMultipleViewports' in 'obj', which is of non-class type 'int'
|  1251 |     p.PrintKeyBool("primitiveFragmentShadingRateWithMultipleViewports", static_cast<bool>(obj.primitiveFragmentShadingRateWithMultipleViewports), 52);
|       |                                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1252:75: error: request for member 'layeredShadingRateAttachments' in 'obj', which is of non-class type 'int'
|  1252 |     p.PrintKeyBool("layeredShadingRateAttachments", static_cast<bool>(obj.layeredShadingRateAttachments), 52);
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1253:86: error: request for member 'fragmentShadingRateNonTrivialCombinerOps' in 'obj', which is of non-class type 'int'
|  1253 |     p.PrintKeyBool("fragmentShadingRateNonTrivialCombinerOps", static_cast<bool>(obj.fragmentShadingRateNonTrivialCombinerOps), 52);
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1254:46: error: request for member 'maxFragmentSize' in 'obj', which is of non-class type 'int'
|  1254 |     DumpVkExtent2D(p, "maxFragmentSize", obj.maxFragmentSize);
|       |                                              ^~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1255:55: error: request for member 'maxFragmentSizeAspectRatio' in 'obj', which is of non-class type 'int'
|  1255 |     p.PrintKeyValue("maxFragmentSizeAspectRatio", obj.maxFragmentSizeAspectRatio, 52);
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1256:66: error: request for member 'maxFragmentShadingRateCoverageSamples' in 'obj', which is of non-class type 'int'
|  1256 |     p.PrintKeyValue("maxFragmentShadingRateCoverageSamples", obj.maxFragmentShadingRateCoverageSamples, 52);
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1257:84: error: request for member 'maxFragmentShadingRateRasterizationSamples' in 'obj', which is of non-class type 'int'
|  1257 |     DumpVkSampleCountFlagBits(p, "maxFragmentShadingRateRasterizationSamples", obj.maxFragmentShadingRateRasterizationSamples, 52);
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1258:93: error: request for member 'fragmentShadingRateWithShaderDepthStencilWrites' in 'obj', which is of non-class type 'int'
|  1258 |     p.PrintKeyBool("fragmentShadingRateWithShaderDepthStencilWrites", static_cast<bool>(obj.fragmentShadingRateWithShaderDepthStencilWrites), 52);
|       |                                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1259:79: error: request for member 'fragmentShadingRateWithSampleMask' in 'obj', which is of non-class type 'int'
|  1259 |     p.PrintKeyBool("fragmentShadingRateWithSampleMask", static_cast<bool>(obj.fragmentShadingRateWithSampleMask), 52);
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1260:85: error: request for member 'fragmentShadingRateWithShaderSampleMask' in 'obj', which is of non-class type 'int'
|  1260 |     p.PrintKeyBool("fragmentShadingRateWithShaderSampleMask", static_cast<bool>(obj.fragmentShadingRateWithShaderSampleMask), 52);
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1261:94: error: request for member 'fragmentShadingRateWithConservativeRasterization' in 'obj', which is of non-class type 'int'
|  1261 |     p.PrintKeyBool("fragmentShadingRateWithConservativeRasterization", static_cast<bool>(obj.fragmentShadingRateWithConservativeRasterization), 52);
|       |                                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1262:92: error: request for member 'fragmentShadingRateWithFragmentShaderInterlock' in 'obj', which is of non-class type 'int'
|  1262 |     p.PrintKeyBool("fragmentShadingRateWithFragmentShaderInterlock", static_cast<bool>(obj.fragmentShadingRateWithFragmentShaderInterlock), 52);
|       |                                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1263:90: error: request for member 'fragmentShadingRateWithCustomSampleLocations' in 'obj', which is of non-class type 'int'
|  1263 |     p.PrintKeyBool("fragmentShadingRateWithCustomSampleLocations", static_cast<bool>(obj.fragmentShadingRateWithCustomSampleLocations), 52);
|       |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1264:87: error: request for member 'fragmentShadingRateStrictMultiplyCombiner' in 'obj', which is of non-class type 'int'
|  1264 |     p.PrintKeyBool("fragmentShadingRateStrictMultiplyCombiner", static_cast<bool>(obj.fragmentShadingRateStrictMultiplyCombiner), 52);
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1578:76: error: 'VkPhysicalDeviceRayQueryFeaturesKHR' has not been declared
|  1578 | void DumpVkPhysicalDeviceRayQueryFeaturesKHR(Printer &p, std::string name, VkPhysicalDeviceRayQueryFeaturesKHR &obj) {
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRayQueryFeaturesKHR(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1580:54: error: request for member 'rayQuery' in 'obj', which is of non-class type 'int'
|  1580 |     p.PrintKeyBool("rayQuery", static_cast<bool>(obj.rayQuery), 8);
|       |                                                      ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1582:86: error: 'VkPhysicalDeviceRayTracingPipelineFeaturesKHR' has not been declared
|  1582 | void DumpVkPhysicalDeviceRayTracingPipelineFeaturesKHR(Printer &p, std::string name, VkPhysicalDeviceRayTracingPipelineFeaturesKHR &obj) {
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRayTracingPipelineFeaturesKHR(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1584:64: error: request for member 'rayTracingPipeline' in 'obj', which is of non-class type 'int'
|  1584 |     p.PrintKeyBool("rayTracingPipeline", static_cast<bool>(obj.rayTracingPipeline), 53);
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1585:94: error: request for member 'rayTracingPipelineShaderGroupHandleCaptureReplay' in 'obj', which is of non-class type 'int'
|  1585 |     p.PrintKeyBool("rayTracingPipelineShaderGroupHandleCaptureReplay", static_cast<bool>(obj.rayTracingPipelineShaderGroupHandleCaptureReplay), 53);
|       |                                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1586:99: error: request for member 'rayTracingPipelineShaderGroupHandleCaptureReplayMixed' in 'obj', which is of non-class type 'int'
|  1586 |     p.PrintKeyBool("rayTracingPipelineShaderGroupHandleCaptureReplayMixed", static_cast<bool>(obj.rayTracingPipelineShaderGroupHandleCaptureReplayMixed), 53);
|       |                                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1587:81: error: request for member 'rayTracingPipelineTraceRaysIndirect' in 'obj', which is of non-class type 'int'
|  1587 |     p.PrintKeyBool("rayTracingPipelineTraceRaysIndirect", static_cast<bool>(obj.rayTracingPipelineTraceRaysIndirect), 53);
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1588:74: error: request for member 'rayTraversalPrimitiveCulling' in 'obj', which is of non-class type 'int'
|  1588 |     p.PrintKeyBool("rayTraversalPrimitiveCulling", static_cast<bool>(obj.rayTraversalPrimitiveCulling), 53);
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1590:88: error: 'VkPhysicalDeviceRayTracingPipelinePropertiesKHR' has not been declared
|  1590 | void DumpVkPhysicalDeviceRayTracingPipelinePropertiesKHR(Printer &p, std::string name, VkPhysicalDeviceRayTracingPipelinePropertiesKHR &obj) {
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRayTracingPipelinePropertiesKHR(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1592:50: error: request for member 'shaderGroupHandleSize' in 'obj', which is of non-class type 'int'
|  1592 |     p.PrintKeyValue("shaderGroupHandleSize", obj.shaderGroupHandleSize, 34);
|       |                                                  ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1593:49: error: request for member 'maxRayRecursionDepth' in 'obj', which is of non-class type 'int'
|  1593 |     p.PrintKeyValue("maxRayRecursionDepth", obj.maxRayRecursionDepth, 34);
|       |                                                 ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1594:49: error: request for member 'maxShaderGroupStride' in 'obj', which is of non-class type 'int'
|  1594 |     p.PrintKeyValue("maxShaderGroupStride", obj.maxShaderGroupStride, 34);
|       |                                                 ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1595:53: error: request for member 'shaderGroupBaseAlignment' in 'obj', which is of non-class type 'int'
|  1595 |     p.PrintKeyValue("shaderGroupBaseAlignment", obj.shaderGroupBaseAlignment, 34);
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1596:63: error: request for member 'shaderGroupHandleCaptureReplaySize' in 'obj', which is of non-class type 'int'
|  1596 |     p.PrintKeyValue("shaderGroupHandleCaptureReplaySize", obj.shaderGroupHandleCaptureReplaySize, 34);
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1597:58: error: request for member 'maxRayDispatchInvocationCount' in 'obj', which is of non-class type 'int'
|  1597 |     p.PrintKeyValue("maxRayDispatchInvocationCount", obj.maxRayDispatchInvocationCount, 34);
|       |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1598:55: error: request for member 'shaderGroupHandleAlignment' in 'obj', which is of non-class type 'int'
|  1598 |     p.PrintKeyValue("shaderGroupHandleAlignment", obj.shaderGroupHandleAlignment, 34);
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1599:51: error: request for member 'maxRayHitAttributeSize' in 'obj', which is of non-class type 'int'
|  1599 |     p.PrintKeyValue("maxRayHitAttributeSize", obj.maxRayHitAttributeSize, 34);
|       |                                                   ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1678:90: error: 'VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT' has not been declared
|  1678 | void DumpVkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT &obj) {
|       |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1680:69: error: request for member 'shaderImageInt64Atomics' in 'obj', which is of non-class type 'int'
|  1680 |     p.PrintKeyBool("shaderImageInt64Atomics", static_cast<bool>(obj.shaderImageInt64Atomics), 23);
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1681:69: error: request for member 'sparseImageInt64Atomics' in 'obj', which is of non-class type 'int'
|  1681 |     p.PrintKeyBool("sparseImageInt64Atomics", static_cast<bool>(obj.sparseImageInt64Atomics), 23);
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1687:93: error: 'VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR' has not been declared
|  1687 | void DumpVkPhysicalDeviceShaderTerminateInvocationFeaturesKHR(Printer &p, std::string name, VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR &obj) {
|       |                                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderTerminateInvocationFeaturesKHR(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1689:71: error: request for member 'shaderTerminateInvocation' in 'obj', which is of non-class type 'int'
|  1689 |     p.PrintKeyBool("shaderTerminateInvocation", static_cast<bool>(obj.shaderTerminateInvocation), 25);
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'pNextChainInfos get_chain_infos()':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1972:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR'?
|  1972 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR, sizeof(VkPhysicalDeviceAccelerationStructurePropertiesKHR)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1972:90: error: 'VkPhysicalDeviceAccelerationStructurePropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceAccelerationStructurePropertiesKHR'?
|  1972 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR, sizeof(VkPhysicalDeviceAccelerationStructurePropertiesKHR)},
|       |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                          DumpVkPhysicalDeviceAccelerationStructurePropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1984:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
|  1984 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR, sizeof(VkPhysicalDeviceFragmentShadingRatePropertiesKHR)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1984:89: error: 'VkPhysicalDeviceFragmentShadingRatePropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceFragmentShadingRatePropertiesKHR'?
|  1984 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR, sizeof(VkPhysicalDeviceFragmentShadingRatePropertiesKHR)},
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                         DumpVkPhysicalDeviceFragmentShadingRatePropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1998:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_KHR'?
|  1998 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR, sizeof(VkPhysicalDeviceRayTracingPipelinePropertiesKHR)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1998:88: error: 'VkPhysicalDeviceRayTracingPipelinePropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRayTracingPipelinePropertiesKHR'?
|  1998 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR, sizeof(VkPhysicalDeviceRayTracingPipelinePropertiesKHR)},
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                        DumpVkPhysicalDeviceRayTracingPipelinePropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2010:5: error: no match for 'operator=' (operand types are 'std::vector<pNextChainBuildingBlockInfo>' and '<brace-enclosed initializer list>')
|  2010 |     };
|       |     ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/vector:72,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/vector.tcc:198:5: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(const std::vector<_Tp, _Alloc>&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   198 |     vector<_Tp, _Alloc>::
|       |     ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/vector.tcc:199:42: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'const std::vector<pNextChainBuildingBlockInfo>&'
|   199 |     operator=(const vector<_Tp, _Alloc>& __x)
|       |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/vector:67,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:709:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::vector<_Tp, _Alloc>&&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:709:26: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::vector<pNextChainBuildingBlockInfo>&&'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |                 ~~~~~~~~~^~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:730:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::initializer_list<_Tp>) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   730 |       operator=(initializer_list<value_type> __l)
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:730:46: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::initializer_list<pNextChainBuildingBlockInfo>'
|   730 |       operator=(initializer_list<value_type> __l)
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2019:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR'?
|  2019 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR, sizeof(VkPhysicalDeviceAccelerationStructureFeaturesKHR)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2019:88: error: 'VkPhysicalDeviceAccelerationStructureFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceAccelerationStructureFeaturesKHR'?
|  2019 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR, sizeof(VkPhysicalDeviceAccelerationStructureFeaturesKHR)},
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                        DumpVkPhysicalDeviceAccelerationStructureFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2027:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT'?
|  2027 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT, sizeof(VkPhysicalDeviceDeviceMemoryReportFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2027:86: error: 'VkPhysicalDeviceDeviceMemoryReportFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceDeviceMemoryReportFeaturesEXT'?
|  2027 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT, sizeof(VkPhysicalDeviceDeviceMemoryReportFeaturesEXT)},
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                      DumpVkPhysicalDeviceDeviceMemoryReportFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2032:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT'?
|  2032 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR, sizeof(VkPhysicalDeviceFragmentShadingRateFeaturesKHR)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2032:87: error: 'VkPhysicalDeviceFragmentShadingRateFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceFragmentShadingRateFeaturesKHR'?
|  2032 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR, sizeof(VkPhysicalDeviceFragmentShadingRateFeaturesKHR)},
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                       DumpVkPhysicalDeviceFragmentShadingRateFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2049:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR'?
|  2049 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR, sizeof(VkPhysicalDeviceRayQueryFeaturesKHR)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2049:75: error: 'VkPhysicalDeviceRayQueryFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRayQueryFeaturesKHR'?
|  2049 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR, sizeof(VkPhysicalDeviceRayQueryFeaturesKHR)},
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                           DumpVkPhysicalDeviceRayQueryFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2050:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR'?
|  2050 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR, sizeof(VkPhysicalDeviceRayTracingPipelineFeaturesKHR)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2050:86: error: 'VkPhysicalDeviceRayTracingPipelineFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRayTracingPipelineFeaturesKHR'?
|  2050 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR, sizeof(VkPhysicalDeviceRayTracingPipelineFeaturesKHR)},
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                      DumpVkPhysicalDeviceRayTracingPipelineFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2061:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  2061 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT, sizeof(VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2061:91: error: 'VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT'?
|  2061 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT, sizeof(VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT)},
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                           DumpVkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2063:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  2063 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR, sizeof(VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2063:93: error: 'VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderTerminateInvocationFeaturesKHR'?
|  2063 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR, sizeof(VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR)},
|       |                                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                             DumpVkPhysicalDeviceShaderTerminateInvocationFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2076:5: error: no match for 'operator=' (operand types are 'std::vector<pNextChainBuildingBlockInfo>' and '<brace-enclosed initializer list>')
|  2076 |     };
|       |     ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/vector:72,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/vector.tcc:198:5: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(const std::vector<_Tp, _Alloc>&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   198 |     vector<_Tp, _Alloc>::
|       |     ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/vector.tcc:199:42: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'const std::vector<pNextChainBuildingBlockInfo>&'
|   199 |     operator=(const vector<_Tp, _Alloc>& __x)
|       |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/vector:67,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:709:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::vector<_Tp, _Alloc>&&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:709:26: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::vector<pNextChainBuildingBlockInfo>&&'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |                 ~~~~~~~~~^~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:730:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::initializer_list<_Tp>) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   730 |       operator=(initializer_list<value_type> __l)
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:730:46: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::initializer_list<pNextChainBuildingBlockInfo>'
|   730 |       operator=(initializer_list<value_type> __l)
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_props2(Printer&, AppInstance&, AppGpu&, void*, VulkanVersion)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2093:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR'?
|  2093 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2094:54: error: 'VK_KHR_ACCELERATION_STRUCTURE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_COPY_ACCELERATION_STRUCTURE_MODE_CLONE_NV'?
|  2094 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_ACCELERATION_STRUCTURE_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_COPY_ACCELERATION_STRUCTURE_MODE_CLONE_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2095:13: error: 'VkPhysicalDeviceAccelerationStructurePropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceAccelerationStructurePropertiesKHR'?
|  2095 |             VkPhysicalDeviceAccelerationStructurePropertiesKHR* props = (VkPhysicalDeviceAccelerationStructurePropertiesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceAccelerationStructurePropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2095:65: error: 'props' was not declared in this scope
|  2095 |             VkPhysicalDeviceAccelerationStructurePropertiesKHR* props = (VkPhysicalDeviceAccelerationStructurePropertiesKHR*)structure;
|       |                                                                 ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2095:125: error: expected primary-expression before ')' token
|  2095 |             VkPhysicalDeviceAccelerationStructurePropertiesKHR* props = (VkPhysicalDeviceAccelerationStructurePropertiesKHR*)structure;
|       |                                                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2169:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
|  2169 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2170:54: error: 'VK_KHR_FRAGMENT_SHADING_RATE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME'?
|  2170 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_FRAGMENT_SHADING_RATE_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2171:13: error: 'VkPhysicalDeviceFragmentShadingRatePropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceFragmentShadingRatePropertiesKHR'?
|  2171 |             VkPhysicalDeviceFragmentShadingRatePropertiesKHR* props = (VkPhysicalDeviceFragmentShadingRatePropertiesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceFragmentShadingRatePropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2171:63: error: 'props' was not declared in this scope
|  2171 |             VkPhysicalDeviceFragmentShadingRatePropertiesKHR* props = (VkPhysicalDeviceFragmentShadingRatePropertiesKHR*)structure;
|       |                                                               ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2171:121: error: expected primary-expression before ')' token
|  2171 |             VkPhysicalDeviceFragmentShadingRatePropertiesKHR* props = (VkPhysicalDeviceFragmentShadingRatePropertiesKHR*)structure;
|       |                                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2247:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_KHR'?
|  2247 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2248:54: error: 'VK_KHR_RAY_TRACING_PIPELINE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_RAY_TRACING_EXTENSION_NAME'?
|  2248 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_RAY_TRACING_PIPELINE_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_RAY_TRACING_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2249:13: error: 'VkPhysicalDeviceRayTracingPipelinePropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRayTracingPipelinePropertiesKHR'?
|  2249 |             VkPhysicalDeviceRayTracingPipelinePropertiesKHR* props = (VkPhysicalDeviceRayTracingPipelinePropertiesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceRayTracingPipelinePropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2249:62: error: 'props' was not declared in this scope
|  2249 |             VkPhysicalDeviceRayTracingPipelinePropertiesKHR* props = (VkPhysicalDeviceRayTracingPipelinePropertiesKHR*)structure;
|       |                                                              ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2249:119: error: expected primary-expression before ')' token
|  2249 |             VkPhysicalDeviceRayTracingPipelinePropertiesKHR* props = (VkPhysicalDeviceRayTracingPipelinePropertiesKHR*)structure;
|       |                                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, void*, VulkanVersion)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2367:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR'?
|  2367 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2368:54: error: 'VK_KHR_ACCELERATION_STRUCTURE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_COPY_ACCELERATION_STRUCTURE_MODE_CLONE_NV'?
|  2368 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_ACCELERATION_STRUCTURE_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_COPY_ACCELERATION_STRUCTURE_MODE_CLONE_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2369:13: error: 'VkPhysicalDeviceAccelerationStructureFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceAccelerationStructureFeaturesKHR'?
|  2369 |             VkPhysicalDeviceAccelerationStructureFeaturesKHR* props = (VkPhysicalDeviceAccelerationStructureFeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceAccelerationStructureFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2369:63: error: 'props' was not declared in this scope
|  2369 |             VkPhysicalDeviceAccelerationStructureFeaturesKHR* props = (VkPhysicalDeviceAccelerationStructureFeaturesKHR*)structure;
|       |                                                               ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2369:121: error: expected primary-expression before ')' token
|  2369 |             VkPhysicalDeviceAccelerationStructureFeaturesKHR* props = (VkPhysicalDeviceAccelerationStructureFeaturesKHR*)structure;
|       |                                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2417:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT'?
|  2417 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2418:54: error: 'VK_EXT_DEVICE_MEMORY_REPORT_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEBUG_REPORT_EXTENSION_NAME'?
|  2418 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_DEVICE_MEMORY_REPORT_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_DEBUG_REPORT_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2419:13: error: 'VkPhysicalDeviceDeviceMemoryReportFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceDeviceMemoryReportFeaturesEXT'?
|  2419 |             VkPhysicalDeviceDeviceMemoryReportFeaturesEXT* props = (VkPhysicalDeviceDeviceMemoryReportFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceDeviceMemoryReportFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2419:60: error: 'props' was not declared in this scope
|  2419 |             VkPhysicalDeviceDeviceMemoryReportFeaturesEXT* props = (VkPhysicalDeviceDeviceMemoryReportFeaturesEXT*)structure;
|       |                                                            ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2419:115: error: expected primary-expression before ')' token
|  2419 |             VkPhysicalDeviceDeviceMemoryReportFeaturesEXT* props = (VkPhysicalDeviceDeviceMemoryReportFeaturesEXT*)structure;
|       |                                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2447:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT'?
|  2447 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2448:54: error: 'VK_KHR_FRAGMENT_SHADING_RATE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME'?
|  2448 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_FRAGMENT_SHADING_RATE_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2449:13: error: 'VkPhysicalDeviceFragmentShadingRateFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceFragmentShadingRateFeaturesKHR'?
|  2449 |             VkPhysicalDeviceFragmentShadingRateFeaturesKHR* props = (VkPhysicalDeviceFragmentShadingRateFeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceFragmentShadingRateFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2449:61: error: 'props' was not declared in this scope
|  2449 |             VkPhysicalDeviceFragmentShadingRateFeaturesKHR* props = (VkPhysicalDeviceFragmentShadingRateFeaturesKHR*)structure;
|       |                                                             ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2449:117: error: expected primary-expression before ')' token
|  2449 |             VkPhysicalDeviceFragmentShadingRateFeaturesKHR* props = (VkPhysicalDeviceFragmentShadingRateFeaturesKHR*)structure;
|       |                                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2542:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR'?
|  2542 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2543:54: error: 'VK_KHR_RAY_QUERY_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_RAY_TRACING_EXTENSION_NAME'?
|  2543 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_RAY_QUERY_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_RAY_TRACING_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2544:13: error: 'VkPhysicalDeviceRayQueryFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRayQueryFeaturesKHR'?
|  2544 |             VkPhysicalDeviceRayQueryFeaturesKHR* props = (VkPhysicalDeviceRayQueryFeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceRayQueryFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2544:50: error: 'props' was not declared in this scope
|  2544 |             VkPhysicalDeviceRayQueryFeaturesKHR* props = (VkPhysicalDeviceRayQueryFeaturesKHR*)structure;
|       |                                                  ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2544:95: error: expected primary-expression before ')' token
|  2544 |             VkPhysicalDeviceRayQueryFeaturesKHR* props = (VkPhysicalDeviceRayQueryFeaturesKHR*)structure;
|       |                                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2548:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR'?
|  2548 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2549:54: error: 'VK_KHR_RAY_TRACING_PIPELINE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_RAY_TRACING_EXTENSION_NAME'?
|  2549 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_RAY_TRACING_PIPELINE_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_RAY_TRACING_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2550:13: error: 'VkPhysicalDeviceRayTracingPipelineFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRayTracingPipelineFeaturesKHR'?
|  2550 |             VkPhysicalDeviceRayTracingPipelineFeaturesKHR* props = (VkPhysicalDeviceRayTracingPipelineFeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceRayTracingPipelineFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2550:60: error: 'props' was not declared in this scope
|  2550 |             VkPhysicalDeviceRayTracingPipelineFeaturesKHR* props = (VkPhysicalDeviceRayTracingPipelineFeaturesKHR*)structure;
|       |                                                            ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2550:115: error: expected primary-expression before ')' token
|  2550 |             VkPhysicalDeviceRayTracingPipelineFeaturesKHR* props = (VkPhysicalDeviceRayTracingPipelineFeaturesKHR*)structure;
|       |                                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2619:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  2619 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2620:54: error: 'VK_EXT_SHADER_IMAGE_ATOMIC_INT64_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME'?
|  2620 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_SHADER_IMAGE_ATOMIC_INT64_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2621:13: error: 'VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT'?
|  2621 |             VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT* props = (VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2621:64: error: 'props' was not declared in this scope
|  2621 |             VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT* props = (VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT*)structure;
|       |                                                                ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2621:123: error: expected primary-expression before ')' token
|  2621 |             VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT* props = (VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT*)structure;
|       |                                                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2632:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  2632 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2633:54: error: 'VK_KHR_SHADER_TERMINATE_INVOCATION_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME'?
|  2633 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_SHADER_TERMINATE_INVOCATION_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2634:13: error: 'VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderTerminateInvocationFeaturesKHR'?
|  2634 |             VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR* props = (VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceShaderTerminateInvocationFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2634:67: error: 'props' was not declared in this scope
|  2634 |             VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR* props = (VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR*)structure;
|       |                                                                   ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2634:129: error: expected primary-expression before ')' token
|  2634 |             VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR* props = (VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR*)structure;
|       |                                                                                                                                 ^
| [2/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd -Iicd -I. -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.
 2.162.0-r0=/usr/src/debug/vulkan-tools/1.2.162.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0=/usr/src/debug/vulkan-tools/1.2.162.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplic
 it-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp
| FAILED: icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd -Iicd -I. -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.
 0-r0=/usr/src/debug/vulkan-tools/1.2.162.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0=/usr/src/debug/vulkan-tools/1.2.162.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fal
 lthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:22:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:1872:5: error: 'VkPhysicalDeviceFragmentShadingRateKHR' has not been declared
|  1872 |     VkPhysicalDeviceFragmentShadingRateKHR*     pFragmentShadingRates);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:1877:11: error: 'VkFragmentShadingRateCombinerOpKHR' does not name a type
|  1877 |     const VkFragmentShadingRateCombinerOpKHR    combinerOps[2]);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2863:5: error: 'VkFragmentShadingRateNV' has not been declared
|  2863 |     VkFragmentShadingRateNV                     shadingRate,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2864:11: error: 'VkFragmentShadingRateCombinerOpKHR' does not name a type
|  2864 |     const VkFragmentShadingRateCombinerOpKHR    combinerOps[2]);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2900:11: error: 'VkAccelerationStructureBuildRangeInfoKHR' does not name a type; did you mean 'VkAccelerationStructureBuildOffsetInfoKHR'?
|  2900 |     const VkAccelerationStructureBuildRangeInfoKHR* const* ppBuildRangeInfos);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkAccelerationStructureBuildOffsetInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2915:11: error: 'VkAccelerationStructureBuildRangeInfoKHR' does not name a type; did you mean 'VkAccelerationStructureBuildOffsetInfoKHR'?
|  2915 |     const VkAccelerationStructureBuildRangeInfoKHR* const* ppBuildRangeInfos);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkAccelerationStructureBuildOffsetInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2967:11: error: 'VkAccelerationStructureVersionInfoKHR' does not name a type; did you mean 'VkAccelerationStructureVersionKHR'?
|  2967 |     const VkAccelerationStructureVersionInfoKHR* pVersionInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkAccelerationStructureVersionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2968:5: error: 'VkAccelerationStructureCompatibilityKHR' has not been declared
|  2968 |     VkAccelerationStructureCompatibilityKHR*    pCompatibility);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2975:5: error: 'VkAccelerationStructureBuildSizesInfoKHR' has not been declared
|  2975 |     VkAccelerationStructureBuildSizesInfoKHR*   pSizeInfo);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2980:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  2980 |     const VkStridedDeviceAddressRegionKHR*      pRaygenShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2981:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  2981 |     const VkStridedDeviceAddressRegionKHR*      pMissShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2982:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  2982 |     const VkStridedDeviceAddressRegionKHR*      pHitShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:2983:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  2983 |     const VkStridedDeviceAddressRegionKHR*      pCallableShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:3007:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  3007 |     const VkStridedDeviceAddressRegionKHR*      pRaygenShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:3008:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  3008 |     const VkStridedDeviceAddressRegionKHR*      pMissShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:3009:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  3009 |     const VkStridedDeviceAddressRegionKHR*      pHitShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:3010:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  3010 |     const VkStridedDeviceAddressRegionKHR*      pCallableShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.h:3017:5: error: 'VkShaderGroupShaderKHR' has not been declared
|  3017 |     VkShaderGroupShaderKHR                      groupShader);
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2043:31: error: 'VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderAtomicInt64FeaturesKHR'?
|  2043 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderAtomicInt64FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2043:83: error: template argument 1 is invalid
|  2043 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2047:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  2047 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2047:106: error: template argument 1 is invalid
|  2047 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR> {
|       |                                                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2052:31: error: 'VkFragmentShadingRateAttachmentInfoKHR' was not declared in this scope
|  2052 | template <> struct LvlTypeMap<VkFragmentShadingRateAttachmentInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2052:69: error: template argument 1 is invalid
|  2052 | template <> struct LvlTypeMap<VkFragmentShadingRateAttachmentInfoKHR> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2056:32: error: 'VK_STRUCTURE_TYPE_FRAGMENT_SHADING_RATE_ATTACHMENT_INFO_KHR' was not declared in this scope
|  2056 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_FRAGMENT_SHADING_RATE_ATTACHMENT_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2056:91: error: template argument 1 is invalid
|  2056 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_FRAGMENT_SHADING_RATE_ATTACHMENT_INFO_KHR> {
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2061:31: error: 'VkPipelineFragmentShadingRateStateCreateInfoKHR' was not declared in this scope; did you mean 'VkPipelineViewportShadingRateImageStateCreateInfoNV'?
|  2061 | template <> struct LvlTypeMap<VkPipelineFragmentShadingRateStateCreateInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPipelineViewportShadingRateImageStateCreateInfoNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2061:78: error: template argument 1 is invalid
|  2061 | template <> struct LvlTypeMap<VkPipelineFragmentShadingRateStateCreateInfoKHR> {
|       |                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2065:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_STATE_CREATE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_SHADING_RATE_IMAGE_STATE_CREATE_INFO_NV'?
|  2065 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_STATE_CREATE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_SHADING_RATE_IMAGE_STATE_CREATE_INFO_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2065:102: error: template argument 1 is invalid
|  2065 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_STATE_CREATE_INFO_KHR> {
|       |                                                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2070:31: error: 'VkPhysicalDeviceFragmentShadingRateFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT'?
|  2070 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRateFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceFragmentDensityMap2FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2070:77: error: template argument 1 is invalid
|  2070 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRateFeaturesKHR> {
|       |                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2074:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT'?
|  2074 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2074:100: error: template argument 1 is invalid
|  2074 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR> {
|       |                                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2079:31: error: 'VkPhysicalDeviceFragmentShadingRatePropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT'?
|  2079 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRatePropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceFragmentDensityMap2PropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2079:79: error: template argument 1 is invalid
|  2079 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRatePropertiesKHR> {
|       |                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2083:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
|  2083 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2083:102: error: template argument 1 is invalid
|  2083 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR> {
|       |                                                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2088:31: error: 'VkPhysicalDeviceFragmentShadingRateKHR' was not declared in this scope
|  2088 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRateKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2088:69: error: template argument 1 is invalid
|  2088 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRateKHR> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2092:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR'?
|  2092 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:2092:91: error: template argument 1 is invalid
|  2092 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_KHR> {
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3578:31: error: 'VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderAtomicInt64FeaturesKHR'?
|  3578 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderAtomicInt64FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3578:80: error: template argument 1 is invalid
|  3578 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT> {
|       |                                                                                ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3582:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  3582 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3582:104: error: template argument 1 is invalid
|  3582 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT> {
|       |                                                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3944:31: error: 'VkPhysicalDeviceDeviceMemoryReportFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMemoryPriorityFeaturesEXT'?
|  3944 | template <> struct LvlTypeMap<VkPhysicalDeviceDeviceMemoryReportFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMemoryPriorityFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3944:76: error: template argument 1 is invalid
|  3944 | template <> struct LvlTypeMap<VkPhysicalDeviceDeviceMemoryReportFeaturesEXT> {
|       |                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3948:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT'?
|  3948 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3948:99: error: template argument 1 is invalid
|  3948 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT> {
|       |                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3953:31: error: 'VkDeviceMemoryReportCallbackDataEXT' was not declared in this scope
|  3953 | template <> struct LvlTypeMap<VkDeviceMemoryReportCallbackDataEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3953:66: error: template argument 1 is invalid
|  3953 | template <> struct LvlTypeMap<VkDeviceMemoryReportCallbackDataEXT> {
|       |                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3957:32: error: 'VK_STRUCTURE_TYPE_DEVICE_MEMORY_REPORT_CALLBACK_DATA_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CALLBACK_DATA_EXT'?
|  3957 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_MEMORY_REPORT_CALLBACK_DATA_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CALLBACK_DATA_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3957:88: error: template argument 1 is invalid
|  3957 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_MEMORY_REPORT_CALLBACK_DATA_EXT> {
|       |                                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3962:31: error: 'VkDeviceDeviceMemoryReportCreateInfoEXT' was not declared in this scope
|  3962 | template <> struct LvlTypeMap<VkDeviceDeviceMemoryReportCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3962:70: error: template argument 1 is invalid
|  3962 | template <> struct LvlTypeMap<VkDeviceDeviceMemoryReportCreateInfoEXT> {
|       |                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3966:32: error: 'VK_STRUCTURE_TYPE_DEVICE_DEVICE_MEMORY_REPORT_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO_EXT'?
|  3966 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_DEVICE_MEMORY_REPORT_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3966:93: error: template argument 1 is invalid
|  3966 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_DEVICE_MEMORY_REPORT_CREATE_INFO_EXT> {
|       |                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4070:31: error: 'VkPhysicalDeviceFragmentShadingRateEnumsFeaturesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV'?
|  4070 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRateEnumsFeaturesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4070:81: error: template argument 1 is invalid
|  4070 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRateEnumsFeaturesNV> {
|       |                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4074:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_FEATURES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV'?
|  4074 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_FEATURES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4074:105: error: template argument 1 is invalid
|  4074 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_FEATURES_NV> {
|       |                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4079:31: error: 'VkPhysicalDeviceFragmentShadingRateEnumsPropertiesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceShadingRateImagePropertiesNV'?
|  4079 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRateEnumsPropertiesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShadingRateImagePropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4079:83: error: template argument 1 is invalid
|  4079 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShadingRateEnumsPropertiesNV> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4083:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_PROPERTIES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_PROPERTIES_NV'?
|  4083 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_PROPERTIES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_PROPERTIES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4083:107: error: template argument 1 is invalid
|  4083 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_PROPERTIES_NV> {
|       |                                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4088:31: error: 'VkPipelineFragmentShadingRateEnumStateCreateInfoNV' was not declared in this scope; did you mean 'VkPipelineViewportShadingRateImageStateCreateInfoNV'?
|  4088 | template <> struct LvlTypeMap<VkPipelineFragmentShadingRateEnumStateCreateInfoNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPipelineViewportShadingRateImageStateCreateInfoNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4088:81: error: template argument 1 is invalid
|  4088 | template <> struct LvlTypeMap<VkPipelineFragmentShadingRateEnumStateCreateInfoNV> {
|       |                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4092:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_ENUM_STATE_CREATE_INFO_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_SHADING_RATE_IMAGE_STATE_CREATE_INFO_NV'?
|  4092 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_ENUM_STATE_CREATE_INFO_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_SHADING_RATE_IMAGE_STATE_CREATE_INFO_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4092:106: error: template argument 1 is invalid
|  4092 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_ENUM_STATE_CREATE_INFO_NV> {
|       |                                                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4115:31: error: 'VkCopyCommandTransformInfoQCOM' was not declared in this scope
|  4115 | template <> struct LvlTypeMap<VkCopyCommandTransformInfoQCOM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4115:61: error: template argument 1 is invalid
|  4115 | template <> struct LvlTypeMap<VkCopyCommandTransformInfoQCOM> {
|       |                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4119:32: error: 'VK_STRUCTURE_TYPE_COPY_COMMAND_TRANSFORM_INFO_QCOM' was not declared in this scope
|  4119 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_COMMAND_TRANSFORM_INFO_QCOM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4119:82: error: template argument 1 is invalid
|  4119 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_COMMAND_TRANSFORM_INFO_QCOM> {
|       |                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4207:20: error: redefinition of 'struct LvlTypeMap<VkWriteDescriptorSetAccelerationStructureKHR>'
|  4207 | template <> struct LvlTypeMap<VkWriteDescriptorSetAccelerationStructureKHR> {
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3131:20: note: previous definition of 'struct LvlTypeMap<VkWriteDescriptorSetAccelerationStructureKHR>'
|  3131 | template <> struct LvlTypeMap<VkWriteDescriptorSetAccelerationStructureNV> {
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4211:20: error: redefinition of 'struct LvlSTypeMap<VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_KHR>'
|  4211 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_KHR> {
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:3135:20: note: previous definition of 'struct LvlSTypeMap<VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_KHR>'
|  3135 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_NV> {
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4216:31: error: 'VkPhysicalDeviceAccelerationStructureFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceTimelineSemaphoreFeaturesKHR'?
|  4216 | template <> struct LvlTypeMap<VkPhysicalDeviceAccelerationStructureFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceTimelineSemaphoreFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4216:79: error: template argument 1 is invalid
|  4216 | template <> struct LvlTypeMap<VkPhysicalDeviceAccelerationStructureFeaturesKHR> {
|       |                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4220:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR'?
|  4220 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4220:101: error: template argument 1 is invalid
|  4220 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR> {
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4225:31: error: 'VkPhysicalDeviceAccelerationStructurePropertiesKHR' was not declared in this scope; did you mean 'vkWriteAccelerationStructuresPropertiesKHR'?
|  4225 | template <> struct LvlTypeMap<VkPhysicalDeviceAccelerationStructurePropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               vkWriteAccelerationStructuresPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4225:81: error: template argument 1 is invalid
|  4225 | template <> struct LvlTypeMap<VkPhysicalDeviceAccelerationStructurePropertiesKHR> {
|       |                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4229:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR'?
|  4229 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4229:103: error: template argument 1 is invalid
|  4229 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR> {
|       |                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4243:31: error: 'VkAccelerationStructureVersionInfoKHR' was not declared in this scope; did you mean 'VkAccelerationStructureVersionKHR'?
|  4243 | template <> struct LvlTypeMap<VkAccelerationStructureVersionInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkAccelerationStructureVersionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4243:68: error: template argument 1 is invalid
|  4243 | template <> struct LvlTypeMap<VkAccelerationStructureVersionInfoKHR> {
|       |                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4247:32: error: 'VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_VERSION_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_VERSION_KHR'?
|  4247 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_VERSION_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_VERSION_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4247:89: error: template argument 1 is invalid
|  4247 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_VERSION_INFO_KHR> {
|       |                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4279:31: error: 'VkAccelerationStructureBuildSizesInfoKHR' was not declared in this scope; did you mean 'VkAccelerationStructureBuildOffsetInfoKHR'?
|  4279 | template <> struct LvlTypeMap<VkAccelerationStructureBuildSizesInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkAccelerationStructureBuildOffsetInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4279:71: error: template argument 1 is invalid
|  4279 | template <> struct LvlTypeMap<VkAccelerationStructureBuildSizesInfoKHR> {
|       |                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4283:32: error: 'VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_GEOMETRY_INFO_KHR'?
|  4283 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_GEOMETRY_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4283:93: error: template argument 1 is invalid
|  4283 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR> {
|       |                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4315:31: error: 'VkPhysicalDeviceRayTracingPipelineFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceRayTracingFeaturesKHR'?
|  4315 | template <> struct LvlTypeMap<VkPhysicalDeviceRayTracingPipelineFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceRayTracingFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4315:76: error: template argument 1 is invalid
|  4315 | template <> struct LvlTypeMap<VkPhysicalDeviceRayTracingPipelineFeaturesKHR> {
|       |                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4319:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR'?
|  4319 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4319:99: error: template argument 1 is invalid
|  4319 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR> {
|       |                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4324:31: error: 'VkPhysicalDeviceRayTracingPipelinePropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceRayTracingPropertiesKHR'?
|  4324 | template <> struct LvlTypeMap<VkPhysicalDeviceRayTracingPipelinePropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceRayTracingPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4324:78: error: template argument 1 is invalid
|  4324 | template <> struct LvlTypeMap<VkPhysicalDeviceRayTracingPipelinePropertiesKHR> {
|       |                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4328:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_KHR'?
|  4328 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4328:101: error: template argument 1 is invalid
|  4328 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR> {
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4333:31: error: 'VkPhysicalDeviceRayQueryFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceRayTracingFeaturesKHR'?
|  4333 | template <> struct LvlTypeMap<VkPhysicalDeviceRayQueryFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceRayTracingFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4333:66: error: template argument 1 is invalid
|  4333 | template <> struct LvlTypeMap<VkPhysicalDeviceRayQueryFeaturesKHR> {
|       |                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4337:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR'?
|  4337 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/vk_typemap_helper.h:4337:88: error: template argument 1 is invalid
|  4337 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR> {
|       |                                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:3150:5: error: 'VkPhysicalDeviceFragmentShadingRateKHR' has not been declared
|  3150 |     VkPhysicalDeviceFragmentShadingRateKHR*     pFragmentShadingRates)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:3159:11: error: 'VkFragmentShadingRateCombinerOpKHR' does not name a type
|  3159 |     const VkFragmentShadingRateCombinerOpKHR    combinerOps[2])
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4682:5: error: 'VkFragmentShadingRateNV' has not been declared
|  4682 |     VkFragmentShadingRateNV                     shadingRate,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4683:11: error: 'VkFragmentShadingRateCombinerOpKHR' does not name a type
|  4683 |     const VkFragmentShadingRateCombinerOpKHR    combinerOps[2])
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4739:11: error: 'VkAccelerationStructureBuildRangeInfoKHR' does not name a type; did you mean 'VkAccelerationStructureBuildOffsetInfoKHR'?
|  4739 |     const VkAccelerationStructureBuildRangeInfoKHR* const* ppBuildRangeInfos)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkAccelerationStructureBuildOffsetInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4760:11: error: 'VkAccelerationStructureBuildRangeInfoKHR' does not name a type; did you mean 'VkAccelerationStructureBuildOffsetInfoKHR'?
|  4760 |     const VkAccelerationStructureBuildRangeInfoKHR* const* ppBuildRangeInfos)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkAccelerationStructureBuildOffsetInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4848:11: error: 'VkAccelerationStructureVersionInfoKHR' does not name a type; did you mean 'VkAccelerationStructureVersionKHR'?
|  4848 |     const VkAccelerationStructureVersionInfoKHR* pVersionInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkAccelerationStructureVersionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4849:5: error: 'VkAccelerationStructureCompatibilityKHR' has not been declared
|  4849 |     VkAccelerationStructureCompatibilityKHR*    pCompatibility)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4859:5: error: 'VkAccelerationStructureBuildSizesInfoKHR' has not been declared
|  4859 |     VkAccelerationStructureBuildSizesInfoKHR*   pSizeInfo)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4867:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  4867 |     const VkStridedDeviceAddressRegionKHR*      pRaygenShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4868:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  4868 |     const VkStridedDeviceAddressRegionKHR*      pMissShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4869:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  4869 |     const VkStridedDeviceAddressRegionKHR*      pHitShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4870:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  4870 |     const VkStridedDeviceAddressRegionKHR*      pCallableShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4908:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  4908 |     const VkStridedDeviceAddressRegionKHR*      pRaygenShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4909:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  4909 |     const VkStridedDeviceAddressRegionKHR*      pMissShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4910:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  4910 |     const VkStridedDeviceAddressRegionKHR*      pHitShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4911:11: error: 'VkStridedDeviceAddressRegionKHR' does not name a type; did you mean 'VkStridedBufferRegionKHR'?
|  4911 |     const VkStridedDeviceAddressRegionKHR*      pCallableShaderBindingTable,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkStridedBufferRegionKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.162.0-r0/git/icd/generated/mock_icd.cpp:4921:5: error: 'VkShaderGroupShaderKHR' has not been declared
|  4921 |     VkShaderGroupShaderKHR                      groupShader)
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| ninja: build stopped: subcommand failed.
| WARNING: exit code 1 from a shell command.
| 
NOTE: recipe vulkan-tools-1.2.162.0-r0: task do_compile: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.0.bb:do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2297 tasks of which 2288 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.0.bb:do_compile
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============4186909543582277685==--
