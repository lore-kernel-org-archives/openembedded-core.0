Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43835C54E90
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:14 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.75737.1722536823011266854
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=gjBO+94z;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=kv2q6LsR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101910f3231f6-6f35e9f6-cae8-4aa9-a846-f0858e67c9c7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536833;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0nru7W9Ndp4+ysdQMR2MyWjZndiPM2zgZlXnyA1xunw=;
	b=gjBO+94zg7u0a3EgBMeEXS42b8k9GZRaHTNXDUrzuOtxeETTwtjPznlBC3857Fha
	YJpTRKQFCz4bcPdlfiZwhm0rQrKVVQ+0kxub7A3L+XtoqEOkNizo9Jot+8VcokI9xiH
	sTOYS9gUeY6AdueV3ID2A9tnVVUPc6vahUCxbw1M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536833;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0nru7W9Ndp4+ysdQMR2MyWjZndiPM2zgZlXnyA1xunw=;
	b=kv2q6LsRlRKICBqy5mqHv30i56oeWM8+i4hFvcneZ7/nKplYfQUEwzxz1WT3rvrc
	ZdLyJ/7BQ4r/QpHiSXpxbU9Ov46XoYLg8Y0iAu78vzqXtAYTO6pxvXoI63X8wnEz2sN
	L22nIEZo1712J/yr4SINz2BPCVHzaw5bJ1SrLzbY=
Content-Type: multipart/mixed; boundary="===============5756808669308973991=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.3.290.0 FAILED
Message-ID: <010101910f3231f6-6f35e9f6-cae8-4aa9-a846-f0858e67c9c7-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202850

--===============5756808669308973991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-tools* to *1.3.290.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.3.283.0-1.3.290.0.patch
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

-- >8 --
From a7ee8d719694a225972671d96697307a20ad7dcd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 14:35:34 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.3.283.0 -> 1.3.290.0

---
 .../{vulkan-tools_1.3.283.0.bb => vulkan-tools_1.3.290.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.283.0.bb => vulkan-tools_1.3.290.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.283.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.290.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.283.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.290.0.bb
index a76f60735f..9ef7d4daea 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.283.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.290.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.3.283;protocol=https"
-SRCREV = "38321da9031f5909f1ca2dbafac8840ef6b2c144"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https"
+SRCREV = "53a6ba7c235cbe0b0f3e85e3de6d9070bcfec710"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.0


--===============5756808669308973991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1883 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1883 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-91eb39ad6fa1f33b9e19deaba0421c152354f9a1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:91eb39ad6fa1f33b9e19deaba0421c152354f9a1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 195 Local 186 Mirrors 0 Missed 9 Current 374 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 450 of 569 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.290.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 452 of 569 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.290.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-tools-1.3.290.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe vulkan-tools-1.3.290.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-tools-1.3.290.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-tools-1.3.290.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 569 of 569 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-tools-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-tools-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1584 of 1604 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.290.0.bb:do_fetch)
NOTE: recipe vulkan-tools-1.3.290.0-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.3.290.0-r0: task do_fetch: Succeeded
NOTE: Running task 1585 of 1604 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.290.0.bb:do_unpack)
NOTE: Running task 1586 of 1604 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.290.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.3.290.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.3.290.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.3.290.0-r0: task do_unpack: Succeeded
NOTE: Running task 1587 of 1604 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.290.0.bb:do_patch)
NOTE: Running task 1588 of 1604 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.290.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-tools-1.3.290.0-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.3.290.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.3.290.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-tools-1.3.290.0-r0: task do_patch: Succeeded
NOTE: Running task 1590 of 1604 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.290.0.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-tools-1.3.290.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.3.290.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-tools-1.3.290.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1592 of 1604 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.290.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.3.290.0-r0: task do_configure: Started
NOTE: recipe vulkan-tools-1.3.290.0-r0: task do_configure: Succeeded
NOTE: Running task 1593 of 1604 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.290.0.bb:do_compile)
NOTE: recipe vulkan-tools-1.3.290.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/build --target all --
| Change Dir: '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/build'
| 
| Run Build Command(s): ninja -v -j 16 all
| [1/4] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/recipe-sysroot -DGIT_BRANCH_NAME=\"main\" -DGIT_TAG_INFO=\"vulkan-sdk-1.3.290.0\" -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yoct
 o-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git=/usr/src/debug/vulkan-tools/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git=/usr/src/debug/vulkan-tools/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/build=/usr/src/debug/vulkan-tools/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/build=/usr/src/debug/vulkan-tools/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tool
 s/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-stringop-truncation -Wpointer-arith -Wno-unused-function -Wno-sign-compare -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/mock_icd.cpp
