Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.19822.1597558930173559319
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0E635E0203A; Sat, 15 Aug 2020 23:22:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB9D1E0206A
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:19:42 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.2.148.0 FAILED
Message-Id: <20200816062210.0E635E0203A@yocto-www.yoctoproject.org>
Date: Sat, 15 Aug 2020 23:22:10 -0700 (PDT)
X-Groupsio-MsgNum: 141512
Content-Type: multipart/mixed; boundary="===============4948552996951478716=="

--===============4948552996951478716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-tools* to *1.2.148.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.2.135.0-1.2.148.0.patch
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

--===============4948552996951478716==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.2.135.0-1.2.148.0.patch"

From ebb63a68fdb3f5fd1158c16b53c97d7acdafa0eb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 16 Aug 2020 01:39:34 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.2.135.0 -> 1.2.148.0

---
 .../{vulkan-tools_1.2.135.0.bb => vulkan-tools_1.2.148.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.2.135.0.bb => vulkan-tools_1.2.148.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.135.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.148.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.2.135.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.2.148.0.bb
index 085c0e27e9..8ff883f7b1 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.135.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.148.0.bb
@@ -5,8 +5,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.135"
-SRCREV = "6d8197fd6c91d352a601587ffdde28f4cd7bc399"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.148"
+SRCREV = "3f7ccf2cce264525d14361ac563e7a6ba9a54f54"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


--===============4948552996951478716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1342 entries from dependency cache.
Parsing recipes...done.
Parsing of 778 .bb files complete (777 cached, 1 parsed). 1342 targets, 33 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.1+snapshot-20200816"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:bb443a8acdb866788f01252ced2884ae2ce6382c"
workspace            = "master:bd1da2aca0bc26720f438a9c1d54f5b04084da4e"

Initialising tasks...done.
Sstate summary: Wanted 258 Found 250 Missed 8 Current 533 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1643 of 2448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.148.0.bb:do_fetch)
NOTE: recipe vulkan-tools-1.2.148.0-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.2.148.0-r0: task do_fetch: Succeeded
NOTE: Running task 2434 of 2448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.148.0.bb:do_unpack)
NOTE: Running task 2435 of 2448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.148.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.2.148.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.2.148.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.2.148.0-r0: task do_unpack: Succeeded
NOTE: Running task 2436 of 2448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.148.0.bb:do_patch)
NOTE: recipe vulkan-tools-1.2.148.0-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.2.148.0-r0: task do_patch: Succeeded
NOTE: Running task 2437 of 2448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.148.0.bb:do_generate_toolchain_file)
NOTE: Running task 2438 of 2448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.148.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2439 of 2448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.148.0.bb:do_populate_lic)
NOTE: recipe vulkan-tools-1.2.148.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.2.148.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.2.148.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.2.148.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-tools-1.2.148.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.2.148.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2440 of 2448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.148.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.2.148.0-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-tools-1.2.148.0-r0: task do_configure: Started
NOTE: recipe vulkan-tools-1.2.148.0-r0: task do_configure: Succeeded
NOTE: Running task 2441 of 2448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.148.0.bb:do_compile)
NOTE: recipe vulkan-tools-1.2.148.0-r0: task do_compile: Started
ERROR: vulkan-tools-1.2.148.0-r0 do_compile: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/temp/run.do_compile.25463' failed with exit code 1:
[1/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++  -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd -Iicd -I. -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-t
 ools/1.2.148.0-r0=/usr/src/debug/vulkan-tools/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0=/usr/src/debug/vulkan-tools/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-
 memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp
FAILED: icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++  -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd -Iicd -I. -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1
 .2.148.0-r0=/usr/src/debug/vulkan-tools/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0=/usr/src/debug/vulkan-tools/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp
  -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:22:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.h:2022:5: error: 'VkImageViewAddressPropertiesNVX' has not been declared
 2022 |     VkImageViewAddressPropertiesNVX*            pProperties);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.h:2804:11: error: 'VkPrivateDataSlotCreateInfoEXT' does not name a type
 2804 |     const VkPrivateDataSlotCreateInfoEXT*       pCreateInfo,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.h:2806:5: error: 'VkPrivateDataSlotEXT' has not been declared
 2806 |     VkPrivateDataSlotEXT*                       pPrivateDataSlot);
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.h:2810:5: error: 'VkPrivateDataSlotEXT' has not been declared
 2810 |     VkPrivateDataSlotEXT                        privateDataSlot,
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.h:2817:5: error: 'VkPrivateDataSlotEXT' has not been declared
 2817 |     VkPrivateDataSlotEXT                        privateDataSlot,
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.h:2824:5: error: 'VkPrivateDataSlotEXT' has not been declared
 2824 |     VkPrivateDataSlotEXT                        privateDataSlot,
      |     ^~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:27:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:2214:31: error: 'VkImageViewAddressPropertiesNVX' was not declared in this scope
 2214 | template <> struct LvlTypeMap<VkImageViewAddressPropertiesNVX> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:2214:62: error: template argument 1 is invalid
 2214 | template <> struct LvlTypeMap<VkImageViewAddressPropertiesNVX> {
      |                                                              ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:2218:32: error: 'VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2'?
 2218 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:2218:83: error: template argument 1 is invalid
 2218 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX> {
      |                                                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3251:43: error: 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR'?
 3251 |     static const VkStructureType kSType = VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL;
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                           VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3254:32: error: 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR'?
 3254 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3254:96: error: template argument 1 is invalid
 3254 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL> {
      |                                                                                                ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3629:31: error: 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderAtomicInt64FeaturesKHR'?
 3629 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderAtomicFloatFeaturesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceShaderAtomicInt64FeaturesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3629:75: error: template argument 1 is invalid
 3629 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderAtomicFloatFeaturesEXT> {
      |                                                                           ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3633:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
 3633 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3633:98: error: template argument 1 is invalid
 3633 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT> {
      |                                                                                                  ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3647:31: error: 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceIndexTypeUint8FeaturesEXT'?
 3647 | template <> struct LvlTypeMap<VkPhysicalDeviceExtendedDynamicStateFeaturesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceIndexTypeUint8FeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3647:78: error: template argument 1 is invalid
 3647 | template <> struct LvlTypeMap<VkPhysicalDeviceExtendedDynamicStateFeaturesEXT> {
      |                                                                              ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3651:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT'?
 3651 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3651:101: error: template argument 1 is invalid
 3651 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT> {
      |                                                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3773:31: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceHostQueryResetFeaturesEXT'?
 3773 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2FeaturesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceHostQueryResetFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3773:69: error: template argument 1 is invalid
 3773 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2FeaturesEXT> {
      |                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3777:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 3777 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3777:91: error: template argument 1 is invalid
 3777 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT> {
      |                                                                                           ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3782:31: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDevicePCIBusInfoPropertiesEXT'?
 3782 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2PropertiesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDevicePCIBusInfoPropertiesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3782:71: error: template argument 1 is invalid
 3782 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2PropertiesEXT> {
      |                                                                       ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3786:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
 3786 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3786:93: error: template argument 1 is invalid
 3786 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT> {
      |                                                                                             ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3791:31: error: 'VkSamplerCustomBorderColorCreateInfoEXT' was not declared in this scope
 3791 | template <> struct LvlTypeMap<VkSamplerCustomBorderColorCreateInfoEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3791:70: error: template argument 1 is invalid
 3791 | template <> struct LvlTypeMap<VkSamplerCustomBorderColorCreateInfoEXT> {
      |                                                                      ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3795:32: error: 'VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO_EXT'?
 3795 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3795:93: error: template argument 1 is invalid
 3795 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT> {
      |                                                                                             ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3800:31: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceToolPropertiesEXT'?
 3800 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorPropertiesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceToolPropertiesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3800:77: error: template argument 1 is invalid
 3800 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorPropertiesEXT> {
      |                                                                             ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3804:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
 3804 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3804:100: error: template argument 1 is invalid
 3804 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT> {
      |                                                                                                    ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3809:31: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMemoryPriorityFeaturesEXT'?
 3809 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorFeaturesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceMemoryPriorityFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3809:75: error: template argument 1 is invalid
 3809 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorFeaturesEXT> {
      |                                                                           ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3813:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 3813 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3813:98: error: template argument 1 is invalid
 3813 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT> {
      |                                                                                                  ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3818:31: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceASTCDecodeFeaturesEXT'?
 3818 | template <> struct LvlTypeMap<VkPhysicalDevicePrivateDataFeaturesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceASTCDecodeFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3818:69: error: template argument 1 is invalid
 3818 | template <> struct LvlTypeMap<VkPhysicalDevicePrivateDataFeaturesEXT> {
      |                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3822:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 3822 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3822:91: error: template argument 1 is invalid
 3822 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT> {
      |                                                                                           ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3827:31: error: 'VkDevicePrivateDataCreateInfoEXT' was not declared in this scope
 3827 | template <> struct LvlTypeMap<VkDevicePrivateDataCreateInfoEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3827:63: error: template argument 1 is invalid
 3827 | template <> struct LvlTypeMap<VkDevicePrivateDataCreateInfoEXT> {
      |                                                               ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3831:32: error: 'VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT'?
 3831 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3831:85: error: template argument 1 is invalid
 3831 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT> {
      |                                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3836:31: error: 'VkPrivateDataSlotCreateInfoEXT' was not declared in this scope
 3836 | template <> struct LvlTypeMap<VkPrivateDataSlotCreateInfoEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3836:61: error: template argument 1 is invalid
 3836 | template <> struct LvlTypeMap<VkPrivateDataSlotCreateInfoEXT> {
      |                                                             ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3840:32: error: 'VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT'?
 3840 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3840:83: error: template argument 1 is invalid
 3840 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT> {
      |                                                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3872:31: error: 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapFeaturesEXT'?
 3872 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMap2FeaturesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceFragmentDensityMapFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3872:77: error: template argument 1 is invalid
 3872 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMap2FeaturesEXT> {
      |                                                                             ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3876:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT'?
 3876 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3876:101: error: template argument 1 is invalid
 3876 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT> {
      |                                                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3881:31: error: 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapPropertiesEXT'?
 3881 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMap2PropertiesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceFragmentDensityMapPropertiesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3881:79: error: template argument 1 is invalid
 3881 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMap2PropertiesEXT> {
      |                                                                               ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3885:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
 3885 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3885:103: error: template argument 1 is invalid
 3885 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT> {
      |                                                                                                       ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3890:31: error: 'VkPhysicalDeviceImageRobustnessFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceBufferAddressFeaturesEXT'?
 3890 | template <> struct LvlTypeMap<VkPhysicalDeviceImageRobustnessFeaturesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceBufferAddressFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3890:73: error: template argument 1 is invalid
 3890 | template <> struct LvlTypeMap<VkPhysicalDeviceImageRobustnessFeaturesEXT> {
      |                                                                         ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3894:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT'?
 3894 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3894:95: error: template argument 1 is invalid
 3894 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT> {
      |                                                                                               ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:3404:5: error: 'VkImageViewAddressPropertiesNVX' has not been declared
 3404 |     VkImageViewAddressPropertiesNVX*            pProperties)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:4603:11: error: 'VkPrivateDataSlotCreateInfoEXT' does not name a type
 4603 |     const VkPrivateDataSlotCreateInfoEXT*       pCreateInfo,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:4605:5: error: 'VkPrivateDataSlotEXT' has not been declared
 4605 |     VkPrivateDataSlotEXT*                       pPrivateDataSlot)
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp: In function 'VkResult vkmock::CreatePrivateDataSlotEXT(VkDevice, const int*, const VkAllocationCallbacks*, int*)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:4608:26: error: 'VkPrivateDataSlotEXT' was not declared in this scope; did you mean 'pPrivateDataSlot'?
 4608 |     *pPrivateDataSlot = (VkPrivateDataSlotEXT)global_unique_handle++;
      |                          ^~~~~~~~~~~~~~~~~~~~
      |                          pPrivateDataSlot
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:4614:5: error: 'VkPrivateDataSlotEXT' has not been declared
 4614 |     VkPrivateDataSlotEXT                        privateDataSlot,
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:4624:5: error: 'VkPrivateDataSlotEXT' has not been declared
 4624 |     VkPrivateDataSlotEXT                        privateDataSlot,
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:4635:5: error: 'VkPrivateDataSlotEXT' has not been declared
 4635 |     VkPrivateDataSlotEXT                        privateDataSlot,
      |     ^~~~~~~~~~~~~~~~~~~~
[2/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++  -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/v
 ulkan-tools/1.2.148.0-r0=/usr/src/debug/vulkan-tools/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0=/usr/src/debug/vulkan-tools/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-b
 uiltin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp
FAILED: vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++  -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-
 tools/1.2.148.0-r0=/usr/src/debug/vulkan-tools/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0=/usr/src/debug/vulkan-tools/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin
 -memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'const char* VkDriverIdString(VkDriverId)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:94:9: warning: case value '13' not in enumerated type 'VkDriverId' [-Wswitch]
   94 |         case (13): return "DRIVER_ID_MESA_LLVMPIPE";
      |         ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:95:9: warning: case value '14' not in enumerated type 'VkDriverId' [-Wswitch]
   95 |         case (14): return "DRIVER_ID_MOLTENVK";
      |         ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1015:85: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' has not been declared
 1015 | void DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceCustomBorderColorFeaturesEXT &obj) {
      |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1017:64: error: request for member 'customBorderColors' in 'obj', which is of non-class type 'int'
 1017 |     p.PrintKeyBool("customBorderColors", static_cast<bool>(obj.customBorderColors), 30);
      |                                                                ^~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1018:76: error: request for member 'customBorderColorWithoutFormat' in 'obj', which is of non-class type 'int'
 1018 |     p.PrintKeyBool("customBorderColorWithoutFormat", static_cast<bool>(obj.customBorderColorWithoutFormat), 30);
      |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1020:87: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' has not been declared
 1020 | void DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT(Printer &p, std::string name, VkPhysicalDeviceCustomBorderColorPropertiesEXT &obj) {
      |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1022:57: error: request for member 'maxCustomBorderColorSamplers' in 'obj', which is of non-class type 'int'
 1022 |     p.PrintKeyValue("maxCustomBorderColorSamplers", obj.maxCustomBorderColorSamplers, 28);
      |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1095:88: error: 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT' has not been declared
 1095 | void DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceExtendedDynamicStateFeaturesEXT &obj) {
      |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1097:66: error: request for member 'extendedDynamicState' in 'obj', which is of non-class type 'int'
 1097 |     p.PrintKeyBool("extendedDynamicState", static_cast<bool>(obj.extendedDynamicState), 20);
      |                                                                  ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1181:87: error: 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT' has not been declared
 1181 | void DumpVkPhysicalDeviceFragmentDensityMap2FeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceFragmentDensityMap2FeaturesEXT &obj) {
      |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceFragmentDensityMap2FeaturesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1183:72: error: request for member 'fragmentDensityMapDeferred' in 'obj', which is of non-class type 'int'
 1183 |     p.PrintKeyBool("fragmentDensityMapDeferred", static_cast<bool>(obj.fragmentDensityMapDeferred), 26);
      |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1185:89: error: 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT' has not been declared
 1185 | void DumpVkPhysicalDeviceFragmentDensityMap2PropertiesEXT(Printer &p, std::string name, VkPhysicalDeviceFragmentDensityMap2PropertiesEXT &obj) {
      |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceFragmentDensityMap2PropertiesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1187:61: error: request for member 'subsampledLoads' in 'obj', which is of non-class type 'int'
 1187 |     p.PrintKeyBool("subsampledLoads", static_cast<bool>(obj.subsampledLoads), 41);
      |                                                             ^~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1188:87: error: request for member 'subsampledCoarseReconstructionEarlyAccess' in 'obj', which is of non-class type 'int'
 1188 |     p.PrintKeyBool("subsampledCoarseReconstructionEarlyAccess", static_cast<bool>(obj.subsampledCoarseReconstructionEarlyAccess), 41);
      |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1189:53: error: request for member 'maxSubsampledArrayLayers' in 'obj', which is of non-class type 'int'
 1189 |     p.PrintKeyValue("maxSubsampledArrayLayers", obj.maxSubsampledArrayLayers, 41);
      |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1190:63: error: request for member 'maxDescriptorSetSubsampledSamplers' in 'obj', which is of non-class type 'int'
 1190 |     p.PrintKeyValue("maxDescriptorSetSubsampledSamplers", obj.maxDescriptorSetSubsampledSamplers, 41);
      |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1222:83: error: 'VkPhysicalDeviceImageRobustnessFeaturesEXT' has not been declared
 1222 | void DumpVkPhysicalDeviceImageRobustnessFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceImageRobustnessFeaturesEXT &obj) {
      |                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceImageRobustnessFeaturesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1224:63: error: request for member 'robustImageAccess' in 'obj', which is of non-class type 'int'
 1224 |     p.PrintKeyBool("robustImageAccess", static_cast<bool>(obj.robustImageAccess), 17);
      |                                                               ^~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1480:79: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' has not been declared
 1480 | void DumpVkPhysicalDevicePrivateDataFeaturesEXT(Printer &p, std::string name, VkPhysicalDevicePrivateDataFeaturesEXT &obj) {
      |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePrivateDataFeaturesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1482:57: error: request for member 'privateData' in 'obj', which is of non-class type 'int'
 1482 |     p.PrintKeyBool("privateData", static_cast<bool>(obj.privateData), 11);
      |                                                         ^~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1524:79: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' has not been declared
 1524 | void DumpVkPhysicalDeviceRobustness2FeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceRobustness2FeaturesEXT &obj) {
      |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRobustness2FeaturesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1526:65: error: request for member 'robustBufferAccess2' in 'obj', which is of non-class type 'int'
 1526 |     p.PrintKeyBool("robustBufferAccess2", static_cast<bool>(obj.robustBufferAccess2), 19);
      |                                                                 ^~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1527:64: error: request for member 'robustImageAccess2' in 'obj', which is of non-class type 'int'
 1527 |     p.PrintKeyBool("robustImageAccess2", static_cast<bool>(obj.robustImageAccess2), 19);
      |                                                                ^~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1528:60: error: request for member 'nullDescriptor' in 'obj', which is of non-class type 'int'
 1528 |     p.PrintKeyBool("nullDescriptor", static_cast<bool>(obj.nullDescriptor), 19);
      |                                                            ^~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1530:81: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' has not been declared
 1530 | void DumpVkPhysicalDeviceRobustness2PropertiesEXT(Printer &p, std::string name, VkPhysicalDeviceRobustness2PropertiesEXT &obj) {
      |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRobustness2PropertiesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1532:81: error: request for member 'robustStorageBufferAccessSizeAlignment' in 'obj', which is of non-class type 'int'
 1532 |     p.PrintKeyValue("robustStorageBufferAccessSizeAlignment", to_hex_str(p, obj.robustStorageBufferAccessSizeAlignment), 38);
      |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1533:81: error: request for member 'robustUniformBufferAccessSizeAlignment' in 'obj', which is of non-class type 'int'
 1533 |     p.PrintKeyValue("robustUniformBufferAccessSizeAlignment", to_hex_str(p, obj.robustUniformBufferAccessSizeAlignment), 38);
      |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1563:85: error: 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT' has not been declared
 1563 | void DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceShaderAtomicFloatFeaturesEXT &obj) {
      |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1565:72: error: request for member 'shaderBufferFloat32Atomics' in 'obj', which is of non-class type 'int'
 1565 |     p.PrintKeyBool("shaderBufferFloat32Atomics", static_cast<bool>(obj.shaderBufferFloat32Atomics), 28);
      |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1566:74: error: request for member 'shaderBufferFloat32AtomicAdd' in 'obj', which is of non-class type 'int'
 1566 |     p.PrintKeyBool("shaderBufferFloat32AtomicAdd", static_cast<bool>(obj.shaderBufferFloat32AtomicAdd), 28);
      |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1567:72: error: request for member 'shaderBufferFloat64Atomics' in 'obj', which is of non-class type 'int'
 1567 |     p.PrintKeyBool("shaderBufferFloat64Atomics", static_cast<bool>(obj.shaderBufferFloat64Atomics), 28);
      |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1568:74: error: request for member 'shaderBufferFloat64AtomicAdd' in 'obj', which is of non-class type 'int'
 1568 |     p.PrintKeyBool("shaderBufferFloat64AtomicAdd", static_cast<bool>(obj.shaderBufferFloat64AtomicAdd), 28);
      |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1569:72: error: request for member 'shaderSharedFloat32Atomics' in 'obj', which is of non-class type 'int'
 1569 |     p.PrintKeyBool("shaderSharedFloat32Atomics", static_cast<bool>(obj.shaderSharedFloat32Atomics), 28);
      |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1570:74: error: request for member 'shaderSharedFloat32AtomicAdd' in 'obj', which is of non-class type 'int'
 1570 |     p.PrintKeyBool("shaderSharedFloat32AtomicAdd", static_cast<bool>(obj.shaderSharedFloat32AtomicAdd), 28);
      |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1571:72: error: request for member 'shaderSharedFloat64Atomics' in 'obj', which is of non-class type 'int'
 1571 |     p.PrintKeyBool("shaderSharedFloat64Atomics", static_cast<bool>(obj.shaderSharedFloat64Atomics), 28);
      |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1572:74: error: request for member 'shaderSharedFloat64AtomicAdd' in 'obj', which is of non-class type 'int'
 1572 |     p.PrintKeyBool("shaderSharedFloat64AtomicAdd", static_cast<bool>(obj.shaderSharedFloat64AtomicAdd), 28);
      |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1573:71: error: request for member 'shaderImageFloat32Atomics' in 'obj', which is of non-class type 'int'
 1573 |     p.PrintKeyBool("shaderImageFloat32Atomics", static_cast<bool>(obj.shaderImageFloat32Atomics), 28);
      |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1574:73: error: request for member 'shaderImageFloat32AtomicAdd' in 'obj', which is of non-class type 'int'
 1574 |     p.PrintKeyBool("shaderImageFloat32AtomicAdd", static_cast<bool>(obj.shaderImageFloat32AtomicAdd), 28);
      |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1575:71: error: request for member 'sparseImageFloat32Atomics' in 'obj', which is of non-class type 'int'
 1575 |     p.PrintKeyBool("sparseImageFloat32Atomics", static_cast<bool>(obj.sparseImageFloat32Atomics), 28);
      |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1576:73: error: request for member 'sparseImageFloat32AtomicAdd' in 'obj', which is of non-class type 'int'
 1576 |     p.PrintKeyBool("sparseImageFloat32AtomicAdd", static_cast<bool>(obj.sparseImageFloat32AtomicAdd), 28);
      |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'pNextChainInfos get_chain_infos()':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1888:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
 1888 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorPropertiesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1888:87: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT'?
 1888 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorPropertiesEXT)},
      |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                       DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1895:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
 1895 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceFragmentDensityMap2PropertiesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1895:90: error: 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapPropertiesEXT'?
 1895 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceFragmentDensityMap2PropertiesEXT)},
      |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                          VkPhysicalDeviceFragmentDensityMapPropertiesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1910:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
 1910 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceRobustness2PropertiesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1910:80: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2PropertiesEXT'?
 1910 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceRobustness2PropertiesEXT)},
      |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                DumpVkPhysicalDeviceRobustness2PropertiesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1921:5: error: no match for 'operator=' (operand types are 'std::vector<pNextChainBuildingBlockInfo>' and '<brace-enclosed initializer list>')
 1921 |     };
      |     ^
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/vector:72,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.h:39,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/vector.tcc:198:5: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(const std::vector<_Tp, _Alloc>&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
  198 |     vector<_Tp, _Alloc>::
      |     ^~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/vector.tcc:199:42: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'const std::vector<pNextChainBuildingBlockInfo>&'
  199 |     operator=(const vector<_Tp, _Alloc>& __x)
      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/vector:67,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.h:39,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:709:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::vector<_Tp, _Alloc>&&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
  709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
      |       ^~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:709:26: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::vector<pNextChainBuildingBlockInfo>&&'
  709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
      |                 ~~~~~~~~~^~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:730:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::initializer_list<_Tp>) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
  730 |       operator=(initializer_list<value_type> __l)
      |       ^~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:730:46: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::initializer_list<pNextChainBuildingBlockInfo>'
  730 |       operator=(initializer_list<value_type> __l)
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1933:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 1933 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorFeaturesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1933:85: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT'?
 1933 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorFeaturesEXT)},
      |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                     DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1936:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT'?
 1936 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT, sizeof(VkPhysicalDeviceExtendedDynamicStateFeaturesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1936:88: error: 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT'?
 1936 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT, sizeof(VkPhysicalDeviceExtendedDynamicStateFeaturesEXT)},
      |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                        DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1937:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT'?
 1937 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT, sizeof(VkPhysicalDeviceFragmentDensityMap2FeaturesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1937:88: error: 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapFeaturesEXT'?
 1937 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT, sizeof(VkPhysicalDeviceFragmentDensityMap2FeaturesEXT)},
      |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                        VkPhysicalDeviceFragmentDensityMapFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1941:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT'?
 1941 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT, sizeof(VkPhysicalDeviceImageRobustnessFeaturesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1941:82: error: 'VkPhysicalDeviceImageRobustnessFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceImageRobustnessFeaturesEXT'?
 1941 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT, sizeof(VkPhysicalDeviceImageRobustnessFeaturesEXT)},
      |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                  DumpVkPhysicalDeviceImageRobustnessFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1951:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 1951 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT, sizeof(VkPhysicalDevicePrivateDataFeaturesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1951:78: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePrivateDataFeaturesEXT'?
 1951 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT, sizeof(VkPhysicalDevicePrivateDataFeaturesEXT)},
      |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                              DumpVkPhysicalDevicePrivateDataFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1956:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 1956 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT, sizeof(VkPhysicalDeviceRobustness2FeaturesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1956:78: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2FeaturesEXT'?
 1956 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT, sizeof(VkPhysicalDeviceRobustness2FeaturesEXT)},
      |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                              DumpVkPhysicalDeviceRobustness2FeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1960:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
 1960 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT, sizeof(VkPhysicalDeviceShaderAtomicFloatFeaturesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1960:85: error: 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT'?
 1960 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT, sizeof(VkPhysicalDeviceShaderAtomicFloatFeaturesEXT)},
      |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                     DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1979:5: error: no match for 'operator=' (operand types are 'std::vector<pNextChainBuildingBlockInfo>' and '<brace-enclosed initializer list>')
 1979 |     };
      |     ^
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/vector:72,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.h:39,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/vector.tcc:198:5: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(const std::vector<_Tp, _Alloc>&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
  198 |     vector<_Tp, _Alloc>::
      |     ^~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/vector.tcc:199:42: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'const std::vector<pNextChainBuildingBlockInfo>&'
  199 |     operator=(const vector<_Tp, _Alloc>& __x)
      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/vector:67,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.h:39,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:709:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::vector<_Tp, _Alloc>&&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
  709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
      |       ^~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:709:26: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::vector<pNextChainBuildingBlockInfo>&&'
  709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
      |                 ~~~~~~~~~^~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:730:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::initializer_list<_Tp>) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
  730 |       operator=(initializer_list<value_type> __l)
      |       ^~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:730:46: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::initializer_list<pNextChainBuildingBlockInfo>'
  730 |       operator=(initializer_list<value_type> __l)
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_props2(Printer&, AppInstance&, AppGpu&, void*, VulkanVersion)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2008:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
 2008 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2009:54: error: 'VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME'?
 2009 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2010:13: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT'?
 2010 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2010:61: error: 'props' was not declared in this scope
 2010 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
      |                                                             ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2010:117: error: expected primary-expression before ')' token
 2010 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
      |                                                                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2054:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
 2054 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2055:54: error: 'VK_EXT_FRAGMENT_DENSITY_MAP_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME'?
 2055 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_FRAGMENT_DENSITY_MAP_2_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2056:13: error: 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapPropertiesEXT'?
 2056 |             VkPhysicalDeviceFragmentDensityMap2PropertiesEXT* props = (VkPhysicalDeviceFragmentDensityMap2PropertiesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             VkPhysicalDeviceFragmentDensityMapPropertiesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2056:63: error: 'props' was not declared in this scope
 2056 |             VkPhysicalDeviceFragmentDensityMap2PropertiesEXT* props = (VkPhysicalDeviceFragmentDensityMap2PropertiesEXT*)structure;
      |                                                               ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2056:121: error: expected primary-expression before ')' token
 2056 |             VkPhysicalDeviceFragmentDensityMap2PropertiesEXT* props = (VkPhysicalDeviceFragmentDensityMap2PropertiesEXT*)structure;
      |                                                                                                                         ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2138:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
 2138 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2139:54: error: 'VK_EXT_ROBUSTNESS_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEBUG_REPORT_EXTENSION_NAME'?
 2139 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_ROBUSTNESS_2_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_EXT_DEBUG_REPORT_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2140:13: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2PropertiesEXT'?
 2140 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceRobustness2PropertiesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2140:55: error: 'props' was not declared in this scope
 2140 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
      |                                                       ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2140:105: error: expected primary-expression before ')' token
 2140 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
      |                                                                                                         ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, void*, VulkanVersion)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2271:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 2271 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2272:54: error: 'VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME'?
 2272 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2273:13: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT'?
 2273 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2273:59: error: 'props' was not declared in this scope
 2273 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
      |                                                           ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2273:113: error: expected primary-expression before ')' token
 2273 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
      |                                                                                                                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2290:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT'?
 2290 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2291:54: error: 'VK_EXT_EXTENDED_DYNAMIC_STATE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_INDEX_TYPE_UINT8_EXTENSION_NAME'?
 2291 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_EXTENDED_DYNAMIC_STATE_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_EXT_INDEX_TYPE_UINT8_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2292:13: error: 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT'?
 2292 |             VkPhysicalDeviceExtendedDynamicStateFeaturesEXT* props = (VkPhysicalDeviceExtendedDynamicStateFeaturesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2292:62: error: 'props' was not declared in this scope
 2292 |             VkPhysicalDeviceExtendedDynamicStateFeaturesEXT* props = (VkPhysicalDeviceExtendedDynamicStateFeaturesEXT*)structure;
      |                                                              ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2292:119: error: expected primary-expression before ')' token
 2292 |             VkPhysicalDeviceExtendedDynamicStateFeaturesEXT* props = (VkPhysicalDeviceExtendedDynamicStateFeaturesEXT*)structure;
      |                                                                                                                       ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2296:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT'?
 2296 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2297:54: error: 'VK_EXT_FRAGMENT_DENSITY_MAP_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME'?
 2297 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_FRAGMENT_DENSITY_MAP_2_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2298:13: error: 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapFeaturesEXT'?
 2298 |             VkPhysicalDeviceFragmentDensityMap2FeaturesEXT* props = (VkPhysicalDeviceFragmentDensityMap2FeaturesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             VkPhysicalDeviceFragmentDensityMapFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2298:61: error: 'props' was not declared in this scope
 2298 |             VkPhysicalDeviceFragmentDensityMap2FeaturesEXT* props = (VkPhysicalDeviceFragmentDensityMap2FeaturesEXT*)structure;
      |                                                             ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2298:117: error: expected primary-expression before ')' token
 2298 |             VkPhysicalDeviceFragmentDensityMap2FeaturesEXT* props = (VkPhysicalDeviceFragmentDensityMap2FeaturesEXT*)structure;
      |                                                                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2321:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT'?
 2321 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2322:54: error: 'VK_EXT_IMAGE_ROBUSTNESS_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_IMAGE_FORMAT_LIST_EXTENSION_NAME'?
 2322 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_IMAGE_ROBUSTNESS_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_KHR_IMAGE_FORMAT_LIST_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2323:13: error: 'VkPhysicalDeviceImageRobustnessFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceImageRobustnessFeaturesEXT'?
 2323 |             VkPhysicalDeviceImageRobustnessFeaturesEXT* props = (VkPhysicalDeviceImageRobustnessFeaturesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceImageRobustnessFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2323:57: error: 'props' was not declared in this scope
 2323 |             VkPhysicalDeviceImageRobustnessFeaturesEXT* props = (VkPhysicalDeviceImageRobustnessFeaturesEXT*)structure;
      |                                                         ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2323:109: error: expected primary-expression before ')' token
 2323 |             VkPhysicalDeviceImageRobustnessFeaturesEXT* props = (VkPhysicalDeviceImageRobustnessFeaturesEXT*)structure;
      |                                                                                                             ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2383:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 2383 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2384:54: error: 'VK_EXT_PRIVATE_DATA_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_HDR_METADATA_EXTENSION_NAME'?
 2384 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_PRIVATE_DATA_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_EXT_HDR_METADATA_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2385:13: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePrivateDataFeaturesEXT'?
 2385 |             VkPhysicalDevicePrivateDataFeaturesEXT* props = (VkPhysicalDevicePrivateDataFeaturesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDevicePrivateDataFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2385:53: error: 'props' was not declared in this scope
 2385 |             VkPhysicalDevicePrivateDataFeaturesEXT* props = (VkPhysicalDevicePrivateDataFeaturesEXT*)structure;
      |                                                     ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2385:101: error: expected primary-expression before ')' token
 2385 |             VkPhysicalDevicePrivateDataFeaturesEXT* props = (VkPhysicalDevicePrivateDataFeaturesEXT*)structure;
      |                                                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2403:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 2403 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2404:54: error: 'VK_EXT_ROBUSTNESS_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEBUG_REPORT_EXTENSION_NAME'?
 2404 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_ROBUSTNESS_2_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_EXT_DEBUG_REPORT_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2405:13: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2FeaturesEXT'?
 2405 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceRobustness2FeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2405:53: error: 'props' was not declared in this scope
 2405 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
      |                                                     ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2405:101: error: expected primary-expression before ')' token
 2405 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
      |                                                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2430:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
 2430 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2431:54: error: 'VK_EXT_SHADER_ATOMIC_FLOAT_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME'?
 2431 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_SHADER_ATOMIC_FLOAT_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2432:13: error: 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT'?
 2432 |             VkPhysicalDeviceShaderAtomicFloatFeaturesEXT* props = (VkPhysicalDeviceShaderAtomicFloatFeaturesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2432:59: error: 'props' was not declared in this scope
 2432 |             VkPhysicalDeviceShaderAtomicFloatFeaturesEXT* props = (VkPhysicalDeviceShaderAtomicFloatFeaturesEXT*)structure;
      |                                                           ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2432:113: error: expected primary-expression before ')' token
 2432 |             VkPhysicalDeviceShaderAtomicFloatFeaturesEXT* props = (VkPhysicalDeviceShaderAtomicFloatFeaturesEXT*)structure;
      |                                                                                                                 ^
ninja: build stopped: subcommand failed.
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/temp/log.do_compile.25463
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/build --target all --
| [1/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++  -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd -Iicd -I. -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan
 -tools/1.2.148.0-r0=/usr/src/debug/vulkan-tools/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0=/usr/src/debug/vulkan-tools/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builti
 n-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp
| FAILED: icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++  -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd -Iicd -I. -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools
 /1.2.148.0-r0=/usr/src/debug/vulkan-tools/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0=/usr/src/debug/vulkan-tools/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memc
 mp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:22:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.h:2022:5: error: 'VkImageViewAddressPropertiesNVX' has not been declared
|  2022 |     VkImageViewAddressPropertiesNVX*            pProperties);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.h:2804:11: error: 'VkPrivateDataSlotCreateInfoEXT' does not name a type
|  2804 |     const VkPrivateDataSlotCreateInfoEXT*       pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.h:2806:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  2806 |     VkPrivateDataSlotEXT*                       pPrivateDataSlot);
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.h:2810:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  2810 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.h:2817:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  2817 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.h:2824:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  2824 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:2214:31: error: 'VkImageViewAddressPropertiesNVX' was not declared in this scope
|  2214 | template <> struct LvlTypeMap<VkImageViewAddressPropertiesNVX> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:2214:62: error: template argument 1 is invalid
|  2214 | template <> struct LvlTypeMap<VkImageViewAddressPropertiesNVX> {
|       |                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:2218:32: error: 'VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2'?
|  2218 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:2218:83: error: template argument 1 is invalid
|  2218 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3251:43: error: 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR'?
|  3251 |     static const VkStructureType kSType = VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL;
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3254:32: error: 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR'?
|  3254 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3254:96: error: template argument 1 is invalid
|  3254 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL> {
|       |                                                                                                ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3629:31: error: 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderAtomicInt64FeaturesKHR'?
|  3629 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderAtomicFloatFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderAtomicInt64FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3629:75: error: template argument 1 is invalid
|  3629 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderAtomicFloatFeaturesEXT> {
|       |                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3633:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  3633 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3633:98: error: template argument 1 is invalid
|  3633 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT> {
|       |                                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3647:31: error: 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceIndexTypeUint8FeaturesEXT'?
|  3647 | template <> struct LvlTypeMap<VkPhysicalDeviceExtendedDynamicStateFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceIndexTypeUint8FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3647:78: error: template argument 1 is invalid
|  3647 | template <> struct LvlTypeMap<VkPhysicalDeviceExtendedDynamicStateFeaturesEXT> {
|       |                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3651:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT'?
|  3651 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3651:101: error: template argument 1 is invalid
|  3651 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT> {
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3773:31: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceHostQueryResetFeaturesEXT'?
|  3773 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2FeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceHostQueryResetFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3773:69: error: template argument 1 is invalid
|  3773 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2FeaturesEXT> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3777:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  3777 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3777:91: error: template argument 1 is invalid
|  3777 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT> {
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3782:31: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDevicePCIBusInfoPropertiesEXT'?
|  3782 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2PropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDevicePCIBusInfoPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3782:71: error: template argument 1 is invalid
|  3782 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2PropertiesEXT> {
|       |                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3786:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  3786 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3786:93: error: template argument 1 is invalid
|  3786 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT> {
|       |                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3791:31: error: 'VkSamplerCustomBorderColorCreateInfoEXT' was not declared in this scope
|  3791 | template <> struct LvlTypeMap<VkSamplerCustomBorderColorCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3791:70: error: template argument 1 is invalid
|  3791 | template <> struct LvlTypeMap<VkSamplerCustomBorderColorCreateInfoEXT> {
|       |                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3795:32: error: 'VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO_EXT'?
|  3795 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3795:93: error: template argument 1 is invalid
|  3795 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT> {
|       |                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3800:31: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceToolPropertiesEXT'?
|  3800 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorPropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceToolPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3800:77: error: template argument 1 is invalid
|  3800 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorPropertiesEXT> {
|       |                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3804:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  3804 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3804:100: error: template argument 1 is invalid
|  3804 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT> {
|       |                                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3809:31: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMemoryPriorityFeaturesEXT'?
|  3809 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMemoryPriorityFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3809:75: error: template argument 1 is invalid
|  3809 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorFeaturesEXT> {
|       |                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3813:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  3813 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3813:98: error: template argument 1 is invalid
|  3813 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT> {
|       |                                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3818:31: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceASTCDecodeFeaturesEXT'?
|  3818 | template <> struct LvlTypeMap<VkPhysicalDevicePrivateDataFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceASTCDecodeFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3818:69: error: template argument 1 is invalid
|  3818 | template <> struct LvlTypeMap<VkPhysicalDevicePrivateDataFeaturesEXT> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3822:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  3822 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3822:91: error: template argument 1 is invalid
|  3822 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT> {
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3827:31: error: 'VkDevicePrivateDataCreateInfoEXT' was not declared in this scope
|  3827 | template <> struct LvlTypeMap<VkDevicePrivateDataCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3827:63: error: template argument 1 is invalid
|  3827 | template <> struct LvlTypeMap<VkDevicePrivateDataCreateInfoEXT> {
|       |                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3831:32: error: 'VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT'?
|  3831 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3831:85: error: template argument 1 is invalid
|  3831 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT> {
|       |                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3836:31: error: 'VkPrivateDataSlotCreateInfoEXT' was not declared in this scope
|  3836 | template <> struct LvlTypeMap<VkPrivateDataSlotCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3836:61: error: template argument 1 is invalid
|  3836 | template <> struct LvlTypeMap<VkPrivateDataSlotCreateInfoEXT> {
|       |                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3840:32: error: 'VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT'?
|  3840 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3840:83: error: template argument 1 is invalid
|  3840 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3872:31: error: 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapFeaturesEXT'?
|  3872 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMap2FeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceFragmentDensityMapFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3872:77: error: template argument 1 is invalid
|  3872 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMap2FeaturesEXT> {
|       |                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3876:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT'?
|  3876 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3876:101: error: template argument 1 is invalid
|  3876 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT> {
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3881:31: error: 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapPropertiesEXT'?
|  3881 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMap2PropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceFragmentDensityMapPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3881:79: error: template argument 1 is invalid
|  3881 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMap2PropertiesEXT> {
|       |                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3885:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
|  3885 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3885:103: error: template argument 1 is invalid
|  3885 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT> {
|       |                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3890:31: error: 'VkPhysicalDeviceImageRobustnessFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceBufferAddressFeaturesEXT'?
|  3890 | template <> struct LvlTypeMap<VkPhysicalDeviceImageRobustnessFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceBufferAddressFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3890:73: error: template argument 1 is invalid
|  3890 | template <> struct LvlTypeMap<VkPhysicalDeviceImageRobustnessFeaturesEXT> {
|       |                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3894:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT'?
|  3894 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3894:95: error: template argument 1 is invalid
|  3894 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT> {
|       |                                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:3404:5: error: 'VkImageViewAddressPropertiesNVX' has not been declared
|  3404 |     VkImageViewAddressPropertiesNVX*            pProperties)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:4603:11: error: 'VkPrivateDataSlotCreateInfoEXT' does not name a type
|  4603 |     const VkPrivateDataSlotCreateInfoEXT*       pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:4605:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  4605 |     VkPrivateDataSlotEXT*                       pPrivateDataSlot)
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp: In function 'VkResult vkmock::CreatePrivateDataSlotEXT(VkDevice, const int*, const VkAllocationCallbacks*, int*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:4608:26: error: 'VkPrivateDataSlotEXT' was not declared in this scope; did you mean 'pPrivateDataSlot'?
|  4608 |     *pPrivateDataSlot = (VkPrivateDataSlotEXT)global_unique_handle++;
|       |                          ^~~~~~~~~~~~~~~~~~~~
|       |                          pPrivateDataSlot
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:4614:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  4614 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:4624:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  4624 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:4635:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  4635 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| [2/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++  -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux
 /vulkan-tools/1.2.148.0-r0=/usr/src/debug/vulkan-tools/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0=/usr/src/debug/vulkan-tools/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno
 -builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp
| FAILED: vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++  -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulka
 n-tools/1.2.148.0-r0=/usr/src/debug/vulkan-tools/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0=/usr/src/debug/vulkan-tools/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-built
 in-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'const char* VkDriverIdString(VkDriverId)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:94:9: warning: case value '13' not in enumerated type 'VkDriverId' [-Wswitch]
|    94 |         case (13): return "DRIVER_ID_MESA_LLVMPIPE";
|       |         ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:95:9: warning: case value '14' not in enumerated type 'VkDriverId' [-Wswitch]
|    95 |         case (14): return "DRIVER_ID_MOLTENVK";
|       |         ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1015:85: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' has not been declared
|  1015 | void DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceCustomBorderColorFeaturesEXT &obj) {
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1017:64: error: request for member 'customBorderColors' in 'obj', which is of non-class type 'int'
|  1017 |     p.PrintKeyBool("customBorderColors", static_cast<bool>(obj.customBorderColors), 30);
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1018:76: error: request for member 'customBorderColorWithoutFormat' in 'obj', which is of non-class type 'int'
|  1018 |     p.PrintKeyBool("customBorderColorWithoutFormat", static_cast<bool>(obj.customBorderColorWithoutFormat), 30);
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1020:87: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' has not been declared
|  1020 | void DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT(Printer &p, std::string name, VkPhysicalDeviceCustomBorderColorPropertiesEXT &obj) {
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1022:57: error: request for member 'maxCustomBorderColorSamplers' in 'obj', which is of non-class type 'int'
|  1022 |     p.PrintKeyValue("maxCustomBorderColorSamplers", obj.maxCustomBorderColorSamplers, 28);
|       |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1095:88: error: 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT' has not been declared
|  1095 | void DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceExtendedDynamicStateFeaturesEXT &obj) {
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1097:66: error: request for member 'extendedDynamicState' in 'obj', which is of non-class type 'int'
|  1097 |     p.PrintKeyBool("extendedDynamicState", static_cast<bool>(obj.extendedDynamicState), 20);
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1181:87: error: 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT' has not been declared
|  1181 | void DumpVkPhysicalDeviceFragmentDensityMap2FeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceFragmentDensityMap2FeaturesEXT &obj) {
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceFragmentDensityMap2FeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1183:72: error: request for member 'fragmentDensityMapDeferred' in 'obj', which is of non-class type 'int'
|  1183 |     p.PrintKeyBool("fragmentDensityMapDeferred", static_cast<bool>(obj.fragmentDensityMapDeferred), 26);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1185:89: error: 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT' has not been declared
|  1185 | void DumpVkPhysicalDeviceFragmentDensityMap2PropertiesEXT(Printer &p, std::string name, VkPhysicalDeviceFragmentDensityMap2PropertiesEXT &obj) {
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceFragmentDensityMap2PropertiesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1187:61: error: request for member 'subsampledLoads' in 'obj', which is of non-class type 'int'
|  1187 |     p.PrintKeyBool("subsampledLoads", static_cast<bool>(obj.subsampledLoads), 41);
|       |                                                             ^~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1188:87: error: request for member 'subsampledCoarseReconstructionEarlyAccess' in 'obj', which is of non-class type 'int'
|  1188 |     p.PrintKeyBool("subsampledCoarseReconstructionEarlyAccess", static_cast<bool>(obj.subsampledCoarseReconstructionEarlyAccess), 41);
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1189:53: error: request for member 'maxSubsampledArrayLayers' in 'obj', which is of non-class type 'int'
|  1189 |     p.PrintKeyValue("maxSubsampledArrayLayers", obj.maxSubsampledArrayLayers, 41);
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1190:63: error: request for member 'maxDescriptorSetSubsampledSamplers' in 'obj', which is of non-class type 'int'
|  1190 |     p.PrintKeyValue("maxDescriptorSetSubsampledSamplers", obj.maxDescriptorSetSubsampledSamplers, 41);
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1222:83: error: 'VkPhysicalDeviceImageRobustnessFeaturesEXT' has not been declared
|  1222 | void DumpVkPhysicalDeviceImageRobustnessFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceImageRobustnessFeaturesEXT &obj) {
|       |                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceImageRobustnessFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1224:63: error: request for member 'robustImageAccess' in 'obj', which is of non-class type 'int'
|  1224 |     p.PrintKeyBool("robustImageAccess", static_cast<bool>(obj.robustImageAccess), 17);
|       |                                                               ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1480:79: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' has not been declared
|  1480 | void DumpVkPhysicalDevicePrivateDataFeaturesEXT(Printer &p, std::string name, VkPhysicalDevicePrivateDataFeaturesEXT &obj) {
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePrivateDataFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1482:57: error: request for member 'privateData' in 'obj', which is of non-class type 'int'
|  1482 |     p.PrintKeyBool("privateData", static_cast<bool>(obj.privateData), 11);
|       |                                                         ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1524:79: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' has not been declared
|  1524 | void DumpVkPhysicalDeviceRobustness2FeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceRobustness2FeaturesEXT &obj) {
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRobustness2FeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1526:65: error: request for member 'robustBufferAccess2' in 'obj', which is of non-class type 'int'
|  1526 |     p.PrintKeyBool("robustBufferAccess2", static_cast<bool>(obj.robustBufferAccess2), 19);
|       |                                                                 ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1527:64: error: request for member 'robustImageAccess2' in 'obj', which is of non-class type 'int'
|  1527 |     p.PrintKeyBool("robustImageAccess2", static_cast<bool>(obj.robustImageAccess2), 19);
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1528:60: error: request for member 'nullDescriptor' in 'obj', which is of non-class type 'int'
|  1528 |     p.PrintKeyBool("nullDescriptor", static_cast<bool>(obj.nullDescriptor), 19);
|       |                                                            ^~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1530:81: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' has not been declared
|  1530 | void DumpVkPhysicalDeviceRobustness2PropertiesEXT(Printer &p, std::string name, VkPhysicalDeviceRobustness2PropertiesEXT &obj) {
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRobustness2PropertiesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1532:81: error: request for member 'robustStorageBufferAccessSizeAlignment' in 'obj', which is of non-class type 'int'
|  1532 |     p.PrintKeyValue("robustStorageBufferAccessSizeAlignment", to_hex_str(p, obj.robustStorageBufferAccessSizeAlignment), 38);
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1533:81: error: request for member 'robustUniformBufferAccessSizeAlignment' in 'obj', which is of non-class type 'int'
|  1533 |     p.PrintKeyValue("robustUniformBufferAccessSizeAlignment", to_hex_str(p, obj.robustUniformBufferAccessSizeAlignment), 38);
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1563:85: error: 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT' has not been declared
|  1563 | void DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceShaderAtomicFloatFeaturesEXT &obj) {
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1565:72: error: request for member 'shaderBufferFloat32Atomics' in 'obj', which is of non-class type 'int'
|  1565 |     p.PrintKeyBool("shaderBufferFloat32Atomics", static_cast<bool>(obj.shaderBufferFloat32Atomics), 28);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1566:74: error: request for member 'shaderBufferFloat32AtomicAdd' in 'obj', which is of non-class type 'int'
|  1566 |     p.PrintKeyBool("shaderBufferFloat32AtomicAdd", static_cast<bool>(obj.shaderBufferFloat32AtomicAdd), 28);
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1567:72: error: request for member 'shaderBufferFloat64Atomics' in 'obj', which is of non-class type 'int'
|  1567 |     p.PrintKeyBool("shaderBufferFloat64Atomics", static_cast<bool>(obj.shaderBufferFloat64Atomics), 28);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1568:74: error: request for member 'shaderBufferFloat64AtomicAdd' in 'obj', which is of non-class type 'int'
|  1568 |     p.PrintKeyBool("shaderBufferFloat64AtomicAdd", static_cast<bool>(obj.shaderBufferFloat64AtomicAdd), 28);
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1569:72: error: request for member 'shaderSharedFloat32Atomics' in 'obj', which is of non-class type 'int'
|  1569 |     p.PrintKeyBool("shaderSharedFloat32Atomics", static_cast<bool>(obj.shaderSharedFloat32Atomics), 28);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1570:74: error: request for member 'shaderSharedFloat32AtomicAdd' in 'obj', which is of non-class type 'int'
|  1570 |     p.PrintKeyBool("shaderSharedFloat32AtomicAdd", static_cast<bool>(obj.shaderSharedFloat32AtomicAdd), 28);
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1571:72: error: request for member 'shaderSharedFloat64Atomics' in 'obj', which is of non-class type 'int'
|  1571 |     p.PrintKeyBool("shaderSharedFloat64Atomics", static_cast<bool>(obj.shaderSharedFloat64Atomics), 28);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1572:74: error: request for member 'shaderSharedFloat64AtomicAdd' in 'obj', which is of non-class type 'int'
|  1572 |     p.PrintKeyBool("shaderSharedFloat64AtomicAdd", static_cast<bool>(obj.shaderSharedFloat64AtomicAdd), 28);
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1573:71: error: request for member 'shaderImageFloat32Atomics' in 'obj', which is of non-class type 'int'
|  1573 |     p.PrintKeyBool("shaderImageFloat32Atomics", static_cast<bool>(obj.shaderImageFloat32Atomics), 28);
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1574:73: error: request for member 'shaderImageFloat32AtomicAdd' in 'obj', which is of non-class type 'int'
|  1574 |     p.PrintKeyBool("shaderImageFloat32AtomicAdd", static_cast<bool>(obj.shaderImageFloat32AtomicAdd), 28);
|       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1575:71: error: request for member 'sparseImageFloat32Atomics' in 'obj', which is of non-class type 'int'
|  1575 |     p.PrintKeyBool("sparseImageFloat32Atomics", static_cast<bool>(obj.sparseImageFloat32Atomics), 28);
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1576:73: error: request for member 'sparseImageFloat32AtomicAdd' in 'obj', which is of non-class type 'int'
|  1576 |     p.PrintKeyBool("sparseImageFloat32AtomicAdd", static_cast<bool>(obj.sparseImageFloat32AtomicAdd), 28);
|       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'pNextChainInfos get_chain_infos()':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1888:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  1888 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorPropertiesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1888:87: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT'?
|  1888 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorPropertiesEXT)},
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                       DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1895:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
|  1895 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceFragmentDensityMap2PropertiesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1895:90: error: 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapPropertiesEXT'?
|  1895 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceFragmentDensityMap2PropertiesEXT)},
|       |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                          VkPhysicalDeviceFragmentDensityMapPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1910:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  1910 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceRobustness2PropertiesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1910:80: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2PropertiesEXT'?
|  1910 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceRobustness2PropertiesEXT)},
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                DumpVkPhysicalDeviceRobustness2PropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1921:5: error: no match for 'operator=' (operand types are 'std::vector<pNextChainBuildingBlockInfo>' and '<brace-enclosed initializer list>')
|  1921 |     };
|       |     ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/vector:72,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/vector.tcc:198:5: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(const std::vector<_Tp, _Alloc>&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   198 |     vector<_Tp, _Alloc>::
|       |     ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/vector.tcc:199:42: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'const std::vector<pNextChainBuildingBlockInfo>&'
|   199 |     operator=(const vector<_Tp, _Alloc>& __x)
|       |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/vector:67,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:709:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::vector<_Tp, _Alloc>&&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:709:26: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::vector<pNextChainBuildingBlockInfo>&&'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |                 ~~~~~~~~~^~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:730:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::initializer_list<_Tp>) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   730 |       operator=(initializer_list<value_type> __l)
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:730:46: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::initializer_list<pNextChainBuildingBlockInfo>'
|   730 |       operator=(initializer_list<value_type> __l)
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1933:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  1933 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1933:85: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT'?
|  1933 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorFeaturesEXT)},
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                     DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1936:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT'?
|  1936 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT, sizeof(VkPhysicalDeviceExtendedDynamicStateFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1936:88: error: 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT'?
|  1936 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT, sizeof(VkPhysicalDeviceExtendedDynamicStateFeaturesEXT)},
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                        DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1937:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT'?
|  1937 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT, sizeof(VkPhysicalDeviceFragmentDensityMap2FeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1937:88: error: 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapFeaturesEXT'?
|  1937 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT, sizeof(VkPhysicalDeviceFragmentDensityMap2FeaturesEXT)},
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                        VkPhysicalDeviceFragmentDensityMapFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1941:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT'?
|  1941 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT, sizeof(VkPhysicalDeviceImageRobustnessFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1941:82: error: 'VkPhysicalDeviceImageRobustnessFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceImageRobustnessFeaturesEXT'?
|  1941 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT, sizeof(VkPhysicalDeviceImageRobustnessFeaturesEXT)},
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                  DumpVkPhysicalDeviceImageRobustnessFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1951:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  1951 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT, sizeof(VkPhysicalDevicePrivateDataFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1951:78: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePrivateDataFeaturesEXT'?
|  1951 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT, sizeof(VkPhysicalDevicePrivateDataFeaturesEXT)},
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                              DumpVkPhysicalDevicePrivateDataFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1956:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  1956 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT, sizeof(VkPhysicalDeviceRobustness2FeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1956:78: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2FeaturesEXT'?
|  1956 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT, sizeof(VkPhysicalDeviceRobustness2FeaturesEXT)},
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                              DumpVkPhysicalDeviceRobustness2FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1960:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  1960 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT, sizeof(VkPhysicalDeviceShaderAtomicFloatFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1960:85: error: 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT'?
|  1960 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT, sizeof(VkPhysicalDeviceShaderAtomicFloatFeaturesEXT)},
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                     DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1979:5: error: no match for 'operator=' (operand types are 'std::vector<pNextChainBuildingBlockInfo>' and '<brace-enclosed initializer list>')
|  1979 |     };
|       |     ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/vector:72,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/vector.tcc:198:5: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(const std::vector<_Tp, _Alloc>&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   198 |     vector<_Tp, _Alloc>::
|       |     ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/vector.tcc:199:42: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'const std::vector<pNextChainBuildingBlockInfo>&'
|   199 |     operator=(const vector<_Tp, _Alloc>& __x)
|       |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/vector:67,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:709:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::vector<_Tp, _Alloc>&&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:709:26: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::vector<pNextChainBuildingBlockInfo>&&'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |                 ~~~~~~~~~^~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:730:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::initializer_list<_Tp>) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   730 |       operator=(initializer_list<value_type> __l)
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:730:46: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::initializer_list<pNextChainBuildingBlockInfo>'
|   730 |       operator=(initializer_list<value_type> __l)
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_props2(Printer&, AppInstance&, AppGpu&, void*, VulkanVersion)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2008:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  2008 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2009:54: error: 'VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME'?
|  2009 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2010:13: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT'?
|  2010 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2010:61: error: 'props' was not declared in this scope
|  2010 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
|       |                                                             ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2010:117: error: expected primary-expression before ')' token
|  2010 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
|       |                                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2054:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
|  2054 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2055:54: error: 'VK_EXT_FRAGMENT_DENSITY_MAP_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME'?
|  2055 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_FRAGMENT_DENSITY_MAP_2_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2056:13: error: 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapPropertiesEXT'?
|  2056 |             VkPhysicalDeviceFragmentDensityMap2PropertiesEXT* props = (VkPhysicalDeviceFragmentDensityMap2PropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceFragmentDensityMapPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2056:63: error: 'props' was not declared in this scope
|  2056 |             VkPhysicalDeviceFragmentDensityMap2PropertiesEXT* props = (VkPhysicalDeviceFragmentDensityMap2PropertiesEXT*)structure;
|       |                                                               ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2056:121: error: expected primary-expression before ')' token
|  2056 |             VkPhysicalDeviceFragmentDensityMap2PropertiesEXT* props = (VkPhysicalDeviceFragmentDensityMap2PropertiesEXT*)structure;
|       |                                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2138:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  2138 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2139:54: error: 'VK_EXT_ROBUSTNESS_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEBUG_REPORT_EXTENSION_NAME'?
|  2139 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_ROBUSTNESS_2_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_DEBUG_REPORT_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2140:13: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2PropertiesEXT'?
|  2140 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceRobustness2PropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2140:55: error: 'props' was not declared in this scope
|  2140 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
|       |                                                       ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2140:105: error: expected primary-expression before ')' token
|  2140 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
|       |                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, void*, VulkanVersion)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2271:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  2271 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2272:54: error: 'VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME'?
|  2272 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2273:13: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT'?
|  2273 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2273:59: error: 'props' was not declared in this scope
|  2273 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
|       |                                                           ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2273:113: error: expected primary-expression before ')' token
|  2273 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
|       |                                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2290:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT'?
|  2290 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2291:54: error: 'VK_EXT_EXTENDED_DYNAMIC_STATE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_INDEX_TYPE_UINT8_EXTENSION_NAME'?
|  2291 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_EXTENDED_DYNAMIC_STATE_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_INDEX_TYPE_UINT8_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2292:13: error: 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT'?
|  2292 |             VkPhysicalDeviceExtendedDynamicStateFeaturesEXT* props = (VkPhysicalDeviceExtendedDynamicStateFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2292:62: error: 'props' was not declared in this scope
|  2292 |             VkPhysicalDeviceExtendedDynamicStateFeaturesEXT* props = (VkPhysicalDeviceExtendedDynamicStateFeaturesEXT*)structure;
|       |                                                              ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2292:119: error: expected primary-expression before ')' token
|  2292 |             VkPhysicalDeviceExtendedDynamicStateFeaturesEXT* props = (VkPhysicalDeviceExtendedDynamicStateFeaturesEXT*)structure;
|       |                                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2296:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT'?
|  2296 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2297:54: error: 'VK_EXT_FRAGMENT_DENSITY_MAP_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME'?
|  2297 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_FRAGMENT_DENSITY_MAP_2_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2298:13: error: 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapFeaturesEXT'?
|  2298 |             VkPhysicalDeviceFragmentDensityMap2FeaturesEXT* props = (VkPhysicalDeviceFragmentDensityMap2FeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceFragmentDensityMapFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2298:61: error: 'props' was not declared in this scope
|  2298 |             VkPhysicalDeviceFragmentDensityMap2FeaturesEXT* props = (VkPhysicalDeviceFragmentDensityMap2FeaturesEXT*)structure;
|       |                                                             ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2298:117: error: expected primary-expression before ')' token
|  2298 |             VkPhysicalDeviceFragmentDensityMap2FeaturesEXT* props = (VkPhysicalDeviceFragmentDensityMap2FeaturesEXT*)structure;
|       |                                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2321:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT'?
|  2321 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2322:54: error: 'VK_EXT_IMAGE_ROBUSTNESS_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_IMAGE_FORMAT_LIST_EXTENSION_NAME'?
|  2322 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_IMAGE_ROBUSTNESS_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_IMAGE_FORMAT_LIST_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2323:13: error: 'VkPhysicalDeviceImageRobustnessFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceImageRobustnessFeaturesEXT'?
|  2323 |             VkPhysicalDeviceImageRobustnessFeaturesEXT* props = (VkPhysicalDeviceImageRobustnessFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceImageRobustnessFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2323:57: error: 'props' was not declared in this scope
|  2323 |             VkPhysicalDeviceImageRobustnessFeaturesEXT* props = (VkPhysicalDeviceImageRobustnessFeaturesEXT*)structure;
|       |                                                         ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2323:109: error: expected primary-expression before ')' token
|  2323 |             VkPhysicalDeviceImageRobustnessFeaturesEXT* props = (VkPhysicalDeviceImageRobustnessFeaturesEXT*)structure;
|       |                                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2383:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  2383 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2384:54: error: 'VK_EXT_PRIVATE_DATA_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_HDR_METADATA_EXTENSION_NAME'?
|  2384 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_PRIVATE_DATA_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_HDR_METADATA_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2385:13: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePrivateDataFeaturesEXT'?
|  2385 |             VkPhysicalDevicePrivateDataFeaturesEXT* props = (VkPhysicalDevicePrivateDataFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDevicePrivateDataFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2385:53: error: 'props' was not declared in this scope
|  2385 |             VkPhysicalDevicePrivateDataFeaturesEXT* props = (VkPhysicalDevicePrivateDataFeaturesEXT*)structure;
|       |                                                     ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2385:101: error: expected primary-expression before ')' token
|  2385 |             VkPhysicalDevicePrivateDataFeaturesEXT* props = (VkPhysicalDevicePrivateDataFeaturesEXT*)structure;
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2403:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  2403 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2404:54: error: 'VK_EXT_ROBUSTNESS_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEBUG_REPORT_EXTENSION_NAME'?
|  2404 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_ROBUSTNESS_2_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_DEBUG_REPORT_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2405:13: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2FeaturesEXT'?
|  2405 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceRobustness2FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2405:53: error: 'props' was not declared in this scope
|  2405 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
|       |                                                     ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2405:101: error: expected primary-expression before ')' token
|  2405 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2430:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  2430 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2431:54: error: 'VK_EXT_SHADER_ATOMIC_FLOAT_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME'?
|  2431 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_SHADER_ATOMIC_FLOAT_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2432:13: error: 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT'?
|  2432 |             VkPhysicalDeviceShaderAtomicFloatFeaturesEXT* props = (VkPhysicalDeviceShaderAtomicFloatFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2432:59: error: 'props' was not declared in this scope
|  2432 |             VkPhysicalDeviceShaderAtomicFloatFeaturesEXT* props = (VkPhysicalDeviceShaderAtomicFloatFeaturesEXT*)structure;
|       |                                                           ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2432:113: error: expected primary-expression before ')' token
|  2432 |             VkPhysicalDeviceShaderAtomicFloatFeaturesEXT* props = (VkPhysicalDeviceShaderAtomicFloatFeaturesEXT*)structure;
|       |                                                                                                                 ^
| ninja: build stopped: subcommand failed.
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/temp/run.do_compile.25463' failed with exit code 1:
| [1/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++  -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd -Iicd -I. -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan
 -tools/1.2.148.0-r0=/usr/src/debug/vulkan-tools/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0=/usr/src/debug/vulkan-tools/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builti
 n-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp
| FAILED: icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++  -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd -Iicd -I. -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools
 /1.2.148.0-r0=/usr/src/debug/vulkan-tools/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0=/usr/src/debug/vulkan-tools/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memc
 mp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:22:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.h:2022:5: error: 'VkImageViewAddressPropertiesNVX' has not been declared
|  2022 |     VkImageViewAddressPropertiesNVX*            pProperties);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.h:2804:11: error: 'VkPrivateDataSlotCreateInfoEXT' does not name a type
|  2804 |     const VkPrivateDataSlotCreateInfoEXT*       pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.h:2806:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  2806 |     VkPrivateDataSlotEXT*                       pPrivateDataSlot);
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.h:2810:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  2810 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.h:2817:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  2817 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.h:2824:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  2824 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:2214:31: error: 'VkImageViewAddressPropertiesNVX' was not declared in this scope
|  2214 | template <> struct LvlTypeMap<VkImageViewAddressPropertiesNVX> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:2214:62: error: template argument 1 is invalid
|  2214 | template <> struct LvlTypeMap<VkImageViewAddressPropertiesNVX> {
|       |                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:2218:32: error: 'VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2'?
|  2218 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:2218:83: error: template argument 1 is invalid
|  2218 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3251:43: error: 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR'?
|  3251 |     static const VkStructureType kSType = VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL;
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3254:32: error: 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR'?
|  3254 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3254:96: error: template argument 1 is invalid
|  3254 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL> {
|       |                                                                                                ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3629:31: error: 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderAtomicInt64FeaturesKHR'?
|  3629 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderAtomicFloatFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderAtomicInt64FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3629:75: error: template argument 1 is invalid
|  3629 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderAtomicFloatFeaturesEXT> {
|       |                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3633:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  3633 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3633:98: error: template argument 1 is invalid
|  3633 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT> {
|       |                                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3647:31: error: 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceIndexTypeUint8FeaturesEXT'?
|  3647 | template <> struct LvlTypeMap<VkPhysicalDeviceExtendedDynamicStateFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceIndexTypeUint8FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3647:78: error: template argument 1 is invalid
|  3647 | template <> struct LvlTypeMap<VkPhysicalDeviceExtendedDynamicStateFeaturesEXT> {
|       |                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3651:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT'?
|  3651 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3651:101: error: template argument 1 is invalid
|  3651 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT> {
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3773:31: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceHostQueryResetFeaturesEXT'?
|  3773 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2FeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceHostQueryResetFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3773:69: error: template argument 1 is invalid
|  3773 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2FeaturesEXT> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3777:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  3777 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3777:91: error: template argument 1 is invalid
|  3777 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT> {
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3782:31: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDevicePCIBusInfoPropertiesEXT'?
|  3782 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2PropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDevicePCIBusInfoPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3782:71: error: template argument 1 is invalid
|  3782 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2PropertiesEXT> {
|       |                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3786:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  3786 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3786:93: error: template argument 1 is invalid
|  3786 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT> {
|       |                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3791:31: error: 'VkSamplerCustomBorderColorCreateInfoEXT' was not declared in this scope
|  3791 | template <> struct LvlTypeMap<VkSamplerCustomBorderColorCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3791:70: error: template argument 1 is invalid
|  3791 | template <> struct LvlTypeMap<VkSamplerCustomBorderColorCreateInfoEXT> {
|       |                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3795:32: error: 'VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO_EXT'?
|  3795 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3795:93: error: template argument 1 is invalid
|  3795 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT> {
|       |                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3800:31: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceToolPropertiesEXT'?
|  3800 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorPropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceToolPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3800:77: error: template argument 1 is invalid
|  3800 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorPropertiesEXT> {
|       |                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3804:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  3804 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3804:100: error: template argument 1 is invalid
|  3804 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT> {
|       |                                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3809:31: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMemoryPriorityFeaturesEXT'?
|  3809 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMemoryPriorityFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3809:75: error: template argument 1 is invalid
|  3809 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorFeaturesEXT> {
|       |                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3813:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  3813 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3813:98: error: template argument 1 is invalid
|  3813 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT> {
|       |                                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3818:31: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceASTCDecodeFeaturesEXT'?
|  3818 | template <> struct LvlTypeMap<VkPhysicalDevicePrivateDataFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceASTCDecodeFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3818:69: error: template argument 1 is invalid
|  3818 | template <> struct LvlTypeMap<VkPhysicalDevicePrivateDataFeaturesEXT> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3822:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  3822 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3822:91: error: template argument 1 is invalid
|  3822 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT> {
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3827:31: error: 'VkDevicePrivateDataCreateInfoEXT' was not declared in this scope
|  3827 | template <> struct LvlTypeMap<VkDevicePrivateDataCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3827:63: error: template argument 1 is invalid
|  3827 | template <> struct LvlTypeMap<VkDevicePrivateDataCreateInfoEXT> {
|       |                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3831:32: error: 'VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT'?
|  3831 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3831:85: error: template argument 1 is invalid
|  3831 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT> {
|       |                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3836:31: error: 'VkPrivateDataSlotCreateInfoEXT' was not declared in this scope
|  3836 | template <> struct LvlTypeMap<VkPrivateDataSlotCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3836:61: error: template argument 1 is invalid
|  3836 | template <> struct LvlTypeMap<VkPrivateDataSlotCreateInfoEXT> {
|       |                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3840:32: error: 'VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT'?
|  3840 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3840:83: error: template argument 1 is invalid
|  3840 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3872:31: error: 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapFeaturesEXT'?
|  3872 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMap2FeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceFragmentDensityMapFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3872:77: error: template argument 1 is invalid
|  3872 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMap2FeaturesEXT> {
|       |                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3876:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT'?
|  3876 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3876:101: error: template argument 1 is invalid
|  3876 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT> {
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3881:31: error: 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapPropertiesEXT'?
|  3881 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMap2PropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceFragmentDensityMapPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3881:79: error: template argument 1 is invalid
|  3881 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMap2PropertiesEXT> {
|       |                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3885:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
|  3885 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3885:103: error: template argument 1 is invalid
|  3885 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT> {
|       |                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3890:31: error: 'VkPhysicalDeviceImageRobustnessFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceBufferAddressFeaturesEXT'?
|  3890 | template <> struct LvlTypeMap<VkPhysicalDeviceImageRobustnessFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceBufferAddressFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3890:73: error: template argument 1 is invalid
|  3890 | template <> struct LvlTypeMap<VkPhysicalDeviceImageRobustnessFeaturesEXT> {
|       |                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3894:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT'?
|  3894 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/vk_typemap_helper.h:3894:95: error: template argument 1 is invalid
|  3894 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT> {
|       |                                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:3404:5: error: 'VkImageViewAddressPropertiesNVX' has not been declared
|  3404 |     VkImageViewAddressPropertiesNVX*            pProperties)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:4603:11: error: 'VkPrivateDataSlotCreateInfoEXT' does not name a type
|  4603 |     const VkPrivateDataSlotCreateInfoEXT*       pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:4605:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  4605 |     VkPrivateDataSlotEXT*                       pPrivateDataSlot)
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp: In function 'VkResult vkmock::CreatePrivateDataSlotEXT(VkDevice, const int*, const VkAllocationCallbacks*, int*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:4608:26: error: 'VkPrivateDataSlotEXT' was not declared in this scope; did you mean 'pPrivateDataSlot'?
|  4608 |     *pPrivateDataSlot = (VkPrivateDataSlotEXT)global_unique_handle++;
|       |                          ^~~~~~~~~~~~~~~~~~~~
|       |                          pPrivateDataSlot
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:4614:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  4614 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:4624:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  4624 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/icd/generated/mock_icd.cpp:4635:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  4635 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| [2/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++  -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux
 /vulkan-tools/1.2.148.0-r0=/usr/src/debug/vulkan-tools/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0=/usr/src/debug/vulkan-tools/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno
 -builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp
| FAILED: vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++  -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulka
 n-tools/1.2.148.0-r0=/usr/src/debug/vulkan-tools/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0=/usr/src/debug/vulkan-tools/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-built
 in-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'const char* VkDriverIdString(VkDriverId)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:94:9: warning: case value '13' not in enumerated type 'VkDriverId' [-Wswitch]
|    94 |         case (13): return "DRIVER_ID_MESA_LLVMPIPE";
|       |         ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:95:9: warning: case value '14' not in enumerated type 'VkDriverId' [-Wswitch]
|    95 |         case (14): return "DRIVER_ID_MOLTENVK";
|       |         ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1015:85: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' has not been declared
|  1015 | void DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceCustomBorderColorFeaturesEXT &obj) {
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1017:64: error: request for member 'customBorderColors' in 'obj', which is of non-class type 'int'
|  1017 |     p.PrintKeyBool("customBorderColors", static_cast<bool>(obj.customBorderColors), 30);
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1018:76: error: request for member 'customBorderColorWithoutFormat' in 'obj', which is of non-class type 'int'
|  1018 |     p.PrintKeyBool("customBorderColorWithoutFormat", static_cast<bool>(obj.customBorderColorWithoutFormat), 30);
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1020:87: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' has not been declared
|  1020 | void DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT(Printer &p, std::string name, VkPhysicalDeviceCustomBorderColorPropertiesEXT &obj) {
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1022:57: error: request for member 'maxCustomBorderColorSamplers' in 'obj', which is of non-class type 'int'
|  1022 |     p.PrintKeyValue("maxCustomBorderColorSamplers", obj.maxCustomBorderColorSamplers, 28);
|       |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1095:88: error: 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT' has not been declared
|  1095 | void DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceExtendedDynamicStateFeaturesEXT &obj) {
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1097:66: error: request for member 'extendedDynamicState' in 'obj', which is of non-class type 'int'
|  1097 |     p.PrintKeyBool("extendedDynamicState", static_cast<bool>(obj.extendedDynamicState), 20);
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1181:87: error: 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT' has not been declared
|  1181 | void DumpVkPhysicalDeviceFragmentDensityMap2FeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceFragmentDensityMap2FeaturesEXT &obj) {
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceFragmentDensityMap2FeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1183:72: error: request for member 'fragmentDensityMapDeferred' in 'obj', which is of non-class type 'int'
|  1183 |     p.PrintKeyBool("fragmentDensityMapDeferred", static_cast<bool>(obj.fragmentDensityMapDeferred), 26);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1185:89: error: 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT' has not been declared
|  1185 | void DumpVkPhysicalDeviceFragmentDensityMap2PropertiesEXT(Printer &p, std::string name, VkPhysicalDeviceFragmentDensityMap2PropertiesEXT &obj) {
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceFragmentDensityMap2PropertiesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1187:61: error: request for member 'subsampledLoads' in 'obj', which is of non-class type 'int'
|  1187 |     p.PrintKeyBool("subsampledLoads", static_cast<bool>(obj.subsampledLoads), 41);
|       |                                                             ^~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1188:87: error: request for member 'subsampledCoarseReconstructionEarlyAccess' in 'obj', which is of non-class type 'int'
|  1188 |     p.PrintKeyBool("subsampledCoarseReconstructionEarlyAccess", static_cast<bool>(obj.subsampledCoarseReconstructionEarlyAccess), 41);
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1189:53: error: request for member 'maxSubsampledArrayLayers' in 'obj', which is of non-class type 'int'
|  1189 |     p.PrintKeyValue("maxSubsampledArrayLayers", obj.maxSubsampledArrayLayers, 41);
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1190:63: error: request for member 'maxDescriptorSetSubsampledSamplers' in 'obj', which is of non-class type 'int'
|  1190 |     p.PrintKeyValue("maxDescriptorSetSubsampledSamplers", obj.maxDescriptorSetSubsampledSamplers, 41);
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1222:83: error: 'VkPhysicalDeviceImageRobustnessFeaturesEXT' has not been declared
|  1222 | void DumpVkPhysicalDeviceImageRobustnessFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceImageRobustnessFeaturesEXT &obj) {
|       |                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceImageRobustnessFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1224:63: error: request for member 'robustImageAccess' in 'obj', which is of non-class type 'int'
|  1224 |     p.PrintKeyBool("robustImageAccess", static_cast<bool>(obj.robustImageAccess), 17);
|       |                                                               ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1480:79: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' has not been declared
|  1480 | void DumpVkPhysicalDevicePrivateDataFeaturesEXT(Printer &p, std::string name, VkPhysicalDevicePrivateDataFeaturesEXT &obj) {
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePrivateDataFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1482:57: error: request for member 'privateData' in 'obj', which is of non-class type 'int'
|  1482 |     p.PrintKeyBool("privateData", static_cast<bool>(obj.privateData), 11);
|       |                                                         ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1524:79: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' has not been declared
|  1524 | void DumpVkPhysicalDeviceRobustness2FeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceRobustness2FeaturesEXT &obj) {
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRobustness2FeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1526:65: error: request for member 'robustBufferAccess2' in 'obj', which is of non-class type 'int'
|  1526 |     p.PrintKeyBool("robustBufferAccess2", static_cast<bool>(obj.robustBufferAccess2), 19);
|       |                                                                 ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1527:64: error: request for member 'robustImageAccess2' in 'obj', which is of non-class type 'int'
|  1527 |     p.PrintKeyBool("robustImageAccess2", static_cast<bool>(obj.robustImageAccess2), 19);
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1528:60: error: request for member 'nullDescriptor' in 'obj', which is of non-class type 'int'
|  1528 |     p.PrintKeyBool("nullDescriptor", static_cast<bool>(obj.nullDescriptor), 19);
|       |                                                            ^~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1530:81: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' has not been declared
|  1530 | void DumpVkPhysicalDeviceRobustness2PropertiesEXT(Printer &p, std::string name, VkPhysicalDeviceRobustness2PropertiesEXT &obj) {
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRobustness2PropertiesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1532:81: error: request for member 'robustStorageBufferAccessSizeAlignment' in 'obj', which is of non-class type 'int'
|  1532 |     p.PrintKeyValue("robustStorageBufferAccessSizeAlignment", to_hex_str(p, obj.robustStorageBufferAccessSizeAlignment), 38);
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1533:81: error: request for member 'robustUniformBufferAccessSizeAlignment' in 'obj', which is of non-class type 'int'
|  1533 |     p.PrintKeyValue("robustUniformBufferAccessSizeAlignment", to_hex_str(p, obj.robustUniformBufferAccessSizeAlignment), 38);
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1563:85: error: 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT' has not been declared
|  1563 | void DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceShaderAtomicFloatFeaturesEXT &obj) {
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1565:72: error: request for member 'shaderBufferFloat32Atomics' in 'obj', which is of non-class type 'int'
|  1565 |     p.PrintKeyBool("shaderBufferFloat32Atomics", static_cast<bool>(obj.shaderBufferFloat32Atomics), 28);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1566:74: error: request for member 'shaderBufferFloat32AtomicAdd' in 'obj', which is of non-class type 'int'
|  1566 |     p.PrintKeyBool("shaderBufferFloat32AtomicAdd", static_cast<bool>(obj.shaderBufferFloat32AtomicAdd), 28);
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1567:72: error: request for member 'shaderBufferFloat64Atomics' in 'obj', which is of non-class type 'int'
|  1567 |     p.PrintKeyBool("shaderBufferFloat64Atomics", static_cast<bool>(obj.shaderBufferFloat64Atomics), 28);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1568:74: error: request for member 'shaderBufferFloat64AtomicAdd' in 'obj', which is of non-class type 'int'
|  1568 |     p.PrintKeyBool("shaderBufferFloat64AtomicAdd", static_cast<bool>(obj.shaderBufferFloat64AtomicAdd), 28);
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1569:72: error: request for member 'shaderSharedFloat32Atomics' in 'obj', which is of non-class type 'int'
|  1569 |     p.PrintKeyBool("shaderSharedFloat32Atomics", static_cast<bool>(obj.shaderSharedFloat32Atomics), 28);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1570:74: error: request for member 'shaderSharedFloat32AtomicAdd' in 'obj', which is of non-class type 'int'
|  1570 |     p.PrintKeyBool("shaderSharedFloat32AtomicAdd", static_cast<bool>(obj.shaderSharedFloat32AtomicAdd), 28);
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1571:72: error: request for member 'shaderSharedFloat64Atomics' in 'obj', which is of non-class type 'int'
|  1571 |     p.PrintKeyBool("shaderSharedFloat64Atomics", static_cast<bool>(obj.shaderSharedFloat64Atomics), 28);
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1572:74: error: request for member 'shaderSharedFloat64AtomicAdd' in 'obj', which is of non-class type 'int'
|  1572 |     p.PrintKeyBool("shaderSharedFloat64AtomicAdd", static_cast<bool>(obj.shaderSharedFloat64AtomicAdd), 28);
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1573:71: error: request for member 'shaderImageFloat32Atomics' in 'obj', which is of non-class type 'int'
|  1573 |     p.PrintKeyBool("shaderImageFloat32Atomics", static_cast<bool>(obj.shaderImageFloat32Atomics), 28);
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1574:73: error: request for member 'shaderImageFloat32AtomicAdd' in 'obj', which is of non-class type 'int'
|  1574 |     p.PrintKeyBool("shaderImageFloat32AtomicAdd", static_cast<bool>(obj.shaderImageFloat32AtomicAdd), 28);
|       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1575:71: error: request for member 'sparseImageFloat32Atomics' in 'obj', which is of non-class type 'int'
|  1575 |     p.PrintKeyBool("sparseImageFloat32Atomics", static_cast<bool>(obj.sparseImageFloat32Atomics), 28);
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1576:73: error: request for member 'sparseImageFloat32AtomicAdd' in 'obj', which is of non-class type 'int'
|  1576 |     p.PrintKeyBool("sparseImageFloat32AtomicAdd", static_cast<bool>(obj.sparseImageFloat32AtomicAdd), 28);
|       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'pNextChainInfos get_chain_infos()':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1888:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  1888 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorPropertiesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1888:87: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT'?
|  1888 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorPropertiesEXT)},
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                       DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1895:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
|  1895 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceFragmentDensityMap2PropertiesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1895:90: error: 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapPropertiesEXT'?
|  1895 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceFragmentDensityMap2PropertiesEXT)},
|       |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                          VkPhysicalDeviceFragmentDensityMapPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1910:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  1910 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceRobustness2PropertiesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1910:80: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2PropertiesEXT'?
|  1910 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceRobustness2PropertiesEXT)},
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                DumpVkPhysicalDeviceRobustness2PropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1921:5: error: no match for 'operator=' (operand types are 'std::vector<pNextChainBuildingBlockInfo>' and '<brace-enclosed initializer list>')
|  1921 |     };
|       |     ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/vector:72,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/vector.tcc:198:5: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(const std::vector<_Tp, _Alloc>&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   198 |     vector<_Tp, _Alloc>::
|       |     ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/vector.tcc:199:42: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'const std::vector<pNextChainBuildingBlockInfo>&'
|   199 |     operator=(const vector<_Tp, _Alloc>& __x)
|       |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/vector:67,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:709:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::vector<_Tp, _Alloc>&&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:709:26: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::vector<pNextChainBuildingBlockInfo>&&'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |                 ~~~~~~~~~^~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:730:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::initializer_list<_Tp>) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   730 |       operator=(initializer_list<value_type> __l)
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:730:46: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::initializer_list<pNextChainBuildingBlockInfo>'
|   730 |       operator=(initializer_list<value_type> __l)
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1933:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  1933 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1933:85: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT'?
|  1933 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorFeaturesEXT)},
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                     DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1936:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT'?
|  1936 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT, sizeof(VkPhysicalDeviceExtendedDynamicStateFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1936:88: error: 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT'?
|  1936 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT, sizeof(VkPhysicalDeviceExtendedDynamicStateFeaturesEXT)},
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                        DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1937:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT'?
|  1937 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT, sizeof(VkPhysicalDeviceFragmentDensityMap2FeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1937:88: error: 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapFeaturesEXT'?
|  1937 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT, sizeof(VkPhysicalDeviceFragmentDensityMap2FeaturesEXT)},
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                        VkPhysicalDeviceFragmentDensityMapFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1941:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT'?
|  1941 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT, sizeof(VkPhysicalDeviceImageRobustnessFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1941:82: error: 'VkPhysicalDeviceImageRobustnessFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceImageRobustnessFeaturesEXT'?
|  1941 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT, sizeof(VkPhysicalDeviceImageRobustnessFeaturesEXT)},
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                  DumpVkPhysicalDeviceImageRobustnessFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1951:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  1951 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT, sizeof(VkPhysicalDevicePrivateDataFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1951:78: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePrivateDataFeaturesEXT'?
|  1951 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT, sizeof(VkPhysicalDevicePrivateDataFeaturesEXT)},
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                              DumpVkPhysicalDevicePrivateDataFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1956:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  1956 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT, sizeof(VkPhysicalDeviceRobustness2FeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1956:78: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2FeaturesEXT'?
|  1956 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT, sizeof(VkPhysicalDeviceRobustness2FeaturesEXT)},
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                              DumpVkPhysicalDeviceRobustness2FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1960:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  1960 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT, sizeof(VkPhysicalDeviceShaderAtomicFloatFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1960:85: error: 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT'?
|  1960 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT, sizeof(VkPhysicalDeviceShaderAtomicFloatFeaturesEXT)},
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                     DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1979:5: error: no match for 'operator=' (operand types are 'std::vector<pNextChainBuildingBlockInfo>' and '<brace-enclosed initializer list>')
|  1979 |     };
|       |     ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/vector:72,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/vector.tcc:198:5: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(const std::vector<_Tp, _Alloc>&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   198 |     vector<_Tp, _Alloc>::
|       |     ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/vector.tcc:199:42: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'const std::vector<pNextChainBuildingBlockInfo>&'
|   199 |     operator=(const vector<_Tp, _Alloc>& __x)
|       |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/vector:67,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:709:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::vector<_Tp, _Alloc>&&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:709:26: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::vector<pNextChainBuildingBlockInfo>&&'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |                 ~~~~~~~~~^~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:730:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::initializer_list<_Tp>) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   730 |       operator=(initializer_list<value_type> __l)
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:730:46: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::initializer_list<pNextChainBuildingBlockInfo>'
|   730 |       operator=(initializer_list<value_type> __l)
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_props2(Printer&, AppInstance&, AppGpu&, void*, VulkanVersion)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2008:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  2008 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2009:54: error: 'VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME'?
|  2009 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2010:13: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT'?
|  2010 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2010:61: error: 'props' was not declared in this scope
|  2010 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
|       |                                                             ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2010:117: error: expected primary-expression before ')' token
|  2010 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
|       |                                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2054:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT'?
|  2054 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2055:54: error: 'VK_EXT_FRAGMENT_DENSITY_MAP_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME'?
|  2055 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_FRAGMENT_DENSITY_MAP_2_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2056:13: error: 'VkPhysicalDeviceFragmentDensityMap2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapPropertiesEXT'?
|  2056 |             VkPhysicalDeviceFragmentDensityMap2PropertiesEXT* props = (VkPhysicalDeviceFragmentDensityMap2PropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceFragmentDensityMapPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2056:63: error: 'props' was not declared in this scope
|  2056 |             VkPhysicalDeviceFragmentDensityMap2PropertiesEXT* props = (VkPhysicalDeviceFragmentDensityMap2PropertiesEXT*)structure;
|       |                                                               ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2056:121: error: expected primary-expression before ')' token
|  2056 |             VkPhysicalDeviceFragmentDensityMap2PropertiesEXT* props = (VkPhysicalDeviceFragmentDensityMap2PropertiesEXT*)structure;
|       |                                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2138:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  2138 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2139:54: error: 'VK_EXT_ROBUSTNESS_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEBUG_REPORT_EXTENSION_NAME'?
|  2139 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_ROBUSTNESS_2_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_DEBUG_REPORT_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2140:13: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2PropertiesEXT'?
|  2140 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceRobustness2PropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2140:55: error: 'props' was not declared in this scope
|  2140 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
|       |                                                       ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2140:105: error: expected primary-expression before ')' token
|  2140 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
|       |                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, void*, VulkanVersion)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2271:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  2271 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2272:54: error: 'VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME'?
|  2272 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2273:13: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT'?
|  2273 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2273:59: error: 'props' was not declared in this scope
|  2273 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
|       |                                                           ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2273:113: error: expected primary-expression before ')' token
|  2273 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
|       |                                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2290:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT'?
|  2290 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2291:54: error: 'VK_EXT_EXTENDED_DYNAMIC_STATE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_INDEX_TYPE_UINT8_EXTENSION_NAME'?
|  2291 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_EXTENDED_DYNAMIC_STATE_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_INDEX_TYPE_UINT8_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2292:13: error: 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT'?
|  2292 |             VkPhysicalDeviceExtendedDynamicStateFeaturesEXT* props = (VkPhysicalDeviceExtendedDynamicStateFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceExtendedDynamicStateFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2292:62: error: 'props' was not declared in this scope
|  2292 |             VkPhysicalDeviceExtendedDynamicStateFeaturesEXT* props = (VkPhysicalDeviceExtendedDynamicStateFeaturesEXT*)structure;
|       |                                                              ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2292:119: error: expected primary-expression before ')' token
|  2292 |             VkPhysicalDeviceExtendedDynamicStateFeaturesEXT* props = (VkPhysicalDeviceExtendedDynamicStateFeaturesEXT*)structure;
|       |                                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2296:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT'?
|  2296 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2297:54: error: 'VK_EXT_FRAGMENT_DENSITY_MAP_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME'?
|  2297 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_FRAGMENT_DENSITY_MAP_2_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2298:13: error: 'VkPhysicalDeviceFragmentDensityMap2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapFeaturesEXT'?
|  2298 |             VkPhysicalDeviceFragmentDensityMap2FeaturesEXT* props = (VkPhysicalDeviceFragmentDensityMap2FeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceFragmentDensityMapFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2298:61: error: 'props' was not declared in this scope
|  2298 |             VkPhysicalDeviceFragmentDensityMap2FeaturesEXT* props = (VkPhysicalDeviceFragmentDensityMap2FeaturesEXT*)structure;
|       |                                                             ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2298:117: error: expected primary-expression before ')' token
|  2298 |             VkPhysicalDeviceFragmentDensityMap2FeaturesEXT* props = (VkPhysicalDeviceFragmentDensityMap2FeaturesEXT*)structure;
|       |                                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2321:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT'?
|  2321 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2322:54: error: 'VK_EXT_IMAGE_ROBUSTNESS_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_IMAGE_FORMAT_LIST_EXTENSION_NAME'?
|  2322 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_IMAGE_ROBUSTNESS_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_IMAGE_FORMAT_LIST_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2323:13: error: 'VkPhysicalDeviceImageRobustnessFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceImageRobustnessFeaturesEXT'?
|  2323 |             VkPhysicalDeviceImageRobustnessFeaturesEXT* props = (VkPhysicalDeviceImageRobustnessFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceImageRobustnessFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2323:57: error: 'props' was not declared in this scope
|  2323 |             VkPhysicalDeviceImageRobustnessFeaturesEXT* props = (VkPhysicalDeviceImageRobustnessFeaturesEXT*)structure;
|       |                                                         ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2323:109: error: expected primary-expression before ')' token
|  2323 |             VkPhysicalDeviceImageRobustnessFeaturesEXT* props = (VkPhysicalDeviceImageRobustnessFeaturesEXT*)structure;
|       |                                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2383:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  2383 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2384:54: error: 'VK_EXT_PRIVATE_DATA_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_HDR_METADATA_EXTENSION_NAME'?
|  2384 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_PRIVATE_DATA_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_HDR_METADATA_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2385:13: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePrivateDataFeaturesEXT'?
|  2385 |             VkPhysicalDevicePrivateDataFeaturesEXT* props = (VkPhysicalDevicePrivateDataFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDevicePrivateDataFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2385:53: error: 'props' was not declared in this scope
|  2385 |             VkPhysicalDevicePrivateDataFeaturesEXT* props = (VkPhysicalDevicePrivateDataFeaturesEXT*)structure;
|       |                                                     ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2385:101: error: expected primary-expression before ')' token
|  2385 |             VkPhysicalDevicePrivateDataFeaturesEXT* props = (VkPhysicalDevicePrivateDataFeaturesEXT*)structure;
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2403:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  2403 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2404:54: error: 'VK_EXT_ROBUSTNESS_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEBUG_REPORT_EXTENSION_NAME'?
|  2404 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_ROBUSTNESS_2_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_DEBUG_REPORT_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2405:13: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2FeaturesEXT'?
|  2405 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceRobustness2FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2405:53: error: 'props' was not declared in this scope
|  2405 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
|       |                                                     ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2405:101: error: expected primary-expression before ')' token
|  2405 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2430:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  2430 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2431:54: error: 'VK_EXT_SHADER_ATOMIC_FLOAT_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME'?
|  2431 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_SHADER_ATOMIC_FLOAT_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2432:13: error: 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT'?
|  2432 |             VkPhysicalDeviceShaderAtomicFloatFeaturesEXT* props = (VkPhysicalDeviceShaderAtomicFloatFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceShaderAtomicFloatFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2432:59: error: 'props' was not declared in this scope
|  2432 |             VkPhysicalDeviceShaderAtomicFloatFeaturesEXT* props = (VkPhysicalDeviceShaderAtomicFloatFeaturesEXT*)structure;
|       |                                                           ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.148.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2432:113: error: expected primary-expression before ')' token
|  2432 |             VkPhysicalDeviceShaderAtomicFloatFeaturesEXT* props = (VkPhysicalDeviceShaderAtomicFloatFeaturesEXT*)structure;
|       |                                                                                                                 ^
| ninja: build stopped: subcommand failed.
| WARNING: exit code 1 from a shell command.
| 
NOTE: recipe vulkan-tools-1.2.148.0-r0: task do_compile: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.148.0.bb:do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2441 tasks of which 2432 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.148.0.bb:do_compile
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============4948552996951478716==--
