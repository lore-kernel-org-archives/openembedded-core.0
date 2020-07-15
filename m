Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.106.1594831465794202982
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 09:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A6043E01E97; Wed, 15 Jul 2020 09:44:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 31C24E01ED1
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 09:43:02 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.2.141.0 FAILED
Message-Id: <20200715164425.A6043E01E97@yocto-www.yoctoproject.org>
Date: Wed, 15 Jul 2020 09:44:25 -0700 (PDT)
X-Groupsio-MsgNum: 140680
Content-Type: multipart/mixed; boundary="===============2840243931849933204=="

--===============2840243931849933204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-tools* to *1.2.141.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.2.135.0-1.2.141.0.patch
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

--===============2840243931849933204==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.2.135.0-1.2.141.0.patch"

From dfff23ca59cab08699a3116ad1f8d507c1722aba Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Wed, 15 Jul 2020 12:12:52 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.2.135.0 -> 1.2.141.0

---
 .../{vulkan-tools_1.2.135.0.bb => vulkan-tools_1.2.141.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.2.135.0.bb => vulkan-tools_1.2.141.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.135.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.141.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.2.135.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.2.141.0.bb
index 085c0e27e9..cd45f9aad7 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.135.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.141.0.bb
@@ -5,8 +5,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.135"
-SRCREV = "6d8197fd6c91d352a601587ffdde28f4cd7bc399"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.141"
+SRCREV = "9722db2abcb42a62bc24263bea7a5dbffa948f90"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


--===============2840243931849933204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1339 entries from dependency cache.
Parsing recipes...done.
Parsing of 778 .bb files complete (777 cached, 1 parsed). 1339 targets, 33 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.1+snapshot-20200715"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f91c96c8034d83aa0d585741a8e7eda65521b9f8"
workspace            = "master:ca701cb92dcf186664d9b1f82c679e4f9cc388ec"

Initialising tasks...done.
Sstate summary: Wanted 256 Found 248 Missed 8 Current 535 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1638 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.141.0.bb:do_fetch)
NOTE: recipe vulkan-tools-1.2.141.0-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.2.141.0-r0: task do_fetch: Succeeded
NOTE: Running task 2019 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.141.0.bb:do_unpack)
NOTE: Running task 2020 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.141.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.2.141.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.2.141.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.2.141.0-r0: task do_unpack: Succeeded
NOTE: Running task 2431 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.141.0.bb:do_patch)
NOTE: recipe vulkan-tools-1.2.141.0-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.2.141.0-r0: task do_patch: Succeeded
NOTE: Running task 2432 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.141.0.bb:do_generate_toolchain_file)
NOTE: Running task 2433 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.141.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2434 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.141.0.bb:do_populate_lic)
NOTE: recipe vulkan-tools-1.2.141.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.2.141.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.2.141.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.2.141.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-tools-1.2.141.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.2.141.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2435 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.141.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.2.141.0-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-tools-1.2.141.0-r0: task do_configure: Started
NOTE: recipe vulkan-tools-1.2.141.0-r0: task do_configure: Succeeded
NOTE: Running task 2436 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.141.0.bb:do_compile)
NOTE: recipe vulkan-tools-1.2.141.0-r0: task do_compile: Started
ERROR: vulkan-tools-1.2.141.0-r0 do_compile: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/temp/run.do_compile.1175' failed with exit code 1:
[1/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++  -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd -Iicd -I. -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-t
 ools/1.2.141.0-r0=/usr/src/debug/vulkan-tools/1.2.141.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0=/usr/src/debug/vulkan-tools/1.2.141.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-
 memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp
FAILED: icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++  -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd -Iicd -I. -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1
 .2.141.0-r0=/usr/src/debug/vulkan-tools/1.2.141.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0=/usr/src/debug/vulkan-tools/1.2.141.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp
  -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:22:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.h:2017:5: error: 'VkImageViewAddressPropertiesNVX' has not been declared
 2017 |     VkImageViewAddressPropertiesNVX*            pProperties);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.h:2738:11: error: 'VkPrivateDataSlotCreateInfoEXT' does not name a type
 2738 |     const VkPrivateDataSlotCreateInfoEXT*       pCreateInfo,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.h:2740:5: error: 'VkPrivateDataSlotEXT' has not been declared
 2740 |     VkPrivateDataSlotEXT*                       pPrivateDataSlot);
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.h:2744:5: error: 'VkPrivateDataSlotEXT' has not been declared
 2744 |     VkPrivateDataSlotEXT                        privateDataSlot,
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.h:2751:5: error: 'VkPrivateDataSlotEXT' has not been declared
 2751 |     VkPrivateDataSlotEXT                        privateDataSlot,
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.h:2758:5: error: 'VkPrivateDataSlotEXT' has not been declared
 2758 |     VkPrivateDataSlotEXT                        privateDataSlot,
      |     ^~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:27:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:2214:31: error: 'VkImageViewAddressPropertiesNVX' was not declared in this scope
 2214 | template <> struct LvlTypeMap<VkImageViewAddressPropertiesNVX> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:2214:62: error: template argument 1 is invalid
 2214 | template <> struct LvlTypeMap<VkImageViewAddressPropertiesNVX> {
      |                                                              ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:2218:32: error: 'VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2'?
 2218 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:2218:83: error: template argument 1 is invalid
 2218 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX> {
      |                                                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3251:43: error: 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR'?
 3251 |     static const VkStructureType kSType = VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL;
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                           VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3254:32: error: 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR'?
 3254 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3254:96: error: template argument 1 is invalid
 3254 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL> {
      |                                                                                                ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3755:31: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceHostQueryResetFeaturesEXT'?
 3755 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2FeaturesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceHostQueryResetFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3755:69: error: template argument 1 is invalid
 3755 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2FeaturesEXT> {
      |                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3759:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 3759 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3759:91: error: template argument 1 is invalid
 3759 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT> {
      |                                                                                           ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3764:31: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDevicePCIBusInfoPropertiesEXT'?
 3764 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2PropertiesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDevicePCIBusInfoPropertiesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3764:71: error: template argument 1 is invalid
 3764 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2PropertiesEXT> {
      |                                                                       ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3768:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
 3768 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3768:93: error: template argument 1 is invalid
 3768 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT> {
      |                                                                                             ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3773:31: error: 'VkSamplerCustomBorderColorCreateInfoEXT' was not declared in this scope
 3773 | template <> struct LvlTypeMap<VkSamplerCustomBorderColorCreateInfoEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3773:70: error: template argument 1 is invalid
 3773 | template <> struct LvlTypeMap<VkSamplerCustomBorderColorCreateInfoEXT> {
      |                                                                      ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3777:32: error: 'VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO_EXT'?
 3777 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3777:93: error: template argument 1 is invalid
 3777 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT> {
      |                                                                                             ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3782:31: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceToolPropertiesEXT'?
 3782 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorPropertiesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceToolPropertiesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3782:77: error: template argument 1 is invalid
 3782 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorPropertiesEXT> {
      |                                                                             ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3786:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
 3786 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3786:100: error: template argument 1 is invalid
 3786 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT> {
      |                                                                                                    ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3791:31: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMemoryPriorityFeaturesEXT'?
 3791 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorFeaturesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceMemoryPriorityFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3791:75: error: template argument 1 is invalid
 3791 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorFeaturesEXT> {
      |                                                                           ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3795:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 3795 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3795:98: error: template argument 1 is invalid
 3795 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT> {
      |                                                                                                  ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3800:31: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceASTCDecodeFeaturesEXT'?
 3800 | template <> struct LvlTypeMap<VkPhysicalDevicePrivateDataFeaturesEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               VkPhysicalDeviceASTCDecodeFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3800:69: error: template argument 1 is invalid
 3800 | template <> struct LvlTypeMap<VkPhysicalDevicePrivateDataFeaturesEXT> {
      |                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3804:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 3804 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3804:91: error: template argument 1 is invalid
 3804 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT> {
      |                                                                                           ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3809:31: error: 'VkDevicePrivateDataCreateInfoEXT' was not declared in this scope
 3809 | template <> struct LvlTypeMap<VkDevicePrivateDataCreateInfoEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3809:63: error: template argument 1 is invalid
 3809 | template <> struct LvlTypeMap<VkDevicePrivateDataCreateInfoEXT> {
      |                                                               ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3813:32: error: 'VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT'?
 3813 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3813:85: error: template argument 1 is invalid
 3813 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT> {
      |                                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3818:31: error: 'VkPrivateDataSlotCreateInfoEXT' was not declared in this scope
 3818 | template <> struct LvlTypeMap<VkPrivateDataSlotCreateInfoEXT> {
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3818:61: error: template argument 1 is invalid
 3818 | template <> struct LvlTypeMap<VkPrivateDataSlotCreateInfoEXT> {
      |                                                             ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3822:32: error: 'VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT'?
 3822 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT> {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                VK_STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3822:83: error: template argument 1 is invalid
 3822 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT> {
      |                                                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:3402:5: error: 'VkImageViewAddressPropertiesNVX' has not been declared
 3402 |     VkImageViewAddressPropertiesNVX*            pProperties)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:4504:11: error: 'VkPrivateDataSlotCreateInfoEXT' does not name a type
 4504 |     const VkPrivateDataSlotCreateInfoEXT*       pCreateInfo,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:4506:5: error: 'VkPrivateDataSlotEXT' has not been declared
 4506 |     VkPrivateDataSlotEXT*                       pPrivateDataSlot)
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp: In function 'VkResult vkmock::CreatePrivateDataSlotEXT(VkDevice, const int*, const VkAllocationCallbacks*, int*)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:4509:26: error: 'VkPrivateDataSlotEXT' was not declared in this scope; did you mean 'pPrivateDataSlot'?
 4509 |     *pPrivateDataSlot = (VkPrivateDataSlotEXT)global_unique_handle++;
      |                          ^~~~~~~~~~~~~~~~~~~~
      |                          pPrivateDataSlot
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:4515:5: error: 'VkPrivateDataSlotEXT' has not been declared
 4515 |     VkPrivateDataSlotEXT                        privateDataSlot,
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:4525:5: error: 'VkPrivateDataSlotEXT' has not been declared
 4525 |     VkPrivateDataSlotEXT                        privateDataSlot,
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:4536:5: error: 'VkPrivateDataSlotEXT' has not been declared
 4536 |     VkPrivateDataSlotEXT                        privateDataSlot,
      |     ^~~~~~~~~~~~~~~~~~~~
[2/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++  -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/v
 ulkan-tools/1.2.141.0-r0=/usr/src/debug/vulkan-tools/1.2.141.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0=/usr/src/debug/vulkan-tools/1.2.141.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-b
 uiltin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp
FAILED: vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++  -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-
 tools/1.2.141.0-r0=/usr/src/debug/vulkan-tools/1.2.141.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0=/usr/src/debug/vulkan-tools/1.2.141.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin
 -memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'const char* VkDriverIdString(VkDriverId)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:416:9: warning: case value '13' not in enumerated type 'VkDriverId' [-Wswitch]
  416 |         case (13): return "DRIVER_ID_MESA_LLVMPIPE";
      |         ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1792:79: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' has not been declared
 1792 | void DumpVkPhysicalDeviceRobustness2FeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceRobustness2FeaturesEXT &obj) {
      |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRobustness2FeaturesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1794:65: error: request for member 'robustBufferAccess2' in 'obj', which is of non-class type 'int'
 1794 |     p.PrintKeyBool("robustBufferAccess2", static_cast<bool>(obj.robustBufferAccess2), 19);
      |                                                                 ^~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1795:64: error: request for member 'robustImageAccess2' in 'obj', which is of non-class type 'int'
 1795 |     p.PrintKeyBool("robustImageAccess2", static_cast<bool>(obj.robustImageAccess2), 19);
      |                                                                ^~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1796:60: error: request for member 'nullDescriptor' in 'obj', which is of non-class type 'int'
 1796 |     p.PrintKeyBool("nullDescriptor", static_cast<bool>(obj.nullDescriptor), 19);
      |                                                            ^~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1798:81: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' has not been declared
 1798 | void DumpVkPhysicalDeviceRobustness2PropertiesEXT(Printer &p, std::string name, VkPhysicalDeviceRobustness2PropertiesEXT &obj) {
      |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRobustness2PropertiesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1800:81: error: request for member 'robustStorageBufferAccessSizeAlignment' in 'obj', which is of non-class type 'int'
 1800 |     p.PrintKeyValue("robustStorageBufferAccessSizeAlignment", to_hex_str(p, obj.robustStorageBufferAccessSizeAlignment), 38);
      |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1801:81: error: request for member 'robustUniformBufferAccessSizeAlignment' in 'obj', which is of non-class type 'int'
 1801 |     p.PrintKeyValue("robustUniformBufferAccessSizeAlignment", to_hex_str(p, obj.robustUniformBufferAccessSizeAlignment), 38);
      |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1803:87: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' has not been declared
 1803 | void DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT(Printer &p, std::string name, VkPhysicalDeviceCustomBorderColorPropertiesEXT &obj) {
      |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1805:57: error: request for member 'maxCustomBorderColorSamplers' in 'obj', which is of non-class type 'int'
 1805 |     p.PrintKeyValue("maxCustomBorderColorSamplers", obj.maxCustomBorderColorSamplers, 28);
      |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1807:85: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' has not been declared
 1807 | void DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceCustomBorderColorFeaturesEXT &obj) {
      |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT(Printer&, std::string, int&)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1809:64: error: request for member 'customBorderColors' in 'obj', which is of non-class type 'int'
 1809 |     p.PrintKeyBool("customBorderColors", static_cast<bool>(obj.customBorderColors), 30);
      |                                                                ^~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1810:76: error: request for member 'customBorderColorWithoutFormat' in 'obj', which is of non-class type 'int'
 1810 |     p.PrintKeyBool("customBorderColorWithoutFormat", static_cast<bool>(obj.customBorderColorWithoutFormat), 30);
      |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'pNextChainInfos get_chain_infos()':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1849:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
 1849 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorPropertiesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1849:87: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT'?
 1849 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorPropertiesEXT)},
      |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                       DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1870:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
 1870 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceRobustness2PropertiesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1870:80: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2PropertiesEXT'?
 1870 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceRobustness2PropertiesEXT)},
      |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                DumpVkPhysicalDeviceRobustness2PropertiesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1881:5: error: no match for 'operator=' (operand types are 'std::vector<pNextChainBuildingBlockInfo>' and '<brace-enclosed initializer list>')
 1881 |     };
      |     ^
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/vector:72,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.h:39,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/vector.tcc:198:5: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(const std::vector<_Tp, _Alloc>&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
  198 |     vector<_Tp, _Alloc>::
      |     ^~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/vector.tcc:199:42: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'const std::vector<pNextChainBuildingBlockInfo>&'
  199 |     operator=(const vector<_Tp, _Alloc>& __x)
      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/vector:67,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.h:39,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:709:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::vector<_Tp, _Alloc>&&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
  709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
      |       ^~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:709:26: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::vector<pNextChainBuildingBlockInfo>&&'
  709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
      |                 ~~~~~~~~~^~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:730:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::initializer_list<_Tp>) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
  730 |       operator=(initializer_list<value_type> __l)
      |       ^~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:730:46: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::initializer_list<pNextChainBuildingBlockInfo>'
  730 |       operator=(initializer_list<value_type> __l)
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1893:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 1893 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorFeaturesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1893:85: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT'?
 1893 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorFeaturesEXT)},
      |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                                     DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1912:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 1912 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT, sizeof(VkPhysicalDeviceRobustness2FeaturesEXT)},
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1912:78: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2FeaturesEXT'?
 1912 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT, sizeof(VkPhysicalDeviceRobustness2FeaturesEXT)},
      |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                                              DumpVkPhysicalDeviceRobustness2FeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1934:5: error: no match for 'operator=' (operand types are 'std::vector<pNextChainBuildingBlockInfo>' and '<brace-enclosed initializer list>')
 1934 |     };
      |     ^
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/vector:72,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.h:39,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/vector.tcc:198:5: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(const std::vector<_Tp, _Alloc>&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
  198 |     vector<_Tp, _Alloc>::
      |     ^~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/vector.tcc:199:42: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'const std::vector<pNextChainBuildingBlockInfo>&'
  199 |     operator=(const vector<_Tp, _Alloc>& __x)
      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/vector:67,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.h:39,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:709:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::vector<_Tp, _Alloc>&&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
  709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
      |       ^~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:709:26: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::vector<pNextChainBuildingBlockInfo>&&'
  709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
      |                 ~~~~~~~~~^~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:730:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::initializer_list<_Tp>) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
  730 |       operator=(initializer_list<value_type> __l)
      |       ^~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:730:46: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::initializer_list<pNextChainBuildingBlockInfo>'
  730 |       operator=(initializer_list<value_type> __l)
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_props2(Printer&, AppInstance&, AppGpu&, void*, VulkanVersion)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2135:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
 2135 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2136:54: error: 'VK_EXT_ROBUSTNESS_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEBUG_REPORT_EXTENSION_NAME'?
 2136 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_ROBUSTNESS_2_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_EXT_DEBUG_REPORT_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2137:13: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2PropertiesEXT'?
 2137 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceRobustness2PropertiesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2137:55: error: 'props' was not declared in this scope
 2137 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
      |                                                       ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2137:105: error: expected primary-expression before ')' token
 2137 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
      |                                                                                                         ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2141:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
 2141 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2142:54: error: 'VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME'?
 2142 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2143:13: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT'?
 2143 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2143:61: error: 'props' was not declared in this scope
 2143 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
      |                                                             ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2143:117: error: expected primary-expression before ')' token
 2143 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
      |                                                                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, void*, VulkanVersion)':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2444:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 2444 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2445:54: error: 'VK_EXT_ROBUSTNESS_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEBUG_REPORT_EXTENSION_NAME'?
 2445 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_ROBUSTNESS_2_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_EXT_DEBUG_REPORT_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2446:13: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2FeaturesEXT'?
 2446 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceRobustness2FeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2446:53: error: 'props' was not declared in this scope
 2446 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
      |                                                     ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2446:101: error: expected primary-expression before ')' token
 2446 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
      |                                                                                                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2450:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
 2450 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT &&
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2451:54: error: 'VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME'?
 2451 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME))) {
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                      VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2452:13: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT'?
 2452 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2452:59: error: 'props' was not declared in this scope
 2452 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
      |                                                           ^~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2452:113: error: expected primary-expression before ')' token
 2452 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
      |                                                                                                                 ^
ninja: build stopped: subcommand failed.
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/temp/log.do_compile.1175
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/build --target all --
| [1/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++  -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd -Iicd -I. -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan
 -tools/1.2.141.0-r0=/usr/src/debug/vulkan-tools/1.2.141.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0=/usr/src/debug/vulkan-tools/1.2.141.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builti
 n-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp
| FAILED: icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++  -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd -Iicd -I. -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools
 /1.2.141.0-r0=/usr/src/debug/vulkan-tools/1.2.141.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0=/usr/src/debug/vulkan-tools/1.2.141.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memc
 mp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:22:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.h:2017:5: error: 'VkImageViewAddressPropertiesNVX' has not been declared
|  2017 |     VkImageViewAddressPropertiesNVX*            pProperties);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.h:2738:11: error: 'VkPrivateDataSlotCreateInfoEXT' does not name a type
|  2738 |     const VkPrivateDataSlotCreateInfoEXT*       pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.h:2740:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  2740 |     VkPrivateDataSlotEXT*                       pPrivateDataSlot);
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.h:2744:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  2744 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.h:2751:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  2751 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.h:2758:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  2758 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:2214:31: error: 'VkImageViewAddressPropertiesNVX' was not declared in this scope
|  2214 | template <> struct LvlTypeMap<VkImageViewAddressPropertiesNVX> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:2214:62: error: template argument 1 is invalid
|  2214 | template <> struct LvlTypeMap<VkImageViewAddressPropertiesNVX> {
|       |                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:2218:32: error: 'VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2'?
|  2218 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:2218:83: error: template argument 1 is invalid
|  2218 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3251:43: error: 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR'?
|  3251 |     static const VkStructureType kSType = VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL;
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3254:32: error: 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR'?
|  3254 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3254:96: error: template argument 1 is invalid
|  3254 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL> {
|       |                                                                                                ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3755:31: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceHostQueryResetFeaturesEXT'?
|  3755 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2FeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceHostQueryResetFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3755:69: error: template argument 1 is invalid
|  3755 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2FeaturesEXT> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3759:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  3759 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3759:91: error: template argument 1 is invalid
|  3759 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT> {
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3764:31: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDevicePCIBusInfoPropertiesEXT'?
|  3764 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2PropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDevicePCIBusInfoPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3764:71: error: template argument 1 is invalid
|  3764 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2PropertiesEXT> {
|       |                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3768:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  3768 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3768:93: error: template argument 1 is invalid
|  3768 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT> {
|       |                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3773:31: error: 'VkSamplerCustomBorderColorCreateInfoEXT' was not declared in this scope
|  3773 | template <> struct LvlTypeMap<VkSamplerCustomBorderColorCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3773:70: error: template argument 1 is invalid
|  3773 | template <> struct LvlTypeMap<VkSamplerCustomBorderColorCreateInfoEXT> {
|       |                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3777:32: error: 'VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO_EXT'?
|  3777 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3777:93: error: template argument 1 is invalid
|  3777 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT> {
|       |                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3782:31: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceToolPropertiesEXT'?
|  3782 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorPropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceToolPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3782:77: error: template argument 1 is invalid
|  3782 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorPropertiesEXT> {
|       |                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3786:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  3786 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3786:100: error: template argument 1 is invalid
|  3786 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT> {
|       |                                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3791:31: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMemoryPriorityFeaturesEXT'?
|  3791 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMemoryPriorityFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3791:75: error: template argument 1 is invalid
|  3791 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorFeaturesEXT> {
|       |                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3795:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  3795 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3795:98: error: template argument 1 is invalid
|  3795 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT> {
|       |                                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3800:31: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceASTCDecodeFeaturesEXT'?
|  3800 | template <> struct LvlTypeMap<VkPhysicalDevicePrivateDataFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceASTCDecodeFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3800:69: error: template argument 1 is invalid
|  3800 | template <> struct LvlTypeMap<VkPhysicalDevicePrivateDataFeaturesEXT> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3804:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  3804 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3804:91: error: template argument 1 is invalid
|  3804 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT> {
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3809:31: error: 'VkDevicePrivateDataCreateInfoEXT' was not declared in this scope
|  3809 | template <> struct LvlTypeMap<VkDevicePrivateDataCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3809:63: error: template argument 1 is invalid
|  3809 | template <> struct LvlTypeMap<VkDevicePrivateDataCreateInfoEXT> {
|       |                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3813:32: error: 'VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT'?
|  3813 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3813:85: error: template argument 1 is invalid
|  3813 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT> {
|       |                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3818:31: error: 'VkPrivateDataSlotCreateInfoEXT' was not declared in this scope
|  3818 | template <> struct LvlTypeMap<VkPrivateDataSlotCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3818:61: error: template argument 1 is invalid
|  3818 | template <> struct LvlTypeMap<VkPrivateDataSlotCreateInfoEXT> {
|       |                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3822:32: error: 'VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT'?
|  3822 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3822:83: error: template argument 1 is invalid
|  3822 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:3402:5: error: 'VkImageViewAddressPropertiesNVX' has not been declared
|  3402 |     VkImageViewAddressPropertiesNVX*            pProperties)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:4504:11: error: 'VkPrivateDataSlotCreateInfoEXT' does not name a type
|  4504 |     const VkPrivateDataSlotCreateInfoEXT*       pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:4506:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  4506 |     VkPrivateDataSlotEXT*                       pPrivateDataSlot)
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp: In function 'VkResult vkmock::CreatePrivateDataSlotEXT(VkDevice, const int*, const VkAllocationCallbacks*, int*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:4509:26: error: 'VkPrivateDataSlotEXT' was not declared in this scope; did you mean 'pPrivateDataSlot'?
|  4509 |     *pPrivateDataSlot = (VkPrivateDataSlotEXT)global_unique_handle++;
|       |                          ^~~~~~~~~~~~~~~~~~~~
|       |                          pPrivateDataSlot
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:4515:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  4515 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:4525:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  4525 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:4536:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  4536 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| [2/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++  -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux
 /vulkan-tools/1.2.141.0-r0=/usr/src/debug/vulkan-tools/1.2.141.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0=/usr/src/debug/vulkan-tools/1.2.141.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno
 -builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp
| FAILED: vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++  -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulka
 n-tools/1.2.141.0-r0=/usr/src/debug/vulkan-tools/1.2.141.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0=/usr/src/debug/vulkan-tools/1.2.141.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-built
 in-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'const char* VkDriverIdString(VkDriverId)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:416:9: warning: case value '13' not in enumerated type 'VkDriverId' [-Wswitch]
|   416 |         case (13): return "DRIVER_ID_MESA_LLVMPIPE";
|       |         ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1792:79: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' has not been declared
|  1792 | void DumpVkPhysicalDeviceRobustness2FeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceRobustness2FeaturesEXT &obj) {
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRobustness2FeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1794:65: error: request for member 'robustBufferAccess2' in 'obj', which is of non-class type 'int'
|  1794 |     p.PrintKeyBool("robustBufferAccess2", static_cast<bool>(obj.robustBufferAccess2), 19);
|       |                                                                 ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1795:64: error: request for member 'robustImageAccess2' in 'obj', which is of non-class type 'int'
|  1795 |     p.PrintKeyBool("robustImageAccess2", static_cast<bool>(obj.robustImageAccess2), 19);
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1796:60: error: request for member 'nullDescriptor' in 'obj', which is of non-class type 'int'
|  1796 |     p.PrintKeyBool("nullDescriptor", static_cast<bool>(obj.nullDescriptor), 19);
|       |                                                            ^~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1798:81: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' has not been declared
|  1798 | void DumpVkPhysicalDeviceRobustness2PropertiesEXT(Printer &p, std::string name, VkPhysicalDeviceRobustness2PropertiesEXT &obj) {
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRobustness2PropertiesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1800:81: error: request for member 'robustStorageBufferAccessSizeAlignment' in 'obj', which is of non-class type 'int'
|  1800 |     p.PrintKeyValue("robustStorageBufferAccessSizeAlignment", to_hex_str(p, obj.robustStorageBufferAccessSizeAlignment), 38);
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1801:81: error: request for member 'robustUniformBufferAccessSizeAlignment' in 'obj', which is of non-class type 'int'
|  1801 |     p.PrintKeyValue("robustUniformBufferAccessSizeAlignment", to_hex_str(p, obj.robustUniformBufferAccessSizeAlignment), 38);
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1803:87: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' has not been declared
|  1803 | void DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT(Printer &p, std::string name, VkPhysicalDeviceCustomBorderColorPropertiesEXT &obj) {
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1805:57: error: request for member 'maxCustomBorderColorSamplers' in 'obj', which is of non-class type 'int'
|  1805 |     p.PrintKeyValue("maxCustomBorderColorSamplers", obj.maxCustomBorderColorSamplers, 28);
|       |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1807:85: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' has not been declared
|  1807 | void DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceCustomBorderColorFeaturesEXT &obj) {
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1809:64: error: request for member 'customBorderColors' in 'obj', which is of non-class type 'int'
|  1809 |     p.PrintKeyBool("customBorderColors", static_cast<bool>(obj.customBorderColors), 30);
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1810:76: error: request for member 'customBorderColorWithoutFormat' in 'obj', which is of non-class type 'int'
|  1810 |     p.PrintKeyBool("customBorderColorWithoutFormat", static_cast<bool>(obj.customBorderColorWithoutFormat), 30);
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'pNextChainInfos get_chain_infos()':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1849:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  1849 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorPropertiesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1849:87: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT'?
|  1849 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorPropertiesEXT)},
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                       DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1870:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  1870 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceRobustness2PropertiesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1870:80: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2PropertiesEXT'?
|  1870 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceRobustness2PropertiesEXT)},
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                DumpVkPhysicalDeviceRobustness2PropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1881:5: error: no match for 'operator=' (operand types are 'std::vector<pNextChainBuildingBlockInfo>' and '<brace-enclosed initializer list>')
|  1881 |     };
|       |     ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/vector:72,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/vector.tcc:198:5: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(const std::vector<_Tp, _Alloc>&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   198 |     vector<_Tp, _Alloc>::
|       |     ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/vector.tcc:199:42: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'const std::vector<pNextChainBuildingBlockInfo>&'
|   199 |     operator=(const vector<_Tp, _Alloc>& __x)
|       |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/vector:67,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:709:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::vector<_Tp, _Alloc>&&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:709:26: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::vector<pNextChainBuildingBlockInfo>&&'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |                 ~~~~~~~~~^~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:730:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::initializer_list<_Tp>) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   730 |       operator=(initializer_list<value_type> __l)
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:730:46: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::initializer_list<pNextChainBuildingBlockInfo>'
|   730 |       operator=(initializer_list<value_type> __l)
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1893:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  1893 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1893:85: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT'?
|  1893 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorFeaturesEXT)},
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                     DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1912:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  1912 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT, sizeof(VkPhysicalDeviceRobustness2FeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1912:78: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2FeaturesEXT'?
|  1912 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT, sizeof(VkPhysicalDeviceRobustness2FeaturesEXT)},
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                              DumpVkPhysicalDeviceRobustness2FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1934:5: error: no match for 'operator=' (operand types are 'std::vector<pNextChainBuildingBlockInfo>' and '<brace-enclosed initializer list>')
|  1934 |     };
|       |     ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/vector:72,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/vector.tcc:198:5: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(const std::vector<_Tp, _Alloc>&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   198 |     vector<_Tp, _Alloc>::
|       |     ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/vector.tcc:199:42: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'const std::vector<pNextChainBuildingBlockInfo>&'
|   199 |     operator=(const vector<_Tp, _Alloc>& __x)
|       |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/vector:67,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:709:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::vector<_Tp, _Alloc>&&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:709:26: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::vector<pNextChainBuildingBlockInfo>&&'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |                 ~~~~~~~~~^~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:730:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::initializer_list<_Tp>) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   730 |       operator=(initializer_list<value_type> __l)
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:730:46: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::initializer_list<pNextChainBuildingBlockInfo>'
|   730 |       operator=(initializer_list<value_type> __l)
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_props2(Printer&, AppInstance&, AppGpu&, void*, VulkanVersion)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2135:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  2135 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2136:54: error: 'VK_EXT_ROBUSTNESS_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEBUG_REPORT_EXTENSION_NAME'?
|  2136 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_ROBUSTNESS_2_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_DEBUG_REPORT_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2137:13: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2PropertiesEXT'?
|  2137 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceRobustness2PropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2137:55: error: 'props' was not declared in this scope
|  2137 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
|       |                                                       ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2137:105: error: expected primary-expression before ')' token
|  2137 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
|       |                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2141:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  2141 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2142:54: error: 'VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME'?
|  2142 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2143:13: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT'?
|  2143 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2143:61: error: 'props' was not declared in this scope
|  2143 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
|       |                                                             ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2143:117: error: expected primary-expression before ')' token
|  2143 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
|       |                                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, void*, VulkanVersion)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2444:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  2444 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2445:54: error: 'VK_EXT_ROBUSTNESS_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEBUG_REPORT_EXTENSION_NAME'?
|  2445 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_ROBUSTNESS_2_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_DEBUG_REPORT_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2446:13: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2FeaturesEXT'?
|  2446 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceRobustness2FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2446:53: error: 'props' was not declared in this scope
|  2446 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
|       |                                                     ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2446:101: error: expected primary-expression before ')' token
|  2446 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2450:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  2450 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2451:54: error: 'VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME'?
|  2451 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2452:13: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT'?
|  2452 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2452:59: error: 'props' was not declared in this scope
|  2452 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
|       |                                                           ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2452:113: error: expected primary-expression before ')' token
|  2452 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
|       |                                                                                                                 ^
| ninja: build stopped: subcommand failed.
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/temp/run.do_compile.1175' failed with exit code 1:
| [1/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++  -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd -Iicd -I. -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan
 -tools/1.2.141.0-r0=/usr/src/debug/vulkan-tools/1.2.141.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0=/usr/src/debug/vulkan-tools/1.2.141.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builti
 n-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp
| FAILED: icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++  -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd -Iicd -I. -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools
 /1.2.141.0-r0=/usr/src/debug/vulkan-tools/1.2.141.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0=/usr/src/debug/vulkan-tools/1.2.141.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memc
 mp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:22:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.h:2017:5: error: 'VkImageViewAddressPropertiesNVX' has not been declared
|  2017 |     VkImageViewAddressPropertiesNVX*            pProperties);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.h:2738:11: error: 'VkPrivateDataSlotCreateInfoEXT' does not name a type
|  2738 |     const VkPrivateDataSlotCreateInfoEXT*       pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.h:2740:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  2740 |     VkPrivateDataSlotEXT*                       pPrivateDataSlot);
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.h:2744:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  2744 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.h:2751:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  2751 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.h:2758:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  2758 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:2214:31: error: 'VkImageViewAddressPropertiesNVX' was not declared in this scope
|  2214 | template <> struct LvlTypeMap<VkImageViewAddressPropertiesNVX> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:2214:62: error: template argument 1 is invalid
|  2214 | template <> struct LvlTypeMap<VkImageViewAddressPropertiesNVX> {
|       |                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:2218:32: error: 'VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2'?
|  2218 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:2218:83: error: template argument 1 is invalid
|  2218 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3251:43: error: 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR'?
|  3251 |     static const VkStructureType kSType = VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL;
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3254:32: error: 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR'?
|  3254 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3254:96: error: template argument 1 is invalid
|  3254 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL> {
|       |                                                                                                ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3755:31: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceHostQueryResetFeaturesEXT'?
|  3755 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2FeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceHostQueryResetFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3755:69: error: template argument 1 is invalid
|  3755 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2FeaturesEXT> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3759:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  3759 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3759:91: error: template argument 1 is invalid
|  3759 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT> {
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3764:31: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDevicePCIBusInfoPropertiesEXT'?
|  3764 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2PropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDevicePCIBusInfoPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3764:71: error: template argument 1 is invalid
|  3764 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2PropertiesEXT> {
|       |                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3768:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  3768 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3768:93: error: template argument 1 is invalid
|  3768 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT> {
|       |                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3773:31: error: 'VkSamplerCustomBorderColorCreateInfoEXT' was not declared in this scope
|  3773 | template <> struct LvlTypeMap<VkSamplerCustomBorderColorCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3773:70: error: template argument 1 is invalid
|  3773 | template <> struct LvlTypeMap<VkSamplerCustomBorderColorCreateInfoEXT> {
|       |                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3777:32: error: 'VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO_EXT'?
|  3777 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3777:93: error: template argument 1 is invalid
|  3777 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT> {
|       |                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3782:31: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceToolPropertiesEXT'?
|  3782 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorPropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceToolPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3782:77: error: template argument 1 is invalid
|  3782 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorPropertiesEXT> {
|       |                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3786:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  3786 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3786:100: error: template argument 1 is invalid
|  3786 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT> {
|       |                                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3791:31: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMemoryPriorityFeaturesEXT'?
|  3791 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMemoryPriorityFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3791:75: error: template argument 1 is invalid
|  3791 | template <> struct LvlTypeMap<VkPhysicalDeviceCustomBorderColorFeaturesEXT> {
|       |                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3795:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  3795 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3795:98: error: template argument 1 is invalid
|  3795 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT> {
|       |                                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3800:31: error: 'VkPhysicalDevicePrivateDataFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceASTCDecodeFeaturesEXT'?
|  3800 | template <> struct LvlTypeMap<VkPhysicalDevicePrivateDataFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceASTCDecodeFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3800:69: error: template argument 1 is invalid
|  3800 | template <> struct LvlTypeMap<VkPhysicalDevicePrivateDataFeaturesEXT> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3804:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  3804 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3804:91: error: template argument 1 is invalid
|  3804 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT> {
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3809:31: error: 'VkDevicePrivateDataCreateInfoEXT' was not declared in this scope
|  3809 | template <> struct LvlTypeMap<VkDevicePrivateDataCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3809:63: error: template argument 1 is invalid
|  3809 | template <> struct LvlTypeMap<VkDevicePrivateDataCreateInfoEXT> {
|       |                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3813:32: error: 'VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT'?
|  3813 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3813:85: error: template argument 1 is invalid
|  3813 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT> {
|       |                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3818:31: error: 'VkPrivateDataSlotCreateInfoEXT' was not declared in this scope
|  3818 | template <> struct LvlTypeMap<VkPrivateDataSlotCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3818:61: error: template argument 1 is invalid
|  3818 | template <> struct LvlTypeMap<VkPrivateDataSlotCreateInfoEXT> {
|       |                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3822:32: error: 'VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT'?
|  3822 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/vk_typemap_helper.h:3822:83: error: template argument 1 is invalid
|  3822 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:3402:5: error: 'VkImageViewAddressPropertiesNVX' has not been declared
|  3402 |     VkImageViewAddressPropertiesNVX*            pProperties)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:4504:11: error: 'VkPrivateDataSlotCreateInfoEXT' does not name a type
|  4504 |     const VkPrivateDataSlotCreateInfoEXT*       pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:4506:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  4506 |     VkPrivateDataSlotEXT*                       pPrivateDataSlot)
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp: In function 'VkResult vkmock::CreatePrivateDataSlotEXT(VkDevice, const int*, const VkAllocationCallbacks*, int*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:4509:26: error: 'VkPrivateDataSlotEXT' was not declared in this scope; did you mean 'pPrivateDataSlot'?
|  4509 |     *pPrivateDataSlot = (VkPrivateDataSlotEXT)global_unique_handle++;
|       |                          ^~~~~~~~~~~~~~~~~~~~
|       |                          pPrivateDataSlot
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:4515:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  4515 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:4525:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  4525 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/icd/generated/mock_icd.cpp:4536:5: error: 'VkPrivateDataSlotEXT' has not been declared
|  4536 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| [2/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++  -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux
 /vulkan-tools/1.2.141.0-r0=/usr/src/debug/vulkan-tools/1.2.141.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0=/usr/src/debug/vulkan-tools/1.2.141.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno
 -builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp
| FAILED: vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++  -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulka
 n-tools/1.2.141.0-r0=/usr/src/debug/vulkan-tools/1.2.141.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0=/usr/src/debug/vulkan-tools/1.2.141.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-built
 in-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'const char* VkDriverIdString(VkDriverId)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:416:9: warning: case value '13' not in enumerated type 'VkDriverId' [-Wswitch]
|   416 |         case (13): return "DRIVER_ID_MESA_LLVMPIPE";
|       |         ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1792:79: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' has not been declared
|  1792 | void DumpVkPhysicalDeviceRobustness2FeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceRobustness2FeaturesEXT &obj) {
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRobustness2FeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1794:65: error: request for member 'robustBufferAccess2' in 'obj', which is of non-class type 'int'
|  1794 |     p.PrintKeyBool("robustBufferAccess2", static_cast<bool>(obj.robustBufferAccess2), 19);
|       |                                                                 ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1795:64: error: request for member 'robustImageAccess2' in 'obj', which is of non-class type 'int'
|  1795 |     p.PrintKeyBool("robustImageAccess2", static_cast<bool>(obj.robustImageAccess2), 19);
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1796:60: error: request for member 'nullDescriptor' in 'obj', which is of non-class type 'int'
|  1796 |     p.PrintKeyBool("nullDescriptor", static_cast<bool>(obj.nullDescriptor), 19);
|       |                                                            ^~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1798:81: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' has not been declared
|  1798 | void DumpVkPhysicalDeviceRobustness2PropertiesEXT(Printer &p, std::string name, VkPhysicalDeviceRobustness2PropertiesEXT &obj) {
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRobustness2PropertiesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1800:81: error: request for member 'robustStorageBufferAccessSizeAlignment' in 'obj', which is of non-class type 'int'
|  1800 |     p.PrintKeyValue("robustStorageBufferAccessSizeAlignment", to_hex_str(p, obj.robustStorageBufferAccessSizeAlignment), 38);
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1801:81: error: request for member 'robustUniformBufferAccessSizeAlignment' in 'obj', which is of non-class type 'int'
|  1801 |     p.PrintKeyValue("robustUniformBufferAccessSizeAlignment", to_hex_str(p, obj.robustUniformBufferAccessSizeAlignment), 38);
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1803:87: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' has not been declared
|  1803 | void DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT(Printer &p, std::string name, VkPhysicalDeviceCustomBorderColorPropertiesEXT &obj) {
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1805:57: error: request for member 'maxCustomBorderColorSamplers' in 'obj', which is of non-class type 'int'
|  1805 |     p.PrintKeyValue("maxCustomBorderColorSamplers", obj.maxCustomBorderColorSamplers, 28);
|       |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1807:85: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' has not been declared
|  1807 | void DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT(Printer &p, std::string name, VkPhysicalDeviceCustomBorderColorFeaturesEXT &obj) {
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT(Printer&, std::string, int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1809:64: error: request for member 'customBorderColors' in 'obj', which is of non-class type 'int'
|  1809 |     p.PrintKeyBool("customBorderColors", static_cast<bool>(obj.customBorderColors), 30);
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1810:76: error: request for member 'customBorderColorWithoutFormat' in 'obj', which is of non-class type 'int'
|  1810 |     p.PrintKeyBool("customBorderColorWithoutFormat", static_cast<bool>(obj.customBorderColorWithoutFormat), 30);
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'pNextChainInfos get_chain_infos()':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1849:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  1849 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorPropertiesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1849:87: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT'?
|  1849 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorPropertiesEXT)},
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                       DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1870:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  1870 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceRobustness2PropertiesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1870:80: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2PropertiesEXT'?
|  1870 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT, sizeof(VkPhysicalDeviceRobustness2PropertiesEXT)},
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                DumpVkPhysicalDeviceRobustness2PropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1881:5: error: no match for 'operator=' (operand types are 'std::vector<pNextChainBuildingBlockInfo>' and '<brace-enclosed initializer list>')
|  1881 |     };
|       |     ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/vector:72,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/vector.tcc:198:5: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(const std::vector<_Tp, _Alloc>&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   198 |     vector<_Tp, _Alloc>::
|       |     ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/vector.tcc:199:42: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'const std::vector<pNextChainBuildingBlockInfo>&'
|   199 |     operator=(const vector<_Tp, _Alloc>& __x)
|       |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/vector:67,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:709:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::vector<_Tp, _Alloc>&&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:709:26: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::vector<pNextChainBuildingBlockInfo>&&'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |                 ~~~~~~~~~^~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:730:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::initializer_list<_Tp>) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   730 |       operator=(initializer_list<value_type> __l)
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:730:46: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::initializer_list<pNextChainBuildingBlockInfo>'
|   730 |       operator=(initializer_list<value_type> __l)
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1893:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  1893 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorFeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1893:85: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT'?
|  1893 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT, sizeof(VkPhysicalDeviceCustomBorderColorFeaturesEXT)},
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                     DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1912:10: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  1912 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT, sizeof(VkPhysicalDeviceRobustness2FeaturesEXT)},
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1912:78: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2FeaturesEXT'?
|  1912 |         {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT, sizeof(VkPhysicalDeviceRobustness2FeaturesEXT)},
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                              DumpVkPhysicalDeviceRobustness2FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1934:5: error: no match for 'operator=' (operand types are 'std::vector<pNextChainBuildingBlockInfo>' and '<brace-enclosed initializer list>')
|  1934 |     };
|       |     ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/vector:72,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/vector.tcc:198:5: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(const std::vector<_Tp, _Alloc>&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   198 |     vector<_Tp, _Alloc>::
|       |     ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/vector.tcc:199:42: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'const std::vector<pNextChainBuildingBlockInfo>&'
|   199 |     operator=(const vector<_Tp, _Alloc>& __x)
|       |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/vector:67,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:709:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::vector<_Tp, _Alloc>&&) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:709:26: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::vector<pNextChainBuildingBlockInfo>&&'
|   709 |       operator=(vector&& __x) noexcept(_Alloc_traits::_S_nothrow_move())
|       |                 ~~~~~~~~~^~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:730:7: note: candidate: 'std::vector<_Tp, _Alloc>& std::vector<_Tp, _Alloc>::operator=(std::initializer_list<_Tp>) [with _Tp = pNextChainBuildingBlockInfo; _Alloc = std::allocator<pNextChainBuildingBlockInfo>]'
|   730 |       operator=(initializer_list<value_type> __l)
|       |       ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/recipe-sysroot/usr/include/c++/10.1.0/bits/stl_vector.h:730:46: note:   no known conversion for argument 1 from '<brace-enclosed initializer list>' to 'std::initializer_list<pNextChainBuildingBlockInfo>'
|   730 |       operator=(initializer_list<value_type> __l)
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/vulkaninfo.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_props2(Printer&, AppInstance&, AppGpu&, void*, VulkanVersion)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2135:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  2135 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2136:54: error: 'VK_EXT_ROBUSTNESS_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEBUG_REPORT_EXTENSION_NAME'?
|  2136 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_ROBUSTNESS_2_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_DEBUG_REPORT_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2137:13: error: 'VkPhysicalDeviceRobustness2PropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2PropertiesEXT'?
|  2137 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceRobustness2PropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2137:55: error: 'props' was not declared in this scope
|  2137 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
|       |                                                       ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2137:105: error: expected primary-expression before ')' token
|  2137 |             VkPhysicalDeviceRobustness2PropertiesEXT* props = (VkPhysicalDeviceRobustness2PropertiesEXT*)structure;
|       |                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2141:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  2141 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2142:54: error: 'VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME'?
|  2142 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2143:13: error: 'VkPhysicalDeviceCustomBorderColorPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT'?
|  2143 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceCustomBorderColorPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2143:61: error: 'props' was not declared in this scope
|  2143 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
|       |                                                             ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2143:117: error: expected primary-expression before ')' token
|  2143 |             VkPhysicalDeviceCustomBorderColorPropertiesEXT* props = (VkPhysicalDeviceCustomBorderColorPropertiesEXT*)structure;
|       |                                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, void*, VulkanVersion)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2444:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  2444 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2445:54: error: 'VK_EXT_ROBUSTNESS_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEBUG_REPORT_EXTENSION_NAME'?
|  2445 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_ROBUSTNESS_2_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_DEBUG_REPORT_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2446:13: error: 'VkPhysicalDeviceRobustness2FeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRobustness2FeaturesEXT'?
|  2446 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceRobustness2FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2446:53: error: 'props' was not declared in this scope
|  2446 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
|       |                                                     ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2446:101: error: expected primary-expression before ')' token
|  2446 |             VkPhysicalDeviceRobustness2FeaturesEXT* props = (VkPhysicalDeviceRobustness2FeaturesEXT*)structure;
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2450:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  2450 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2451:54: error: 'VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME'?
|  2451 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2452:13: error: 'VkPhysicalDeviceCustomBorderColorFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT'?
|  2452 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceCustomBorderColorFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2452:59: error: 'props' was not declared in this scope
|  2452 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
|       |                                                           ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.141.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2452:113: error: expected primary-expression before ')' token
|  2452 |             VkPhysicalDeviceCustomBorderColorFeaturesEXT* props = (VkPhysicalDeviceCustomBorderColorFeaturesEXT*)structure;
|       |                                                                                                                 ^
| ninja: build stopped: subcommand failed.
| WARNING: exit code 1 from a shell command.
| 
NOTE: recipe vulkan-tools-1.2.141.0-r0: task do_compile: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.141.0.bb:do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2436 tasks of which 2427 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.141.0.bb:do_compile
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============2840243931849933204==--
