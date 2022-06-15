Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D08EDCCA485
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:45 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web09.4386.1655298220493928915
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WRGGxT0+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 010101816776668a-8d57982c-ed49-4968-b5fe-92784aade2fd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q7rmORKQJ/sutJctVtvFWoI+tRFWFvY4FqCrVbW+NkA=;
	b=WRGGxT0+Wvcj2pCFOEUGhtzBZs5ccB979ekifXyHfPv0KOjePEZDv3EwrHsxxKXa
	3WmizWyBlxbhmp7Wv786Bz/CG93Yh+irxH2oVnB/MrkPl6y+/+TFsHQKkPVcbFclNIy
	SxIhNbpoQWwLv2a+l154pWiffWMibhLBcKIsciQo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q7rmORKQJ/sutJctVtvFWoI+tRFWFvY4FqCrVbW+NkA=;
	b=IubqYBaqdm7a3tcCdEsn8vO71V0UJHlt4BCu90enaIHuEkkNfyg9OhQJ9K2zqsmt
	9Ca8cr9A3xj8MO8x8msJrAqazG0qfWyihE9d2lbIq3OC1xr5W+WKROVvaGnGv9SZWA1
	VyhRggReqrp6E9Xj0MSe86fSQALlzowGixrWGBkM=
Content-Type: multipart/mixed; boundary="===============5487949365495507309=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.3.216.0 FAILED
Message-ID: 
 <010101816776668a-8d57982c-ed49-4968-b5fe-92784aade2fd-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166974

--===============5487949365495507309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-tools* to *1.3.216.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.3.211.0-1.3.216.0.patch
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
--===============5487949365495507309==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.3.211.0-1.3.216.0.patch"

From 92aa1414bfa8b291b5b8c6a0a462ebebfeeccf64 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 12:22:15 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.3.211.0 -> 1.3.216.0