| FAILED: icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/recipe-sysroot -DGIT_BRANCH_NAME=\"main\" -DGIT_TAG_INFO=\"vulkan-sdk-1.3.290.0\" -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-work
 er/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git=/usr/src/debug/vulkan-tools/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git=/usr/src/debug/vulkan-tools/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/build=/usr/src/debug/vulkan-tools/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/build=/usr/src/debug/vulkan-tools/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.
 290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-stringop-truncation -Wpointer-arith -Wno-unused-function -Wno-sign-compare -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/mock_icd.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/mock_icd.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/mock_icd.cpp:17:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:3834:31: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR'?
|  3834 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:3834:90: error: template argument 1 is invalid
|  3834 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR> {
|       |                                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:3838:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR'?
|  3838 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:3838:114: error: template argument 1 is invalid
|  3838 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR> {
|       |                                                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:3843:31: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  3843 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance7FeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:3843:70: error: template argument 1 is invalid
|  3843 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance7FeaturesKHR> {
|       |                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:3847:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES_KHR'?
|  3847 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:3847:92: error: template argument 1 is invalid
|  3847 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR> {
|       |                                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:3852:31: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  3852 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance7PropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:3852:72: error: template argument 1 is invalid
|  3852 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance7PropertiesKHR> {
|       |                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:3856:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES_KHR'?
|  3856 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:3856:94: error: template argument 1 is invalid
|  3856 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR> {
|       |                                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:3861:31: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceGroupPropertiesKHR'?
|  3861 | template <> struct LvlTypeMap<VkPhysicalDeviceLayeredApiPropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceGroupPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:3861:70: error: template argument 1 is invalid
|  3861 | template <> struct LvlTypeMap<VkPhysicalDeviceLayeredApiPropertiesKHR> {
|       |                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:3865:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT'?
|  3865 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:3865:92: error: template argument 1 is invalid
|  3865 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_KHR> {
|       |                                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:3870:31: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceLayeredDriverPropertiesMSFT'?
|  3870 | template <> struct LvlTypeMap<VkPhysicalDeviceLayeredApiPropertiesListKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceLayeredDriverPropertiesMSFT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:3870:74: error: template argument 1 is invalid
|  3870 | template <> struct LvlTypeMap<VkPhysicalDeviceLayeredApiPropertiesListKHR> {
|       |                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:3874:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT'?
|  3874 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:3874:97: error: template argument 1 is invalid
|  3874 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR> {
|       |                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:3879:31: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceLayeredDriverPropertiesMSFT'?
|  3879 | template <> struct LvlTypeMap<VkPhysicalDeviceLayeredApiVulkanPropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceLayeredDriverPropertiesMSFT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:3879:76: error: template argument 1 is invalid
|  3879 | template <> struct LvlTypeMap<VkPhysicalDeviceLayeredApiVulkanPropertiesKHR> {
|       |                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:3883:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_VULKAN_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT'?
|  3883 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_VULKAN_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:3883:99: error: template argument 1 is invalid
|  3883 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_VULKAN_PROPERTIES_KHR> {
|       |                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:7743:31: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT'?
|  7743 | template <> struct LvlTypeMap<VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:7743:80: error: template argument 1 is invalid
|  7743 | template <> struct LvlTypeMap<VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT> {
|       |                                                                                ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:7747:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT'?
|  7747 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:7747:103: error: template argument 1 is invalid
|  7747 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT> {
|       |                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:7752:31: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceVertexAttributeDivisorPropertiesEXT'?
|  7752 | template <> struct LvlTypeMap<VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceVertexAttributeDivisorPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:7752:82: error: template argument 1 is invalid
|  7752 | template <> struct LvlTypeMap<VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT> {
|       |                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:7756:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_EXT'?
|  7756 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:7756:105: error: template argument 1 is invalid
|  7756 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT> {
|       |                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:8095:31: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT'?
|  8095 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:8095:84: error: template argument 1 is invalid
|  8095 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT> {
|       |                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:8099:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT'?
|  8099 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:8099:107: error: template argument 1 is invalid
|  8099 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT> {
|       |                                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:8113:31: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' was not declared in this scope; did you mean 'VkPhysicalDeviceImageCompressionControlFeaturesEXT'?
|  8113 | template <> struct LvlTypeMap<VkPhysicalDeviceImageAlignmentControlFeaturesMESA> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceImageCompressionControlFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:8113:80: error: template argument 1 is invalid
|  8113 | template <> struct LvlTypeMap<VkPhysicalDeviceImageAlignmentControlFeaturesMESA> {
|       |                                                                                ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:8117:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_FEATURES_MESA' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_FEATURES_EXT'?
|  8117 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_FEATURES_MESA> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:8117:103: error: template argument 1 is invalid
|  8117 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_FEATURES_MESA> {
|       |                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:8122:31: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' was not declared in this scope; did you mean 'VkPhysicalDeviceSubgroupSizeControlPropertiesEXT'?
|  8122 | template <> struct LvlTypeMap<VkPhysicalDeviceImageAlignmentControlPropertiesMESA> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceSubgroupSizeControlPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:8122:82: error: template argument 1 is invalid
|  8122 | template <> struct LvlTypeMap<VkPhysicalDeviceImageAlignmentControlPropertiesMESA> {
|       |                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:8126:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_PROPERTIES_MESA' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_PROPERTIES_EXT'?
|  8126 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_PROPERTIES_MESA> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:8126:105: error: template argument 1 is invalid
|  8126 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_PROPERTIES_MESA> {
|       |                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:8131:31: error: 'VkImageAlignmentControlCreateInfoMESA' was not declared in this scope
|  8131 | template <> struct LvlTypeMap<VkImageAlignmentControlCreateInfoMESA> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:8131:68: error: template argument 1 is invalid
|  8131 | template <> struct LvlTypeMap<VkImageAlignmentControlCreateInfoMESA> {
|       |                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:8135:32: error: 'VK_STRUCTURE_TYPE_IMAGE_ALIGNMENT_CONTROL_CREATE_INFO_MESA' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_VIEW_MIN_LOD_CREATE_INFO_EXT'?
|  8135 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_ALIGNMENT_CONTROL_CREATE_INFO_MESA> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_VIEW_MIN_LOD_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/icd/generated/vk_typemap_helper.h:8135:90: error: template argument 1 is invalid
|  8135 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_ALIGNMENT_CONTROL_CREATE_INFO_MESA> {
|       |                                                                                          ^
| [2/4] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git=/usr/src/debug/vulkan-tools/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git=/usr/src/debug/vulkan-tools/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/build=/usr/src/debug/vulkan-tools/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/build=/usr/src/debug/vulkan-tools/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/rec
 ipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIE -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-stringop-truncation -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/vulkaninfo.cpp
| FAILED: vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild
 /yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git=/usr/src/debug/vulkan-tools/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git=/usr/src/debug/vulkan-tools/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/build=/usr/src/debug/vulkan-tools/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/build=/usr/src/debug/vulkan-tools/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/recipe-sy
 sroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIE -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-stringop-truncation -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/vulkaninfo.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/vulkaninfo.cpp:34:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkDriverIdString(VkDriverId)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:102:15: error: 'VK_DRIVER_ID_MESA_HONEYKRISP' was not declared in this scope; did you mean 'VK_DRIVER_ID_MESA_VENUS'?
|   102 |         case (VK_DRIVER_ID_MESA_HONEYKRISP): return "DRIVER_ID_MESA_HONEYKRISP";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_DRIVER_ID_MESA_VENUS
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:103:15: error: 'VK_DRIVER_ID_RESERVED_27' was not declared in this scope; did you mean 'VK_DRIVER_ID_MESA_VENUS'?
|   103 |         case (VK_DRIVER_ID_RESERVED_27): return "DRIVER_ID_RESERVED_27";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_DRIVER_ID_MESA_VENUS
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:428:49: error: 'VkPhysicalDeviceLayeredApiKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceLayeredApiKHRString'?
|   428 | std::string VkPhysicalDeviceLayeredApiKHRString(VkPhysicalDeviceLayeredApiKHR value) {
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 VkPhysicalDeviceLayeredApiKHRString
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:428:86: error: expected ',' or ';' before '{' token
|   428 | std::string VkPhysicalDeviceLayeredApiKHRString(VkPhysicalDeviceLayeredApiKHR value) {
|       |                                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:438:70: error: 'VkPhysicalDeviceLayeredApiKHR' has not been declared
|   438 | void DumpVkPhysicalDeviceLayeredApiKHR(Printer &p, std::string name, VkPhysicalDeviceLayeredApiKHR value) {
|       |                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceLayeredApiKHR(Printer&, std::string, int)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:440:88: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|   440 |         p.PrintKeyString(name, std::string("VK_") + VkPhysicalDeviceLayeredApiKHRString(value));
|       |                                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:442:67: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|   442 |         p.PrintKeyString(name, VkPhysicalDeviceLayeredApiKHRString(value));
|       |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2100:86: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceGroupPropertiesKHR'?
|  2100 | void DumpVkPhysicalDeviceLayeredApiPropertiesKHR(Printer &p, std::string name, const VkPhysicalDeviceLayeredApiPropertiesKHR &obj) {
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                      VkPhysicalDeviceGroupPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceLayeredApiPropertiesKHR(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2103:37: error: request for member 'vendorID' in 'obj', which is of non-class type 'const int'
|  2103 |     p.PrintKeyValue("vendorID", obj.vendorID);
|       |                                     ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2104:37: error: request for member 'deviceID' in 'obj', which is of non-class type 'const int'
|  2104 |     p.PrintKeyValue("deviceID", obj.deviceID);
|       |                                     ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2105:60: error: request for member 'layeredAPI' in 'obj', which is of non-class type 'const int'
|  2105 |     DumpVkPhysicalDeviceLayeredApiKHR(p, "layeredAPI", obj.layeredAPI);
|       |                                                            ^~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2106:40: error: request for member 'deviceName' in 'obj', which is of non-class type 'const int'
|  2106 |     p.PrintKeyString("deviceName", obj.deviceName);
|       |                                        ^~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2108:90: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'VkPhysicalDeviceLayeredDriverPropertiesMSFT'?
|  2108 | void DumpVkPhysicalDeviceLayeredApiPropertiesListKHR(Printer &p, std::string name, const VkPhysicalDeviceLayeredApiPropertiesListKHR &obj) {
|       |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                          VkPhysicalDeviceLayeredDriverPropertiesMSFT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceLayeredApiPropertiesListKHR(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2111:44: error: request for member 'layeredApiCount' in 'obj', which is of non-class type 'const int'
|  2111 |     p.PrintKeyValue("layeredApiCount", obj.layeredApiCount);
|       |                                            ^~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2112:13: error: request for member 'layeredApiCount' in 'obj', which is of non-class type 'const int'
|  2112 |     if (obj.layeredApiCount == 0 || obj.pLayeredApis == nullptr) {
|       |             ^~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2112:41: error: request for member 'pLayeredApis' in 'obj', which is of non-class type 'const int'
|  2112 |     if (obj.layeredApiCount == 0 || obj.pLayeredApis == nullptr) {
|       |                                         ^~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2115:48: error: request for member 'layeredApiCount' in 'obj', which is of non-class type 'const int'
|  2115 |         ArrayWrapper arr(p,"pLayeredApis", obj.layeredApiCount);
|       |                                                ^~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2116:38: error: request for member 'layeredApiCount' in 'obj', which is of non-class type 'const int'
|  2116 |         for (uint32_t i = 0; i < obj.layeredApiCount; i++) {
|       |                                      ^~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2117:83: error: request for member 'pLayeredApis' in 'obj', which is of non-class type 'const int'
|  2117 |             DumpVkPhysicalDeviceLayeredApiPropertiesKHR(p, std::to_string(i), obj.pLayeredApis[i]);
|       |                                                                                   ^~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2126:96: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT'?
|  2126 | void DumpVkPhysicalDeviceLegacyVertexAttributesFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT &obj) {
|       |                                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceLegacyVertexAttributesFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2129:68: error: request for member 'legacyVertexAttributes' in 'obj', which is of non-class type 'const int'
|  2129 |     p.PrintKeyBool("legacyVertexAttributes", static_cast<bool>(obj.legacyVertexAttributes));
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2131:98: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceVertexAttributeDivisorPropertiesEXT'?
|  2131 | void DumpVkPhysicalDeviceLegacyVertexAttributesPropertiesEXT(Printer &p, std::string name, const VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT &obj) {
|       |                                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                  VkPhysicalDeviceVertexAttributeDivisorPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceLegacyVertexAttributesPropertiesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2134:72: error: request for member 'nativeUnalignedPerformance' in 'obj', which is of non-class type 'const int'
|  2134 |     p.PrintKeyBool("nativeUnalignedPerformance", static_cast<bool>(obj.nativeUnalignedPerformance));
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2326:86: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  2326 | void DumpVkPhysicalDeviceMaintenance7FeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceMaintenance7FeaturesKHR &obj) {
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                      VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceMaintenance7FeaturesKHR(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2329:58: error: request for member 'maintenance7' in 'obj', which is of non-class type 'const int'
|  2329 |     p.PrintKeyBool("maintenance7", static_cast<bool>(obj.maintenance7));
|       |                                                          ^~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2331:88: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  2331 | void DumpVkPhysicalDeviceMaintenance7PropertiesKHR(Printer &p, std::string name, const VkPhysicalDeviceMaintenance7PropertiesKHR &obj) {
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                        VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceMaintenance7PropertiesKHR(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2334:87: error: request for member 'robustFragmentShadingRateAttachmentAccess' in 'obj', which is of non-class type 'const int'
|  2334 |     p.PrintKeyBool("robustFragmentShadingRateAttachmentAccess", static_cast<bool>(obj.robustFragmentShadingRateAttachmentAccess));
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2335:82: error: request for member 'separateDepthStencilAttachmentAccess' in 'obj', which is of non-class type 'const int'
|  2335 |     p.PrintKeyBool("separateDepthStencilAttachmentAccess", static_cast<bool>(obj.separateDepthStencilAttachmentAccess));
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2336:71: error: request for member 'maxDescriptorSetTotalUniformBuffersDynamic' in 'obj', which is of non-class type 'const int'
|  2336 |     p.PrintKeyValue("maxDescriptorSetTotalUniformBuffersDynamic", obj.maxDescriptorSetTotalUniformBuffersDynamic);
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2337:71: error: request for member 'maxDescriptorSetTotalStorageBuffersDynamic' in 'obj', which is of non-class type 'const int'
|  2337 |     p.PrintKeyValue("maxDescriptorSetTotalStorageBuffersDynamic", obj.maxDescriptorSetTotalStorageBuffersDynamic);
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2338:64: error: request for member 'maxDescriptorSetTotalBuffersDynamic' in 'obj', which is of non-class type 'const int'
|  2338 |     p.PrintKeyValue("maxDescriptorSetTotalBuffersDynamic", obj.maxDescriptorSetTotalBuffersDynamic);
|       |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2339:86: error: request for member 'maxDescriptorSetUpdateAfterBindTotalUniformBuffersDynamic' in 'obj', which is of non-class type 'const int'
|  2339 |     p.PrintKeyValue("maxDescriptorSetUpdateAfterBindTotalUniformBuffersDynamic", obj.maxDescriptorSetUpdateAfterBindTotalUniformBuffersDynamic);
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2340:86: error: request for member 'maxDescriptorSetUpdateAfterBindTotalStorageBuffersDynamic' in 'obj', which is of non-class type 'const int'
|  2340 |     p.PrintKeyValue("maxDescriptorSetUpdateAfterBindTotalStorageBuffersDynamic", obj.maxDescriptorSetUpdateAfterBindTotalStorageBuffersDynamic);
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2341:79: error: request for member 'maxDescriptorSetUpdateAfterBindTotalBuffersDynamic' in 'obj', which is of non-class type 'const int'
|  2341 |     p.PrintKeyValue("maxDescriptorSetUpdateAfterBindTotalBuffersDynamic", obj.maxDescriptorSetUpdateAfterBindTotalBuffersDynamic);
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2877:106: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR'?
|  2877 | void DumpVkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR &obj) {
|       |                                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                          VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2880:78: error: request for member 'shaderRelaxedExtendedInstruction' in 'obj', which is of non-class type 'const int'
|  2880 |     p.PrintKeyBool("shaderRelaxedExtendedInstruction", static_cast<bool>(obj.shaderRelaxedExtendedInstruction));
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2882:100: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT'?
|  2882 | void DumpVkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT &obj) {
|       |                                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                    VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:2885:72: error: request for member 'shaderReplicatedComposites' in 'obj', which is of non-class type 'const int'
|  2885 |     p.PrintKeyBool("shaderReplicatedComposites", static_cast<bool>(obj.shaderReplicatedComposites));
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3423:5: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'VkPhysicalDeviceLayeredDriverPropertiesMSFT'?
|  3423 |     VkPhysicalDeviceLayeredApiPropertiesListKHR PhysicalDeviceLayeredApiPropertiesListKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceLayeredDriverPropertiesMSFT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3424:17: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceLayeredApiPropertiesKHR'?
|  3424 |     std::vector<VkPhysicalDeviceLayeredApiPropertiesKHR> VkPhysicalDeviceLayeredApiPropertiesListKHR_pLayeredApis;
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                 DumpVkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3424:56: error: template argument 1 is invalid
|  3424 |     std::vector<VkPhysicalDeviceLayeredApiPropertiesKHR> VkPhysicalDeviceLayeredApiPropertiesListKHR_pLayeredApis;
|       |                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3424:56: error: template argument 2 is invalid
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3425:5: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceVertexAttributeDivisorPropertiesEXT'?
|  3425 |     VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT PhysicalDeviceLegacyVertexAttributesPropertiesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceVertexAttributeDivisorPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3431:5: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  3431 |     VkPhysicalDeviceMaintenance7PropertiesKHR PhysicalDeviceMaintenance7PropertiesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_props2_chain::initialize_chain(AppInstance&, AppGpu&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3490:9: error: 'PhysicalDeviceLayeredApiPropertiesListKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  3490 |         PhysicalDeviceLayeredApiPropertiesListKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3490:59: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT'?
|  3490 |         PhysicalDeviceLayeredApiPropertiesListKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR;
|       |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                           VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3491:9: error: 'PhysicalDeviceLegacyVertexAttributesPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
|  3491 |         PhysicalDeviceLegacyVertexAttributesPropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3491:67: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_EXT'?
|  3491 |         PhysicalDeviceLegacyVertexAttributesPropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT;
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                   VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3497:9: error: 'PhysicalDeviceMaintenance7PropertiesKHR' was not declared in this scope; did you mean 'PhysicalDeviceMaintenance5PropertiesKHR'?
|  3497 |         PhysicalDeviceMaintenance7PropertiesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceMaintenance5PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3497:57: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES_KHR'?
|  3497 |         PhysicalDeviceMaintenance7PropertiesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR;
|       |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                         VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3587:54: error: 'VK_KHR_MAINTENANCE_7_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_MAINTENANCE_3_EXTENSION_NAME'?
|  3587 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_MAINTENANCE_7_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_MAINTENANCE_3_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3589:54: error: 'VK_EXT_LEGACY_VERTEX_ATTRIBUTES_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_LEGACY_DITHERING_EXTENSION_NAME'?
|  3589 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_LEGACY_VERTEX_ATTRIBUTES_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_LEGACY_DITHERING_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3604:54: error: 'VK_KHR_MAINTENANCE_7_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_MAINTENANCE_3_EXTENSION_NAME'?
|  3604 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_MAINTENANCE_7_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_MAINTENANCE_3_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_props2(Printer&, AppInstance&, AppGpu&, void*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3842:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT'?
|  3842 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3843:54: error: 'VK_KHR_MAINTENANCE_7_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_MAINTENANCE_3_EXTENSION_NAME'?
|  3843 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_MAINTENANCE_7_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_MAINTENANCE_3_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3844:13: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  3844 |             VkPhysicalDeviceLayeredApiPropertiesListKHR* props = (VkPhysicalDeviceLayeredApiPropertiesListKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3844:58: error: 'props' was not declared in this scope
|  3844 |             VkPhysicalDeviceLayeredApiPropertiesListKHR* props = (VkPhysicalDeviceLayeredApiPropertiesListKHR*)structure;
|       |                                                          ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3844:111: error: expected primary-expression before ')' token
|  3844 |             VkPhysicalDeviceLayeredApiPropertiesListKHR* props = (VkPhysicalDeviceLayeredApiPropertiesListKHR*)structure;
|       |                                                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3848:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_EXT'?
|  3848 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3849:54: error: 'VK_EXT_LEGACY_VERTEX_ATTRIBUTES_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_LEGACY_DITHERING_EXTENSION_NAME'?
|  3849 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_LEGACY_VERTEX_ATTRIBUTES_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_LEGACY_DITHERING_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3850:13: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
|  3850 |             VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT* props = (VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3850:66: error: 'props' was not declared in this scope
|  3850 |             VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT* props = (VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT*)structure;
|       |                                                                  ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3850:127: error: expected primary-expression before ')' token
|  3850 |             VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT* props = (VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT*)structure;
|       |                                                                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3886:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES_KHR'?
|  3886 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3887:54: error: 'VK_KHR_MAINTENANCE_7_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_MAINTENANCE_3_EXTENSION_NAME'?
|  3887 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_MAINTENANCE_7_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_MAINTENANCE_3_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3888:13: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  3888 |             VkPhysicalDeviceMaintenance7PropertiesKHR* props = (VkPhysicalDeviceMaintenance7PropertiesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3888:56: error: 'props' was not declared in this scope
|  3888 |             VkPhysicalDeviceMaintenance7PropertiesKHR* props = (VkPhysicalDeviceMaintenance7PropertiesKHR*)structure;
|       |                                                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:3888:107: error: expected primary-expression before ')' token
|  3888 |             VkPhysicalDeviceMaintenance7PropertiesKHR* props = (VkPhysicalDeviceMaintenance7PropertiesKHR*)structure;
|       |                                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void prepare_phys_device_props2_twocall_chain_vectors(std::unique_ptr<phys_device_props2_chain>&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:4102:69: error: request for member 'resize' in '(& chain)->std::unique_ptr<phys_device_props2_chain>::operator->()->phys_device_props2_chain::VkPhysicalDeviceLayeredApiPropertiesListKHR_pLayeredApis', which is of non-class type 'int'
|  4102 |     chain->VkPhysicalDeviceLayeredApiPropertiesListKHR_pLayeredApis.resize(chain->PhysicalDeviceLayeredApiPropertiesListKHR.layeredApiCount);
|       |                                                                     ^~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:4102:83: error: 'struct phys_device_props2_chain' has no member named 'PhysicalDeviceLayeredApiPropertiesListKHR'; did you mean 'PhysicalDeviceMaintenance5PropertiesKHR'?
|  4102 |     chain->VkPhysicalDeviceLayeredApiPropertiesListKHR_pLayeredApis.resize(chain->PhysicalDeviceLayeredApiPropertiesListKHR.layeredApiCount);
|       |                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                   PhysicalDeviceMaintenance5PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:4103:12: error: 'struct phys_device_props2_chain' has no member named 'PhysicalDeviceLayeredApiPropertiesListKHR'; did you mean 'PhysicalDeviceMaintenance5PropertiesKHR'?
|  4103 |     chain->PhysicalDeviceLayeredApiPropertiesListKHR.pLayeredApis = chain->VkPhysicalDeviceLayeredApiPropertiesListKHR_pLayeredApis.data();
|       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |            PhysicalDeviceMaintenance5PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:4103:133: error: request for member 'data' in '(& chain)->std::unique_ptr<phys_device_props2_chain>::operator->()->phys_device_props2_chain::VkPhysicalDeviceLayeredApiPropertiesListKHR_pLayeredApis', which is of non-class type 'int'
|  4103 |     chain->PhysicalDeviceLayeredApiPropertiesListKHR.pLayeredApis = chain->VkPhysicalDeviceLayeredApiPropertiesListKHR_pLayeredApis.data();
|       |                                                                                                                                     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:4190:5: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT'?
|  4190 |     VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT PhysicalDeviceLegacyVertexAttributesFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:4195:5: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  4195 |     VkPhysicalDeviceMaintenance7FeaturesKHR PhysicalDeviceMaintenance7FeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:4250:5: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR'?
|  4250 |     VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR PhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:4251:5: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT'?
|  4251 |     VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT PhysicalDeviceShaderReplicatedCompositesFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_features2_chain::initialize_chain(AppGpu&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:4329:9: error: 'PhysicalDeviceLegacyVertexAttributesFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
|  4329 |         PhysicalDeviceLegacyVertexAttributesFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:4329:65: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT'?
|  4329 |         PhysicalDeviceLegacyVertexAttributesFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT;
|       |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:4334:9: error: 'PhysicalDeviceMaintenance7FeaturesKHR' was not declared in this scope; did you mean 'PhysicalDeviceMaintenance5FeaturesKHR'?
|  4334 |         PhysicalDeviceMaintenance7FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceMaintenance5FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:4334:55: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES_KHR'?
|  4334 |         PhysicalDeviceMaintenance7FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR;
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                       VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:4388:9: error: 'PhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  4388 |         PhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:4388:75: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR'?
|  4388 |         PhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR;
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                           VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:4389:9: error: 'PhysicalDeviceShaderReplicatedCompositesFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
|  4389 |         PhysicalDeviceShaderReplicatedCompositesFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:4389:69: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT'?
|  4389 |         PhysicalDeviceShaderReplicatedCompositesFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT;
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                     VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:4529:54: error: 'VK_EXT_LEGACY_VERTEX_ATTRIBUTES_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_LEGACY_DITHERING_EXTENSION_NAME'?
|  4529 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_LEGACY_VERTEX_ATTRIBUTES_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_LEGACY_DITHERING_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:4541:54: error: 'VK_KHR_MAINTENANCE_7_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_MAINTENANCE_3_EXTENSION_NAME'?
|  4541 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_MAINTENANCE_7_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_MAINTENANCE_3_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:4659:54: error: 'VK_KHR_SHADER_RELAXED_EXTENDED_INSTRUCTION_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_SHADER_SUBGROUP_EXTENDED_TYPES_EXTENSION_NAME'?
|  4659 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_SHADER_RELAXED_EXTENDED_INSTRUCTION_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_SHADER_SUBGROUP_EXTENDED_TYPES_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:4661:54: error: 'VK_EXT_SHADER_REPLICATED_COMPOSITES_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_SHADER_IMAGE_ATOMIC_INT64_EXTENSION_NAME'?
|  4661 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_SHADER_REPLICATED_COMPOSITES_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_SHADER_IMAGE_ATOMIC_INT64_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, void*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:5054:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT'?
|  5054 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:5055:54: error: 'VK_EXT_LEGACY_VERTEX_ATTRIBUTES_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_LEGACY_DITHERING_EXTENSION_NAME'?
|  5055 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_LEGACY_VERTEX_ATTRIBUTES_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_LEGACY_DITHERING_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:5056:13: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
|  5056 |             VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT* props = (VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:5056:64: error: 'props' was not declared in this scope
|  5056 |             VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT* props = (VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT*)structure;
|       |                                                                ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:5056:123: error: expected primary-expression before ')' token
|  5056 |             VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT* props = (VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT*)structure;
|       |                                                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:5085:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES_KHR'?
|  5085 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:5086:54: error: 'VK_KHR_MAINTENANCE_7_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_MAINTENANCE_3_EXTENSION_NAME'?
|  5086 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_MAINTENANCE_7_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_MAINTENANCE_3_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:5087:13: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  5087 |             VkPhysicalDeviceMaintenance7FeaturesKHR* props = (VkPhysicalDeviceMaintenance7FeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:5087:54: error: 'props' was not declared in this scope
|  5087 |             VkPhysicalDeviceMaintenance7FeaturesKHR* props = (VkPhysicalDeviceMaintenance7FeaturesKHR*)structure;
|       |                                                      ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:5087:103: error: expected primary-expression before ')' token
|  5087 |             VkPhysicalDeviceMaintenance7FeaturesKHR* props = (VkPhysicalDeviceMaintenance7FeaturesKHR*)structure;
|       |                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:5409:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR'?
|  5409 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:5410:54: error: 'VK_KHR_SHADER_RELAXED_EXTENDED_INSTRUCTION_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_SHADER_SUBGROUP_EXTENDED_TYPES_EXTENSION_NAME'?
|  5410 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_SHADER_RELAXED_EXTENDED_INSTRUCTION_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_SHADER_SUBGROUP_EXTENDED_TYPES_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:5411:13: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  5411 |             VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR* props = (VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:5411:74: error: 'props' was not declared in this scope
|  5411 |             VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR* props = (VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR*)structure;
|       |                                                                          ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:5411:143: error: expected primary-expression before ')' token
|  5411 |             VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR* props = (VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR*)structure;
|       |                                                                                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:5415:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT'?
|  5415 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:5416:54: error: 'VK_EXT_SHADER_REPLICATED_COMPOSITES_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_SHADER_IMAGE_ATOMIC_INT64_EXTENSION_NAME'?
|  5416 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_SHADER_REPLICATED_COMPOSITES_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_SHADER_IMAGE_ATOMIC_INT64_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:5417:13: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
|  5417 |             VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT* props = (VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:5417:68: error: 'props' was not declared in this scope
|  5417 |             VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT* props = (VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT*)structure;
|       |                                                                    ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/git/vulkaninfo/generated/vulkaninfo.hpp:5417:131: error: expected primary-expression before ')' token
|  5417 |             VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT* props = (VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT*)structure;
|       |                                                                                                                                   ^
| ninja: build stopped: subcommand failed.
| 
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/temp/run.do_compile.3723727:153 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/temp/run.do_compile.3723727, line 153
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/temp/run.do_compile.3723727, line 147
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/temp/run.do_compile.3723727, line 142
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/temp/run.do_compile.3723727, line 166
NOTE: recipe vulkan-tools-1.3.290.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1593 tasks of which 1585 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801143509.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801143509.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.290.0.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-tools-1.3.290.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/temp/run.do_compile.3723727', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.290.0/temp/log.do_compile.3723727
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.290.0.bb:do_compile) failed with exit code '1'

--===============5756808669308973991==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.3.283.0-1.3.290.0.patch"

RnJvbSBhN2VlOGQ3MTk2OTRhMjI1OTcyNjcxZDk2Njk3MzA3YTIwYWQ3ZGNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxNDozNTozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi10b29sczogdXBncmFkZSAxLjMuMjgzLjAgLT4gMS4zLjI5MC4wCgotLS0KIC4uLi97dnVs
a2FuLXRvb2xzXzEuMy4yODMuMC5iYiA9PiB2dWxrYW4tdG9vbHNfMS4zLjI5MC4wLmJifSAgfCA0
ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLXRvb2xzXzEuMy4yODMu
MC5iYiA9PiB2dWxrYW4tdG9vbHNfMS4zLjI5MC4wLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuMy4yODMuMC5iYiBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuMy4yOTAuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2Fu
L3Z1bGthbi10b29sc18xLjMuMjgzLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuMy4yOTAuMC5iYgppbmRleCBhNzZmNjA3MzVmLi45ZWY3
ZDRkYWVhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10
b29sc18xLjMuMjgzLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxr
YW4tdG9vbHNfMS4zLjI5MC4wLmJiCkBAIC02LDggKzYsOCBAQCBTRUNUSU9OID0gImxpYnMiCiAK
IExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VO
U0UudHh0O21kNT0zYjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKLVNSQ19VUkkgPSAi
Z2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLVRvb2xzLmdpdDticmFuY2g9dnVs
a2FuLXNkay0xLjMuMjgzO3Byb3RvY29sPWh0dHBzIgotU1JDUkVWID0gIjM4MzIxZGE5MDMxZjU5
MDlmMWNhMmRiYWZhYzg4NDBlZjZiMmMxNDQiCitTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20v
S2hyb25vc0dyb3VwL1Z1bGthbi1Ub29scy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMi
CitTUkNSRVYgPSAiNTNhNmJhN2MyMzVjYmUwYjBmM2U4NWUzZGU2ZDkwNzBiY2ZlYzcxMCIKIAog
UyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi40NC4wCgo=

--===============5756808669308973991==--

