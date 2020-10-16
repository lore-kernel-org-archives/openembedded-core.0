Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.12222.1602843683341884250
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6706338C1677
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:24 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.2.154.0 FAILED
Message-ID: <MADEUP.163E71D704CB3774.13247@lists.openembedded.org>
X-Groupsio-MsgNum: 143474
Content-Type: multipart/mixed; boundary="===============8527777379211087381=="

--===============8527777379211087381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-tools* to *1.2.154.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.2.135.0-1.2.154.0.patch
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

--===============8527777379211087381==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.2.135.0-1.2.154.0.patch"

From be2fcd002946d6906f0196ba4fbc434a57ba711b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 09:01:59 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.2.135.0 -> 1.2.154.0

---
 .../{vulkan-tools_1.2.135.0.bb => vulkan-tools_1.2.154.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.2.135.0.bb => vulkan-tools_1.2.154.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.135.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.2.135.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb
index 085c0e27e9..0fc3494eea 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.135.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb
@@ -5,8 +5,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.135"
-SRCREV = "6d8197fd6c91d352a601587ffdde28f4cd7bc399"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.154"
+SRCREV = "10d757bb1072416ddfbe4c24b43d4cd2f808a5c7"
 
 S = "${WORKDIR}/git"
 
-- 
2.18.4


--===============8527777379211087381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1463 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (784 cached, 1 parsed). 1356 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5480bb7eb828d071dd670f3b9fb699dafebcce38"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 229 Found 221 Missed 8 Current 498 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1577 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb:do_fetch)
NOTE: recipe vulkan-tools-1.2.154.0-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.2.154.0-r0: task do_fetch: Succeeded
NOTE: Running task 2260 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb:do_unpack)
NOTE: Running task 2261 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.2.154.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.2.154.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.2.154.0-r0: task do_unpack: Succeeded
NOTE: Running task 2262 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb:do_patch)
NOTE: recipe vulkan-tools-1.2.154.0-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.2.154.0-r0: task do_patch: Succeeded
NOTE: Running task 2263 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb:do_generate_toolchain_file)
NOTE: Running task 2264 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2265 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb:do_populate_lic)
NOTE: recipe vulkan-tools-1.2.154.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.2.154.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.2.154.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.2.154.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-tools-1.2.154.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.2.154.0-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-tools-1.2.154.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2266 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.2.154.0-r0: task do_configure: Started
NOTE: recipe vulkan-tools-1.2.154.0-r0: task do_configure: Succeeded
NOTE: Running task 2267 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb:do_compile)
NOTE: recipe vulkan-tools-1.2.154.0-r0: task do_compile: Started
ERROR: vulkan-tools-1.2.154.0-r0 do_compile: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/temp/run.do_compile.3470107' failed with exit code 1:
[1/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd -Iicd -I. -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.
 154.0-r0=/usr/src/debug/vulkan-tools/1.2.154.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0=/usr/src/debug/vulkan-tools/1.2.154.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit
 -fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp
FAILED: icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd -Iicd -I. -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-
 r0=/usr/src/debug/vulkan-tools/1.2.154.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0=/usr/src/debug/vulkan-tools/1.2.154.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallt
 hrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:22:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:1928:11: error: 'VkCopyBufferInfo2KHR' does not name a type
 1928 |     const VkCopyBufferInfo2KHR*                 pCopyBufferInfo);
      |           ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:1932:11: error: 'VkCopyImageInfo2KHR' does not name a type
 1932 |     const VkCopyImageInfo2KHR*                  pCopyImageInfo);
      |           ^~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:1936:11: error: 'VkCopyBufferToImageInfo2KHR' does not name a type
 1936 |     const VkCopyBufferToImageInfo2KHR*          pCopyBufferToImageInfo);
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:1940:11: error: 'VkCopyImageToBufferInfo2KHR' does not name a type
 1940 |     const VkCopyImageToBufferInfo2KHR*          pCopyImageToBufferInfo);
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:1944:11: error: 'VkBlitImageInfo2KHR' does not name a type
 1944 |     const VkBlitImageInfo2KHR*                  pBlitImageInfo);
      |           ^~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:1948:11: error: 'VkResolveImageInfo2KHR' does not name a type
 1948 |     const VkResolveImageInfo2KHR*               pResolveImageInfo);
      |           ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:2053:5: error: 'VkImageViewAddressPropertiesNVX' has not been declared
 2053 |     VkImageViewAddressPropertiesNVX*            pProperties);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:2835:11: error: 'VkPrivateDataSlotCreateInfoEXT' does not name a type
 2835 |     const VkPrivateDataSlotCreateInfoEXT*       pCreateInfo,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:2837:5: error: 'VkPrivateDataSlotEXT' has not been declared
 2837 |     VkPrivateDataSlotEXT*                       pPrivateDataSlot);
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:2841:5: error: 'VkPrivateDataSlotEXT' has not been declared
 2841 |     VkPrivateDataSlotEXT                        privateDataSlot,
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:2848:5: error: 'VkPrivateDataSlotEXT' has not been declared
 2848 |     VkPrivateDataSlotEXT                        privateDataSlot,
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:2855:5: error: 'VkPrivateDataSlotEXT' has not been declared
 2855 |     VkPrivateDataSlotEXT                        privateDataSlot,
      |     ^~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:27:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2013:31: error: 'VkPhysicalDevicePortabilitySubsetFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceVariablePointerFeaturesKHR'?
 2013 | template <> struct LvlTypeMap<VkPhysicalDevicePortabilitySubsetFeaturesKHR> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceVariablePointerFeaturesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2013:75: error: template argument 1 is invalid
 2013 | template <> struct LvlTypeMap<VkPhysicalDevicePortabilitySubsetFeaturesKHR> {
      |                                                                           ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2017:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR'?
 2017 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2017:97: error: template argument 1 is invalid
 2017 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR> {
      |                                                                                                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2024:31: error: 'VkPhysicalDevicePortabilitySubsetPropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance3PropertiesKHR'?
 2024 | template <> struct LvlTypeMap<VkPhysicalDevicePortabilitySubsetPropertiesKHR> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceMaintenance3PropertiesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2024:77: error: template argument 1 is invalid
 2024 | template <> struct LvlTypeMap<VkPhysicalDevicePortabilitySubsetPropertiesKHR> {
      |                                                                             ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2028:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR'?
 2028 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2028:99: error: template argument 1 is invalid
 2028 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR> {
      |                                                                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2128:31: error: 'VkBufferCopy2KHR' was not declared in this scope; did you mean 'VkBufferCopy'?
 2128 | template <> struct LvlTypeMap<VkBufferCopy2KHR> {
      |                               ^~~~~~~~~~~~~~~~
      |                               VkBufferCopy
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2128:47: error: template argument 1 is invalid
 2128 | template <> struct LvlTypeMap<VkBufferCopy2KHR> {
      |                                               ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2132:32: error: 'VK_STRUCTURE_TYPE_BUFFER_COPY_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO'?
 2132 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BUFFER_COPY_2_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2132:67: error: template argument 1 is invalid
 2132 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BUFFER_COPY_2_KHR> {
      |                                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2137:31: error: 'VkCopyBufferInfo2KHR' was not declared in this scope
 2137 | template <> struct LvlTypeMap<VkCopyBufferInfo2KHR> {
      |                               ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2137:51: error: template argument 1 is invalid
 2137 | template <> struct LvlTypeMap<VkCopyBufferInfo2KHR> {
      |                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2141:32: error: 'VK_STRUCTURE_TYPE_COPY_BUFFER_INFO_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR'?
 2141 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_BUFFER_INFO_2_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2141:72: error: template argument 1 is invalid
 2141 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_BUFFER_INFO_2_KHR> {
      |                                                                        ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2146:31: error: 'VkImageCopy2KHR' was not declared in this scope; did you mean 'VkImageCopy'?
 2146 | template <> struct LvlTypeMap<VkImageCopy2KHR> {
      |                               ^~~~~~~~~~~~~~~
      |                               VkImageCopy
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2146:46: error: template argument 1 is invalid
 2146 | template <> struct LvlTypeMap<VkImageCopy2KHR> {
      |                                              ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2150:32: error: 'VK_STRUCTURE_TYPE_IMAGE_COPY_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO'?
 2150 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_COPY_2_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2150:66: error: template argument 1 is invalid
 2150 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_COPY_2_KHR> {
      |                                                                  ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2155:31: error: 'VkCopyImageInfo2KHR' was not declared in this scope
 2155 | template <> struct LvlTypeMap<VkCopyImageInfo2KHR> {
      |                               ^~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2155:50: error: template argument 1 is invalid
 2155 | template <> struct LvlTypeMap<VkCopyImageInfo2KHR> {
      |                                                  ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2159:32: error: 'VK_STRUCTURE_TYPE_COPY_IMAGE_INFO_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR'?
 2159 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_IMAGE_INFO_2_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2159:71: error: template argument 1 is invalid
 2159 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_IMAGE_INFO_2_KHR> {
      |                                                                       ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2164:31: error: 'VkBufferImageCopy2KHR' was not declared in this scope; did you mean 'VkBufferImageCopy'?
 2164 | template <> struct LvlTypeMap<VkBufferImageCopy2KHR> {
      |                               ^~~~~~~~~~~~~~~~~~~~~
      |                               VkBufferImageCopy
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2164:52: error: template argument 1 is invalid
 2164 | template <> struct LvlTypeMap<VkBufferImageCopy2KHR> {
      |                                                    ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2168:32: error: 'VK_STRUCTURE_TYPE_BUFFER_IMAGE_COPY_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER'?
 2168 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BUFFER_IMAGE_COPY_2_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2168:73: error: template argument 1 is invalid
 2168 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BUFFER_IMAGE_COPY_2_KHR> {
      |                                                                         ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2173:31: error: 'VkCopyBufferToImageInfo2KHR' was not declared in this scope
 2173 | template <> struct LvlTypeMap<VkCopyBufferToImageInfo2KHR> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2173:58: error: template argument 1 is invalid
 2173 | template <> struct LvlTypeMap<VkCopyBufferToImageInfo2KHR> {
      |                                                          ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2177:32: error: 'VK_STRUCTURE_TYPE_COPY_BUFFER_TO_IMAGE_INFO_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_INFO_KHR'?
 2177 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_BUFFER_TO_IMAGE_INFO_2_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_INFO_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2177:81: error: template argument 1 is invalid
 2177 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_BUFFER_TO_IMAGE_INFO_2_KHR> {
      |                                                                                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2182:31: error: 'VkCopyImageToBufferInfo2KHR' was not declared in this scope
 2182 | template <> struct LvlTypeMap<VkCopyImageToBufferInfo2KHR> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2182:58: error: template argument 1 is invalid
 2182 | template <> struct LvlTypeMap<VkCopyImageToBufferInfo2KHR> {
      |                                                          ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2186:32: error: 'VK_STRUCTURE_TYPE_COPY_IMAGE_TO_BUFFER_INFO_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_INFO_KHR'?
 2186 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_IMAGE_TO_BUFFER_INFO_2_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_INFO_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2186:81: error: template argument 1 is invalid
 2186 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_IMAGE_TO_BUFFER_INFO_2_KHR> {
      |                                                                                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2191:31: error: 'VkImageBlit2KHR' was not declared in this scope; did you mean 'VkImageBlit'?
 2191 | template <> struct LvlTypeMap<VkImageBlit2KHR> {
      |                               ^~~~~~~~~~~~~~~
      |                               VkImageBlit
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2191:46: error: template argument 1 is invalid
 2191 | template <> struct LvlTypeMap<VkImageBlit2KHR> {
      |                                              ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2195:32: error: 'VK_STRUCTURE_TYPE_IMAGE_BLIT_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SURFACE_FORMAT_2_KHR'?
 2195 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_BLIT_2_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_SURFACE_FORMAT_2_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2195:66: error: template argument 1 is invalid
 2195 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_BLIT_2_KHR> {
      |                                                                  ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2200:31: error: 'VkBlitImageInfo2KHR' was not declared in this scope
 2200 | template <> struct LvlTypeMap<VkBlitImageInfo2KHR> {
      |                               ^~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2200:50: error: template argument 1 is invalid
 2200 | template <> struct LvlTypeMap<VkBlitImageInfo2KHR> {
      |                                                  ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2204:32: error: 'VK_STRUCTURE_TYPE_BLIT_IMAGE_INFO_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR'?
 2204 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BLIT_IMAGE_INFO_2_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2204:71: error: template argument 1 is invalid
 2204 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BLIT_IMAGE_INFO_2_KHR> {
      |                                                                       ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2209:31: error: 'VkImageResolve2KHR' was not declared in this scope; did you mean 'VkImageResolve'?
 2209 | template <> struct LvlTypeMap<VkImageResolve2KHR> {
      |                               ^~~~~~~~~~~~~~~~~~
      |                               VkImageResolve
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2209:49: error: template argument 1 is invalid
 2209 | template <> struct LvlTypeMap<VkImageResolve2KHR> {
      |                                                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2213:32: error: 'VK_STRUCTURE_TYPE_IMAGE_RESOLVE_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO'?
 2213 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_RESOLVE_2_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2213:69: error: template argument 1 is invalid
 2213 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_RESOLVE_2_KHR> {
      |                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2218:31: error: 'VkResolveImageInfo2KHR' was not declared in this scope
 2218 | template <> struct LvlTypeMap<VkResolveImageInfo2KHR> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2218:53: error: template argument 1 is invalid
 2218 | template <> struct LvlTypeMap<VkResolveImageInfo2KHR> {
      |                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2222:32: error: 'VK_STRUCTURE_TYPE_RESOLVE_IMAGE_INFO_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR'?
 2222 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RESOLVE_IMAGE_INFO_2_KHR> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2222:74: error: template argument 1 is invalid
 2222 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RESOLVE_IMAGE_INFO_2_KHR> {
      |                                                                          ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2335:31: error: 'VkImageViewAddressPropertiesNVX' was not declared in this scope
 2335 | template <> struct LvlTypeMap<VkImageViewAddressPropertiesNVX> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2335:62: error: template argument 1 is invalid
 2335 | template <> struct LvlTypeMap<VkImageViewAddressPropertiesNVX> {
      |                                                              ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2339:32: error: 'VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2'?
 2339 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2339:83: error: template argument 1 is invalid
 2339 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX> {
      |                                                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3372:43: error: 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR'?
 3372 |     static const VkStructureType kSType = VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL;
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                           VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3375:32: error: 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR'?
 3375 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3375:96: error: template argument 1 is invalid
 3375 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL> {
      |                                                                                                ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3750:31: error: 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderAtomicInt64FeaturesKHR'?
 3750 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderAtomicFloatFeaturesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceShaderAtomicInt64FeaturesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3750:75: error: template argument 1 is invalid
 3750 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderAtomicFloatFeaturesEXT> {
      |                                                                           ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3754:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
 3754 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3754:98: error: template argument 1 is invalid
 3754 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT> {
      |                                                                                                  ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3768:31: error: 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceIndexTypeUint8FeaturesEXT'?
 3768 | template <> struct LvlTypeMap<VkPhysicalDeviceExtendedDynamicStateFeaturesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceIndexTypeUint8FeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3768:78: error: template argument 1 is invalid
 3768 | template <> struct LvlTypeMap<VkPhysicalDeviceExtendedDynamicStateFeaturesEXT> {
      |                                                                              ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3772:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT'?
 3772 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3772:101: error: template argument 1 is invalid
 3772 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT> {
      |                                                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3894:31: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceHostQueryResetFeaturesEXT'?
 3894 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2FeaturesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceHostQueryResetFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3894:69: error: template argument 1 is invalid
 3894 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2FeaturesEXT> {
      |                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3898:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 3898 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3898:91: error: template argument 1 is invalid
 3898 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT> {
      |                                                                                           ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3903:31: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDevicePCIBusInfoPropertiesEXT'?
 3903 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2PropertiesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDevicePCIBusInfoPropertiesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3903:71: error: template argument 1 is invalid
 3903 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2PropertiesEXT> {
      |                                                                       ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3907:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
 3907 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3907:93: error: template argument 1 is invalid
 3907 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT> {
      |                                                                                             ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3912:31: error: 'VkSamplerCustomBorderColorCreateInfoEXT' was not declared in this scope
 3912 | template <> struct LvlTypeMap<VkSamplerCustomBorderColorCreateInfoEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3912:70: error: template argument 1 is invalid
 3912 | template <> struct LvlTypeMap<VkSamplerCustomBorderColorCreateInfoEXT> {
      |                                                                      ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3916:32: error: 'VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO_EXT'?
 3916 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3916:93: error: template argument 1 is invalid
 3916 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT> {
      |                                                                                             ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3921:31: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceToolPropertiesEXT'?
 3921 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorPropertiesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceToolPropertiesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3921:77: error: template argument 1 is invalid
 3921 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorPropertiesEXT> {
      |                                                                             ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3925:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
 3925 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3925:100: error: template argument 1 is invalid
 3925 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT> {
      |                                                                                                    ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3930:31: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMemoryPriorityFeaturesEXT'?
 3930 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorFeaturesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceMemoryPriorityFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3930:75: error: template argument 1 is invalid
 3930 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorFeaturesEXT> {
      |                                                                           ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3934:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 3934 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3934:98: error: template argument 1 is invalid
 3934 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT> {
      |                                                                                                  ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3939:31: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceASTCDecodeFeaturesEXT'?
 3939 | template <> struct LvlTypeMap<VkPhysicalDevicePrivateDataFeaturesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceASTCDecodeFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3939:69: error: template argument 1 is invalid
 3939 | template <> struct LvlTypeMap<VkPhysicalDevicePrivateDataFeaturesEXT> {
      |                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3943:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 3943 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3943:91: error: template argument 1 is invalid
 3943 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT> {
      |                                                                                           ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3948:31: error: 'VkDevicePrivateDataCreateInfoEXT' was not declared in this scope
 3948 | template <> struct LvlTypeMap<VkDevicePrivateDataCreateInfoEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3948:63: error: template argument 1 is invalid
 3948 | template <> struct LvlTypeMap<VkDevicePrivateDataCreateInfoEXT> {
      |                                                               ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3952:32: error: 'VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT'?
 3952 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3952:85: error: template argument 1 is invalid
 3952 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT> {
      |                                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3957:31: error: 'VkPrivateDataSlotCreateInfoEXT' was not declared in this scope
 3957 | template <> struct LvlTypeMap<VkPrivateDataSlotCreateInfoEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3957:61: error: template argument 1 is invalid
 3957 | template <> struct LvlTypeMap<VkPrivateDataSlotCreateInfoEXT> {
      |                                                             ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3961:32: error: 'VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT'?
 3961 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3961:83: error: template argument 1 is invalid
 3961 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT> {
      |                                                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3993:31: error: 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapFeaturesEXT'?
 3993 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMap2FeaturesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceFragmentDensityMapFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3993:77: error: template argument 1 is invalid
 3993 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMap2FeaturesEXT> {
      |                                                                             ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3997:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT'?
 3997 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3997:101: error: template argument 1 is invalid
 3997 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT> {
      |                                                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4002:31: error: 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapPropertiesEXT'?
 4002 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMap2PropertiesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceFragmentDensityMapPropertiesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4002:79: error: template argument 1 is invalid
 4002 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMap2PropertiesEXT> {
      |                                                                               ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4006:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
 4006 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4006:103: error: template argument 1 is invalid
 4006 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT> {
      |                                                                                                       ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4011:31: error: 'VkPhysicalDeviceImageRobustnessFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceBufferAddressFeaturesEXT'?
 4011 | template <> struct LvlTypeMap<VkPhysicalDeviceImageRobustnessFeaturesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceBufferAddressFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4011:73: error: template argument 1 is invalid
 4011 | template <> struct LvlTypeMap<VkPhysicalDeviceImageRobustnessFeaturesEXT> {
      |                                                                         ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4015:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT'?
 4015 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4015:95: error: template argument 1 is invalid
 4015 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT> {
      |                                                                                               ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4020:31: error: 'VkPhysicalDevice4444FormatsFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceASTCDecodeFeaturesEXT'?
 4020 | template <> struct LvlTypeMap<VkPhysicalDevice4444FormatsFeaturesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceASTCDecodeFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4020:69: error: template argument 1 is invalid
 4020 | template <> struct LvlTypeMap<VkPhysicalDevice4444FormatsFeaturesEXT> {
      |                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4024:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 4024 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4024:91: error: template argument 1 is invalid
 4024 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT> {
      |                                                                                           ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:3257:11: error: 'VkCopyBufferInfo2KHR' does not name a type; did you mean 'CmdCopyBuffer2KHR'?
 3257 |     const VkCopyBufferInfo2KHR*                 pCopyBufferInfo)
      |           ^~~~~~~~~~~~~~~~~~~~
      |           CmdCopyBuffer2KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:3264:11: error: 'VkCopyImageInfo2KHR' does not name a type; did you mean 'CmdCopyImage2KHR'?
 3264 |     const VkCopyImageInfo2KHR*                  pCopyImageInfo)
      |           ^~~~~~~~~~~~~~~~~~~
      |           CmdCopyImage2KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:3271:11: error: 'VkCopyBufferToImageInfo2KHR' does not name a type; did you mean 'CmdCopyBufferToImage2KHR'?
 3271 |     const VkCopyBufferToImageInfo2KHR*          pCopyBufferToImageInfo)
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           CmdCopyBufferToImage2KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:3278:11: error: 'VkCopyImageToBufferInfo2KHR' does not name a type; did you mean 'CmdCopyImageToBuffer2KHR'?
 3278 |     const VkCopyImageToBufferInfo2KHR*          pCopyImageToBufferInfo)
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           CmdCopyImageToBuffer2KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:3285:11: error: 'VkBlitImageInfo2KHR' does not name a type; did you mean 'CmdBlitImage2KHR'?
 3285 |     const VkBlitImageInfo2KHR*                  pBlitImageInfo)
      |           ^~~~~~~~~~~~~~~~~~~
      |           CmdBlitImage2KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:3292:11: error: 'VkResolveImageInfo2KHR' does not name a type; did you mean 'CmdResolveImage2KHR'?
 3292 |     const VkResolveImageInfo2KHR*               pResolveImageInfo)
      |           ^~~~~~~~~~~~~~~~~~~~~~
      |           CmdResolveImage2KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:3450:5: error: 'VkImageViewAddressPropertiesNVX' has not been declared
 3450 |     VkImageViewAddressPropertiesNVX*            pProperties)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:4649:11: error: 'VkPrivateDataSlotCreateInfoEXT' does not name a type
 4649 |     const VkPrivateDataSlotCreateInfoEXT*       pCreateInfo,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:4651:5: error: 'VkPrivateDataSlotEXT' has not been declared
 4651 |     VkPrivateDataSlotEXT*                       pPrivateDataSlot)
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp: In function 'VkResult vkmock::CreatePrivateDataSlotEXT(VkDevice, const int*, const VkAllocationCallbacks*, int*)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:4654:26: error: 'VkPrivateDataSlotEXT' was not declared in this scope; did you mean 'pPrivateDataSlot'?
 4654 |     *pPrivateDataSlot = (VkPrivateDataSlotEXT)global_unique_handle++;
      |                          ^~~~~~~~~~~~~~~~~~~~
      |                          pPrivateDataSlot
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:4660:5: error: 'VkPrivateDataSlotEXT' has not been declared
 4660 |     VkPrivateDataSlotEXT                        privateDataSlot,
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:4670:5: error: 'VkPrivateDataSlotEXT' has not been declared
 4670 |     VkPrivateDataSlotEXT                        privateDataSlot,
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:4681:5: error: 'VkPrivateDataSlotEXT' has not been declared
 4681 |     VkPrivateDataSlotEXT                        privateDataSlot,
      |     ^~~~~~~~~~~~~~~~~~~~
[2/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-too
 ls/1.2.154.0-r0=/usr/src/debug/vulkan-tools/1.2.154.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0=/usr/src/debug/vulkan-tools/1.2.154.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wi
 mplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp
FAILED: vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2
 .154.0-r0=/usr/src/debug/vulkan-tools/1.2.154.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0=/usr/src/debug/vulkan-tools/1.2.154.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplici
 t-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'const char* VkDriverIdString(VkDriverId)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:94:9: warning: case value '13' not in enumerated type 'VkDriverId' [-Wswitch]
   94 |         case (13): return "DRIVER_ID_MESA_LLVMPIPE";
      |         ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:95:9: warning: case value '14' not in enumerated type 'VkDriverId' [-Wswitch]
   95 |         case (14): return "DRIVER_ID_MOLTENVK";
      |         ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'const char* VkFormatString(VkFormat)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:349:9: warning: case value '1000340000' not in enumerated type 'VkFormat' [-Wswitch]
  349 |         case (1000340000): return "FORMAT_A4R4G4B4_UNORM_PACK16_EXT";
      |         ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:350:9: warning: case value '1000340001' not in enumerated type 'VkFormat' [-Wswitch]
  350 |         case (1000340001): return "FORMAT_A4B4G4R4_UNORM_PACK16_EXT";
      |         ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:965:79: error: 'VkPhysicalDevice4444FormatsFeaturesEXT' has not been declared
  965 | void DumpVkPhysicalDevice4444FormatsFeaturesEXT(Printer &p, std::string name, VkPhysicalDevice4444FormatsFeaturesEXT &obj) {
      |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevice4444FormatsFeaturesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:967:60: error: request for member 'formatA4R4G4B4' in 'obj', which is of non-class type 'int'
  967 |     p.PrintKeyBool("formatA4R4G4B4", static_cast<bool>(obj.formatA4R4G4B4), 14);
      |                                                            ^~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:968:60: error: request for member 'formatA4B4G4R4' in 'obj', which is of non-class type 'int'
  968 |     p.PrintKeyBool("formatA4B4G4R4", static_cast<bool>(obj.formatA4B4G4R4), 14);
      |                                                            ^~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1022:85: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' has not been declared
 1022 | void DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceCustomBorderColorFeaturesEXT &obj) {
      |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1024:64: error: request for member 'customBorderColors' in 'obj', which is of non-class type 'int'
 1024 |     p.PrintKeyBool("customBorderColors", static_cast<bool>(obj.customBorderColors), 30);
      |                                                                ^~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1025:76: error: request for member 'customBorderColorWithoutFormat' in 'obj', which is of non-class type 'int'
 1025 |     p.PrintKeyBool("customBorderColorWithoutFormat", static_cast<bool>(obj.customBorderColorWithoutFormat), 30);
      |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1027:87: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' has not been declared
 1027 | void DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT(Printer &p, std::string name, VkPhysicalDeviceCustomBorderColorPropertiesEXT &obj) {
      |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1029:57: error: request for member 'maxCustomBorderColorSamplers' in 'obj', which is of non-class type 'int'
 1029 |     p.PrintKeyValue("maxCustomBorderColorSamplers", obj.maxCustomBorderColorSamplers, 28);
      |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1102:88: error: 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT' has not been declared
 1102 | void DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceExtendedDynamicStateFeaturesEXT &obj) {
      |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1104:66: error: request for member 'extendedDynamicState' in 'obj', which is of non-class type 'int'
 1104 |     p.PrintKeyBool("extendedDynamicState", static_cast<bool>(obj.extendedDynamicState), 20);
      |                                                                  ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1188:87: error: 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT' has not been declared
 1188 | void DumpVkPhysicalDeviceFragmentDensityMap2FeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceFragmentDensityMap2FeaturesEXT &obj) {
      |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceFragmentDensityMap2FeaturesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1190:72: error: request for member 'fragmentDensityMapDeferred' in 'obj', which is of non-class type 'int'
 1190 |     p.PrintKeyBool("fragmentDensityMapDeferred", static_cast<bool>(obj.fragmentDensityMapDeferred), 26);
      |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1192:89: error: 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT' has not been declared
 1192 | void DumpVkPhysicalDeviceFragmentDensityMap2PropertiesEXT(Printer &p, std::string name, VkPhysicalDeviceFragmentDensityMap2PropertiesEXT &obj) {
      |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceFragmentDensityMap2PropertiesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1194:61: error: request for member 'subsampledLoads' in 'obj', which is of non-class type 'int'
 1194 |     p.PrintKeyBool("subsampledLoads", static_cast<bool>(obj.subsampledLoads), 41);
      |                                                             ^~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1195:87: error: request for member 'subsampledCoarseReconstructionEarlyAccess' in 'obj', which is of non-class type 'int'
 1195 |     p.PrintKeyBool("subsampledCoarseReconstructionEarlyAccess", static_cast<bool>(obj.subsampledCoarseReconstructionEarlyAccess), 41);
      |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1196:53: error: request for member 'maxSubsampledArrayLayers' in 'obj', which is of non-class type 'int'
 1196 |     p.PrintKeyValue("maxSubsampledArrayLayers", obj.maxSubsampledArrayLayers, 41);
      |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1197:63: error: request for member 'maxDescriptorSetSubsampledSamplers' in 'obj', which is of non-class type 'int'
 1197 |     p.PrintKeyValue("maxDescriptorSetSubsampledSamplers", obj.maxDescriptorSetSubsampledSamplers, 41);
      |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1229:83: error: 'VkPhysicalDeviceImageRobustnessFeaturesEXT' has not been declared
 1229 | void DumpVkPhysicalDeviceImageRobustnessFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceImageRobustnessFeaturesEXT &obj) {
      |                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceImageRobustnessFeaturesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1231:63: error: request for member 'robustImageAccess' in 'obj', which is of non-class type 'int'
 1231 |     p.PrintKeyBool("robustImageAccess", static_cast<bool>(obj.robustImageAccess), 17);
      |                                                               ^~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1488:85: error: 'VkPhysicalDevicePortabilitySubsetFeaturesKHR' has not been declared
 1488 | void DumpVkPhysicalDevicePortabilitySubsetFeaturesKHR(Printer &p, std::string name, VkPhysicalDevicePortabilitySubsetFeaturesKHR &obj) {
      |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePortabilitySubsetFeaturesKHR(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1490:76: error: request for member 'constantAlphaColorBlendFactors' in 'obj', which is of non-class type 'int'
 1490 |     p.PrintKeyBool("constantAlphaColorBlendFactors", static_cast<bool>(obj.constantAlphaColorBlendFactors), 38);
      |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1491:52: error: request for member 'events' in 'obj', which is of non-class type 'int'
 1491 |     p.PrintKeyBool("events", static_cast<bool>(obj.events), 38);
      |                                                    ^~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1492:77: error: request for member 'imageViewFormatReinterpretation' in 'obj', which is of non-class type 'int'
 1492 |     p.PrintKeyBool("imageViewFormatReinterpretation", static_cast<bool>(obj.imageViewFormatReinterpretation), 38);
      |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1493:68: error: request for member 'imageViewFormatSwizzle' in 'obj', which is of non-class type 'int'
 1493 |     p.PrintKeyBool("imageViewFormatSwizzle", static_cast<bool>(obj.imageViewFormatSwizzle), 38);
      |                                                                    ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1494:66: error: request for member 'imageView2DOn3DImage' in 'obj', which is of non-class type 'int'
 1494 |     p.PrintKeyBool("imageView2DOn3DImage", static_cast<bool>(obj.imageView2DOn3DImage), 38);
      |                                                                  ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1495:67: error: request for member 'multisampleArrayImage' in 'obj', which is of non-class type 'int'
 1495 |     p.PrintKeyBool("multisampleArrayImage", static_cast<bool>(obj.multisampleArrayImage), 38);
      |                                                                   ^~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1496:71: error: request for member 'mutableComparisonSamplers' in 'obj', which is of non-class type 'int'
 1496 |     p.PrintKeyBool("mutableComparisonSamplers", static_cast<bool>(obj.mutableComparisonSamplers), 38);
      |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1497:59: error: request for member 'pointPolygons' in 'obj', which is of non-class type 'int'
 1497 |     p.PrintKeyBool("pointPolygons", static_cast<bool>(obj.pointPolygons), 38);
      |                                                           ^~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1498:63: error: request for member 'samplerMipLodBias' in 'obj', which is of non-class type 'int'
 1498 |     p.PrintKeyBool("samplerMipLodBias", static_cast<bool>(obj.samplerMipLodBias), 38);
      |                                                               ^~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1499:68: error: request for member 'separateStencilMaskRef' in 'obj', which is of non-class type 'int'
 1499 |     p.PrintKeyBool("separateStencilMaskRef", static_cast<bool>(obj.separateStencilMaskRef), 38);
      |                                                                    ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1500:84: error: request for member 'shaderSampleRateInterpolationFunctions' in 'obj', which is of non-class type 'int'
 1500 |     p.PrintKeyBool("shaderSampleRateInterpolationFunctions", static_cast<bool>(obj.shaderSampleRateInterpolationFunctions), 38);
      |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1501:66: error: request for member 'tessellationIsolines' in 'obj', which is of non-class type 'int'
 1501 |     p.PrintKeyBool("tessellationIsolines", static_cast<bool>(obj.tessellationIsolines), 38);
      |                                                                  ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1502:67: error: request for member 'tessellationPointMode' in 'obj', which is of non-class type 'int'
 1502 |     p.PrintKeyBool("tessellationPointMode", static_cast<bool>(obj.tessellationPointMode), 38);
      |                                                                   ^~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1503:58: error: request for member 'triangleFans' in 'obj', which is of non-class type 'int'
 1503 |     p.PrintKeyBool("triangleFans", static_cast<bool>(obj.triangleFans), 38);
      |                                                          ^~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1504:79: error: request for member 'vertexAttributeAccessBeyondStride' in 'obj', which is of non-class type 'int'
 1504 |     p.PrintKeyBool("vertexAttributeAccessBeyondStride", static_cast<bool>(obj.vertexAttributeAccessBeyondStride), 38);
      |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1508:87: error: 'VkPhysicalDevicePortabilitySubsetPropertiesKHR' has not been declared
 1508 | void DumpVkPhysicalDevicePortabilitySubsetPropertiesKHR(Printer &p, std::string name, VkPhysicalDevicePortabilitySubsetPropertiesKHR &obj) {
      |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePortabilitySubsetPropertiesKHR(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1510:65: error: request for member 'minVertexInputBindingStrideAlignment' in 'obj', which is of non-class type 'int'
 1510 |     p.PrintKeyValue("minVertexInputBindingStrideAlignment", obj.minVertexInputBindingStrideAlignment, 36);
      |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1513:79: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' has not been declared
 1513 | void DumpVkPhysicalDevicePrivateDataFeaturesEXT(Printer &p, std::string name, VkPhysicalDevicePrivateDataFeaturesEXT &obj) {
      |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePrivateDataFeaturesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1515:57: error: request for member 'privateData' in 'obj', which is of non-class type 'int'
 1515 |     p.PrintKeyBool("privateData", static_cast<bool>(obj.privateData), 11);
      |                                                         ^~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1557:79: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' has not been declared
 1557 | void DumpVkPhysicalDeviceRobustness2FeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceRobustness2FeaturesEXT &obj) {
      |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRobustness2FeaturesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1559:65: error: request for member 'robustBufferAccess2' in 'obj', which is of non-class type 'int'
 1559 |     p.PrintKeyBool("robustBufferAccess2", static_cast<bool>(obj.robustBufferAccess2), 19);
      |                                                                 ^~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1560:64: error: request for member 'robustImageAccess2' in 'obj', which is of non-class type 'int'
 1560 |     p.PrintKeyBool("robustImageAccess2", static_cast<bool>(obj.robustImageAccess2), 19);
      |                                                                ^~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1561:60: error: request for member 'nullDescriptor' in 'obj', which is of non-class type 'int'
 1561 |     p.PrintKeyBool("nullDescriptor", static_cast<bool>(obj.nullDescriptor), 19);
      |                                                            ^~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1563:81: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' has not been declared
 1563 | void DumpVkPhysicalDeviceRobustness2PropertiesEXT(Printer &p, std::string name, VkPhysicalDeviceRobustness2PropertiesEXT &obj) {
      |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRobustness2PropertiesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1565:81: error: request for member 'robustStorageBufferAccessSizeAlignment' in 'obj', which is of non-class type 'int'
 1565 |     p.PrintKeyValue("robustStorageBufferAccessSizeAlignment", to_hex_str(p, obj.robustStorageBufferAccessSizeAlignment), 38);
      |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1566:81: error: request for member 'robustUniformBufferAccessSizeAlignment' in 'obj', which is of non-class type 'int'
 1566 |     p.PrintKeyValue("robustUniformBufferAccessSizeAlignment", to_hex_str(p, obj.robustUniformBufferAccessSizeAlignment), 38);
      |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1596:85: error: 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT' has not been declared
 1596 | void DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceShaderAtomicFloatFeaturesEXT &obj) {
      |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1598:72: error: request for member 'shaderBufferFloat32Atomics' in 'obj', which is of non-class type 'int'
 1598 |     p.PrintKeyBool("shaderBufferFloat32Atomics", static_cast<bool>(obj.shaderBufferFloat32Atomics), 28);
      |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1599:74: error: request for member 'shaderBufferFloat32AtomicAdd' in 'obj', which is of non-class type 'int'
 1599 |     p.PrintKeyBool("shaderBufferFloat32AtomicAdd", static_cast<bool>(obj.shaderBufferFloat32AtomicAdd), 28);
      |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1600:72: error: request for member 'shaderBufferFloat64Atomics' in 'obj', which is of non-class type 'int'
 1600 |     p.PrintKeyBool("shaderBufferFloat64Atomics", static_cast<bool>(obj.shaderBufferFloat64Atomics), 28);
      |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1601:74: error: request for member 'shaderBufferFloat64AtomicAdd' in 'obj', which is of non-class type 'int'
 1601 |     p.PrintKeyBool("shaderBufferFloat64AtomicAdd", static_cast<bool>(obj.shaderBufferFloat64AtomicAdd), 28);
      |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1602:72: error: request for member 'shaderSharedFloat32Atomics' in 'obj', which is of non-class type 'int'
 1602 |     p.PrintKeyBool("shaderSharedFloat32Atomics", static_cast<bool>(obj.shaderSharedFloat32Atomics), 28);
      |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1603:74: error: request for member 'shaderSharedFloat32AtomicAdd' in 'obj', which is of non-class type 'int'
 1603 |     p.PrintKeyBool("shaderSharedFloat32AtomicAdd", static_cast<bool>(obj.shaderSharedFloat32AtomicAdd), 28);
      |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1604:72: error: request for member 'shaderSharedFloat64Atomics' in 'obj', which is of non-class type 'int'
 1604 |     p.PrintKeyBool("shaderSharedFloat64Atomics", static_cast<bool>(obj.shaderSharedFloat64Atomics), 28);
      |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1605:74: error: request for member 'shaderSharedFloat64AtomicAdd' in 'obj', which is of non-class type 'int'
 1605 |     p.PrintKeyBool("shaderSharedFloat64AtomicAdd", static_cast<bool>(obj.shaderSharedFloat64AtomicAdd), 28);
      |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1606:71: error: request for member 'shaderImageFloat32Atomics' in 'obj', which is of non-class type 'int'
 1606 |     p.PrintKeyBool("shaderImageFloat32Atomics", static_cast<bool>(obj.shaderImageFloat32Atomics), 28);
      |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1607:73: error: request for member 'shaderImageFloat32AtomicAdd' in 'obj', which is of non-class type 'int'
 1607 |     p.PrintKeyBool("shaderImageFloat32AtomicAdd", static_cast<bool>(obj.shaderImageFloat32AtomicAdd), 28);
      |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1608:71: error: request for member 'sparseImageFloat32Atomics' in 'obj', which is of non-class type 'int'
 1608 |     p.PrintKeyBool("sparseImageFloat32Atomics", static_cast<bool>(obj.sparseImageFloat32Atomics), 28);
      |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1609:73: error: request for member 'sparseImageFloat32AtomicAdd' in 'obj', which is of non-class type 'int'
 1609 |     p.PrintKeyBool("sparseImageFloat32AtomicAdd", static_cast<bool>(obj.sparseImageFloat32AtomicAdd), 28);
      |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'pNextChainInfos get_chain_infos()':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1921:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
 1921 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorPropertiesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1921:87: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT'?
 1921 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorPropertiesEXT)},
      |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                       DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1928:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
 1928 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceFragmentDensityMap2PropertiesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1928:90: error: 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapPropertiesEXT'?
 1928 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceFragmentDensityMap2PropertiesEXT)},
      |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                          VkPhysicalDeviceFragmentDensityMapPropertiesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1939:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR'?
 1939 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR, sizeof(VkPhysicalDevicePortabilitySubsetPropertiesKHR)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1939:86: error: 'VkPhysicalDevicePortabilitySubsetPropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePortabilitySubsetPropertiesKHR'?
 1939 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR, sizeof(VkPhysicalDevicePortabilitySubsetPropertiesKHR)},
      |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                      DumpVkPhysicalDevicePortabilitySubsetPropertiesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1946:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
 1946 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceRobustness2PropertiesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1946:80: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2PropertiesEXT'?
 1946 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceRobustness2PropertiesEXT)},
      |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                DumpVkPhysicalDeviceRobustness2PropertiesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1957:5: error: no match for 'operator=' (operand types are 'std::vector<pNextChainBuildingBlockInfo>' and '<brace-enclosed initializer list>')
 1957 |     };
      |     ^
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/vector:72,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.h:39,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/vector.tcc:198:5: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(const std::vector<_Tp, _Alloc>&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
  198 |     vector<_Tp, _Alloc>::
      |     ^~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/vector.tcc:199:42: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'const std::vector<pNextChainBuildingBlockInfo>&'
  199 |     operator=(const vector<_Tp, _Alloc>& __x)
      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/vector:67,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.h:39,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:709:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::vector<_Tp, _Alloc>&&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
  709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
      |       ^~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:709:26: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::vector<pNextChainBuildingBlockInfo>&&'
  709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
      |                 ~~~~~~~~~^~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:730:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::initializer_list<_Tp>) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
  730 |       operator=(initializer_list<value_type> __l)
      |       ^~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:730:46: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::initializer_list<pNextChainBuildingBlockInfo>'
  730 |       operator=(initializer_list<value_type> __l)
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1963:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 1963 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT, sizeof(VkPhysicalDevice4444FormatsFeaturesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1963:78: error: 'VkPhysicalDevice4444FormatsFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevice4444FormatsFeaturesEXT'?
 1963 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT, sizeof(VkPhysicalDevice4444FormatsFeaturesEXT)},
      |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                              DumpVkPhysicalDevice4444FormatsFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1970:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 1970 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorFeaturesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1970:85: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT'?
 1970 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorFeaturesEXT)},
      |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                     DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1973:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT'?
 1973 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT, sizeof(VkPhysicalDeviceExtendedDynamicStateFeaturesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1973:88: error: 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT'?
 1973 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT, sizeof(VkPhysicalDeviceExtendedDynamicStateFeaturesEXT)},
      |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                        DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1974:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT'?
 1974 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT, sizeof(VkPhysicalDeviceFragmentDensityMap2FeaturesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1974:88: error: 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapFeaturesEXT'?
 1974 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT, sizeof(VkPhysicalDeviceFragmentDensityMap2FeaturesEXT)},
      |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                        VkPhysicalDeviceFragmentDensityMapFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1978:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT'?
 1978 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT, sizeof(VkPhysicalDeviceImageRobustnessFeaturesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1978:82: error: 'VkPhysicalDeviceImageRobustnessFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceImageRobustnessFeaturesEXT'?
 1978 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT, sizeof(VkPhysicalDeviceImageRobustnessFeaturesEXT)},
      |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                  DumpVkPhysicalDeviceImageRobustnessFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1989:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR'?
 1989 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR, sizeof(VkPhysicalDevicePortabilitySubsetFeaturesKHR)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1989:84: error: 'VkPhysicalDevicePortabilitySubsetFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePortabilitySubsetFeaturesKHR'?
 1989 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR, sizeof(VkPhysicalDevicePortabilitySubsetFeaturesKHR)},
      |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                    DumpVkPhysicalDevicePortabilitySubsetFeaturesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1991:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 1991 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT, sizeof(VkPhysicalDevicePrivateDataFeaturesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1991:78: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePrivateDataFeaturesEXT'?
 1991 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT, sizeof(VkPhysicalDevicePrivateDataFeaturesEXT)},
      |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                              DumpVkPhysicalDevicePrivateDataFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1996:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 1996 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT, sizeof(VkPhysicalDeviceRobustness2FeaturesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1996:78: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2FeaturesEXT'?
 1996 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT, sizeof(VkPhysicalDeviceRobustness2FeaturesEXT)},
      |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                              DumpVkPhysicalDeviceRobustness2FeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2000:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
 2000 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT, sizeof(VkPhysicalDeviceShaderAtomicFloatFeaturesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2000:85: error: 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT'?
 2000 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT, sizeof(VkPhysicalDeviceShaderAtomicFloatFeaturesEXT)},
      |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                     DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2019:5: error: no match for 'operator=' (operand types are 'std::vector<pNextChainBuildingBlockInfo>' and '<brace-enclosed initializer list>')
 2019 |     };
      |     ^
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/vector:72,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.h:39,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/vector.tcc:198:5: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(const std::vector<_Tp, _Alloc>&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
  198 |     vector<_Tp, _Alloc>::
      |     ^~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/vector.tcc:199:42: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'const std::vector<pNextChainBuildingBlockInfo>&'
  199 |     operator=(const vector<_Tp, _Alloc>& __x)
      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/vector:67,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.h:39,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:709:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::vector<_Tp, _Alloc>&&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
  709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
      |       ^~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:709:26: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::vector<pNextChainBuildingBlockInfo>&&'
  709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
      |                 ~~~~~~~~~^~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:730:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::initializer_list<_Tp>) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
  730 |       operator=(initializer_list<value_type> __l)
      |       ^~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:730:46: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::initializer_list<pNextChainBuildingBlockInfo>'
  730 |       operator=(initializer_list<value_type> __l)
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_props2(Printer&, AppInstance&, AppGpu&, void*, VulkanVersion)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2048:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
 2048 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2049:54: error: 'VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME'?
 2049 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2050:13: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT'?
 2050 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2050:61: error: 'props' was not declared in this scope
 2050 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
      |                                                             ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2050:117: error: expected primary-expression before ')' token
 2050 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
      |                                                                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2094:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
 2094 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2095:54: error: 'VK_EXT_FRAGMENT_DENSITY_MAP_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME'?
 2095 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_FRAGMENT_DENSITY_MAP_2_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2096:13: error: 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapPropertiesEXT'?
 2096 |             VkPhysicalDeviceFragmentDensityMap2PropertiesEXT* props = (VkPhysicalDeviceFragmentDensityMap2PropertiesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             VkPhysicalDeviceFragmentDensityMapPropertiesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2096:63: error: 'props' was not declared in this scope
 2096 |             VkPhysicalDeviceFragmentDensityMap2PropertiesEXT* props = (VkPhysicalDeviceFragmentDensityMap2PropertiesEXT*)structure;
      |                                                               ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2096:121: error: expected primary-expression before ')' token
 2096 |             VkPhysicalDeviceFragmentDensityMap2PropertiesEXT* props = (VkPhysicalDeviceFragmentDensityMap2PropertiesEXT*)structure;
      |                                                                                                                         ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2159:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR'?
 2159 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2160:54: error: 'VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME'?
 2160 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2161:13: error: 'VkPhysicalDevicePortabilitySubsetPropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePortabilitySubsetPropertiesKHR'?
 2161 |             VkPhysicalDevicePortabilitySubsetPropertiesKHR* props = (VkPhysicalDevicePortabilitySubsetPropertiesKHR*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDevicePortabilitySubsetPropertiesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2161:61: error: 'props' was not declared in this scope
 2161 |             VkPhysicalDevicePortabilitySubsetPropertiesKHR* props = (VkPhysicalDevicePortabilitySubsetPropertiesKHR*)structure;
      |                                                             ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2161:117: error: expected primary-expression before ')' token
 2161 |             VkPhysicalDevicePortabilitySubsetPropertiesKHR* props = (VkPhysicalDevicePortabilitySubsetPropertiesKHR*)structure;
      |                                                                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2186:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
 2186 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2187:54: error: 'VK_EXT_ROBUSTNESS_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEBUG_REPORT_EXTENSION_NAME'?
 2187 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_ROBUSTNESS_2_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_EXT_DEBUG_REPORT_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2188:13: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2PropertiesEXT'?
 2188 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceRobustness2PropertiesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2188:55: error: 'props' was not declared in this scope
 2188 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
      |                                                       ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2188:105: error: expected primary-expression before ')' token
 2188 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
      |                                                                                                         ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, void*, VulkanVersion)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2281:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 2281 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2282:54: error: 'VK_EXT_4444_FORMATS_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_HDR_METADATA_EXTENSION_NAME'?
 2282 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_4444_FORMATS_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_EXT_HDR_METADATA_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2283:13: error: 'VkPhysicalDevice4444FormatsFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevice4444FormatsFeaturesEXT'?
 2283 |             VkPhysicalDevice4444FormatsFeaturesEXT* props = (VkPhysicalDevice4444FormatsFeaturesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDevice4444FormatsFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2283:53: error: 'props' was not declared in this scope
 2283 |             VkPhysicalDevice4444FormatsFeaturesEXT* props = (VkPhysicalDevice4444FormatsFeaturesEXT*)structure;
      |                                                     ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2283:101: error: expected primary-expression before ')' token
 2283 |             VkPhysicalDevice4444FormatsFeaturesEXT* props = (VkPhysicalDevice4444FormatsFeaturesEXT*)structure;
      |                                                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2325:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 2325 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2326:54: error: 'VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME'?
 2326 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2327:13: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT'?
 2327 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2327:59: error: 'props' was not declared in this scope
 2327 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
      |                                                           ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2327:113: error: expected primary-expression before ')' token
 2327 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
      |                                                                                                                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2344:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT'?
 2344 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2345:54: error: 'VK_EXT_EXTENDED_DYNAMIC_STATE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_INDEX_TYPE_UINT8_EXTENSION_NAME'?
 2345 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_EXTENDED_DYNAMIC_STATE_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_EXT_INDEX_TYPE_UINT8_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2346:13: error: 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT'?
 2346 |             VkPhysicalDeviceExtendedDynamicStateFeaturesEXT* props = (VkPhysicalDeviceExtendedDynamicStateFeaturesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2346:62: error: 'props' was not declared in this scope
 2346 |             VkPhysicalDeviceExtendedDynamicStateFeaturesEXT* props = (VkPhysicalDeviceExtendedDynamicStateFeaturesEXT*)structure;
      |                                                              ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2346:119: error: expected primary-expression before ')' token
 2346 |             VkPhysicalDeviceExtendedDynamicStateFeaturesEXT* props = (VkPhysicalDeviceExtendedDynamicStateFeaturesEXT*)structure;
      |                                                                                                                       ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2350:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT'?
 2350 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2351:54: error: 'VK_EXT_FRAGMENT_DENSITY_MAP_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME'?
 2351 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_FRAGMENT_DENSITY_MAP_2_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2352:13: error: 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapFeaturesEXT'?
 2352 |             VkPhysicalDeviceFragmentDensityMap2FeaturesEXT* props = (VkPhysicalDeviceFragmentDensityMap2FeaturesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             VkPhysicalDeviceFragmentDensityMapFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2352:61: error: 'props' was not declared in this scope
 2352 |             VkPhysicalDeviceFragmentDensityMap2FeaturesEXT* props = (VkPhysicalDeviceFragmentDensityMap2FeaturesEXT*)structure;
      |                                                             ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2352:117: error: expected primary-expression before ')' token
 2352 |             VkPhysicalDeviceFragmentDensityMap2FeaturesEXT* props = (VkPhysicalDeviceFragmentDensityMap2FeaturesEXT*)structure;
      |                                                                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2375:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT'?
 2375 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2376:54: error: 'VK_EXT_IMAGE_ROBUSTNESS_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_IMAGE_FORMAT_LIST_EXTENSION_NAME'?
 2376 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_IMAGE_ROBUSTNESS_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_KHR_IMAGE_FORMAT_LIST_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2377:13: error: 'VkPhysicalDeviceImageRobustnessFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceImageRobustnessFeaturesEXT'?
 2377 |             VkPhysicalDeviceImageRobustnessFeaturesEXT* props = (VkPhysicalDeviceImageRobustnessFeaturesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceImageRobustnessFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2377:57: error: 'props' was not declared in this scope
 2377 |             VkPhysicalDeviceImageRobustnessFeaturesEXT* props = (VkPhysicalDeviceImageRobustnessFeaturesEXT*)structure;
      |                                                         ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2377:109: error: expected primary-expression before ')' token
 2377 |             VkPhysicalDeviceImageRobustnessFeaturesEXT* props = (VkPhysicalDeviceImageRobustnessFeaturesEXT*)structure;
      |                                                                                                             ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2438:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR'?
 2438 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2439:54: error: 'VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME'?
 2439 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2440:13: error: 'VkPhysicalDevicePortabilitySubsetFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePortabilitySubsetFeaturesKHR'?
 2440 |             VkPhysicalDevicePortabilitySubsetFeaturesKHR* props = (VkPhysicalDevicePortabilitySubsetFeaturesKHR*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDevicePortabilitySubsetFeaturesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2440:59: error: 'props' was not declared in this scope
 2440 |             VkPhysicalDevicePortabilitySubsetFeaturesKHR* props = (VkPhysicalDevicePortabilitySubsetFeaturesKHR*)structure;
      |                                                           ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2440:113: error: expected primary-expression before ')' token
 2440 |             VkPhysicalDevicePortabilitySubsetFeaturesKHR* props = (VkPhysicalDevicePortabilitySubsetFeaturesKHR*)structure;
      |                                                                                                                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2445:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 2445 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2446:54: error: 'VK_EXT_PRIVATE_DATA_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_HDR_METADATA_EXTENSION_NAME'?
 2446 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_PRIVATE_DATA_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_EXT_HDR_METADATA_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2447:13: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePrivateDataFeaturesEXT'?
 2447 |             VkPhysicalDevicePrivateDataFeaturesEXT* props = (VkPhysicalDevicePrivateDataFeaturesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDevicePrivateDataFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2447:53: error: 'props' was not declared in this scope
 2447 |             VkPhysicalDevicePrivateDataFeaturesEXT* props = (VkPhysicalDevicePrivateDataFeaturesEXT*)structure;
      |                                                     ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2447:101: error: expected primary-expression before ')' token
 2447 |             VkPhysicalDevicePrivateDataFeaturesEXT* props = (VkPhysicalDevicePrivateDataFeaturesEXT*)structure;
      |                                                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2465:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 2465 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2466:54: error: 'VK_EXT_ROBUSTNESS_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEBUG_REPORT_EXTENSION_NAME'?
 2466 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_ROBUSTNESS_2_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_EXT_DEBUG_REPORT_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2467:13: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2FeaturesEXT'?
 2467 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceRobustness2FeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2467:53: error: 'props' was not declared in this scope
 2467 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
      |                                                     ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2467:101: error: expected primary-expression before ')' token
 2467 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
      |                                                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2492:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
 2492 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2493:54: error: 'VK_EXT_SHADER_ATOMIC_FLOAT_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME'?
 2493 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_SHADER_ATOMIC_FLOAT_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2494:13: error: 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT'?
 2494 |             VkPhysicalDeviceShaderAtomicFloatFeaturesEXT* props = (VkPhysicalDeviceShaderAtomicFloatFeaturesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2494:59: error: 'props' was not declared in this scope
 2494 |             VkPhysicalDeviceShaderAtomicFloatFeaturesEXT* props = (VkPhysicalDeviceShaderAtomicFloatFeaturesEXT*)structure;
      |                                                           ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2494:113: error: expected primary-expression before ')' token
 2494 |             VkPhysicalDeviceShaderAtomicFloatFeaturesEXT* props = (VkPhysicalDeviceShaderAtomicFloatFeaturesEXT*)structure;
      |                                                                                                                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp: In function 'void DumpPortability(Printer&, AppGpu&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:771:50: error: 'VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME'?
  771 |     if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME)) {
      |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                  VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:776:41: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR'?
  776 |                 if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR) {
      |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                         VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:777:21: error: 'VkPhysicalDevicePortabilitySubsetPropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePortabilitySubsetPropertiesKHR'?
  777 |                     VkPhysicalDevicePortabilitySubsetPropertiesKHR *props =
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                     DumpVkPhysicalDevicePortabilitySubsetPropertiesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:777:69: error: 'props' was not declared in this scope
  777 |                     VkPhysicalDevicePortabilitySubsetPropertiesKHR *props =
      |                                                                     ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:778:74: error: expected primary-expression before ')' token
  778 |                         (VkPhysicalDevicePortabilitySubsetPropertiesKHR *)structure;
      |                                                                          ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:788:41: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR'?
  788 |                 if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR) {
      |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                         VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:789:21: error: 'VkPhysicalDevicePortabilitySubsetFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePortabilitySubsetFeaturesKHR'?
  789 |                     VkPhysicalDevicePortabilitySubsetFeaturesKHR *features =
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                     DumpVkPhysicalDevicePortabilitySubsetFeaturesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:789:67: error: 'features' was not declared in this scope
  789 |                     VkPhysicalDevicePortabilitySubsetFeaturesKHR *features =
      |                                                                   ^~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:790:72: error: expected primary-expression before ')' token
  790 |                         (VkPhysicalDevicePortabilitySubsetFeaturesKHR *)structure;
      |                                                                        ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp: In function 'int main(int, char**)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:972:78: error: 'VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME'?
  972 |             if (!gpus.at(selected_gpu)->CheckPhysicalDeviceExtensionIncluded(VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME)) {
      |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                              VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME
ninja: build stopped: subcommand failed.
WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/temp/run.do_compile.3470107:155 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
WARNING: Backtrace (BB generated script): 
	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/temp/run.do_compile.3470107, line 155
	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/temp/run.do_compile.3470107, line 149
	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/temp/run.do_compile.3470107, line 144
	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/temp/run.do_compile.3470107, line 168

Backtrace (metadata-relative locations):
	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/cmake.bbclass, line 205
	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/cmake.bbclass, line 209
	#3: do_compile, autogenerated, line 2
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/temp/log.do_compile.3470107
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/build --target all --
| [1/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd -Iicd -I. -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.
 2.154.0-r0=/usr/src/debug/vulkan-tools/1.2.154.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0=/usr/src/debug/vulkan-tools/1.2.154.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplic
 it-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp
| FAILED: icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd -Iicd -I. -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.
 0-r0=/usr/src/debug/vulkan-tools/1.2.154.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0=/usr/src/debug/vulkan-tools/1.2.154.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fal
 lthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:22:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:1928:11: error: 'VkCopyBufferInfo2KHR' does not name a type
|  1928 |     const VkCopyBufferInfo2KHR*                 pCopyBufferInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:1932:11: error: 'VkCopyImageInfo2KHR' does not name a type
|  1932 |     const VkCopyImageInfo2KHR*                  pCopyImageInfo);
|       |           ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:1936:11: error: 'VkCopyBufferToImageInfo2KHR' does not name a type
|  1936 |     const VkCopyBufferToImageInfo2KHR*          pCopyBufferToImageInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:1940:11: error: 'VkCopyImageToBufferInfo2KHR' does not name a type
|  1940 |     const VkCopyImageToBufferInfo2KHR*          pCopyImageToBufferInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:1944:11: error: 'VkBlitImageInfo2KHR' does not name a type
|  1944 |     const VkBlitImageInfo2KHR*                  pBlitImageInfo);
|       |           ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:1948:11: error: 'VkResolveImageInfo2KHR' does not name a type
|  1948 |     const VkResolveImageInfo2KHR*               pResolveImageInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:2053:5: error: 'VkImageViewAddressPropertiesNVX' has not been declared
|  2053 |     VkImageViewAddressPropertiesNVX*            pProperties);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:2835:11: error: 'VkPrivateDataSlotCreateInfoEXT' does not name a type
|  2835 |     const VkPrivateDataSlotCreateInfoEXT*       pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:2837:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  2837 |     VkPrivateDataSlotEXT*                       pPrivateDataSlot);
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:2841:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  2841 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:2848:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  2848 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:2855:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  2855 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2013:31: error: 'VkPhysicalDevicePortabilitySubsetFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceVariablePointerFeaturesKHR'?
|  2013 | template <> struct LvlTypeMap<VkPhysicalDevicePortabilitySubsetFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceVariablePointerFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2013:75: error: template argument 1 is invalid
|  2013 | template <> struct LvlTypeMap<VkPhysicalDevicePortabilitySubsetFeaturesKHR> {
|       |                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2017:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR'?
|  2017 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2017:97: error: template argument 1 is invalid
|  2017 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR> {
|       |                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2024:31: error: 'VkPhysicalDevicePortabilitySubsetPropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance3PropertiesKHR'?
|  2024 | template <> struct LvlTypeMap<VkPhysicalDevicePortabilitySubsetPropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMaintenance3PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2024:77: error: template argument 1 is invalid
|  2024 | template <> struct LvlTypeMap<VkPhysicalDevicePortabilitySubsetPropertiesKHR> {
|       |                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2028:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR'?
|  2028 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2028:99: error: template argument 1 is invalid
|  2028 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR> {
|       |                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2128:31: error: 'VkBufferCopy2KHR' was not declared in this scope; did you mean 'VkBufferCopy'?
|  2128 | template <> struct LvlTypeMap<VkBufferCopy2KHR> {
|       |                               ^~~~~~~~~~~~~~~~
|       |                               VkBufferCopy
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2128:47: error: template argument 1 is invalid
|  2128 | template <> struct LvlTypeMap<VkBufferCopy2KHR> {
|       |                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2132:32: error: 'VK_STRUCTURE_TYPE_BUFFER_COPY_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO'?
|  2132 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BUFFER_COPY_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2132:67: error: template argument 1 is invalid
|  2132 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BUFFER_COPY_2_KHR> {
|       |                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2137:31: error: 'VkCopyBufferInfo2KHR' was not declared in this scope
|  2137 | template <> struct LvlTypeMap<VkCopyBufferInfo2KHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2137:51: error: template argument 1 is invalid
|  2137 | template <> struct LvlTypeMap<VkCopyBufferInfo2KHR> {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2141:32: error: 'VK_STRUCTURE_TYPE_COPY_BUFFER_INFO_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR'?
|  2141 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_BUFFER_INFO_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2141:72: error: template argument 1 is invalid
|  2141 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_BUFFER_INFO_2_KHR> {
|       |                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2146:31: error: 'VkImageCopy2KHR' was not declared in this scope; did you mean 'VkImageCopy'?
|  2146 | template <> struct LvlTypeMap<VkImageCopy2KHR> {
|       |                               ^~~~~~~~~~~~~~~
|       |                               VkImageCopy
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2146:46: error: template argument 1 is invalid
|  2146 | template <> struct LvlTypeMap<VkImageCopy2KHR> {
|       |                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2150:32: error: 'VK_STRUCTURE_TYPE_IMAGE_COPY_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO'?
|  2150 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_COPY_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2150:66: error: template argument 1 is invalid
|  2150 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_COPY_2_KHR> {
|       |                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2155:31: error: 'VkCopyImageInfo2KHR' was not declared in this scope
|  2155 | template <> struct LvlTypeMap<VkCopyImageInfo2KHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2155:50: error: template argument 1 is invalid
|  2155 | template <> struct LvlTypeMap<VkCopyImageInfo2KHR> {
|       |                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2159:32: error: 'VK_STRUCTURE_TYPE_COPY_IMAGE_INFO_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR'?
|  2159 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_IMAGE_INFO_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2159:71: error: template argument 1 is invalid
|  2159 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_IMAGE_INFO_2_KHR> {
|       |                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2164:31: error: 'VkBufferImageCopy2KHR' was not declared in this scope; did you mean 'VkBufferImageCopy'?
|  2164 | template <> struct LvlTypeMap<VkBufferImageCopy2KHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~
|       |                               VkBufferImageCopy
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2164:52: error: template argument 1 is invalid
|  2164 | template <> struct LvlTypeMap<VkBufferImageCopy2KHR> {
|       |                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2168:32: error: 'VK_STRUCTURE_TYPE_BUFFER_IMAGE_COPY_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER'?
|  2168 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BUFFER_IMAGE_COPY_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2168:73: error: template argument 1 is invalid
|  2168 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BUFFER_IMAGE_COPY_2_KHR> {
|       |                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2173:31: error: 'VkCopyBufferToImageInfo2KHR' was not declared in this scope
|  2173 | template <> struct LvlTypeMap<VkCopyBufferToImageInfo2KHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2173:58: error: template argument 1 is invalid
|  2173 | template <> struct LvlTypeMap<VkCopyBufferToImageInfo2KHR> {
|       |                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2177:32: error: 'VK_STRUCTURE_TYPE_COPY_BUFFER_TO_IMAGE_INFO_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_INFO_KHR'?
|  2177 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_BUFFER_TO_IMAGE_INFO_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2177:81: error: template argument 1 is invalid
|  2177 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_BUFFER_TO_IMAGE_INFO_2_KHR> {
|       |                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2182:31: error: 'VkCopyImageToBufferInfo2KHR' was not declared in this scope
|  2182 | template <> struct LvlTypeMap<VkCopyImageToBufferInfo2KHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2182:58: error: template argument 1 is invalid
|  2182 | template <> struct LvlTypeMap<VkCopyImageToBufferInfo2KHR> {
|       |                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2186:32: error: 'VK_STRUCTURE_TYPE_COPY_IMAGE_TO_BUFFER_INFO_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_INFO_KHR'?
|  2186 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_IMAGE_TO_BUFFER_INFO_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2186:81: error: template argument 1 is invalid
|  2186 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_IMAGE_TO_BUFFER_INFO_2_KHR> {
|       |                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2191:31: error: 'VkImageBlit2KHR' was not declared in this scope; did you mean 'VkImageBlit'?
|  2191 | template <> struct LvlTypeMap<VkImageBlit2KHR> {
|       |                               ^~~~~~~~~~~~~~~
|       |                               VkImageBlit
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2191:46: error: template argument 1 is invalid
|  2191 | template <> struct LvlTypeMap<VkImageBlit2KHR> {
|       |                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2195:32: error: 'VK_STRUCTURE_TYPE_IMAGE_BLIT_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SURFACE_FORMAT_2_KHR'?
|  2195 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_BLIT_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SURFACE_FORMAT_2_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2195:66: error: template argument 1 is invalid
|  2195 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_BLIT_2_KHR> {
|       |                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2200:31: error: 'VkBlitImageInfo2KHR' was not declared in this scope
|  2200 | template <> struct LvlTypeMap<VkBlitImageInfo2KHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2200:50: error: template argument 1 is invalid
|  2200 | template <> struct LvlTypeMap<VkBlitImageInfo2KHR> {
|       |                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2204:32: error: 'VK_STRUCTURE_TYPE_BLIT_IMAGE_INFO_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR'?
|  2204 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BLIT_IMAGE_INFO_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2204:71: error: template argument 1 is invalid
|  2204 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BLIT_IMAGE_INFO_2_KHR> {
|       |                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2209:31: error: 'VkImageResolve2KHR' was not declared in this scope; did you mean 'VkImageResolve'?
|  2209 | template <> struct LvlTypeMap<VkImageResolve2KHR> {
|       |                               ^~~~~~~~~~~~~~~~~~
|       |                               VkImageResolve
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2209:49: error: template argument 1 is invalid
|  2209 | template <> struct LvlTypeMap<VkImageResolve2KHR> {
|       |                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2213:32: error: 'VK_STRUCTURE_TYPE_IMAGE_RESOLVE_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO'?
|  2213 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_RESOLVE_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2213:69: error: template argument 1 is invalid
|  2213 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_RESOLVE_2_KHR> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2218:31: error: 'VkResolveImageInfo2KHR' was not declared in this scope
|  2218 | template <> struct LvlTypeMap<VkResolveImageInfo2KHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2218:53: error: template argument 1 is invalid
|  2218 | template <> struct LvlTypeMap<VkResolveImageInfo2KHR> {
|       |                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2222:32: error: 'VK_STRUCTURE_TYPE_RESOLVE_IMAGE_INFO_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR'?
|  2222 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RESOLVE_IMAGE_INFO_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2222:74: error: template argument 1 is invalid
|  2222 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RESOLVE_IMAGE_INFO_2_KHR> {
|       |                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2335:31: error: 'VkImageViewAddressPropertiesNVX' was not declared in this scope
|  2335 | template <> struct LvlTypeMap<VkImageViewAddressPropertiesNVX> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2335:62: error: template argument 1 is invalid
|  2335 | template <> struct LvlTypeMap<VkImageViewAddressPropertiesNVX> {
|       |                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2339:32: error: 'VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2'?
|  2339 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2339:83: error: template argument 1 is invalid
|  2339 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3372:43: error: 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR'?
|  3372 |     static const VkStructureType kSType = VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL;
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3375:32: error: 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR'?
|  3375 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3375:96: error: template argument 1 is invalid
|  3375 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL> {
|       |                                                                                                ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3750:31: error: 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderAtomicInt64FeaturesKHR'?
|  3750 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderAtomicFloatFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderAtomicInt64FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3750:75: error: template argument 1 is invalid
|  3750 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderAtomicFloatFeaturesEXT> {
|       |                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3754:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  3754 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3754:98: error: template argument 1 is invalid
|  3754 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT> {
|       |                                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3768:31: error: 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceIndexTypeUint8FeaturesEXT'?
|  3768 | template <> struct LvlTypeMap<VkPhysicalDeviceExtendedDynamicStateFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceIndexTypeUint8FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3768:78: error: template argument 1 is invalid
|  3768 | template <> struct LvlTypeMap<VkPhysicalDeviceExtendedDynamicStateFeaturesEXT> {
|       |                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3772:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT'?
|  3772 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3772:101: error: template argument 1 is invalid
|  3772 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT> {
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3894:31: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceHostQueryResetFeaturesEXT'?
|  3894 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2FeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceHostQueryResetFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3894:69: error: template argument 1 is invalid
|  3894 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2FeaturesEXT> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3898:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  3898 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3898:91: error: template argument 1 is invalid
|  3898 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT> {
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3903:31: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDevicePCIBusInfoPropertiesEXT'?
|  3903 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2PropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDevicePCIBusInfoPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3903:71: error: template argument 1 is invalid
|  3903 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2PropertiesEXT> {
|       |                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3907:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  3907 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3907:93: error: template argument 1 is invalid
|  3907 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT> {
|       |                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3912:31: error: 'VkSamplerCustomBorderColorCreateInfoEXT' was not declared in this scope
|  3912 | template <> struct LvlTypeMap<VkSamplerCustomBorderColorCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3912:70: error: template argument 1 is invalid
|  3912 | template <> struct LvlTypeMap<VkSamplerCustomBorderColorCreateInfoEXT> {
|       |                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3916:32: error: 'VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO_EXT'?
|  3916 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3916:93: error: template argument 1 is invalid
|  3916 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT> {
|       |                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3921:31: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceToolPropertiesEXT'?
|  3921 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorPropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceToolPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3921:77: error: template argument 1 is invalid
|  3921 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorPropertiesEXT> {
|       |                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3925:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  3925 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3925:100: error: template argument 1 is invalid
|  3925 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT> {
|       |                                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3930:31: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMemoryPriorityFeaturesEXT'?
|  3930 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMemoryPriorityFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3930:75: error: template argument 1 is invalid
|  3930 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorFeaturesEXT> {
|       |                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3934:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  3934 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3934:98: error: template argument 1 is invalid
|  3934 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT> {
|       |                                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3939:31: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceASTCDecodeFeaturesEXT'?
|  3939 | template <> struct LvlTypeMap<VkPhysicalDevicePrivateDataFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceASTCDecodeFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3939:69: error: template argument 1 is invalid
|  3939 | template <> struct LvlTypeMap<VkPhysicalDevicePrivateDataFeaturesEXT> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3943:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  3943 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3943:91: error: template argument 1 is invalid
|  3943 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT> {
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3948:31: error: 'VkDevicePrivateDataCreateInfoEXT' was not declared in this scope
|  3948 | template <> struct LvlTypeMap<VkDevicePrivateDataCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3948:63: error: template argument 1 is invalid
|  3948 | template <> struct LvlTypeMap<VkDevicePrivateDataCreateInfoEXT> {
|       |                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3952:32: error: 'VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT'?
|  3952 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3952:85: error: template argument 1 is invalid
|  3952 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT> {
|       |                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3957:31: error: 'VkPrivateDataSlotCreateInfoEXT' was not declared in this scope
|  3957 | template <> struct LvlTypeMap<VkPrivateDataSlotCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3957:61: error: template argument 1 is invalid
|  3957 | template <> struct LvlTypeMap<VkPrivateDataSlotCreateInfoEXT> {
|       |                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3961:32: error: 'VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT'?
|  3961 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3961:83: error: template argument 1 is invalid
|  3961 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3993:31: error: 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapFeaturesEXT'?
|  3993 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMap2FeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceFragmentDensityMapFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3993:77: error: template argument 1 is invalid
|  3993 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMap2FeaturesEXT> {
|       |                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3997:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT'?
|  3997 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3997:101: error: template argument 1 is invalid
|  3997 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT> {
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4002:31: error: 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapPropertiesEXT'?
|  4002 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMap2PropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceFragmentDensityMapPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4002:79: error: template argument 1 is invalid
|  4002 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMap2PropertiesEXT> {
|       |                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4006:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
|  4006 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4006:103: error: template argument 1 is invalid
|  4006 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT> {
|       |                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4011:31: error: 'VkPhysicalDeviceImageRobustnessFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceBufferAddressFeaturesEXT'?
|  4011 | template <> struct LvlTypeMap<VkPhysicalDeviceImageRobustnessFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceBufferAddressFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4011:73: error: template argument 1 is invalid
|  4011 | template <> struct LvlTypeMap<VkPhysicalDeviceImageRobustnessFeaturesEXT> {
|       |                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4015:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT'?
|  4015 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4015:95: error: template argument 1 is invalid
|  4015 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT> {
|       |                                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4020:31: error: 'VkPhysicalDevice4444FormatsFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceASTCDecodeFeaturesEXT'?
|  4020 | template <> struct LvlTypeMap<VkPhysicalDevice4444FormatsFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceASTCDecodeFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4020:69: error: template argument 1 is invalid
|  4020 | template <> struct LvlTypeMap<VkPhysicalDevice4444FormatsFeaturesEXT> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4024:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  4024 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4024:91: error: template argument 1 is invalid
|  4024 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT> {
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:3257:11: error: 'VkCopyBufferInfo2KHR' does not name a type; did you mean 'CmdCopyBuffer2KHR'?
|  3257 |     const VkCopyBufferInfo2KHR*                 pCopyBufferInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~
|       |           CmdCopyBuffer2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:3264:11: error: 'VkCopyImageInfo2KHR' does not name a type; did you mean 'CmdCopyImage2KHR'?
|  3264 |     const VkCopyImageInfo2KHR*                  pCopyImageInfo)
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           CmdCopyImage2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:3271:11: error: 'VkCopyBufferToImageInfo2KHR' does not name a type; did you mean 'CmdCopyBufferToImage2KHR'?
|  3271 |     const VkCopyBufferToImageInfo2KHR*          pCopyBufferToImageInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           CmdCopyBufferToImage2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:3278:11: error: 'VkCopyImageToBufferInfo2KHR' does not name a type; did you mean 'CmdCopyImageToBuffer2KHR'?
|  3278 |     const VkCopyImageToBufferInfo2KHR*          pCopyImageToBufferInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           CmdCopyImageToBuffer2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:3285:11: error: 'VkBlitImageInfo2KHR' does not name a type; did you mean 'CmdBlitImage2KHR'?
|  3285 |     const VkBlitImageInfo2KHR*                  pBlitImageInfo)
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           CmdBlitImage2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:3292:11: error: 'VkResolveImageInfo2KHR' does not name a type; did you mean 'CmdResolveImage2KHR'?
|  3292 |     const VkResolveImageInfo2KHR*               pResolveImageInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~
|       |           CmdResolveImage2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:3450:5: error: 'VkImageViewAddressPropertiesNVX' has not been declared
|  3450 |     VkImageViewAddressPropertiesNVX*            pProperties)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:4649:11: error: 'VkPrivateDataSlotCreateInfoEXT' does not name a type
|  4649 |     const VkPrivateDataSlotCreateInfoEXT*       pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:4651:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  4651 |     VkPrivateDataSlotEXT*                       pPrivateDataSlot)
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp: In function 'VkResult vkmock::CreatePrivateDataSlotEXT(VkDevice, const int*, const VkAllocationCallbacks*, int*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:4654:26: error: 'VkPrivateDataSlotEXT' was not declared in this scope; did you mean 'pPrivateDataSlot'?
|  4654 |     *pPrivateDataSlot = (VkPrivateDataSlotEXT)global_unique_handle++;
|       |                          ^~~~~~~~~~~~~~~~~~~~
|       |                          pPrivateDataSlot
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:4660:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  4660 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:4670:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  4670 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:4681:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  4681 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| [2/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-t
 ools/1.2.154.0-r0=/usr/src/debug/vulkan-tools/1.2.154.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0=/usr/src/debug/vulkan-tools/1.2.154.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -
 Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp
| FAILED: vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1
 .2.154.0-r0=/usr/src/debug/vulkan-tools/1.2.154.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0=/usr/src/debug/vulkan-tools/1.2.154.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimpli
 cit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'const char* VkDriverIdString(VkDriverId)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:94:9: warning: case value '13' not in enumerated type 'VkDriverId' [-Wswitch]
|    94 |         case (13): return "DRIVER_ID_MESA_LLVMPIPE";
|       |         ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:95:9: warning: case value '14' not in enumerated type 'VkDriverId' [-Wswitch]
|    95 |         case (14): return "DRIVER_ID_MOLTENVK";
|       |         ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'const char* VkFormatString(VkFormat)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:349:9: warning: case value '1000340000' not in enumerated type 'VkFormat' [-Wswitch]
|   349 |         case (1000340000): return "FORMAT_A4R4G4B4_UNORM_PACK16_EXT";
|       |         ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:350:9: warning: case value '1000340001' not in enumerated type 'VkFormat' [-Wswitch]
|   350 |         case (1000340001): return "FORMAT_A4B4G4R4_UNORM_PACK16_EXT";
|       |         ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:965:79: error: 'VkPhysicalDevice4444FormatsFeaturesEXT' has not been declared
|   965 | void DumpVkPhysicalDevice4444FormatsFeaturesEXT(Printer &p, std::string name, VkPhysicalDevice4444FormatsFeaturesEXT &obj) {
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevice4444FormatsFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:967:60: error: request for member 'formatA4R4G4B4' in 'obj', which is of non-class type 'int'
|   967 |     p.PrintKeyBool("formatA4R4G4B4", static_cast<bool>(obj.formatA4R4G4B4), 14);
|       |                                                            ^~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:968:60: error: request for member 'formatA4B4G4R4' in 'obj', which is of non-class type 'int'
|   968 |     p.PrintKeyBool("formatA4B4G4R4", static_cast<bool>(obj.formatA4B4G4R4), 14);
|       |                                                            ^~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1022:85: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' has not been declared
|  1022 | void DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceCustomBorderColorFeaturesEXT &obj) {
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1024:64: error: request for member 'customBorderColors' in 'obj', which is of non-class type 'int'
|  1024 |     p.PrintKeyBool("customBorderColors", static_cast<bool>(obj.customBorderColors), 30);
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1025:76: error: request for member 'customBorderColorWithoutFormat' in 'obj', which is of non-class type 'int'
|  1025 |     p.PrintKeyBool("customBorderColorWithoutFormat", static_cast<bool>(obj.customBorderColorWithoutFormat), 30);
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1027:87: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' has not been declared
|  1027 | void DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT(Printer &p, std::string name, VkPhysicalDeviceCustomBorderColorPropertiesEXT &obj) {
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1029:57: error: request for member 'maxCustomBorderColorSamplers' in 'obj', which is of non-class type 'int'
|  1029 |     p.PrintKeyValue("maxCustomBorderColorSamplers", obj.maxCustomBorderColorSamplers, 28);
|       |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1102:88: error: 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT' has not been declared
|  1102 | void DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceExtendedDynamicStateFeaturesEXT &obj) {
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1104:66: error: request for member 'extendedDynamicState' in 'obj', which is of non-class type 'int'
|  1104 |     p.PrintKeyBool("extendedDynamicState", static_cast<bool>(obj.extendedDynamicState), 20);
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1188:87: error: 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT' has not been declared
|  1188 | void DumpVkPhysicalDeviceFragmentDensityMap2FeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceFragmentDensityMap2FeaturesEXT &obj) {
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceFragmentDensityMap2FeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1190:72: error: request for member 'fragmentDensityMapDeferred' in 'obj', which is of non-class type 'int'
|  1190 |     p.PrintKeyBool("fragmentDensityMapDeferred", static_cast<bool>(obj.fragmentDensityMapDeferred), 26);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1192:89: error: 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT' has not been declared
|  1192 | void DumpVkPhysicalDeviceFragmentDensityMap2PropertiesEXT(Printer &p, std::string name, VkPhysicalDeviceFragmentDensityMap2PropertiesEXT &obj) {
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceFragmentDensityMap2PropertiesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1194:61: error: request for member 'subsampledLoads' in 'obj', which is of non-class type 'int'
|  1194 |     p.PrintKeyBool("subsampledLoads", static_cast<bool>(obj.subsampledLoads), 41);
|       |                                                             ^~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1195:87: error: request for member 'subsampledCoarseReconstructionEarlyAccess' in 'obj', which is of non-class type 'int'
|  1195 |     p.PrintKeyBool("subsampledCoarseReconstructionEarlyAccess", static_cast<bool>(obj.subsampledCoarseReconstructionEarlyAccess), 41);
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1196:53: error: request for member 'maxSubsampledArrayLayers' in 'obj', which is of non-class type 'int'
|  1196 |     p.PrintKeyValue("maxSubsampledArrayLayers", obj.maxSubsampledArrayLayers, 41);
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1197:63: error: request for member 'maxDescriptorSetSubsampledSamplers' in 'obj', which is of non-class type 'int'
|  1197 |     p.PrintKeyValue("maxDescriptorSetSubsampledSamplers", obj.maxDescriptorSetSubsampledSamplers, 41);
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1229:83: error: 'VkPhysicalDeviceImageRobustnessFeaturesEXT' has not been declared
|  1229 | void DumpVkPhysicalDeviceImageRobustnessFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceImageRobustnessFeaturesEXT &obj) {
|       |                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceImageRobustnessFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1231:63: error: request for member 'robustImageAccess' in 'obj', which is of non-class type 'int'
|  1231 |     p.PrintKeyBool("robustImageAccess", static_cast<bool>(obj.robustImageAccess), 17);
|       |                                                               ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1488:85: error: 'VkPhysicalDevicePortabilitySubsetFeaturesKHR' has not been declared
|  1488 | void DumpVkPhysicalDevicePortabilitySubsetFeaturesKHR(Printer &p, std::string name, VkPhysicalDevicePortabilitySubsetFeaturesKHR &obj) {
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePortabilitySubsetFeaturesKHR(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1490:76: error: request for member 'constantAlphaColorBlendFactors' in 'obj', which is of non-class type 'int'
|  1490 |     p.PrintKeyBool("constantAlphaColorBlendFactors", static_cast<bool>(obj.constantAlphaColorBlendFactors), 38);
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1491:52: error: request for member 'events' in 'obj', which is of non-class type 'int'
|  1491 |     p.PrintKeyBool("events", static_cast<bool>(obj.events), 38);
|       |                                                    ^~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1492:77: error: request for member 'imageViewFormatReinterpretation' in 'obj', which is of non-class type 'int'
|  1492 |     p.PrintKeyBool("imageViewFormatReinterpretation", static_cast<bool>(obj.imageViewFormatReinterpretation), 38);
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1493:68: error: request for member 'imageViewFormatSwizzle' in 'obj', which is of non-class type 'int'
|  1493 |     p.PrintKeyBool("imageViewFormatSwizzle", static_cast<bool>(obj.imageViewFormatSwizzle), 38);
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1494:66: error: request for member 'imageView2DOn3DImage' in 'obj', which is of non-class type 'int'
|  1494 |     p.PrintKeyBool("imageView2DOn3DImage", static_cast<bool>(obj.imageView2DOn3DImage), 38);
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1495:67: error: request for member 'multisampleArrayImage' in 'obj', which is of non-class type 'int'
|  1495 |     p.PrintKeyBool("multisampleArrayImage", static_cast<bool>(obj.multisampleArrayImage), 38);
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1496:71: error: request for member 'mutableComparisonSamplers' in 'obj', which is of non-class type 'int'
|  1496 |     p.PrintKeyBool("mutableComparisonSamplers", static_cast<bool>(obj.mutableComparisonSamplers), 38);
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1497:59: error: request for member 'pointPolygons' in 'obj', which is of non-class type 'int'
|  1497 |     p.PrintKeyBool("pointPolygons", static_cast<bool>(obj.pointPolygons), 38);
|       |                                                           ^~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1498:63: error: request for member 'samplerMipLodBias' in 'obj', which is of non-class type 'int'
|  1498 |     p.PrintKeyBool("samplerMipLodBias", static_cast<bool>(obj.samplerMipLodBias), 38);
|       |                                                               ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1499:68: error: request for member 'separateStencilMaskRef' in 'obj', which is of non-class type 'int'
|  1499 |     p.PrintKeyBool("separateStencilMaskRef", static_cast<bool>(obj.separateStencilMaskRef), 38);
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1500:84: error: request for member 'shaderSampleRateInterpolationFunctions' in 'obj', which is of non-class type 'int'
|  1500 |     p.PrintKeyBool("shaderSampleRateInterpolationFunctions", static_cast<bool>(obj.shaderSampleRateInterpolationFunctions), 38);
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1501:66: error: request for member 'tessellationIsolines' in 'obj', which is of non-class type 'int'
|  1501 |     p.PrintKeyBool("tessellationIsolines", static_cast<bool>(obj.tessellationIsolines), 38);
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1502:67: error: request for member 'tessellationPointMode' in 'obj', which is of non-class type 'int'
|  1502 |     p.PrintKeyBool("tessellationPointMode", static_cast<bool>(obj.tessellationPointMode), 38);
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1503:58: error: request for member 'triangleFans' in 'obj', which is of non-class type 'int'
|  1503 |     p.PrintKeyBool("triangleFans", static_cast<bool>(obj.triangleFans), 38);
|       |                                                          ^~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1504:79: error: request for member 'vertexAttributeAccessBeyondStride' in 'obj', which is of non-class type 'int'
|  1504 |     p.PrintKeyBool("vertexAttributeAccessBeyondStride", static_cast<bool>(obj.vertexAttributeAccessBeyondStride), 38);
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1508:87: error: 'VkPhysicalDevicePortabilitySubsetPropertiesKHR' has not been declared
|  1508 | void DumpVkPhysicalDevicePortabilitySubsetPropertiesKHR(Printer &p, std::string name, VkPhysicalDevicePortabilitySubsetPropertiesKHR &obj) {
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePortabilitySubsetPropertiesKHR(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1510:65: error: request for member 'minVertexInputBindingStrideAlignment' in 'obj', which is of non-class type 'int'
|  1510 |     p.PrintKeyValue("minVertexInputBindingStrideAlignment", obj.minVertexInputBindingStrideAlignment, 36);
|       |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1513:79: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' has not been declared
|  1513 | void DumpVkPhysicalDevicePrivateDataFeaturesEXT(Printer &p, std::string name, VkPhysicalDevicePrivateDataFeaturesEXT &obj) {
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePrivateDataFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1515:57: error: request for member 'privateData' in 'obj', which is of non-class type 'int'
|  1515 |     p.PrintKeyBool("privateData", static_cast<bool>(obj.privateData), 11);
|       |                                                         ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1557:79: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' has not been declared
|  1557 | void DumpVkPhysicalDeviceRobustness2FeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceRobustness2FeaturesEXT &obj) {
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRobustness2FeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1559:65: error: request for member 'robustBufferAccess2' in 'obj', which is of non-class type 'int'
|  1559 |     p.PrintKeyBool("robustBufferAccess2", static_cast<bool>(obj.robustBufferAccess2), 19);
|       |                                                                 ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1560:64: error: request for member 'robustImageAccess2' in 'obj', which is of non-class type 'int'
|  1560 |     p.PrintKeyBool("robustImageAccess2", static_cast<bool>(obj.robustImageAccess2), 19);
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1561:60: error: request for member 'nullDescriptor' in 'obj', which is of non-class type 'int'
|  1561 |     p.PrintKeyBool("nullDescriptor", static_cast<bool>(obj.nullDescriptor), 19);
|       |                                                            ^~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1563:81: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' has not been declared
|  1563 | void DumpVkPhysicalDeviceRobustness2PropertiesEXT(Printer &p, std::string name, VkPhysicalDeviceRobustness2PropertiesEXT &obj) {
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRobustness2PropertiesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1565:81: error: request for member 'robustStorageBufferAccessSizeAlignment' in 'obj', which is of non-class type 'int'
|  1565 |     p.PrintKeyValue("robustStorageBufferAccessSizeAlignment", to_hex_str(p, obj.robustStorageBufferAccessSizeAlignment), 38);
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1566:81: error: request for member 'robustUniformBufferAccessSizeAlignment' in 'obj', which is of non-class type 'int'
|  1566 |     p.PrintKeyValue("robustUniformBufferAccessSizeAlignment", to_hex_str(p, obj.robustUniformBufferAccessSizeAlignment), 38);
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1596:85: error: 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT' has not been declared
|  1596 | void DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceShaderAtomicFloatFeaturesEXT &obj) {
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1598:72: error: request for member 'shaderBufferFloat32Atomics' in 'obj', which is of non-class type 'int'
|  1598 |     p.PrintKeyBool("shaderBufferFloat32Atomics", static_cast<bool>(obj.shaderBufferFloat32Atomics), 28);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1599:74: error: request for member 'shaderBufferFloat32AtomicAdd' in 'obj', which is of non-class type 'int'
|  1599 |     p.PrintKeyBool("shaderBufferFloat32AtomicAdd", static_cast<bool>(obj.shaderBufferFloat32AtomicAdd), 28);
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1600:72: error: request for member 'shaderBufferFloat64Atomics' in 'obj', which is of non-class type 'int'
|  1600 |     p.PrintKeyBool("shaderBufferFloat64Atomics", static_cast<bool>(obj.shaderBufferFloat64Atomics), 28);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1601:74: error: request for member 'shaderBufferFloat64AtomicAdd' in 'obj', which is of non-class type 'int'
|  1601 |     p.PrintKeyBool("shaderBufferFloat64AtomicAdd", static_cast<bool>(obj.shaderBufferFloat64AtomicAdd), 28);
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1602:72: error: request for member 'shaderSharedFloat32Atomics' in 'obj', which is of non-class type 'int'
|  1602 |     p.PrintKeyBool("shaderSharedFloat32Atomics", static_cast<bool>(obj.shaderSharedFloat32Atomics), 28);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1603:74: error: request for member 'shaderSharedFloat32AtomicAdd' in 'obj', which is of non-class type 'int'
|  1603 |     p.PrintKeyBool("shaderSharedFloat32AtomicAdd", static_cast<bool>(obj.shaderSharedFloat32AtomicAdd), 28);
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1604:72: error: request for member 'shaderSharedFloat64Atomics' in 'obj', which is of non-class type 'int'
|  1604 |     p.PrintKeyBool("shaderSharedFloat64Atomics", static_cast<bool>(obj.shaderSharedFloat64Atomics), 28);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1605:74: error: request for member 'shaderSharedFloat64AtomicAdd' in 'obj', which is of non-class type 'int'
|  1605 |     p.PrintKeyBool("shaderSharedFloat64AtomicAdd", static_cast<bool>(obj.shaderSharedFloat64AtomicAdd), 28);
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1606:71: error: request for member 'shaderImageFloat32Atomics' in 'obj', which is of non-class type 'int'
|  1606 |     p.PrintKeyBool("shaderImageFloat32Atomics", static_cast<bool>(obj.shaderImageFloat32Atomics), 28);
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1607:73: error: request for member 'shaderImageFloat32AtomicAdd' in 'obj', which is of non-class type 'int'
|  1607 |     p.PrintKeyBool("shaderImageFloat32AtomicAdd", static_cast<bool>(obj.shaderImageFloat32AtomicAdd), 28);
|       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1608:71: error: request for member 'sparseImageFloat32Atomics' in 'obj', which is of non-class type 'int'
|  1608 |     p.PrintKeyBool("sparseImageFloat32Atomics", static_cast<bool>(obj.sparseImageFloat32Atomics), 28);
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1609:73: error: request for member 'sparseImageFloat32AtomicAdd' in 'obj', which is of non-class type 'int'
|  1609 |     p.PrintKeyBool("sparseImageFloat32AtomicAdd", static_cast<bool>(obj.sparseImageFloat32AtomicAdd), 28);
|       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'pNextChainInfos get_chain_infos()':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1921:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  1921 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorPropertiesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1921:87: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT'?
|  1921 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorPropertiesEXT)},
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                       DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1928:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
|  1928 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceFragmentDensityMap2PropertiesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1928:90: error: 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapPropertiesEXT'?
|  1928 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceFragmentDensityMap2PropertiesEXT)},
|       |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                          VkPhysicalDeviceFragmentDensityMapPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1939:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR'?
|  1939 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR, sizeof(VkPhysicalDevicePortabilitySubsetPropertiesKHR)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1939:86: error: 'VkPhysicalDevicePortabilitySubsetPropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePortabilitySubsetPropertiesKHR'?
|  1939 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR, sizeof(VkPhysicalDevicePortabilitySubsetPropertiesKHR)},
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                      DumpVkPhysicalDevicePortabilitySubsetPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1946:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  1946 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceRobustness2PropertiesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1946:80: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2PropertiesEXT'?
|  1946 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceRobustness2PropertiesEXT)},
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                DumpVkPhysicalDeviceRobustness2PropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1957:5: error: no match for 'operator=' (operand types are 'std::vector<pNextChainBuildingBlockInfo>' and '<brace-enclosed initializer list>')
|  1957 |     };
|       |     ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/vector:72,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/vector.tcc:198:5: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(const std::vector<_Tp, _Alloc>&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   198 |     vector<_Tp, _Alloc>::
|       |     ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/vector.tcc:199:42: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'const std::vector<pNextChainBuildingBlockInfo>&'
|   199 |     operator=(const vector<_Tp, _Alloc>& __x)
|       |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/vector:67,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:709:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::vector<_Tp, _Alloc>&&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:709:26: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::vector<pNextChainBuildingBlockInfo>&&'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |                 ~~~~~~~~~^~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:730:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::initializer_list<_Tp>) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   730 |       operator=(initializer_list<value_type> __l)
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:730:46: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::initializer_list<pNextChainBuildingBlockInfo>'
|   730 |       operator=(initializer_list<value_type> __l)
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1963:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  1963 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT, sizeof(VkPhysicalDevice4444FormatsFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1963:78: error: 'VkPhysicalDevice4444FormatsFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevice4444FormatsFeaturesEXT'?
|  1963 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT, sizeof(VkPhysicalDevice4444FormatsFeaturesEXT)},
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                              DumpVkPhysicalDevice4444FormatsFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1970:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  1970 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1970:85: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT'?
|  1970 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorFeaturesEXT)},
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                     DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1973:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT'?
|  1973 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT, sizeof(VkPhysicalDeviceExtendedDynamicStateFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1973:88: error: 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT'?
|  1973 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT, sizeof(VkPhysicalDeviceExtendedDynamicStateFeaturesEXT)},
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                        DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1974:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT'?
|  1974 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT, sizeof(VkPhysicalDeviceFragmentDensityMap2FeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1974:88: error: 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapFeaturesEXT'?
|  1974 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT, sizeof(VkPhysicalDeviceFragmentDensityMap2FeaturesEXT)},
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                        VkPhysicalDeviceFragmentDensityMapFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1978:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT'?
|  1978 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT, sizeof(VkPhysicalDeviceImageRobustnessFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1978:82: error: 'VkPhysicalDeviceImageRobustnessFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceImageRobustnessFeaturesEXT'?
|  1978 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT, sizeof(VkPhysicalDeviceImageRobustnessFeaturesEXT)},
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                  DumpVkPhysicalDeviceImageRobustnessFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1989:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR'?
|  1989 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR, sizeof(VkPhysicalDevicePortabilitySubsetFeaturesKHR)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1989:84: error: 'VkPhysicalDevicePortabilitySubsetFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePortabilitySubsetFeaturesKHR'?
|  1989 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR, sizeof(VkPhysicalDevicePortabilitySubsetFeaturesKHR)},
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                    DumpVkPhysicalDevicePortabilitySubsetFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1991:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  1991 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT, sizeof(VkPhysicalDevicePrivateDataFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1991:78: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePrivateDataFeaturesEXT'?
|  1991 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT, sizeof(VkPhysicalDevicePrivateDataFeaturesEXT)},
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                              DumpVkPhysicalDevicePrivateDataFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1996:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  1996 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT, sizeof(VkPhysicalDeviceRobustness2FeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1996:78: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2FeaturesEXT'?
|  1996 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT, sizeof(VkPhysicalDeviceRobustness2FeaturesEXT)},
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                              DumpVkPhysicalDeviceRobustness2FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2000:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  2000 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT, sizeof(VkPhysicalDeviceShaderAtomicFloatFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2000:85: error: 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT'?
|  2000 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT, sizeof(VkPhysicalDeviceShaderAtomicFloatFeaturesEXT)},
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                     DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2019:5: error: no match for 'operator=' (operand types are 'std::vector<pNextChainBuildingBlockInfo>' and '<brace-enclosed initializer list>')
|  2019 |     };
|       |     ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/vector:72,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/vector.tcc:198:5: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(const std::vector<_Tp, _Alloc>&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   198 |     vector<_Tp, _Alloc>::
|       |     ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/vector.tcc:199:42: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'const std::vector<pNextChainBuildingBlockInfo>&'
|   199 |     operator=(const vector<_Tp, _Alloc>& __x)
|       |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/vector:67,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:709:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::vector<_Tp, _Alloc>&&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:709:26: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::vector<pNextChainBuildingBlockInfo>&&'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |                 ~~~~~~~~~^~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:730:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::initializer_list<_Tp>) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   730 |       operator=(initializer_list<value_type> __l)
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:730:46: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::initializer_list<pNextChainBuildingBlockInfo>'
|   730 |       operator=(initializer_list<value_type> __l)
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_props2(Printer&, AppInstance&, AppGpu&, void*, VulkanVersion)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2048:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  2048 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2049:54: error: 'VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME'?
|  2049 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2050:13: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT'?
|  2050 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2050:61: error: 'props' was not declared in this scope
|  2050 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
|       |                                                             ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2050:117: error: expected primary-expression before ')' token
|  2050 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
|       |                                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2094:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
|  2094 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2095:54: error: 'VK_EXT_FRAGMENT_DENSITY_MAP_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME'?
|  2095 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_FRAGMENT_DENSITY_MAP_2_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2096:13: error: 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapPropertiesEXT'?
|  2096 |             VkPhysicalDeviceFragmentDensityMap2PropertiesEXT* props = (VkPhysicalDeviceFragmentDensityMap2PropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceFragmentDensityMapPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2096:63: error: 'props' was not declared in this scope
|  2096 |             VkPhysicalDeviceFragmentDensityMap2PropertiesEXT* props = (VkPhysicalDeviceFragmentDensityMap2PropertiesEXT*)structure;
|       |                                                               ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2096:121: error: expected primary-expression before ')' token
|  2096 |             VkPhysicalDeviceFragmentDensityMap2PropertiesEXT* props = (VkPhysicalDeviceFragmentDensityMap2PropertiesEXT*)structure;
|       |                                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2159:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR'?
|  2159 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2160:54: error: 'VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME'?
|  2160 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2161:13: error: 'VkPhysicalDevicePortabilitySubsetPropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePortabilitySubsetPropertiesKHR'?
|  2161 |             VkPhysicalDevicePortabilitySubsetPropertiesKHR* props = (VkPhysicalDevicePortabilitySubsetPropertiesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDevicePortabilitySubsetPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2161:61: error: 'props' was not declared in this scope
|  2161 |             VkPhysicalDevicePortabilitySubsetPropertiesKHR* props = (VkPhysicalDevicePortabilitySubsetPropertiesKHR*)structure;
|       |                                                             ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2161:117: error: expected primary-expression before ')' token
|  2161 |             VkPhysicalDevicePortabilitySubsetPropertiesKHR* props = (VkPhysicalDevicePortabilitySubsetPropertiesKHR*)structure;
|       |                                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2186:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  2186 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2187:54: error: 'VK_EXT_ROBUSTNESS_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEBUG_REPORT_EXTENSION_NAME'?
|  2187 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_ROBUSTNESS_2_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_DEBUG_REPORT_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2188:13: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2PropertiesEXT'?
|  2188 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceRobustness2PropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2188:55: error: 'props' was not declared in this scope
|  2188 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
|       |                                                       ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2188:105: error: expected primary-expression before ')' token
|  2188 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
|       |                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, void*, VulkanVersion)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2281:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  2281 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2282:54: error: 'VK_EXT_4444_FORMATS_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_HDR_METADATA_EXTENSION_NAME'?
|  2282 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_4444_FORMATS_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_HDR_METADATA_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2283:13: error: 'VkPhysicalDevice4444FormatsFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevice4444FormatsFeaturesEXT'?
|  2283 |             VkPhysicalDevice4444FormatsFeaturesEXT* props = (VkPhysicalDevice4444FormatsFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDevice4444FormatsFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2283:53: error: 'props' was not declared in this scope
|  2283 |             VkPhysicalDevice4444FormatsFeaturesEXT* props = (VkPhysicalDevice4444FormatsFeaturesEXT*)structure;
|       |                                                     ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2283:101: error: expected primary-expression before ')' token
|  2283 |             VkPhysicalDevice4444FormatsFeaturesEXT* props = (VkPhysicalDevice4444FormatsFeaturesEXT*)structure;
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2325:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  2325 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2326:54: error: 'VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME'?
|  2326 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2327:13: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT'?
|  2327 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2327:59: error: 'props' was not declared in this scope
|  2327 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
|       |                                                           ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2327:113: error: expected primary-expression before ')' token
|  2327 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
|       |                                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2344:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT'?
|  2344 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2345:54: error: 'VK_EXT_EXTENDED_DYNAMIC_STATE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_INDEX_TYPE_UINT8_EXTENSION_NAME'?
|  2345 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_EXTENDED_DYNAMIC_STATE_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_INDEX_TYPE_UINT8_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2346:13: error: 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT'?
|  2346 |             VkPhysicalDeviceExtendedDynamicStateFeaturesEXT* props = (VkPhysicalDeviceExtendedDynamicStateFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2346:62: error: 'props' was not declared in this scope
|  2346 |             VkPhysicalDeviceExtendedDynamicStateFeaturesEXT* props = (VkPhysicalDeviceExtendedDynamicStateFeaturesEXT*)structure;
|       |                                                              ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2346:119: error: expected primary-expression before ')' token
|  2346 |             VkPhysicalDeviceExtendedDynamicStateFeaturesEXT* props = (VkPhysicalDeviceExtendedDynamicStateFeaturesEXT*)structure;
|       |                                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2350:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT'?
|  2350 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2351:54: error: 'VK_EXT_FRAGMENT_DENSITY_MAP_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME'?
|  2351 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_FRAGMENT_DENSITY_MAP_2_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2352:13: error: 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapFeaturesEXT'?
|  2352 |             VkPhysicalDeviceFragmentDensityMap2FeaturesEXT* props = (VkPhysicalDeviceFragmentDensityMap2FeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceFragmentDensityMapFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2352:61: error: 'props' was not declared in this scope
|  2352 |             VkPhysicalDeviceFragmentDensityMap2FeaturesEXT* props = (VkPhysicalDeviceFragmentDensityMap2FeaturesEXT*)structure;
|       |                                                             ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2352:117: error: expected primary-expression before ')' token
|  2352 |             VkPhysicalDeviceFragmentDensityMap2FeaturesEXT* props = (VkPhysicalDeviceFragmentDensityMap2FeaturesEXT*)structure;
|       |                                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2375:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT'?
|  2375 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2376:54: error: 'VK_EXT_IMAGE_ROBUSTNESS_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_IMAGE_FORMAT_LIST_EXTENSION_NAME'?
|  2376 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_IMAGE_ROBUSTNESS_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_IMAGE_FORMAT_LIST_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2377:13: error: 'VkPhysicalDeviceImageRobustnessFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceImageRobustnessFeaturesEXT'?
|  2377 |             VkPhysicalDeviceImageRobustnessFeaturesEXT* props = (VkPhysicalDeviceImageRobustnessFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceImageRobustnessFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2377:57: error: 'props' was not declared in this scope
|  2377 |             VkPhysicalDeviceImageRobustnessFeaturesEXT* props = (VkPhysicalDeviceImageRobustnessFeaturesEXT*)structure;
|       |                                                         ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2377:109: error: expected primary-expression before ')' token
|  2377 |             VkPhysicalDeviceImageRobustnessFeaturesEXT* props = (VkPhysicalDeviceImageRobustnessFeaturesEXT*)structure;
|       |                                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2438:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR'?
|  2438 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2439:54: error: 'VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME'?
|  2439 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2440:13: error: 'VkPhysicalDevicePortabilitySubsetFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePortabilitySubsetFeaturesKHR'?
|  2440 |             VkPhysicalDevicePortabilitySubsetFeaturesKHR* props = (VkPhysicalDevicePortabilitySubsetFeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDevicePortabilitySubsetFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2440:59: error: 'props' was not declared in this scope
|  2440 |             VkPhysicalDevicePortabilitySubsetFeaturesKHR* props = (VkPhysicalDevicePortabilitySubsetFeaturesKHR*)structure;
|       |                                                           ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2440:113: error: expected primary-expression before ')' token
|  2440 |             VkPhysicalDevicePortabilitySubsetFeaturesKHR* props = (VkPhysicalDevicePortabilitySubsetFeaturesKHR*)structure;
|       |                                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2445:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  2445 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2446:54: error: 'VK_EXT_PRIVATE_DATA_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_HDR_METADATA_EXTENSION_NAME'?
|  2446 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_PRIVATE_DATA_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_HDR_METADATA_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2447:13: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePrivateDataFeaturesEXT'?
|  2447 |             VkPhysicalDevicePrivateDataFeaturesEXT* props = (VkPhysicalDevicePrivateDataFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDevicePrivateDataFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2447:53: error: 'props' was not declared in this scope
|  2447 |             VkPhysicalDevicePrivateDataFeaturesEXT* props = (VkPhysicalDevicePrivateDataFeaturesEXT*)structure;
|       |                                                     ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2447:101: error: expected primary-expression before ')' token
|  2447 |             VkPhysicalDevicePrivateDataFeaturesEXT* props = (VkPhysicalDevicePrivateDataFeaturesEXT*)structure;
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2465:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  2465 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2466:54: error: 'VK_EXT_ROBUSTNESS_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEBUG_REPORT_EXTENSION_NAME'?
|  2466 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_ROBUSTNESS_2_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_DEBUG_REPORT_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2467:13: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2FeaturesEXT'?
|  2467 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceRobustness2FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2467:53: error: 'props' was not declared in this scope
|  2467 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
|       |                                                     ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2467:101: error: expected primary-expression before ')' token
|  2467 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2492:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  2492 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2493:54: error: 'VK_EXT_SHADER_ATOMIC_FLOAT_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME'?
|  2493 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_SHADER_ATOMIC_FLOAT_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2494:13: error: 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT'?
|  2494 |             VkPhysicalDeviceShaderAtomicFloatFeaturesEXT* props = (VkPhysicalDeviceShaderAtomicFloatFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2494:59: error: 'props' was not declared in this scope
|  2494 |             VkPhysicalDeviceShaderAtomicFloatFeaturesEXT* props = (VkPhysicalDeviceShaderAtomicFloatFeaturesEXT*)structure;
|       |                                                           ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2494:113: error: expected primary-expression before ')' token
|  2494 |             VkPhysicalDeviceShaderAtomicFloatFeaturesEXT* props = (VkPhysicalDeviceShaderAtomicFloatFeaturesEXT*)structure;
|       |                                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp: In function 'void DumpPortability(Printer&, AppGpu&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:771:50: error: 'VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME'?
|   771 |     if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME)) {
|       |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                  VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:776:41: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR'?
|   776 |                 if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR) {
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                         VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:777:21: error: 'VkPhysicalDevicePortabilitySubsetPropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePortabilitySubsetPropertiesKHR'?
|   777 |                     VkPhysicalDevicePortabilitySubsetPropertiesKHR *props =
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                     DumpVkPhysicalDevicePortabilitySubsetPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:777:69: error: 'props' was not declared in this scope
|   777 |                     VkPhysicalDevicePortabilitySubsetPropertiesKHR *props =
|       |                                                                     ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:778:74: error: expected primary-expression before ')' token
|   778 |                         (VkPhysicalDevicePortabilitySubsetPropertiesKHR *)structure;
|       |                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:788:41: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR'?
|   788 |                 if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR) {
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                         VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:789:21: error: 'VkPhysicalDevicePortabilitySubsetFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePortabilitySubsetFeaturesKHR'?
|   789 |                     VkPhysicalDevicePortabilitySubsetFeaturesKHR *features =
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                     DumpVkPhysicalDevicePortabilitySubsetFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:789:67: error: 'features' was not declared in this scope
|   789 |                     VkPhysicalDevicePortabilitySubsetFeaturesKHR *features =
|       |                                                                   ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:790:72: error: expected primary-expression before ')' token
|   790 |                         (VkPhysicalDevicePortabilitySubsetFeaturesKHR *)structure;
|       |                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp: In function 'int main(int, char**)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:972:78: error: 'VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME'?
|   972 |             if (!gpus.at(selected_gpu)->CheckPhysicalDeviceExtensionIncluded(VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME)) {
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                              VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME
| ninja: build stopped: subcommand failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/temp/run.do_compile.3470107:155 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/temp/run.do_compile.3470107, line 155
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/temp/run.do_compile.3470107, line 149
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/temp/run.do_compile.3470107, line 144
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/temp/run.do_compile.3470107, line 168
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/temp/run.do_compile.3470107' failed with exit code 1:
| [1/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd -Iicd -I. -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.
 2.154.0-r0=/usr/src/debug/vulkan-tools/1.2.154.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0=/usr/src/debug/vulkan-tools/1.2.154.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplic
 it-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp
| FAILED: icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd -Iicd -I. -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.
 0-r0=/usr/src/debug/vulkan-tools/1.2.154.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0=/usr/src/debug/vulkan-tools/1.2.154.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fal
 lthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:22:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:1928:11: error: 'VkCopyBufferInfo2KHR' does not name a type
|  1928 |     const VkCopyBufferInfo2KHR*                 pCopyBufferInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:1932:11: error: 'VkCopyImageInfo2KHR' does not name a type
|  1932 |     const VkCopyImageInfo2KHR*                  pCopyImageInfo);
|       |           ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:1936:11: error: 'VkCopyBufferToImageInfo2KHR' does not name a type
|  1936 |     const VkCopyBufferToImageInfo2KHR*          pCopyBufferToImageInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:1940:11: error: 'VkCopyImageToBufferInfo2KHR' does not name a type
|  1940 |     const VkCopyImageToBufferInfo2KHR*          pCopyImageToBufferInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:1944:11: error: 'VkBlitImageInfo2KHR' does not name a type
|  1944 |     const VkBlitImageInfo2KHR*                  pBlitImageInfo);
|       |           ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:1948:11: error: 'VkResolveImageInfo2KHR' does not name a type
|  1948 |     const VkResolveImageInfo2KHR*               pResolveImageInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:2053:5: error: 'VkImageViewAddressPropertiesNVX' has not been declared
|  2053 |     VkImageViewAddressPropertiesNVX*            pProperties);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:2835:11: error: 'VkPrivateDataSlotCreateInfoEXT' does not name a type
|  2835 |     const VkPrivateDataSlotCreateInfoEXT*       pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:2837:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  2837 |     VkPrivateDataSlotEXT*                       pPrivateDataSlot);
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:2841:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  2841 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:2848:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  2848 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.h:2855:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  2855 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2013:31: error: 'VkPhysicalDevicePortabilitySubsetFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceVariablePointerFeaturesKHR'?
|  2013 | template <> struct LvlTypeMap<VkPhysicalDevicePortabilitySubsetFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceVariablePointerFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2013:75: error: template argument 1 is invalid
|  2013 | template <> struct LvlTypeMap<VkPhysicalDevicePortabilitySubsetFeaturesKHR> {
|       |                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2017:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR'?
|  2017 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2017:97: error: template argument 1 is invalid
|  2017 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR> {
|       |                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2024:31: error: 'VkPhysicalDevicePortabilitySubsetPropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance3PropertiesKHR'?
|  2024 | template <> struct LvlTypeMap<VkPhysicalDevicePortabilitySubsetPropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMaintenance3PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2024:77: error: template argument 1 is invalid
|  2024 | template <> struct LvlTypeMap<VkPhysicalDevicePortabilitySubsetPropertiesKHR> {
|       |                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2028:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR'?
|  2028 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2028:99: error: template argument 1 is invalid
|  2028 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR> {
|       |                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2128:31: error: 'VkBufferCopy2KHR' was not declared in this scope; did you mean 'VkBufferCopy'?
|  2128 | template <> struct LvlTypeMap<VkBufferCopy2KHR> {
|       |                               ^~~~~~~~~~~~~~~~
|       |                               VkBufferCopy
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2128:47: error: template argument 1 is invalid
|  2128 | template <> struct LvlTypeMap<VkBufferCopy2KHR> {
|       |                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2132:32: error: 'VK_STRUCTURE_TYPE_BUFFER_COPY_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO'?
|  2132 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BUFFER_COPY_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2132:67: error: template argument 1 is invalid
|  2132 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BUFFER_COPY_2_KHR> {
|       |                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2137:31: error: 'VkCopyBufferInfo2KHR' was not declared in this scope
|  2137 | template <> struct LvlTypeMap<VkCopyBufferInfo2KHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2137:51: error: template argument 1 is invalid
|  2137 | template <> struct LvlTypeMap<VkCopyBufferInfo2KHR> {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2141:32: error: 'VK_STRUCTURE_TYPE_COPY_BUFFER_INFO_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR'?
|  2141 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_BUFFER_INFO_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2141:72: error: template argument 1 is invalid
|  2141 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_BUFFER_INFO_2_KHR> {
|       |                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2146:31: error: 'VkImageCopy2KHR' was not declared in this scope; did you mean 'VkImageCopy'?
|  2146 | template <> struct LvlTypeMap<VkImageCopy2KHR> {
|       |                               ^~~~~~~~~~~~~~~
|       |                               VkImageCopy
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2146:46: error: template argument 1 is invalid
|  2146 | template <> struct LvlTypeMap<VkImageCopy2KHR> {
|       |                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2150:32: error: 'VK_STRUCTURE_TYPE_IMAGE_COPY_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO'?
|  2150 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_COPY_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2150:66: error: template argument 1 is invalid
|  2150 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_COPY_2_KHR> {
|       |                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2155:31: error: 'VkCopyImageInfo2KHR' was not declared in this scope
|  2155 | template <> struct LvlTypeMap<VkCopyImageInfo2KHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2155:50: error: template argument 1 is invalid
|  2155 | template <> struct LvlTypeMap<VkCopyImageInfo2KHR> {
|       |                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2159:32: error: 'VK_STRUCTURE_TYPE_COPY_IMAGE_INFO_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR'?
|  2159 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_IMAGE_INFO_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2159:71: error: template argument 1 is invalid
|  2159 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_IMAGE_INFO_2_KHR> {
|       |                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2164:31: error: 'VkBufferImageCopy2KHR' was not declared in this scope; did you mean 'VkBufferImageCopy'?
|  2164 | template <> struct LvlTypeMap<VkBufferImageCopy2KHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~
|       |                               VkBufferImageCopy
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2164:52: error: template argument 1 is invalid
|  2164 | template <> struct LvlTypeMap<VkBufferImageCopy2KHR> {
|       |                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2168:32: error: 'VK_STRUCTURE_TYPE_BUFFER_IMAGE_COPY_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER'?
|  2168 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BUFFER_IMAGE_COPY_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2168:73: error: template argument 1 is invalid
|  2168 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BUFFER_IMAGE_COPY_2_KHR> {
|       |                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2173:31: error: 'VkCopyBufferToImageInfo2KHR' was not declared in this scope
|  2173 | template <> struct LvlTypeMap<VkCopyBufferToImageInfo2KHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2173:58: error: template argument 1 is invalid
|  2173 | template <> struct LvlTypeMap<VkCopyBufferToImageInfo2KHR> {
|       |                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2177:32: error: 'VK_STRUCTURE_TYPE_COPY_BUFFER_TO_IMAGE_INFO_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_INFO_KHR'?
|  2177 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_BUFFER_TO_IMAGE_INFO_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2177:81: error: template argument 1 is invalid
|  2177 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_BUFFER_TO_IMAGE_INFO_2_KHR> {
|       |                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2182:31: error: 'VkCopyImageToBufferInfo2KHR' was not declared in this scope
|  2182 | template <> struct LvlTypeMap<VkCopyImageToBufferInfo2KHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2182:58: error: template argument 1 is invalid
|  2182 | template <> struct LvlTypeMap<VkCopyImageToBufferInfo2KHR> {
|       |                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2186:32: error: 'VK_STRUCTURE_TYPE_COPY_IMAGE_TO_BUFFER_INFO_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_INFO_KHR'?
|  2186 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_IMAGE_TO_BUFFER_INFO_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2186:81: error: template argument 1 is invalid
|  2186 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_IMAGE_TO_BUFFER_INFO_2_KHR> {
|       |                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2191:31: error: 'VkImageBlit2KHR' was not declared in this scope; did you mean 'VkImageBlit'?
|  2191 | template <> struct LvlTypeMap<VkImageBlit2KHR> {
|       |                               ^~~~~~~~~~~~~~~
|       |                               VkImageBlit
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2191:46: error: template argument 1 is invalid
|  2191 | template <> struct LvlTypeMap<VkImageBlit2KHR> {
|       |                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2195:32: error: 'VK_STRUCTURE_TYPE_IMAGE_BLIT_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SURFACE_FORMAT_2_KHR'?
|  2195 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_BLIT_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SURFACE_FORMAT_2_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2195:66: error: template argument 1 is invalid
|  2195 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_BLIT_2_KHR> {
|       |                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2200:31: error: 'VkBlitImageInfo2KHR' was not declared in this scope
|  2200 | template <> struct LvlTypeMap<VkBlitImageInfo2KHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2200:50: error: template argument 1 is invalid
|  2200 | template <> struct LvlTypeMap<VkBlitImageInfo2KHR> {
|       |                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2204:32: error: 'VK_STRUCTURE_TYPE_BLIT_IMAGE_INFO_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR'?
|  2204 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BLIT_IMAGE_INFO_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2204:71: error: template argument 1 is invalid
|  2204 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BLIT_IMAGE_INFO_2_KHR> {
|       |                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2209:31: error: 'VkImageResolve2KHR' was not declared in this scope; did you mean 'VkImageResolve'?
|  2209 | template <> struct LvlTypeMap<VkImageResolve2KHR> {
|       |                               ^~~~~~~~~~~~~~~~~~
|       |                               VkImageResolve
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2209:49: error: template argument 1 is invalid
|  2209 | template <> struct LvlTypeMap<VkImageResolve2KHR> {
|       |                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2213:32: error: 'VK_STRUCTURE_TYPE_IMAGE_RESOLVE_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO'?
|  2213 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_RESOLVE_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2213:69: error: template argument 1 is invalid
|  2213 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_RESOLVE_2_KHR> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2218:31: error: 'VkResolveImageInfo2KHR' was not declared in this scope
|  2218 | template <> struct LvlTypeMap<VkResolveImageInfo2KHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2218:53: error: template argument 1 is invalid
|  2218 | template <> struct LvlTypeMap<VkResolveImageInfo2KHR> {
|       |                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2222:32: error: 'VK_STRUCTURE_TYPE_RESOLVE_IMAGE_INFO_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR'?
|  2222 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RESOLVE_IMAGE_INFO_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2222:74: error: template argument 1 is invalid
|  2222 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RESOLVE_IMAGE_INFO_2_KHR> {
|       |                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2335:31: error: 'VkImageViewAddressPropertiesNVX' was not declared in this scope
|  2335 | template <> struct LvlTypeMap<VkImageViewAddressPropertiesNVX> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2335:62: error: template argument 1 is invalid
|  2335 | template <> struct LvlTypeMap<VkImageViewAddressPropertiesNVX> {
|       |                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2339:32: error: 'VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2'?
|  2339 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:2339:83: error: template argument 1 is invalid
|  2339 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3372:43: error: 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR'?
|  3372 |     static const VkStructureType kSType = VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL;
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3375:32: error: 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR'?
|  3375 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3375:96: error: template argument 1 is invalid
|  3375 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL> {
|       |                                                                                                ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3750:31: error: 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderAtomicInt64FeaturesKHR'?
|  3750 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderAtomicFloatFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderAtomicInt64FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3750:75: error: template argument 1 is invalid
|  3750 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderAtomicFloatFeaturesEXT> {
|       |                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3754:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  3754 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3754:98: error: template argument 1 is invalid
|  3754 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT> {
|       |                                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3768:31: error: 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceIndexTypeUint8FeaturesEXT'?
|  3768 | template <> struct LvlTypeMap<VkPhysicalDeviceExtendedDynamicStateFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceIndexTypeUint8FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3768:78: error: template argument 1 is invalid
|  3768 | template <> struct LvlTypeMap<VkPhysicalDeviceExtendedDynamicStateFeaturesEXT> {
|       |                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3772:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT'?
|  3772 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3772:101: error: template argument 1 is invalid
|  3772 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT> {
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3894:31: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceHostQueryResetFeaturesEXT'?
|  3894 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2FeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceHostQueryResetFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3894:69: error: template argument 1 is invalid
|  3894 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2FeaturesEXT> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3898:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  3898 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3898:91: error: template argument 1 is invalid
|  3898 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT> {
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3903:31: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDevicePCIBusInfoPropertiesEXT'?
|  3903 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2PropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDevicePCIBusInfoPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3903:71: error: template argument 1 is invalid
|  3903 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2PropertiesEXT> {
|       |                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3907:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  3907 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3907:93: error: template argument 1 is invalid
|  3907 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT> {
|       |                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3912:31: error: 'VkSamplerCustomBorderColorCreateInfoEXT' was not declared in this scope
|  3912 | template <> struct LvlTypeMap<VkSamplerCustomBorderColorCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3912:70: error: template argument 1 is invalid
|  3912 | template <> struct LvlTypeMap<VkSamplerCustomBorderColorCreateInfoEXT> {
|       |                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3916:32: error: 'VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO_EXT'?
|  3916 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3916:93: error: template argument 1 is invalid
|  3916 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT> {
|       |                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3921:31: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceToolPropertiesEXT'?
|  3921 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorPropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceToolPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3921:77: error: template argument 1 is invalid
|  3921 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorPropertiesEXT> {
|       |                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3925:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  3925 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3925:100: error: template argument 1 is invalid
|  3925 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT> {
|       |                                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3930:31: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMemoryPriorityFeaturesEXT'?
|  3930 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMemoryPriorityFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3930:75: error: template argument 1 is invalid
|  3930 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorFeaturesEXT> {
|       |                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3934:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  3934 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3934:98: error: template argument 1 is invalid
|  3934 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT> {
|       |                                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3939:31: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceASTCDecodeFeaturesEXT'?
|  3939 | template <> struct LvlTypeMap<VkPhysicalDevicePrivateDataFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceASTCDecodeFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3939:69: error: template argument 1 is invalid
|  3939 | template <> struct LvlTypeMap<VkPhysicalDevicePrivateDataFeaturesEXT> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3943:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  3943 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3943:91: error: template argument 1 is invalid
|  3943 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT> {
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3948:31: error: 'VkDevicePrivateDataCreateInfoEXT' was not declared in this scope
|  3948 | template <> struct LvlTypeMap<VkDevicePrivateDataCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3948:63: error: template argument 1 is invalid
|  3948 | template <> struct LvlTypeMap<VkDevicePrivateDataCreateInfoEXT> {
|       |                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3952:32: error: 'VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT'?
|  3952 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3952:85: error: template argument 1 is invalid
|  3952 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT> {
|       |                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3957:31: error: 'VkPrivateDataSlotCreateInfoEXT' was not declared in this scope
|  3957 | template <> struct LvlTypeMap<VkPrivateDataSlotCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3957:61: error: template argument 1 is invalid
|  3957 | template <> struct LvlTypeMap<VkPrivateDataSlotCreateInfoEXT> {
|       |                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3961:32: error: 'VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT'?
|  3961 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3961:83: error: template argument 1 is invalid
|  3961 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3993:31: error: 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapFeaturesEXT'?
|  3993 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMap2FeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceFragmentDensityMapFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3993:77: error: template argument 1 is invalid
|  3993 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMap2FeaturesEXT> {
|       |                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3997:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT'?
|  3997 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:3997:101: error: template argument 1 is invalid
|  3997 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT> {
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4002:31: error: 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapPropertiesEXT'?
|  4002 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMap2PropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceFragmentDensityMapPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4002:79: error: template argument 1 is invalid
|  4002 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMap2PropertiesEXT> {
|       |                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4006:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
|  4006 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4006:103: error: template argument 1 is invalid
|  4006 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT> {
|       |                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4011:31: error: 'VkPhysicalDeviceImageRobustnessFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceBufferAddressFeaturesEXT'?
|  4011 | template <> struct LvlTypeMap<VkPhysicalDeviceImageRobustnessFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceBufferAddressFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4011:73: error: template argument 1 is invalid
|  4011 | template <> struct LvlTypeMap<VkPhysicalDeviceImageRobustnessFeaturesEXT> {
|       |                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4015:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT'?
|  4015 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4015:95: error: template argument 1 is invalid
|  4015 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT> {
|       |                                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4020:31: error: 'VkPhysicalDevice4444FormatsFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceASTCDecodeFeaturesEXT'?
|  4020 | template <> struct LvlTypeMap<VkPhysicalDevice4444FormatsFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceASTCDecodeFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4020:69: error: template argument 1 is invalid
|  4020 | template <> struct LvlTypeMap<VkPhysicalDevice4444FormatsFeaturesEXT> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4024:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  4024 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/vk_typemap_helper.h:4024:91: error: template argument 1 is invalid
|  4024 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT> {
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:3257:11: error: 'VkCopyBufferInfo2KHR' does not name a type; did you mean 'CmdCopyBuffer2KHR'?
|  3257 |     const VkCopyBufferInfo2KHR*                 pCopyBufferInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~
|       |           CmdCopyBuffer2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:3264:11: error: 'VkCopyImageInfo2KHR' does not name a type; did you mean 'CmdCopyImage2KHR'?
|  3264 |     const VkCopyImageInfo2KHR*                  pCopyImageInfo)
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           CmdCopyImage2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:3271:11: error: 'VkCopyBufferToImageInfo2KHR' does not name a type; did you mean 'CmdCopyBufferToImage2KHR'?
|  3271 |     const VkCopyBufferToImageInfo2KHR*          pCopyBufferToImageInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           CmdCopyBufferToImage2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:3278:11: error: 'VkCopyImageToBufferInfo2KHR' does not name a type; did you mean 'CmdCopyImageToBuffer2KHR'?
|  3278 |     const VkCopyImageToBufferInfo2KHR*          pCopyImageToBufferInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           CmdCopyImageToBuffer2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:3285:11: error: 'VkBlitImageInfo2KHR' does not name a type; did you mean 'CmdBlitImage2KHR'?
|  3285 |     const VkBlitImageInfo2KHR*                  pBlitImageInfo)
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           CmdBlitImage2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:3292:11: error: 'VkResolveImageInfo2KHR' does not name a type; did you mean 'CmdResolveImage2KHR'?
|  3292 |     const VkResolveImageInfo2KHR*               pResolveImageInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~
|       |           CmdResolveImage2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:3450:5: error: 'VkImageViewAddressPropertiesNVX' has not been declared
|  3450 |     VkImageViewAddressPropertiesNVX*            pProperties)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:4649:11: error: 'VkPrivateDataSlotCreateInfoEXT' does not name a type
|  4649 |     const VkPrivateDataSlotCreateInfoEXT*       pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:4651:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  4651 |     VkPrivateDataSlotEXT*                       pPrivateDataSlot)
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp: In function 'VkResult vkmock::CreatePrivateDataSlotEXT(VkDevice, const int*, const VkAllocationCallbacks*, int*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:4654:26: error: 'VkPrivateDataSlotEXT' was not declared in this scope; did you mean 'pPrivateDataSlot'?
|  4654 |     *pPrivateDataSlot = (VkPrivateDataSlotEXT)global_unique_handle++;
|       |                          ^~~~~~~~~~~~~~~~~~~~
|       |                          pPrivateDataSlot
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:4660:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  4660 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:4670:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  4670 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/icd/generated/mock_icd.cpp:4681:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  4681 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| [2/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-t
 ools/1.2.154.0-r0=/usr/src/debug/vulkan-tools/1.2.154.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0=/usr/src/debug/vulkan-tools/1.2.154.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -
 Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp
| FAILED: vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1
 .2.154.0-r0=/usr/src/debug/vulkan-tools/1.2.154.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0=/usr/src/debug/vulkan-tools/1.2.154.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimpli
 cit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'const char* VkDriverIdString(VkDriverId)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:94:9: warning: case value '13' not in enumerated type 'VkDriverId' [-Wswitch]
|    94 |         case (13): return "DRIVER_ID_MESA_LLVMPIPE";
|       |         ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:95:9: warning: case value '14' not in enumerated type 'VkDriverId' [-Wswitch]
|    95 |         case (14): return "DRIVER_ID_MOLTENVK";
|       |         ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'const char* VkFormatString(VkFormat)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:349:9: warning: case value '1000340000' not in enumerated type 'VkFormat' [-Wswitch]
|   349 |         case (1000340000): return "FORMAT_A4R4G4B4_UNORM_PACK16_EXT";
|       |         ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:350:9: warning: case value '1000340001' not in enumerated type 'VkFormat' [-Wswitch]
|   350 |         case (1000340001): return "FORMAT_A4B4G4R4_UNORM_PACK16_EXT";
|       |         ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:965:79: error: 'VkPhysicalDevice4444FormatsFeaturesEXT' has not been declared
|   965 | void DumpVkPhysicalDevice4444FormatsFeaturesEXT(Printer &p, std::string name, VkPhysicalDevice4444FormatsFeaturesEXT &obj) {
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevice4444FormatsFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:967:60: error: request for member 'formatA4R4G4B4' in 'obj', which is of non-class type 'int'
|   967 |     p.PrintKeyBool("formatA4R4G4B4", static_cast<bool>(obj.formatA4R4G4B4), 14);
|       |                                                            ^~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:968:60: error: request for member 'formatA4B4G4R4' in 'obj', which is of non-class type 'int'
|   968 |     p.PrintKeyBool("formatA4B4G4R4", static_cast<bool>(obj.formatA4B4G4R4), 14);
|       |                                                            ^~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1022:85: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' has not been declared
|  1022 | void DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceCustomBorderColorFeaturesEXT &obj) {
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1024:64: error: request for member 'customBorderColors' in 'obj', which is of non-class type 'int'
|  1024 |     p.PrintKeyBool("customBorderColors", static_cast<bool>(obj.customBorderColors), 30);
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1025:76: error: request for member 'customBorderColorWithoutFormat' in 'obj', which is of non-class type 'int'
|  1025 |     p.PrintKeyBool("customBorderColorWithoutFormat", static_cast<bool>(obj.customBorderColorWithoutFormat), 30);
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1027:87: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' has not been declared
|  1027 | void DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT(Printer &p, std::string name, VkPhysicalDeviceCustomBorderColorPropertiesEXT &obj) {
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1029:57: error: request for member 'maxCustomBorderColorSamplers' in 'obj', which is of non-class type 'int'
|  1029 |     p.PrintKeyValue("maxCustomBorderColorSamplers", obj.maxCustomBorderColorSamplers, 28);
|       |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1102:88: error: 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT' has not been declared
|  1102 | void DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceExtendedDynamicStateFeaturesEXT &obj) {
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1104:66: error: request for member 'extendedDynamicState' in 'obj', which is of non-class type 'int'
|  1104 |     p.PrintKeyBool("extendedDynamicState", static_cast<bool>(obj.extendedDynamicState), 20);
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1188:87: error: 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT' has not been declared
|  1188 | void DumpVkPhysicalDeviceFragmentDensityMap2FeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceFragmentDensityMap2FeaturesEXT &obj) {
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceFragmentDensityMap2FeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1190:72: error: request for member 'fragmentDensityMapDeferred' in 'obj', which is of non-class type 'int'
|  1190 |     p.PrintKeyBool("fragmentDensityMapDeferred", static_cast<bool>(obj.fragmentDensityMapDeferred), 26);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1192:89: error: 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT' has not been declared
|  1192 | void DumpVkPhysicalDeviceFragmentDensityMap2PropertiesEXT(Printer &p, std::string name, VkPhysicalDeviceFragmentDensityMap2PropertiesEXT &obj) {
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceFragmentDensityMap2PropertiesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1194:61: error: request for member 'subsampledLoads' in 'obj', which is of non-class type 'int'
|  1194 |     p.PrintKeyBool("subsampledLoads", static_cast<bool>(obj.subsampledLoads), 41);
|       |                                                             ^~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1195:87: error: request for member 'subsampledCoarseReconstructionEarlyAccess' in 'obj', which is of non-class type 'int'
|  1195 |     p.PrintKeyBool("subsampledCoarseReconstructionEarlyAccess", static_cast<bool>(obj.subsampledCoarseReconstructionEarlyAccess), 41);
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1196:53: error: request for member 'maxSubsampledArrayLayers' in 'obj', which is of non-class type 'int'
|  1196 |     p.PrintKeyValue("maxSubsampledArrayLayers", obj.maxSubsampledArrayLayers, 41);
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1197:63: error: request for member 'maxDescriptorSetSubsampledSamplers' in 'obj', which is of non-class type 'int'
|  1197 |     p.PrintKeyValue("maxDescriptorSetSubsampledSamplers", obj.maxDescriptorSetSubsampledSamplers, 41);
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1229:83: error: 'VkPhysicalDeviceImageRobustnessFeaturesEXT' has not been declared
|  1229 | void DumpVkPhysicalDeviceImageRobustnessFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceImageRobustnessFeaturesEXT &obj) {
|       |                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceImageRobustnessFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1231:63: error: request for member 'robustImageAccess' in 'obj', which is of non-class type 'int'
|  1231 |     p.PrintKeyBool("robustImageAccess", static_cast<bool>(obj.robustImageAccess), 17);
|       |                                                               ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1488:85: error: 'VkPhysicalDevicePortabilitySubsetFeaturesKHR' has not been declared
|  1488 | void DumpVkPhysicalDevicePortabilitySubsetFeaturesKHR(Printer &p, std::string name, VkPhysicalDevicePortabilitySubsetFeaturesKHR &obj) {
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePortabilitySubsetFeaturesKHR(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1490:76: error: request for member 'constantAlphaColorBlendFactors' in 'obj', which is of non-class type 'int'
|  1490 |     p.PrintKeyBool("constantAlphaColorBlendFactors", static_cast<bool>(obj.constantAlphaColorBlendFactors), 38);
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1491:52: error: request for member 'events' in 'obj', which is of non-class type 'int'
|  1491 |     p.PrintKeyBool("events", static_cast<bool>(obj.events), 38);
|       |                                                    ^~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1492:77: error: request for member 'imageViewFormatReinterpretation' in 'obj', which is of non-class type 'int'
|  1492 |     p.PrintKeyBool("imageViewFormatReinterpretation", static_cast<bool>(obj.imageViewFormatReinterpretation), 38);
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1493:68: error: request for member 'imageViewFormatSwizzle' in 'obj', which is of non-class type 'int'
|  1493 |     p.PrintKeyBool("imageViewFormatSwizzle", static_cast<bool>(obj.imageViewFormatSwizzle), 38);
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1494:66: error: request for member 'imageView2DOn3DImage' in 'obj', which is of non-class type 'int'
|  1494 |     p.PrintKeyBool("imageView2DOn3DImage", static_cast<bool>(obj.imageView2DOn3DImage), 38);
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1495:67: error: request for member 'multisampleArrayImage' in 'obj', which is of non-class type 'int'
|  1495 |     p.PrintKeyBool("multisampleArrayImage", static_cast<bool>(obj.multisampleArrayImage), 38);
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1496:71: error: request for member 'mutableComparisonSamplers' in 'obj', which is of non-class type 'int'
|  1496 |     p.PrintKeyBool("mutableComparisonSamplers", static_cast<bool>(obj.mutableComparisonSamplers), 38);
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1497:59: error: request for member 'pointPolygons' in 'obj', which is of non-class type 'int'
|  1497 |     p.PrintKeyBool("pointPolygons", static_cast<bool>(obj.pointPolygons), 38);
|       |                                                           ^~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1498:63: error: request for member 'samplerMipLodBias' in 'obj', which is of non-class type 'int'
|  1498 |     p.PrintKeyBool("samplerMipLodBias", static_cast<bool>(obj.samplerMipLodBias), 38);
|       |                                                               ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1499:68: error: request for member 'separateStencilMaskRef' in 'obj', which is of non-class type 'int'
|  1499 |     p.PrintKeyBool("separateStencilMaskRef", static_cast<bool>(obj.separateStencilMaskRef), 38);
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1500:84: error: request for member 'shaderSampleRateInterpolationFunctions' in 'obj', which is of non-class type 'int'
|  1500 |     p.PrintKeyBool("shaderSampleRateInterpolationFunctions", static_cast<bool>(obj.shaderSampleRateInterpolationFunctions), 38);
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1501:66: error: request for member 'tessellationIsolines' in 'obj', which is of non-class type 'int'
|  1501 |     p.PrintKeyBool("tessellationIsolines", static_cast<bool>(obj.tessellationIsolines), 38);
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1502:67: error: request for member 'tessellationPointMode' in 'obj', which is of non-class type 'int'
|  1502 |     p.PrintKeyBool("tessellationPointMode", static_cast<bool>(obj.tessellationPointMode), 38);
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1503:58: error: request for member 'triangleFans' in 'obj', which is of non-class type 'int'
|  1503 |     p.PrintKeyBool("triangleFans", static_cast<bool>(obj.triangleFans), 38);
|       |                                                          ^~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1504:79: error: request for member 'vertexAttributeAccessBeyondStride' in 'obj', which is of non-class type 'int'
|  1504 |     p.PrintKeyBool("vertexAttributeAccessBeyondStride", static_cast<bool>(obj.vertexAttributeAccessBeyondStride), 38);
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1508:87: error: 'VkPhysicalDevicePortabilitySubsetPropertiesKHR' has not been declared
|  1508 | void DumpVkPhysicalDevicePortabilitySubsetPropertiesKHR(Printer &p, std::string name, VkPhysicalDevicePortabilitySubsetPropertiesKHR &obj) {
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePortabilitySubsetPropertiesKHR(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1510:65: error: request for member 'minVertexInputBindingStrideAlignment' in 'obj', which is of non-class type 'int'
|  1510 |     p.PrintKeyValue("minVertexInputBindingStrideAlignment", obj.minVertexInputBindingStrideAlignment, 36);
|       |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1513:79: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' has not been declared
|  1513 | void DumpVkPhysicalDevicePrivateDataFeaturesEXT(Printer &p, std::string name, VkPhysicalDevicePrivateDataFeaturesEXT &obj) {
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePrivateDataFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1515:57: error: request for member 'privateData' in 'obj', which is of non-class type 'int'
|  1515 |     p.PrintKeyBool("privateData", static_cast<bool>(obj.privateData), 11);
|       |                                                         ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1557:79: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' has not been declared
|  1557 | void DumpVkPhysicalDeviceRobustness2FeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceRobustness2FeaturesEXT &obj) {
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRobustness2FeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1559:65: error: request for member 'robustBufferAccess2' in 'obj', which is of non-class type 'int'
|  1559 |     p.PrintKeyBool("robustBufferAccess2", static_cast<bool>(obj.robustBufferAccess2), 19);
|       |                                                                 ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1560:64: error: request for member 'robustImageAccess2' in 'obj', which is of non-class type 'int'
|  1560 |     p.PrintKeyBool("robustImageAccess2", static_cast<bool>(obj.robustImageAccess2), 19);
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1561:60: error: request for member 'nullDescriptor' in 'obj', which is of non-class type 'int'
|  1561 |     p.PrintKeyBool("nullDescriptor", static_cast<bool>(obj.nullDescriptor), 19);
|       |                                                            ^~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1563:81: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' has not been declared
|  1563 | void DumpVkPhysicalDeviceRobustness2PropertiesEXT(Printer &p, std::string name, VkPhysicalDeviceRobustness2PropertiesEXT &obj) {
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRobustness2PropertiesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1565:81: error: request for member 'robustStorageBufferAccessSizeAlignment' in 'obj', which is of non-class type 'int'
|  1565 |     p.PrintKeyValue("robustStorageBufferAccessSizeAlignment", to_hex_str(p, obj.robustStorageBufferAccessSizeAlignment), 38);
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1566:81: error: request for member 'robustUniformBufferAccessSizeAlignment' in 'obj', which is of non-class type 'int'
|  1566 |     p.PrintKeyValue("robustUniformBufferAccessSizeAlignment", to_hex_str(p, obj.robustUniformBufferAccessSizeAlignment), 38);
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1596:85: error: 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT' has not been declared
|  1596 | void DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceShaderAtomicFloatFeaturesEXT &obj) {
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1598:72: error: request for member 'shaderBufferFloat32Atomics' in 'obj', which is of non-class type 'int'
|  1598 |     p.PrintKeyBool("shaderBufferFloat32Atomics", static_cast<bool>(obj.shaderBufferFloat32Atomics), 28);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1599:74: error: request for member 'shaderBufferFloat32AtomicAdd' in 'obj', which is of non-class type 'int'
|  1599 |     p.PrintKeyBool("shaderBufferFloat32AtomicAdd", static_cast<bool>(obj.shaderBufferFloat32AtomicAdd), 28);
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1600:72: error: request for member 'shaderBufferFloat64Atomics' in 'obj', which is of non-class type 'int'
|  1600 |     p.PrintKeyBool("shaderBufferFloat64Atomics", static_cast<bool>(obj.shaderBufferFloat64Atomics), 28);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1601:74: error: request for member 'shaderBufferFloat64AtomicAdd' in 'obj', which is of non-class type 'int'
|  1601 |     p.PrintKeyBool("shaderBufferFloat64AtomicAdd", static_cast<bool>(obj.shaderBufferFloat64AtomicAdd), 28);
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1602:72: error: request for member 'shaderSharedFloat32Atomics' in 'obj', which is of non-class type 'int'
|  1602 |     p.PrintKeyBool("shaderSharedFloat32Atomics", static_cast<bool>(obj.shaderSharedFloat32Atomics), 28);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1603:74: error: request for member 'shaderSharedFloat32AtomicAdd' in 'obj', which is of non-class type 'int'
|  1603 |     p.PrintKeyBool("shaderSharedFloat32AtomicAdd", static_cast<bool>(obj.shaderSharedFloat32AtomicAdd), 28);
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1604:72: error: request for member 'shaderSharedFloat64Atomics' in 'obj', which is of non-class type 'int'
|  1604 |     p.PrintKeyBool("shaderSharedFloat64Atomics", static_cast<bool>(obj.shaderSharedFloat64Atomics), 28);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1605:74: error: request for member 'shaderSharedFloat64AtomicAdd' in 'obj', which is of non-class type 'int'
|  1605 |     p.PrintKeyBool("shaderSharedFloat64AtomicAdd", static_cast<bool>(obj.shaderSharedFloat64AtomicAdd), 28);
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1606:71: error: request for member 'shaderImageFloat32Atomics' in 'obj', which is of non-class type 'int'
|  1606 |     p.PrintKeyBool("shaderImageFloat32Atomics", static_cast<bool>(obj.shaderImageFloat32Atomics), 28);
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1607:73: error: request for member 'shaderImageFloat32AtomicAdd' in 'obj', which is of non-class type 'int'
|  1607 |     p.PrintKeyBool("shaderImageFloat32AtomicAdd", static_cast<bool>(obj.shaderImageFloat32AtomicAdd), 28);
|       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1608:71: error: request for member 'sparseImageFloat32Atomics' in 'obj', which is of non-class type 'int'
|  1608 |     p.PrintKeyBool("sparseImageFloat32Atomics", static_cast<bool>(obj.sparseImageFloat32Atomics), 28);
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1609:73: error: request for member 'sparseImageFloat32AtomicAdd' in 'obj', which is of non-class type 'int'
|  1609 |     p.PrintKeyBool("sparseImageFloat32AtomicAdd", static_cast<bool>(obj.sparseImageFloat32AtomicAdd), 28);
|       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'pNextChainInfos get_chain_infos()':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1921:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  1921 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorPropertiesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1921:87: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT'?
|  1921 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorPropertiesEXT)},
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                       DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1928:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
|  1928 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceFragmentDensityMap2PropertiesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1928:90: error: 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapPropertiesEXT'?
|  1928 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceFragmentDensityMap2PropertiesEXT)},
|       |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                          VkPhysicalDeviceFragmentDensityMapPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1939:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR'?
|  1939 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR, sizeof(VkPhysicalDevicePortabilitySubsetPropertiesKHR)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1939:86: error: 'VkPhysicalDevicePortabilitySubsetPropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePortabilitySubsetPropertiesKHR'?
|  1939 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR, sizeof(VkPhysicalDevicePortabilitySubsetPropertiesKHR)},
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                      DumpVkPhysicalDevicePortabilitySubsetPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1946:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  1946 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceRobustness2PropertiesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1946:80: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2PropertiesEXT'?
|  1946 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceRobustness2PropertiesEXT)},
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                DumpVkPhysicalDeviceRobustness2PropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1957:5: error: no match for 'operator=' (operand types are 'std::vector<pNextChainBuildingBlockInfo>' and '<brace-enclosed initializer list>')
|  1957 |     };
|       |     ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/vector:72,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/vector.tcc:198:5: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(const std::vector<_Tp, _Alloc>&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   198 |     vector<_Tp, _Alloc>::
|       |     ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/vector.tcc:199:42: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'const std::vector<pNextChainBuildingBlockInfo>&'
|   199 |     operator=(const vector<_Tp, _Alloc>& __x)
|       |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/vector:67,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:709:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::vector<_Tp, _Alloc>&&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:709:26: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::vector<pNextChainBuildingBlockInfo>&&'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |                 ~~~~~~~~~^~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:730:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::initializer_list<_Tp>) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   730 |       operator=(initializer_list<value_type> __l)
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:730:46: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::initializer_list<pNextChainBuildingBlockInfo>'
|   730 |       operator=(initializer_list<value_type> __l)
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1963:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  1963 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT, sizeof(VkPhysicalDevice4444FormatsFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1963:78: error: 'VkPhysicalDevice4444FormatsFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevice4444FormatsFeaturesEXT'?
|  1963 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT, sizeof(VkPhysicalDevice4444FormatsFeaturesEXT)},
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                              DumpVkPhysicalDevice4444FormatsFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1970:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  1970 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1970:85: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT'?
|  1970 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorFeaturesEXT)},
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                     DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1973:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT'?
|  1973 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT, sizeof(VkPhysicalDeviceExtendedDynamicStateFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1973:88: error: 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT'?
|  1973 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT, sizeof(VkPhysicalDeviceExtendedDynamicStateFeaturesEXT)},
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                        DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1974:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT'?
|  1974 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT, sizeof(VkPhysicalDeviceFragmentDensityMap2FeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1974:88: error: 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapFeaturesEXT'?
|  1974 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT, sizeof(VkPhysicalDeviceFragmentDensityMap2FeaturesEXT)},
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                        VkPhysicalDeviceFragmentDensityMapFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1978:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT'?
|  1978 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT, sizeof(VkPhysicalDeviceImageRobustnessFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1978:82: error: 'VkPhysicalDeviceImageRobustnessFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceImageRobustnessFeaturesEXT'?
|  1978 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT, sizeof(VkPhysicalDeviceImageRobustnessFeaturesEXT)},
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                  DumpVkPhysicalDeviceImageRobustnessFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1989:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR'?
|  1989 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR, sizeof(VkPhysicalDevicePortabilitySubsetFeaturesKHR)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1989:84: error: 'VkPhysicalDevicePortabilitySubsetFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePortabilitySubsetFeaturesKHR'?
|  1989 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR, sizeof(VkPhysicalDevicePortabilitySubsetFeaturesKHR)},
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                    DumpVkPhysicalDevicePortabilitySubsetFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1991:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  1991 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT, sizeof(VkPhysicalDevicePrivateDataFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1991:78: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePrivateDataFeaturesEXT'?
|  1991 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT, sizeof(VkPhysicalDevicePrivateDataFeaturesEXT)},
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                              DumpVkPhysicalDevicePrivateDataFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1996:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  1996 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT, sizeof(VkPhysicalDeviceRobustness2FeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1996:78: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2FeaturesEXT'?
|  1996 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT, sizeof(VkPhysicalDeviceRobustness2FeaturesEXT)},
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                              DumpVkPhysicalDeviceRobustness2FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2000:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  2000 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT, sizeof(VkPhysicalDeviceShaderAtomicFloatFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2000:85: error: 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT'?
|  2000 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT, sizeof(VkPhysicalDeviceShaderAtomicFloatFeaturesEXT)},
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                     DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2019:5: error: no match for 'operator=' (operand types are 'std::vector<pNextChainBuildingBlockInfo>' and '<brace-enclosed initializer list>')
|  2019 |     };
|       |     ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/vector:72,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/vector.tcc:198:5: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(const std::vector<_Tp, _Alloc>&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   198 |     vector<_Tp, _Alloc>::
|       |     ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/vector.tcc:199:42: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'const std::vector<pNextChainBuildingBlockInfo>&'
|   199 |     operator=(const vector<_Tp, _Alloc>& __x)
|       |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/vector:67,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:709:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::vector<_Tp, _Alloc>&&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:709:26: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::vector<pNextChainBuildingBlockInfo>&&'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |                 ~~~~~~~~~^~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:730:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::initializer_list<_Tp>) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   730 |       operator=(initializer_list<value_type> __l)
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/stl_vector.h:730:46: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::initializer_list<pNextChainBuildingBlockInfo>'
|   730 |       operator=(initializer_list<value_type> __l)
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_props2(Printer&, AppInstance&, AppGpu&, void*, VulkanVersion)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2048:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  2048 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2049:54: error: 'VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME'?
|  2049 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2050:13: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT'?
|  2050 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2050:61: error: 'props' was not declared in this scope
|  2050 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
|       |                                                             ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2050:117: error: expected primary-expression before ')' token
|  2050 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
|       |                                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2094:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
|  2094 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2095:54: error: 'VK_EXT_FRAGMENT_DENSITY_MAP_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME'?
|  2095 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_FRAGMENT_DENSITY_MAP_2_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2096:13: error: 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapPropertiesEXT'?
|  2096 |             VkPhysicalDeviceFragmentDensityMap2PropertiesEXT* props = (VkPhysicalDeviceFragmentDensityMap2PropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceFragmentDensityMapPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2096:63: error: 'props' was not declared in this scope
|  2096 |             VkPhysicalDeviceFragmentDensityMap2PropertiesEXT* props = (VkPhysicalDeviceFragmentDensityMap2PropertiesEXT*)structure;
|       |                                                               ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2096:121: error: expected primary-expression before ')' token
|  2096 |             VkPhysicalDeviceFragmentDensityMap2PropertiesEXT* props = (VkPhysicalDeviceFragmentDensityMap2PropertiesEXT*)structure;
|       |                                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2159:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR'?
|  2159 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2160:54: error: 'VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME'?
|  2160 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2161:13: error: 'VkPhysicalDevicePortabilitySubsetPropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePortabilitySubsetPropertiesKHR'?
|  2161 |             VkPhysicalDevicePortabilitySubsetPropertiesKHR* props = (VkPhysicalDevicePortabilitySubsetPropertiesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDevicePortabilitySubsetPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2161:61: error: 'props' was not declared in this scope
|  2161 |             VkPhysicalDevicePortabilitySubsetPropertiesKHR* props = (VkPhysicalDevicePortabilitySubsetPropertiesKHR*)structure;
|       |                                                             ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2161:117: error: expected primary-expression before ')' token
|  2161 |             VkPhysicalDevicePortabilitySubsetPropertiesKHR* props = (VkPhysicalDevicePortabilitySubsetPropertiesKHR*)structure;
|       |                                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2186:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  2186 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2187:54: error: 'VK_EXT_ROBUSTNESS_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEBUG_REPORT_EXTENSION_NAME'?
|  2187 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_ROBUSTNESS_2_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_DEBUG_REPORT_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2188:13: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2PropertiesEXT'?
|  2188 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceRobustness2PropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2188:55: error: 'props' was not declared in this scope
|  2188 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
|       |                                                       ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2188:105: error: expected primary-expression before ')' token
|  2188 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
|       |                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, void*, VulkanVersion)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2281:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  2281 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2282:54: error: 'VK_EXT_4444_FORMATS_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_HDR_METADATA_EXTENSION_NAME'?
|  2282 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_4444_FORMATS_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_HDR_METADATA_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2283:13: error: 'VkPhysicalDevice4444FormatsFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevice4444FormatsFeaturesEXT'?
|  2283 |             VkPhysicalDevice4444FormatsFeaturesEXT* props = (VkPhysicalDevice4444FormatsFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDevice4444FormatsFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2283:53: error: 'props' was not declared in this scope
|  2283 |             VkPhysicalDevice4444FormatsFeaturesEXT* props = (VkPhysicalDevice4444FormatsFeaturesEXT*)structure;
|       |                                                     ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2283:101: error: expected primary-expression before ')' token
|  2283 |             VkPhysicalDevice4444FormatsFeaturesEXT* props = (VkPhysicalDevice4444FormatsFeaturesEXT*)structure;
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2325:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  2325 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2326:54: error: 'VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME'?
|  2326 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2327:13: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT'?
|  2327 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2327:59: error: 'props' was not declared in this scope
|  2327 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
|       |                                                           ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2327:113: error: expected primary-expression before ')' token
|  2327 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
|       |                                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2344:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT'?
|  2344 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2345:54: error: 'VK_EXT_EXTENDED_DYNAMIC_STATE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_INDEX_TYPE_UINT8_EXTENSION_NAME'?
|  2345 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_EXTENDED_DYNAMIC_STATE_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_INDEX_TYPE_UINT8_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2346:13: error: 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT'?
|  2346 |             VkPhysicalDeviceExtendedDynamicStateFeaturesEXT* props = (VkPhysicalDeviceExtendedDynamicStateFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2346:62: error: 'props' was not declared in this scope
|  2346 |             VkPhysicalDeviceExtendedDynamicStateFeaturesEXT* props = (VkPhysicalDeviceExtendedDynamicStateFeaturesEXT*)structure;
|       |                                                              ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2346:119: error: expected primary-expression before ')' token
|  2346 |             VkPhysicalDeviceExtendedDynamicStateFeaturesEXT* props = (VkPhysicalDeviceExtendedDynamicStateFeaturesEXT*)structure;
|       |                                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2350:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT'?
|  2350 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2351:54: error: 'VK_EXT_FRAGMENT_DENSITY_MAP_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME'?
|  2351 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_FRAGMENT_DENSITY_MAP_2_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2352:13: error: 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapFeaturesEXT'?
|  2352 |             VkPhysicalDeviceFragmentDensityMap2FeaturesEXT* props = (VkPhysicalDeviceFragmentDensityMap2FeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceFragmentDensityMapFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2352:61: error: 'props' was not declared in this scope
|  2352 |             VkPhysicalDeviceFragmentDensityMap2FeaturesEXT* props = (VkPhysicalDeviceFragmentDensityMap2FeaturesEXT*)structure;
|       |                                                             ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2352:117: error: expected primary-expression before ')' token
|  2352 |             VkPhysicalDeviceFragmentDensityMap2FeaturesEXT* props = (VkPhysicalDeviceFragmentDensityMap2FeaturesEXT*)structure;
|       |                                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2375:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT'?
|  2375 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2376:54: error: 'VK_EXT_IMAGE_ROBUSTNESS_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_IMAGE_FORMAT_LIST_EXTENSION_NAME'?
|  2376 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_IMAGE_ROBUSTNESS_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_IMAGE_FORMAT_LIST_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2377:13: error: 'VkPhysicalDeviceImageRobustnessFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceImageRobustnessFeaturesEXT'?
|  2377 |             VkPhysicalDeviceImageRobustnessFeaturesEXT* props = (VkPhysicalDeviceImageRobustnessFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceImageRobustnessFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2377:57: error: 'props' was not declared in this scope
|  2377 |             VkPhysicalDeviceImageRobustnessFeaturesEXT* props = (VkPhysicalDeviceImageRobustnessFeaturesEXT*)structure;
|       |                                                         ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2377:109: error: expected primary-expression before ')' token
|  2377 |             VkPhysicalDeviceImageRobustnessFeaturesEXT* props = (VkPhysicalDeviceImageRobustnessFeaturesEXT*)structure;
|       |                                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2438:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR'?
|  2438 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2439:54: error: 'VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME'?
|  2439 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2440:13: error: 'VkPhysicalDevicePortabilitySubsetFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePortabilitySubsetFeaturesKHR'?
|  2440 |             VkPhysicalDevicePortabilitySubsetFeaturesKHR* props = (VkPhysicalDevicePortabilitySubsetFeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDevicePortabilitySubsetFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2440:59: error: 'props' was not declared in this scope
|  2440 |             VkPhysicalDevicePortabilitySubsetFeaturesKHR* props = (VkPhysicalDevicePortabilitySubsetFeaturesKHR*)structure;
|       |                                                           ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2440:113: error: expected primary-expression before ')' token
|  2440 |             VkPhysicalDevicePortabilitySubsetFeaturesKHR* props = (VkPhysicalDevicePortabilitySubsetFeaturesKHR*)structure;
|       |                                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2445:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  2445 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2446:54: error: 'VK_EXT_PRIVATE_DATA_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_HDR_METADATA_EXTENSION_NAME'?
|  2446 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_PRIVATE_DATA_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_HDR_METADATA_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2447:13: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePrivateDataFeaturesEXT'?
|  2447 |             VkPhysicalDevicePrivateDataFeaturesEXT* props = (VkPhysicalDevicePrivateDataFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDevicePrivateDataFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2447:53: error: 'props' was not declared in this scope
|  2447 |             VkPhysicalDevicePrivateDataFeaturesEXT* props = (VkPhysicalDevicePrivateDataFeaturesEXT*)structure;
|       |                                                     ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2447:101: error: expected primary-expression before ')' token
|  2447 |             VkPhysicalDevicePrivateDataFeaturesEXT* props = (VkPhysicalDevicePrivateDataFeaturesEXT*)structure;
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2465:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  2465 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2466:54: error: 'VK_EXT_ROBUSTNESS_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEBUG_REPORT_EXTENSION_NAME'?
|  2466 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_ROBUSTNESS_2_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_DEBUG_REPORT_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2467:13: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2FeaturesEXT'?
|  2467 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceRobustness2FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2467:53: error: 'props' was not declared in this scope
|  2467 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
|       |                                                     ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2467:101: error: expected primary-expression before ')' token
|  2467 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2492:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  2492 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2493:54: error: 'VK_EXT_SHADER_ATOMIC_FLOAT_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME'?
|  2493 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_SHADER_ATOMIC_FLOAT_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2494:13: error: 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT'?
|  2494 |             VkPhysicalDeviceShaderAtomicFloatFeaturesEXT* props = (VkPhysicalDeviceShaderAtomicFloatFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2494:59: error: 'props' was not declared in this scope
|  2494 |             VkPhysicalDeviceShaderAtomicFloatFeaturesEXT* props = (VkPhysicalDeviceShaderAtomicFloatFeaturesEXT*)structure;
|       |                                                           ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2494:113: error: expected primary-expression before ')' token
|  2494 |             VkPhysicalDeviceShaderAtomicFloatFeaturesEXT* props = (VkPhysicalDeviceShaderAtomicFloatFeaturesEXT*)structure;
|       |                                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp: In function 'void DumpPortability(Printer&, AppGpu&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:771:50: error: 'VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME'?
|   771 |     if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME)) {
|       |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                  VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:776:41: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR'?
|   776 |                 if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR) {
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                         VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:777:21: error: 'VkPhysicalDevicePortabilitySubsetPropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePortabilitySubsetPropertiesKHR'?
|   777 |                     VkPhysicalDevicePortabilitySubsetPropertiesKHR *props =
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                     DumpVkPhysicalDevicePortabilitySubsetPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:777:69: error: 'props' was not declared in this scope
|   777 |                     VkPhysicalDevicePortabilitySubsetPropertiesKHR *props =
|       |                                                                     ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:778:74: error: expected primary-expression before ')' token
|   778 |                         (VkPhysicalDevicePortabilitySubsetPropertiesKHR *)structure;
|       |                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:788:41: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR'?
|   788 |                 if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR) {
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                         VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:789:21: error: 'VkPhysicalDevicePortabilitySubsetFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePortabilitySubsetFeaturesKHR'?
|   789 |                     VkPhysicalDevicePortabilitySubsetFeaturesKHR *features =
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                     DumpVkPhysicalDevicePortabilitySubsetFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:789:67: error: 'features' was not declared in this scope
|   789 |                     VkPhysicalDevicePortabilitySubsetFeaturesKHR *features =
|       |                                                                   ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:790:72: error: expected primary-expression before ')' token
|   790 |                         (VkPhysicalDevicePortabilitySubsetFeaturesKHR *)structure;
|       |                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp: In function 'int main(int, char**)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/git/vulkaninfo/vulkaninfo.cpp:972:78: error: 'VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME'?
|   972 |             if (!gpus.at(selected_gpu)->CheckPhysicalDeviceExtensionIncluded(VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME)) {
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                              VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME
| ninja: build stopped: subcommand failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/temp/run.do_compile.3470107:155 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/temp/run.do_compile.3470107, line 155
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/temp/run.do_compile.3470107, line 149
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/temp/run.do_compile.3470107, line 144
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.154.0-r0/temp/run.do_compile.3470107, line 168
| 
| Backtrace (metadata-relative locations):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/cmake.bbclass, line 205
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/cmake.bbclass, line 209
| 	#3: do_compile, autogenerated, line 2
NOTE: recipe vulkan-tools-1.2.154.0-r0: task do_compile: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb:do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2267 tasks of which 2258 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb:do_compile
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============8527777379211087381==--