---
 .../{vulkan-tools_1.3.211.0.bb => vulkan-tools_1.3.216.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.211.0.bb => vulkan-tools_1.3.216.0.bb} (93%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.211.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.211.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb
index 3cb4ccc23f..e26f4504f1 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.211.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.3.211;protocol=https"
-SRCREV = "4fdfd2b1187ab44f062d091ba3113c5e3eab5a1b"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=master;protocol=https"
+SRCREV = "ef9db7a8ec52f6c56158d83f5d57ef388c1abec1"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1


--===============5487949365495507309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (881 cached, 1 parsed). 1642 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-489827791480da050e839cfdaf4c761467a154bb"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:489827791480da050e839cfdaf4c761467a154bb"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 88 Local 81 Mirrors 0 Missed 7 Current 233 (92% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1127 of 1196 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb:do_fetch)
NOTE: recipe vulkan-tools-1.3.216.0-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.3.216.0-r0: task do_fetch: Succeeded
NOTE: Running task 1182 of 1196 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb:do_unpack)
NOTE: Running task 1183 of 1196 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.3.216.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.3.216.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.3.216.0-r0: task do_unpack: Succeeded
NOTE: Running task 1184 of 1196 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb:do_patch)
NOTE: recipe vulkan-tools-1.3.216.0-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.3.216.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.3.216.0-r0: task do_patch: Succeeded
NOTE: Running task 1185 of 1196 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1186 of 1196 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb:do_generate_toolchain_file)
NOTE: Running task 1187 of 1196 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb:do_populate_lic)
NOTE: recipe vulkan-tools-1.3.216.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-tools-1.3.216.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.3.216.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.216.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.3.216.0-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-tools-1.3.216.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1188 of 1196 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.3.216.0-r0: task do_configure: Started
NOTE: recipe vulkan-tools-1.3.216.0-r0: task do_configure: Succeeded
NOTE: Running task 1189 of 1196 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb:do_compile)
NOTE: recipe vulkan-tools-1.3.216.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/build --target all --
| [1/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/build/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/build -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp
 /work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0=/usr/src/debug/vulkan-tools/1.3.216.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0=/usr/src/debug/vulkan-tools/1.3.216.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidd
 en -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/mock_icd.cpp
| FAILED: icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/build/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/build -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/
 core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0=/usr/src/debug/vulkan-tools/1.3.216.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0=/usr/src/debug/vulkan-tools/1.3.216.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wp
 ointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/mock_icd.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/mock_icd.cpp:22:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/mock_icd.h:3345:11: error: 'VkImageSubresource2EXT' does not name a type; did you mean 'VkImageSubresource'?
|  3345 |     const VkImageSubresource2EXT*               pSubresource,
|       |           ^~~~~~~~~~~~~~~~~~~~~~
|       |           VkImageSubresource
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/mock_icd.h:3346:5: error: 'VkSubresourceLayout2EXT' has not been declared
|  3346 |     VkSubresourceLayout2EXT*                    pLayout);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/mock_icd.h:3468:11: error: 'VkPipelineInfoEXT' does not name a type; did you mean 'VkPipelineInfoKHR'?
|  3468 |     const VkPipelineInfoEXT*                    pPipelineInfo,
|       |           ^~~~~~~~~~~~~~~~~
|       |           VkPipelineInfoKHR
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/mock_icd.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:2989:31: error: 'VkPhysicalDeviceFragmentShaderBarycentricFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV'?
|  2989 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShaderBarycentricFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:2989:83: error: template argument 1 is invalid
|  2989 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShaderBarycentricFeaturesKHR> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:2993:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV'?
|  2993 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:2993:106: error: template argument 1 is invalid
|  2993 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_KHR> {
|       |                                                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:2998:31: error: 'VkPhysicalDeviceFragmentShaderBarycentricPropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV'?
|  2998 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShaderBarycentricPropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:2998:85: error: template argument 1 is invalid
|  2998 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentShaderBarycentricPropertiesKHR> {
|       |                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:3002:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV'?
|  3002 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:3002:108: error: template argument 1 is invalid
|  3002 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_PROPERTIES_KHR> {
|       |                                                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:3025:31: error: 'VkPhysicalDeviceRayTracingMaintenance1FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceRayTracingPipelineFeaturesKHR'?
|  3025 | template <> struct LvlTypeMap<VkPhysicalDeviceRayTracingMaintenance1FeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceRayTracingPipelineFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:3025:80: error: template argument 1 is invalid
|  3025 | template <> struct LvlTypeMap<VkPhysicalDeviceRayTracingMaintenance1FeaturesKHR> {
|       |                                                                                ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:3029:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_MAINTENANCE_1_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR'?
|  3029 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_MAINTENANCE_1_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:3029:104: error: template argument 1 is invalid
|  3029 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_MAINTENANCE_1_FEATURES_KHR> {
|       |                                                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5187:31: error: 'VkPhysicalDeviceShaderEarlyAndLateFragmentTestsFeaturesAMD' was not declared in this scope; did you mean 'VkPhysicalDeviceRepresentativeFragmentTestFeaturesNV'?
|  5187 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderEarlyAndLateFragmentTestsFeaturesAMD> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceRepresentativeFragmentTestFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5187:89: error: template argument 1 is invalid
|  5187 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderEarlyAndLateFragmentTestsFeaturesAMD> {
|       |                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5191:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EARLY_AND_LATE_FRAGMENT_TESTS_FEATURES_AMD' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_REPRESENTATIVE_FRAGMENT_TEST_FEATURES_NV'?
|  5191 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EARLY_AND_LATE_FRAGMENT_TESTS_FEATURES_AMD> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_REPRESENTATIVE_FRAGMENT_TEST_FEATURES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5191:115: error: template argument 1 is invalid
|  5191 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EARLY_AND_LATE_FRAGMENT_TESTS_FEATURES_AMD> {
|       |                                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5286:31: error: 'VkPhysicalDeviceImageCompressionControlFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceSubgroupSizeControlFeaturesEXT'?
|  5286 | template <> struct LvlTypeMap<VkPhysicalDeviceImageCompressionControlFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceSubgroupSizeControlFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5286:81: error: template argument 1 is invalid
|  5286 | template <> struct LvlTypeMap<VkPhysicalDeviceImageCompressionControlFeaturesEXT> {
|       |                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5290:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_FEATURES_EXT'?
|  5290 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5290:104: error: template argument 1 is invalid
|  5290 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_FEATURES_EXT> {
|       |                                                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5295:31: error: 'VkImageCompressionControlEXT' was not declared in this scope
|  5295 | template <> struct LvlTypeMap<VkImageCompressionControlEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5295:59: error: template argument 1 is invalid
|  5295 | template <> struct LvlTypeMap<VkImageCompressionControlEXT> {
|       |                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5299:32: error: 'VK_STRUCTURE_TYPE_IMAGE_COMPRESSION_CONTROL_EXT' was not declared in this scope
|  5299 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_COMPRESSION_CONTROL_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5299:79: error: template argument 1 is invalid
|  5299 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_COMPRESSION_CONTROL_EXT> {
|       |                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5304:31: error: 'VkSubresourceLayout2EXT' was not declared in this scope; did you mean 'VkSubresourceLayout'?
|  5304 | template <> struct LvlTypeMap<VkSubresourceLayout2EXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkSubresourceLayout
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5304:54: error: template argument 1 is invalid
|  5304 | template <> struct LvlTypeMap<VkSubresourceLayout2EXT> {
|       |                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5308:32: error: 'VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SURFACE_FORMAT_2_KHR'?
|  5308 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SURFACE_FORMAT_2_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5308:74: error: template argument 1 is invalid
|  5308 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2_EXT> {
|       |                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5313:31: error: 'VkImageSubresource2EXT' was not declared in this scope; did you mean 'VkImageSubresource'?
|  5313 | template <> struct LvlTypeMap<VkImageSubresource2EXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~
|       |                               VkImageSubresource
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5313:53: error: template argument 1 is invalid
|  5313 | template <> struct LvlTypeMap<VkImageSubresource2EXT> {
|       |                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5317:32: error: 'VK_STRUCTURE_TYPE_IMAGE_SUBRESOURCE_2_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_RESOLVE_2_KHR'?
|  5317 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_SUBRESOURCE_2_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_RESOLVE_2_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5317:73: error: template argument 1 is invalid
|  5317 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_SUBRESOURCE_2_EXT> {
|       |                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5322:31: error: 'VkImageCompressionPropertiesEXT' was not declared in this scope
|  5322 | template <> struct LvlTypeMap<VkImageCompressionPropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5322:62: error: template argument 1 is invalid
|  5322 | template <> struct LvlTypeMap<VkImageCompressionPropertiesEXT> {
|       |                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5326:32: error: 'VK_STRUCTURE_TYPE_IMAGE_COMPRESSION_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2'?
|  5326 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_COMPRESSION_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5326:82: error: template argument 1 is invalid
|  5326 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_COMPRESSION_PROPERTIES_EXT> {
|       |                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5669:31: error: 'VkPipelinePropertiesIdentifierEXT' was not declared in this scope
|  5669 | template <> struct LvlTypeMap<VkPipelinePropertiesIdentifierEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5669:64: error: template argument 1 is invalid
|  5669 | template <> struct LvlTypeMap<VkPipelinePropertiesIdentifierEXT> {
|       |                                                                ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5673:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_PROPERTIES_IDENTIFIER_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_COLOR_WRITE_CREATE_INFO_EXT'?
|  5673 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_PROPERTIES_IDENTIFIER_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_COLOR_WRITE_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5673:84: error: template argument 1 is invalid
|  5673 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_PROPERTIES_IDENTIFIER_EXT> {
|       |                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5678:31: error: 'VkPhysicalDevicePipelinePropertiesFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceProvokingVertexFeaturesEXT'?
|  5678 | template <> struct LvlTypeMap<VkPhysicalDevicePipelinePropertiesFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceProvokingVertexFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5678:76: error: template argument 1 is invalid
|  5678 | template <> struct LvlTypeMap<VkPhysicalDevicePipelinePropertiesFeaturesEXT> {
|       |                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5682:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROVOKING_VERTEX_FEATURES_EXT'?
|  5682 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROVOKING_VERTEX_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5682:98: error: template argument 1 is invalid
|  5682 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT> {
|       |                                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5869:31: error: 'VkPhysicalDeviceImageCompressionControlSwapchainFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceTextureCompressionASTCHDRFeaturesEXT'?
|  5869 | template <> struct LvlTypeMap<VkPhysicalDeviceImageCompressionControlSwapchainFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceTextureCompressionASTCHDRFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5869:90: error: template argument 1 is invalid
|  5869 | template <> struct LvlTypeMap<VkPhysicalDeviceImageCompressionControlSwapchainFeaturesEXT> {
|       |                                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5873:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_SWAPCHAIN_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXTURE_COMPRESSION_ASTC_HDR_FEATURES_EXT'?
|  5873 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_SWAPCHAIN_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXTURE_COMPRESSION_ASTC_HDR_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5873:114: error: template argument 1 is invalid
|  5873 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_SWAPCHAIN_FEATURES_EXT> {
|       |                                                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5878:31: error: 'VkPhysicalDeviceSubpassMergeFeedbackFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceTransformFeedbackFeaturesEXT'?
|  5878 | template <> struct LvlTypeMap<VkPhysicalDeviceSubpassMergeFeedbackFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceTransformFeedbackFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5878:78: error: template argument 1 is invalid
|  5878 | template <> struct LvlTypeMap<VkPhysicalDeviceSubpassMergeFeedbackFeaturesEXT> {
|       |                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5882:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBPASS_MERGE_FEEDBACK_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TRANSFORM_FEEDBACK_FEATURES_EXT'?
|  5882 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBPASS_MERGE_FEEDBACK_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TRANSFORM_FEEDBACK_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5882:101: error: template argument 1 is invalid
|  5882 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBPASS_MERGE_FEEDBACK_FEATURES_EXT> {
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5887:31: error: 'VkRenderPassCreationControlEXT' was not declared in this scope
|  5887 | template <> struct LvlTypeMap<VkRenderPassCreationControlEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5887:61: error: template argument 1 is invalid
|  5887 | template <> struct LvlTypeMap<VkRenderPassCreationControlEXT> {
|       |                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5891:32: error: 'VK_STRUCTURE_TYPE_RENDER_PASS_CREATION_CONTROL_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO_2'?
|  5891 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RENDER_PASS_CREATION_CONTROL_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO_2
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5891:82: error: template argument 1 is invalid
|  5891 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RENDER_PASS_CREATION_CONTROL_EXT> {
|       |                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5896:31: error: 'VkRenderPassCreationFeedbackCreateInfoEXT' was not declared in this scope; did you mean 'VkPipelineCreationFeedbackCreateInfoEXT'?
|  5896 | template <> struct LvlTypeMap<VkRenderPassCreationFeedbackCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPipelineCreationFeedbackCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5896:72: error: template argument 1 is invalid
|  5896 | template <> struct LvlTypeMap<VkRenderPassCreationFeedbackCreateInfoEXT> {
|       |                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5900:32: error: 'VK_STRUCTURE_TYPE_RENDER_PASS_CREATION_FEEDBACK_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_CREATION_FEEDBACK_CREATE_INFO_EXT'?
|  5900 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RENDER_PASS_CREATION_FEEDBACK_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_CREATION_FEEDBACK_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5900:95: error: template argument 1 is invalid
|  5900 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RENDER_PASS_CREATION_FEEDBACK_CREATE_INFO_EXT> {
|       |                                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5905:31: error: 'VkRenderPassSubpassFeedbackCreateInfoEXT' was not declared in this scope
|  5905 | template <> struct LvlTypeMap<VkRenderPassSubpassFeedbackCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5905:71: error: template argument 1 is invalid
|  5905 | template <> struct LvlTypeMap<VkRenderPassSubpassFeedbackCreateInfoEXT> {
|       |                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5909:32: error: 'VK_STRUCTURE_TYPE_RENDER_PASS_SUBPASS_FEEDBACK_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_RENDER_PASS_MULTIVIEW_CREATE_INFO_KHR'?
|  5909 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RENDER_PASS_SUBPASS_FEEDBACK_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_RENDER_PASS_MULTIVIEW_CREATE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/vk_typemap_helper.h:5909:94: error: template argument 1 is invalid
|  5909 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RENDER_PASS_SUBPASS_FEEDBACK_CREATE_INFO_EXT> {
|       |                                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/mock_icd.cpp:5380:11: error: 'VkImageSubresource2EXT' does not name a type; did you mean 'VkImageSubresource'?
|  5380 |     const VkImageSubresource2EXT*               pSubresource,
|       |           ^~~~~~~~~~~~~~~~~~~~~~
|       |           VkImageSubresource
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/mock_icd.cpp:5381:5: error: 'VkSubresourceLayout2EXT' has not been declared
|  5381 |     VkSubresourceLayout2EXT*                    pLayout)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/icd/generated/mock_icd.cpp:5576:11: error: 'VkPipelineInfoEXT' does not name a type; did you mean 'VkPipelineInfoKHR'?
|  5576 |     const VkPipelineInfoEXT*                    pPipelineInfo,
|       |           ^~~~~~~~~~~~~~~~~
|       |           VkPipelineInfoKHR
| [2/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulk
 an-tools/1.3.216.0-r0=/usr/src/debug/vulkan-tools/1.3.216.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0=/usr/src/debug/vulkan-tools/1.3.216.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/a
 uh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/vulkaninfo.cpp
| FAILED: vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-too
 ls/1.3.216.0-r0=/usr/src/debug/vulkan-tools/1.3.216.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0=/usr/src/debug/vulkan-tools/1.3.216.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/bui
 ld/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/vulkaninfo.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/vulkaninfo.cpp:30:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkResultString(VkResult)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:480:15: error: 'VK_ERROR_COMPRESSION_EXHAUSTED_EXT' was not declared in this scope
|   480 |         case (VK_ERROR_COMPRESSION_EXHAUSTED_EXT): return "ERROR_COMPRESSION_EXHAUSTED_EXT";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1619:99: error: 'VkPhysicalDeviceFragmentShaderBarycentricFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV'?
|  1619 | void DumpVkPhysicalDeviceFragmentShaderBarycentricFeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceFragmentShaderBarycentricFeaturesKHR &obj) {
|       |                                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                   VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceFragmentShaderBarycentricFeaturesKHR(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1622:71: error: request for member 'fragmentShaderBarycentric' in 'obj', which is of non-class type 'const int'
|  1622 |     p.PrintKeyBool("fragmentShaderBarycentric", static_cast<bool>(obj.fragmentShaderBarycentric));
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1624:101: error: 'VkPhysicalDeviceFragmentShaderBarycentricPropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV'?
|  1624 | void DumpVkPhysicalDeviceFragmentShaderBarycentricPropertiesKHR(Printer &p, std::string name, const VkPhysicalDeviceFragmentShaderBarycentricPropertiesKHR &obj) {
|       |                                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                     VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceFragmentShaderBarycentricPropertiesKHR(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1627:93: error: request for member 'triStripVertexOrderIndependentOfProvokingVertex' in 'obj', which is of non-class type 'const int'
|  1627 |     p.PrintKeyBool("triStripVertexOrderIndependentOfProvokingVertex", static_cast<bool>(obj.triStripVertexOrderIndependentOfProvokingVertex));
|       |                                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1714:97: error: 'VkPhysicalDeviceImageCompressionControlFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceSubgroupSizeControlFeaturesEXT'?
|  1714 | void DumpVkPhysicalDeviceImageCompressionControlFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceImageCompressionControlFeaturesEXT &obj) {
|       |                                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                 VkPhysicalDeviceSubgroupSizeControlFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceImageCompressionControlFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1717:69: error: request for member 'imageCompressionControl' in 'obj', which is of non-class type 'const int'
|  1717 |     p.PrintKeyBool("imageCompressionControl", static_cast<bool>(obj.imageCompressionControl));
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1719:106: error: 'VkPhysicalDeviceImageCompressionControlSwapchainFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceTextureCompressionASTCHDRFeaturesEXT'?
|  1719 | void DumpVkPhysicalDeviceImageCompressionControlSwapchainFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceImageCompressionControlSwapchainFeaturesEXT &obj) {
|       |                                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                          VkPhysicalDeviceTextureCompressionASTCHDRFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceImageCompressionControlSwapchainFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1722:78: error: request for member 'imageCompressionControlSwapchain' in 'obj', which is of non-class type 'const int'
|  1722 |     p.PrintKeyBool("imageCompressionControlSwapchain", static_cast<bool>(obj.imageCompressionControlSwapchain));
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2026:92: error: 'VkPhysicalDevicePipelinePropertiesFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceProvokingVertexFeaturesEXT'?
|  2026 | void DumpVkPhysicalDevicePipelinePropertiesFeaturesEXT(Printer &p, std::string name, const VkPhysicalDevicePipelinePropertiesFeaturesEXT &obj) {
|       |                                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                            VkPhysicalDeviceProvokingVertexFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePipelinePropertiesFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2029:74: error: request for member 'pipelinePropertiesIdentifier' in 'obj', which is of non-class type 'const int'
|  2029 |     p.PrintKeyBool("pipelinePropertiesIdentifier", static_cast<bool>(obj.pipelinePropertiesIdentifier));
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2128:96: error: 'VkPhysicalDeviceRayTracingMaintenance1FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceRayTracingPipelineFeaturesKHR'?
|  2128 | void DumpVkPhysicalDeviceRayTracingMaintenance1FeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceRayTracingMaintenance1FeaturesKHR &obj) {
|       |                                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                VkPhysicalDeviceRayTracingPipelineFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRayTracingMaintenance1FeaturesKHR(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2131:68: error: request for member 'rayTracingMaintenance1' in 'obj', which is of non-class type 'const int'
|  2131 |     p.PrintKeyBool("rayTracingMaintenance1", static_cast<bool>(obj.rayTracingMaintenance1));
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2132:82: error: request for member 'rayTracingPipelineTraceRaysIndirect2' in 'obj', which is of non-class type 'const int'
|  2132 |     p.PrintKeyBool("rayTracingPipelineTraceRaysIndirect2", static_cast<bool>(obj.rayTracingPipelineTraceRaysIndirect2));
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2356:94: error: 'VkPhysicalDeviceSubpassMergeFeedbackFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceTransformFeedbackFeaturesEXT'?
|  2356 | void DumpVkPhysicalDeviceSubpassMergeFeedbackFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceSubpassMergeFeedbackFeaturesEXT &obj) {
|       |                                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                              VkPhysicalDeviceTransformFeedbackFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceSubpassMergeFeedbackFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2359:66: error: request for member 'subpassMergeFeedback' in 'obj', which is of non-class type 'const int'
|  2359 |     p.PrintKeyBool("subpassMergeFeedback", static_cast<bool>(obj.subpassMergeFeedback));
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2805:5: error: 'VkPhysicalDeviceFragmentShaderBarycentricPropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV'?
|  2805 |     VkPhysicalDeviceFragmentShaderBarycentricPropertiesKHR PhysicalDeviceFragmentShaderBarycentricPropertiesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_props2_chain::initialize_chain()':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2852:9: error: 'PhysicalDeviceFragmentShaderBarycentricPropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceFragmentShaderBarycentricPropertiesKHR'?
|  2852 |         PhysicalDeviceFragmentShaderBarycentricPropertiesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_PROPERTIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceFragmentShaderBarycentricPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2852:70: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV'?
|  2852 |         PhysicalDeviceFragmentShaderBarycentricPropertiesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_PROPERTIES_KHR;
|       |                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                      VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2996:5: error: 'VkPhysicalDeviceFragmentShaderBarycentricFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV'?
|  2996 |     VkPhysicalDeviceFragmentShaderBarycentricFeaturesKHR PhysicalDeviceFragmentShaderBarycentricFeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3003:5: error: 'VkPhysicalDeviceImageCompressionControlFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceSubgroupSizeControlFeaturesEXT'?
|  3003 |     VkPhysicalDeviceImageCompressionControlFeaturesEXT PhysicalDeviceImageCompressionControlFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceSubgroupSizeControlFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3004:5: error: 'VkPhysicalDeviceImageCompressionControlSwapchainFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceTextureCompressionASTCHDRFeaturesEXT'?
|  3004 |     VkPhysicalDeviceImageCompressionControlSwapchainFeaturesEXT PhysicalDeviceImageCompressionControlSwapchainFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceTextureCompressionASTCHDRFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3019:5: error: 'VkPhysicalDevicePipelinePropertiesFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceProvokingVertexFeaturesEXT'?
|  3019 |     VkPhysicalDevicePipelinePropertiesFeaturesEXT PhysicalDevicePipelinePropertiesFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceProvokingVertexFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3032:5: error: 'VkPhysicalDeviceRayTracingMaintenance1FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceRayTracingPipelineFeaturesKHR'?
|  3032 |     VkPhysicalDeviceRayTracingMaintenance1FeaturesKHR PhysicalDeviceRayTracingMaintenance1FeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceRayTracingPipelineFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3052:5: error: 'VkPhysicalDeviceSubpassMergeFeedbackFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceTransformFeedbackFeaturesEXT'?
|  3052 |     VkPhysicalDeviceSubpassMergeFeedbackFeaturesEXT PhysicalDeviceSubpassMergeFeedbackFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceTransformFeedbackFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_features2_chain::initialize_chain()':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3092:9: error: 'PhysicalDeviceFragmentShaderBarycentricFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV'?
|  3092 |         PhysicalDeviceFragmentShaderBarycentricFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3092:68: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV'?
|  3092 |         PhysicalDeviceFragmentShaderBarycentricFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_KHR;
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                    VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3099:9: error: 'PhysicalDeviceImageCompressionControlFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceImageCompressionControlFeaturesEXT'?
|  3099 |         PhysicalDeviceImageCompressionControlFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceImageCompressionControlFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3099:66: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_FEATURES_EXT'?
|  3099 |         PhysicalDeviceImageCompressionControlFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_FEATURES_EXT;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                  VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3100:9: error: 'PhysicalDeviceImageCompressionControlSwapchainFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceImageCompressionControlSwapchainFeaturesEXT'?
|  3100 |         PhysicalDeviceImageCompressionControlSwapchainFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_SWAPCHAIN_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceImageCompressionControlSwapchainFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3100:75: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_SWAPCHAIN_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXTURE_COMPRESSION_ASTC_HDR_FEATURES_EXT'?
|  3100 |         PhysicalDeviceImageCompressionControlSwapchainFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_SWAPCHAIN_FEATURES_EXT;
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                           VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXTURE_COMPRESSION_ASTC_HDR_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3115:9: error: 'PhysicalDevicePipelinePropertiesFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePipelinePropertiesFeaturesEXT'?
|  3115 |         PhysicalDevicePipelinePropertiesFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDevicePipelinePropertiesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3115:61: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROVOKING_VERTEX_FEATURES_EXT'?
|  3115 |         PhysicalDevicePipelinePropertiesFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT;
|       |                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                             VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROVOKING_VERTEX_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3128:9: error: 'PhysicalDeviceRayTracingMaintenance1FeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRayTracingMaintenance1FeaturesKHR'?
|  3128 |         PhysicalDeviceRayTracingMaintenance1FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_MAINTENANCE_1_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceRayTracingMaintenance1FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3128:65: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_MAINTENANCE_1_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR'?
|  3128 |         PhysicalDeviceRayTracingMaintenance1FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_MAINTENANCE_1_FEATURES_KHR;
|       |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3147:9: error: 'PhysicalDeviceSubpassMergeFeedbackFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceSubpassMergeFeedbackFeaturesEXT'?
|  3147 |         PhysicalDeviceSubpassMergeFeedbackFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBPASS_MERGE_FEEDBACK_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceSubpassMergeFeedbackFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3147:63: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBPASS_MERGE_FEEDBACK_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TRANSFORM_FEEDBACK_FEATURES_EXT'?
|  3147 |         PhysicalDeviceSubpassMergeFeedbackFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBPASS_MERGE_FEEDBACK_FEATURES_EXT;
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                               VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TRANSFORM_FEEDBACK_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_props2(Printer&, AppInstance&, AppGpu&, void*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3496:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV'?
|  3496 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_PROPERTIES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3497:54: error: 'VK_KHR_FRAGMENT_SHADER_BARYCENTRIC_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_NV_FRAGMENT_SHADER_BARYCENTRIC_EXTENSION_NAME'?
|  3497 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_FRAGMENT_SHADER_BARYCENTRIC_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_NV_FRAGMENT_SHADER_BARYCENTRIC_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3498:13: error: 'VkPhysicalDeviceFragmentShaderBarycentricPropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceFragmentShaderBarycentricPropertiesKHR'?
|  3498 |             VkPhysicalDeviceFragmentShaderBarycentricPropertiesKHR* props = (VkPhysicalDeviceFragmentShaderBarycentricPropertiesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceFragmentShaderBarycentricPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3498:69: error: 'props' was not declared in this scope
|  3498 |             VkPhysicalDeviceFragmentShaderBarycentricPropertiesKHR* props = (VkPhysicalDeviceFragmentShaderBarycentricPropertiesKHR*)structure;
|       |                                                                     ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3498:133: error: expected primary-expression before ')' token
|  3498 |             VkPhysicalDeviceFragmentShaderBarycentricPropertiesKHR* props = (VkPhysicalDeviceFragmentShaderBarycentricPropertiesKHR*)structure;
|       |                                                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, void*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3833:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV'?
|  3833 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3834:148: error: 'VK_KHR_FRAGMENT_SHADER_BARYCENTRIC_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_NV_FRAGMENT_SHADER_BARYCENTRIC_EXTENSION_NAME'?
|  3834 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_NV_FRAGMENT_SHADER_BARYCENTRIC_EXTENSION_NAME) || gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_FRAGMENT_SHADER_BARYCENTRIC_EXTENSION_NAME))) {
|       |                                                                                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                                                    VK_NV_FRAGMENT_SHADER_BARYCENTRIC_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3835:13: error: 'VkPhysicalDeviceFragmentShaderBarycentricFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV'?
|  3835 |             VkPhysicalDeviceFragmentShaderBarycentricFeaturesKHR* props = (VkPhysicalDeviceFragmentShaderBarycentricFeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3835:67: error: 'props' was not declared in this scope
|  3835 |             VkPhysicalDeviceFragmentShaderBarycentricFeaturesKHR* props = (VkPhysicalDeviceFragmentShaderBarycentricFeaturesKHR*)structure;
|       |                                                                   ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3835:129: error: expected primary-expression before ')' token
|  3835 |             VkPhysicalDeviceFragmentShaderBarycentricFeaturesKHR* props = (VkPhysicalDeviceFragmentShaderBarycentricFeaturesKHR*)structure;
|       |                                                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3876:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_FEATURES_EXT'?
|  3876 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3877:54: error: 'VK_EXT_IMAGE_COMPRESSION_CONTROL_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_SUBGROUP_SIZE_CONTROL_EXTENSION_NAME'?
|  3877 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_IMAGE_COMPRESSION_CONTROL_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_SUBGROUP_SIZE_CONTROL_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3878:13: error: 'VkPhysicalDeviceImageCompressionControlFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceImageCompressionControlFeaturesEXT'?
|  3878 |             VkPhysicalDeviceImageCompressionControlFeaturesEXT* props = (VkPhysicalDeviceImageCompressionControlFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceImageCompressionControlFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3878:65: error: 'props' was not declared in this scope
|  3878 |             VkPhysicalDeviceImageCompressionControlFeaturesEXT* props = (VkPhysicalDeviceImageCompressionControlFeaturesEXT*)structure;
|       |                                                                 ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3878:125: error: expected primary-expression before ')' token
|  3878 |             VkPhysicalDeviceImageCompressionControlFeaturesEXT* props = (VkPhysicalDeviceImageCompressionControlFeaturesEXT*)structure;
|       |                                                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3882:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_SWAPCHAIN_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXTURE_COMPRESSION_ASTC_HDR_FEATURES_EXT'?
|  3882 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_SWAPCHAIN_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXTURE_COMPRESSION_ASTC_HDR_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3883:54: error: 'VK_EXT_IMAGE_COMPRESSION_CONTROL_SWAPCHAIN_EXTENSION_NAME' was not declared in this scope
|  3883 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_IMAGE_COMPRESSION_CONTROL_SWAPCHAIN_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3884:13: error: 'VkPhysicalDeviceImageCompressionControlSwapchainFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceImageCompressionControlSwapchainFeaturesEXT'?
|  3884 |             VkPhysicalDeviceImageCompressionControlSwapchainFeaturesEXT* props = (VkPhysicalDeviceImageCompressionControlSwapchainFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceImageCompressionControlSwapchainFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3884:74: error: 'props' was not declared in this scope
|  3884 |             VkPhysicalDeviceImageCompressionControlSwapchainFeaturesEXT* props = (VkPhysicalDeviceImageCompressionControlSwapchainFeaturesEXT*)structure;
|       |                                                                          ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3884:143: error: expected primary-expression before ')' token
|  3884 |             VkPhysicalDeviceImageCompressionControlSwapchainFeaturesEXT* props = (VkPhysicalDeviceImageCompressionControlSwapchainFeaturesEXT*)structure;
|       |                                                                                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3978:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROVOKING_VERTEX_FEATURES_EXT'?
|  3978 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROVOKING_VERTEX_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3979:54: error: 'VK_EXT_PIPELINE_PROPERTIES_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_DRIVER_PROPERTIES_EXTENSION_NAME'?
|  3979 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_PIPELINE_PROPERTIES_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_DRIVER_PROPERTIES_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3980:13: error: 'VkPhysicalDevicePipelinePropertiesFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePipelinePropertiesFeaturesEXT'?
|  3980 |             VkPhysicalDevicePipelinePropertiesFeaturesEXT* props = (VkPhysicalDevicePipelinePropertiesFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDevicePipelinePropertiesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3980:60: error: 'props' was not declared in this scope
|  3980 |             VkPhysicalDevicePipelinePropertiesFeaturesEXT* props = (VkPhysicalDevicePipelinePropertiesFeaturesEXT*)structure;
|       |                                                            ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3980:115: error: expected primary-expression before ')' token
|  3980 |             VkPhysicalDevicePipelinePropertiesFeaturesEXT* props = (VkPhysicalDevicePipelinePropertiesFeaturesEXT*)structure;
|       |                                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4047:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_MAINTENANCE_1_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR'?
|  4047 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_MAINTENANCE_1_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4048:54: error: 'VK_KHR_RAY_TRACING_MAINTENANCE_1_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_RAY_TRACING_PIPELINE_EXTENSION_NAME'?
|  4048 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_RAY_TRACING_MAINTENANCE_1_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_RAY_TRACING_PIPELINE_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4049:13: error: 'VkPhysicalDeviceRayTracingMaintenance1FeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceRayTracingMaintenance1FeaturesKHR'?
|  4049 |             VkPhysicalDeviceRayTracingMaintenance1FeaturesKHR* props = (VkPhysicalDeviceRayTracingMaintenance1FeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceRayTracingMaintenance1FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4049:64: error: 'props' was not declared in this scope
|  4049 |             VkPhysicalDeviceRayTracingMaintenance1FeaturesKHR* props = (VkPhysicalDeviceRayTracingMaintenance1FeaturesKHR*)structure;
|       |                                                                ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4049:123: error: expected primary-expression before ')' token
|  4049 |             VkPhysicalDeviceRayTracingMaintenance1FeaturesKHR* props = (VkPhysicalDeviceRayTracingMaintenance1FeaturesKHR*)structure;
|       |                                                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4171:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBPASS_MERGE_FEEDBACK_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TRANSFORM_FEEDBACK_FEATURES_EXT'?
|  4171 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBPASS_MERGE_FEEDBACK_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TRANSFORM_FEEDBACK_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4172:54: error: 'VK_EXT_SUBPASS_MERGE_FEEDBACK_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_TRANSFORM_FEEDBACK_EXTENSION_NAME'?
|  4172 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_SUBPASS_MERGE_FEEDBACK_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_TRANSFORM_FEEDBACK_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4173:13: error: 'VkPhysicalDeviceSubpassMergeFeedbackFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceSubpassMergeFeedbackFeaturesEXT'?
|  4173 |             VkPhysicalDeviceSubpassMergeFeedbackFeaturesEXT* props = (VkPhysicalDeviceSubpassMergeFeedbackFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceSubpassMergeFeedbackFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4173:62: error: 'props' was not declared in this scope
|  4173 |             VkPhysicalDeviceSubpassMergeFeedbackFeaturesEXT* props = (VkPhysicalDeviceSubpassMergeFeedbackFeaturesEXT*)structure;
|       |                                                              ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4173:119: error: expected primary-expression before ')' token
|  4173 |             VkPhysicalDeviceSubpassMergeFeedbackFeaturesEXT* props = (VkPhysicalDeviceSubpassMergeFeedbackFeaturesEXT*)structure;
|       |                                                                                                                       ^
| ninja: build stopped: subcommand failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/temp/run.do_compile.3905624:154 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/temp/run.do_compile.3905624, line 154
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/temp/run.do_compile.3905624, line 148
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/temp/run.do_compile.3905624, line 143
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/temp/run.do_compile.3905624, line 167
NOTE: recipe vulkan-tools-1.3.216.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1189 tasks of which 1180 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: vulkan-tools-1.3.216.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/temp/run.do_compile.3905624', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.216.0-r0/temp/log.do_compile.3905624
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb:do_compile) failed with exit code '1'

--===============5487949365495507309==--

