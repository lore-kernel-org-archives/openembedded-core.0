Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E38CD12AC
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:27 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.44652.1711994602284417796
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DhdQYxwq;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=aarlw/Y5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018e9ad4853c-fc1b1a17-956b-422a-a50f-5a674239429e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994603;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=r2pU9mZK4Yobb0iyYCi+j5cQn8vCQLkvcTheOSKPtCQ=;
	b=DhdQYxwqfb1eAlV1iw9+TLjyGvFjsfAI9SPFKcz9EEGfPklh7zLoLooxCaWESlGh
	EtmjKDeqoiGXgUGrgf2zuNHzbj0jpnRUwOGxWLuvNo4d54sqCSCEmOdefDhgim6gcuN
	oNKI0/1WmG62DpKGiwY+v2cdiV0aaw57SQ1RXYcg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994603;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=r2pU9mZK4Yobb0iyYCi+j5cQn8vCQLkvcTheOSKPtCQ=;
	b=aarlw/Y5cUoxYr9VPNkoGqoyhYAh1kVd+7UiXbzI9Brq/VxYEHBH1RC3eoB9aVWa
	/JCYtJ+Pwr8KhsycTQDQsMSVbEWRMzCrOq55uI9/hacRwV25QcRzLY2wC07bQwAyVu0
	XkEEwC6htF9HVbQ40d1a0FbtVgOq4FlZNKYarCq0=
Content-Type: multipart/mixed; boundary="===============2681358253810331728=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.3.280.0 FAILED
Message-ID: <0101018e9ad4853c-fc1b1a17-956b-422a-a50f-5a674239429e-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197794

--===============2681358253810331728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-tools* to *1.3.280.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.3.275.0-1.3.280.0.patch
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
From cb77429e9672b8dde459d5b4ac2eb5db39ef7345 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 14:09:07 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.3.275.0 -> 1.3.280.0

---
 .../{vulkan-tools_1.3.275.0.bb => vulkan-tools_1.3.280.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.275.0.bb => vulkan-tools_1.3.280.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.280.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.280.0.bb
index f86912c903..a7e4a67aaa 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.280.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https"
-SRCREV = "c86d42cf9eb620eeac377e3bff46ae342c5cd664"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.3.280;protocol=https"
+SRCREV = "136976082d0b14dad8b9687982b2a80cc6e6a633"
 
 S = "${WORKDIR}/git"
 
-- 
2.42.0


--===============2681358253810331728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1874 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1874 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-d82af0c671ba88f600662186b1beaebd8693b063"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d82af0c671ba88f600662186b1beaebd8693b063"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 203 Local 194 Mirrors 0 Missed 9 Current 369 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 445 of 572 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.280.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 447 of 572 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.280.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-tools-1.3.280.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe vulkan-tools-1.3.280.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-tools-1.3.280.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe vulkan-tools-1.3.280.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 572 of 572 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.280.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-tools-1.3.280.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-tools-1.3.280.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1590 of 1610 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.280.0.bb:do_fetch)
NOTE: recipe vulkan-tools-1.3.280.0-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.3.280.0-r0: task do_fetch: Succeeded
NOTE: Running task 1591 of 1610 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.280.0.bb:do_unpack)
NOTE: Running task 1592 of 1610 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.280.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.3.280.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.3.280.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.3.280.0-r0: task do_unpack: Succeeded
NOTE: Running task 1593 of 1610 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.280.0.bb:do_patch)
NOTE: Running task 1594 of 1610 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.280.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-tools-1.3.280.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.3.280.0-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.3.280.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-tools-1.3.280.0-r0: task do_patch: Succeeded
NOTE: Running task 1596 of 1610 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.280.0.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-tools-1.3.280.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.3.280.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-tools-1.3.280.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1598 of 1610 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.280.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.3.280.0-r0: task do_configure: Started
NOTE: recipe vulkan-tools-1.3.280.0-r0: task do_configure: Succeeded
NOTE: Running task 1599 of 1610 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.280.0.bb:do_compile)
NOTE: recipe vulkan-tools-1.3.280.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/build --target all --
| Change Dir: '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/build'
| 
| Run Build Command(s): ninja -v -j 16 all
| [1/4] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/recipe-sysroot -DGIT_BRANCH_NAME=\"vulkan-sdk-1.3.280\" -DGIT_TAG_INFO=\"vulkan-sdk-1.3.280.0\" -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/
 pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git=/usr/src/debug/vulkan-tools/1.3.280.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git=/usr/src/debug/vulkan-tools/1.3.280.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/build=/usr/src/debug/vulkan-tools/1.3.280.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/build=/usr/src/debug/vulkan-tools/1.3.280.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/recipe-sysroot-native=  -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-stringop-truncation -Wpointer-arith -Wno-unused-function -Wno-sign-compare -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/mock_icd.cpp
| FAILED: icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/recipe-sysroot -DGIT_BRANCH_NAME=\"vulkan-sdk-1.3.280\" -DGIT_TAG_INFO=\"vulkan-sdk-1.3.280.0\" -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybu
 ild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git=/usr/src/debug/vulkan-tools/1.3.280.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git=/usr/src/debug/vulkan-tools/1.3.280.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/build=/usr/src/debug/vulkan-tools/1.3.280.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/build=/usr/src/debug/vulkan-tools/1.3.280.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/b
 uild/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/recipe-sysroot-native=  -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-stringop-truncation -Wpointer-arith -Wno-unused-function -Wno-sign-compare -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/mock_icd.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/mock_icd.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/mock_icd.cpp:17:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3159:31: error: 'VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceDynamicRenderingFeaturesKHR'?
|  3159 | template <> struct LvlTypeMap<VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceDynamicRenderingFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3159:83: error: template argument 1 is invalid
|  3159 | template <> struct LvlTypeMap<VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3163:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES_KHR'?
|  3163 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3163:107: error: template argument 1 is invalid
|  3163 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES_KHR> {
|       |                                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3168:31: error: 'VkRenderingAttachmentLocationInfoKHR' was not declared in this scope; did you mean 'VkRenderingAttachmentInfoKHR'?
|  3168 | template <> struct LvlTypeMap<VkRenderingAttachmentLocationInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkRenderingAttachmentInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3168:67: error: template argument 1 is invalid
|  3168 | template <> struct LvlTypeMap<VkRenderingAttachmentLocationInfoKHR> {
|       |                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3172:32: error: 'VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_LOCATION_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_INFO_KHR'?
|  3172 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_LOCATION_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3172:88: error: template argument 1 is invalid
|  3172 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_LOCATION_INFO_KHR> {
|       |                                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3177:31: error: 'VkRenderingInputAttachmentIndexInfoKHR' was not declared in this scope; did you mean 'VkRenderingAttachmentInfoKHR'?
|  3177 | template <> struct LvlTypeMap<VkRenderingInputAttachmentIndexInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkRenderingAttachmentInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3177:69: error: template argument 1 is invalid
|  3177 | template <> struct LvlTypeMap<VkRenderingInputAttachmentIndexInfoKHR> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3181:32: error: 'VK_STRUCTURE_TYPE_RENDERING_INPUT_ATTACHMENT_INDEX_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_INFO_KHR'?
|  3181 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RENDERING_INPUT_ATTACHMENT_INDEX_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3181:91: error: template argument 1 is invalid
|  3181 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RENDERING_INPUT_ATTACHMENT_INDEX_INFO_KHR> {
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3186:31: error: 'VkPhysicalDeviceShaderQuadControlFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderAtomicInt64FeaturesKHR'?
|  3186 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderQuadControlFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderAtomicInt64FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3186:75: error: template argument 1 is invalid
|  3186 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderQuadControlFeaturesKHR> {
|       |                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3190:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_QUAD_CONTROL_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  3190 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_QUAD_CONTROL_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3190:98: error: template argument 1 is invalid
|  3190 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_QUAD_CONTROL_FEATURES_KHR> {
|       |                                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3474:31: error: 'VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderSubgroupExtendedTypesFeaturesKHR'?
|  3474 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderSubgroupExtendedTypesFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3474:78: error: template argument 1 is invalid
|  3474 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR> {
|       |                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3478:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_EXTENDED_TYPES_FEATURES_KHR'?
|  3478 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_EXTENDED_TYPES_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3478:101: error: template argument 1 is invalid
|  3478 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES_KHR> {
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3483:31: error: 'VkPhysicalDeviceShaderMaximalReconvergenceFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR'?
|  3483 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderMaximalReconvergenceFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3483:84: error: template argument 1 is invalid
|  3483 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderMaximalReconvergenceFeaturesKHR> {
|       |                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3487:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MAXIMAL_RECONVERGENCE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR'?
|  3487 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MAXIMAL_RECONVERGENCE_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3487:107: error: template argument 1 is invalid
|  3487 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MAXIMAL_RECONVERGENCE_FEATURES_KHR> {
|       |                                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3600:31: error: 'VkVideoDecodeAV1ProfileInfoKHR' was not declared in this scope; did you mean 'VkVideoDecodeH265ProfileInfoKHR'?
|  3600 | template <> struct LvlTypeMap<VkVideoDecodeAV1ProfileInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoDecodeH265ProfileInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3600:61: error: template argument 1 is invalid
|  3600 | template <> struct LvlTypeMap<VkVideoDecodeAV1ProfileInfoKHR> {
|       |                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3604:32: error: 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PROFILE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_PROFILE_INFO_KHR'?
|  3604 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PROFILE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_PROFILE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3604:83: error: template argument 1 is invalid
|  3604 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PROFILE_INFO_KHR> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3609:31: error: 'VkVideoDecodeAV1CapabilitiesKHR' was not declared in this scope; did you mean 'VkVideoDecodeCapabilitiesKHR'?
|  3609 | template <> struct LvlTypeMap<VkVideoDecodeAV1CapabilitiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoDecodeCapabilitiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3609:62: error: template argument 1 is invalid
|  3609 | template <> struct LvlTypeMap<VkVideoDecodeAV1CapabilitiesKHR> {
|       |                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3613:32: error: 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_CAPABILITIES_KHR'?
|  3613 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_CAPABILITIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3613:83: error: template argument 1 is invalid
|  3613 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3618:31: error: 'VkVideoDecodeAV1SessionParametersCreateInfoKHR' was not declared in this scope; did you mean 'VkVideoDecodeH265SessionParametersCreateInfoKHR'?
|  3618 | template <> struct LvlTypeMap<VkVideoDecodeAV1SessionParametersCreateInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoDecodeH265SessionParametersCreateInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3618:77: error: template argument 1 is invalid
|  3618 | template <> struct LvlTypeMap<VkVideoDecodeAV1SessionParametersCreateInfoKHR> {
|       |                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3622:32: error: 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_SESSION_PARAMETERS_CREATE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_SESSION_PARAMETERS_CREATE_INFO_KHR'?
|  3622 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_SESSION_PARAMETERS_CREATE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_SESSION_PARAMETERS_CREATE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3622:101: error: template argument 1 is invalid
|  3622 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_SESSION_PARAMETERS_CREATE_INFO_KHR> {
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3627:31: error: 'VkVideoDecodeAV1PictureInfoKHR' was not declared in this scope; did you mean 'VkVideoDecodeH265PictureInfoKHR'?
|  3627 | template <> struct LvlTypeMap<VkVideoDecodeAV1PictureInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoDecodeH265PictureInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3627:61: error: template argument 1 is invalid
|  3627 | template <> struct LvlTypeMap<VkVideoDecodeAV1PictureInfoKHR> {
|       |                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3631:32: error: 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PICTURE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_PICTURE_INFO_KHR'?
|  3631 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PICTURE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_PICTURE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3631:83: error: template argument 1 is invalid
|  3631 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PICTURE_INFO_KHR> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3636:31: error: 'VkVideoDecodeAV1DpbSlotInfoKHR' was not declared in this scope; did you mean 'VkVideoDecodeH265DpbSlotInfoKHR'?
|  3636 | template <> struct LvlTypeMap<VkVideoDecodeAV1DpbSlotInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoDecodeH265DpbSlotInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3636:61: error: template argument 1 is invalid
|  3636 | template <> struct LvlTypeMap<VkVideoDecodeAV1DpbSlotInfoKHR> {
|       |                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3640:32: error: 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_DPB_SLOT_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_DPB_SLOT_INFO_KHR'?
|  3640 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_DPB_SLOT_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_DPB_SLOT_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3640:84: error: template argument 1 is invalid
|  3640 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_DPB_SLOT_INFO_KHR> {
|       |                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3690:31: error: 'VkPhysicalDeviceShaderFloatControls2FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderFloat16Int8FeaturesKHR'?
|  3690 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderFloatControls2FeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderFloat16Int8FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3690:78: error: template argument 1 is invalid
|  3690 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderFloatControls2FeaturesKHR> {
|       |                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3694:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES_KHR'?
|  3694 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3694:102: error: template argument 1 is invalid
|  3694 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES_KHR> {
|       |                                                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3699:31: error: 'VkPhysicalDeviceIndexTypeUint8FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceIndexTypeUint8FeaturesEXT'?
|  3699 | template <> struct LvlTypeMap<VkPhysicalDeviceIndexTypeUint8FeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceIndexTypeUint8FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3699:72: error: template argument 1 is invalid
|  3699 | template <> struct LvlTypeMap<VkPhysicalDeviceIndexTypeUint8FeaturesKHR> {
|       |                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3703:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT'?
|  3703 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3703:95: error: template argument 1 is invalid
|  3703 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_KHR> {
|       |                                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3708:31: error: 'VkPhysicalDeviceLineRasterizationFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceLineRasterizationFeaturesEXT'?
|  3708 | template <> struct LvlTypeMap<VkPhysicalDeviceLineRasterizationFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceLineRasterizationFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3708:75: error: template argument 1 is invalid
|  3708 | template <> struct LvlTypeMap<VkPhysicalDeviceLineRasterizationFeaturesKHR> {
|       |                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3712:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_EXT'?
|  3712 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3712:97: error: template argument 1 is invalid
|  3712 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_KHR> {
|       |                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3717:31: error: 'VkPhysicalDeviceLineRasterizationPropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceLineRasterizationPropertiesEXT'?
|  3717 | template <> struct LvlTypeMap<VkPhysicalDeviceLineRasterizationPropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceLineRasterizationPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3717:77: error: template argument 1 is invalid
|  3717 | template <> struct LvlTypeMap<VkPhysicalDeviceLineRasterizationPropertiesKHR> {
|       |                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3721:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_EXT'?
|  3721 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3721:99: error: template argument 1 is invalid
|  3721 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_KHR> {
|       |                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3726:31: error: 'VkPipelineRasterizationLineStateCreateInfoKHR' was not declared in this scope; did you mean 'VkPipelineRasterizationLineStateCreateInfoEXT'?
|  3726 | template <> struct LvlTypeMap<VkPipelineRasterizationLineStateCreateInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPipelineRasterizationLineStateCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3726:76: error: template argument 1 is invalid
|  3726 | template <> struct LvlTypeMap<VkPipelineRasterizationLineStateCreateInfoKHR> {
|       |                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3730:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_LINE_STATE_CREATE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_LINE_STATE_CREATE_INFO_EXT'?
|  3730 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_LINE_STATE_CREATE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_LINE_STATE_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3730:99: error: template argument 1 is invalid
|  3730 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_LINE_STATE_CREATE_INFO_KHR> {
|       |                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3744:31: error: 'VkPhysicalDeviceShaderExpectAssumeFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderFloat16Int8FeaturesKHR'?
|  3744 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderExpectAssumeFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderFloat16Int8FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3744:76: error: template argument 1 is invalid
|  3744 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderExpectAssumeFeaturesKHR> {
|       |                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3748:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES_KHR'?
|  3748 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:3748:99: error: template argument 1 is invalid
|  3748 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES_KHR> {
|       |                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:5477:31: error: 'VkPhysicalDeviceMapMemoryPlacedFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMemoryPriorityFeaturesEXT'?
|  5477 | template <> struct LvlTypeMap<VkPhysicalDeviceMapMemoryPlacedFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMemoryPriorityFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:5477:73: error: template argument 1 is invalid
|  5477 | template <> struct LvlTypeMap<VkPhysicalDeviceMapMemoryPlacedFeaturesEXT> {
|       |                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:5481:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAP_MEMORY_PLACED_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT'?
|  5481 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAP_MEMORY_PLACED_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:5481:96: error: template argument 1 is invalid
|  5481 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAP_MEMORY_PLACED_FEATURES_EXT> {
|       |                                                                                                ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:5486:31: error: 'VkPhysicalDeviceMapMemoryPlacedPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMemoryBudgetPropertiesEXT'?
|  5486 | template <> struct LvlTypeMap<VkPhysicalDeviceMapMemoryPlacedPropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMemoryBudgetPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:5486:75: error: template argument 1 is invalid
|  5486 | template <> struct LvlTypeMap<VkPhysicalDeviceMapMemoryPlacedPropertiesEXT> {
|       |                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:5490:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAP_MEMORY_PLACED_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_BUDGET_PROPERTIES_EXT'?
|  5490 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAP_MEMORY_PLACED_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_BUDGET_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:5490:98: error: template argument 1 is invalid
|  5490 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAP_MEMORY_PLACED_PROPERTIES_EXT> {
|       |                                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:5495:31: error: 'VkMemoryMapPlacedInfoEXT' was not declared in this scope
|  5495 | template <> struct LvlTypeMap<VkMemoryMapPlacedInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:5495:55: error: template argument 1 is invalid
|  5495 | template <> struct LvlTypeMap<VkMemoryMapPlacedInfoEXT> {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:5499:32: error: 'VK_STRUCTURE_TYPE_MEMORY_MAP_PLACED_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_MICROMAP_CREATE_INFO_EXT'?
|  5499 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MEMORY_MAP_PLACED_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_MICROMAP_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:5499:76: error: template argument 1 is invalid
|  5499 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MEMORY_MAP_PLACED_INFO_EXT> {
|       |                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:8005:31: error: 'VkPhysicalDeviceRawAccessChainsFeaturesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceMeshShaderFeaturesNV'?
|  8005 | template <> struct LvlTypeMap<VkPhysicalDeviceRawAccessChainsFeaturesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMeshShaderFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:8005:72: error: template argument 1 is invalid
|  8005 | template <> struct LvlTypeMap<VkPhysicalDeviceRawAccessChainsFeaturesNV> {
|       |                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:8009:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAW_ACCESS_CHAINS_FEATURES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_FEATURES_NV'?
|  8009 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAW_ACCESS_CHAINS_FEATURES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_FEATURES_NV
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:8009:95: error: template argument 1 is invalid
|  8009 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAW_ACCESS_CHAINS_FEATURES_NV> {
|       |                                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:8014:31: error: 'VkPhysicalDeviceShaderAtomicFloat16VectorFeaturesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT'?
|  8014 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderAtomicFloat16VectorFeaturesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderAtomicFloatFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:8014:82: error: template argument 1 is invalid
|  8014 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderAtomicFloat16VectorFeaturesNV> {
|       |                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:8018:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT16_VECTOR_FEATURES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_2_FEATURES_EXT'?
|  8018 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT16_VECTOR_FEATURES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_2_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:8018:106: error: template argument 1 is invalid
|  8018 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT16_VECTOR_FEATURES_NV> {
|       |                                                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:8023:31: error: 'VkPhysicalDeviceRayTracingValidationFeaturesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceRayTracingMotionBlurFeaturesNV'?
|  8023 | template <> struct LvlTypeMap<VkPhysicalDeviceRayTracingValidationFeaturesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceRayTracingMotionBlurFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:8023:77: error: template argument 1 is invalid
|  8023 | template <> struct LvlTypeMap<VkPhysicalDeviceRayTracingValidationFeaturesNV> {
|       |                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:8027:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_VALIDATION_FEATURES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_MOTION_BLUR_FEATURES_NV'?
|  8027 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_VALIDATION_FEATURES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_MOTION_BLUR_FEATURES_NV
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:8027:100: error: template argument 1 is invalid
|  8027 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_VALIDATION_FEATURES_NV> {
|       |                                                                                                    ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/function_definitions.h:25,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/mock_icd.cpp:18:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/function_declarations.h:2275:11: error: 'VkRenderingAttachmentLocationInfoKHR' does not name a type; did you mean 'VkRenderingAttachmentInfoKHR'?
|  2275 |     const VkRenderingAttachmentLocationInfoKHR* pLocationInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkRenderingAttachmentInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/function_declarations.h:2279:11: error: 'VkRenderingInputAttachmentIndexInfoKHR' does not name a type; did you mean 'VkRenderingAttachmentInfoKHR'?
|  2279 |     const VkRenderingInputAttachmentIndexInfoKHR* pLocationInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkRenderingAttachmentInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/function_definitions.h: In function 'VkResult vkmock::GetPhysicalDeviceVideoCapabilitiesKHR(VkPhysicalDevice, const VkVideoProfileInfoKHR*, VkVideoCapabilitiesKHR*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/function_definitions.h:2745:50: error: 'VkVideoDecodeAV1CapabilitiesKHR' was not declared in this scope; did you mean 'VkVideoDecodeCapabilitiesKHR'?
|  2745 |     auto caps_decode_av1 = lvl_find_mod_in_chain<VkVideoDecodeAV1CapabilitiesKHR>(pCapabilities->pNext);
|       |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                  VkVideoDecodeCapabilitiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/function_definitions.h:2745:82: error: no matching function for call to 'lvl_find_mod_in_chain<<expression error> >(void*&)'
|  2745 |     auto caps_decode_av1 = lvl_find_mod_in_chain<VkVideoDecodeAV1CapabilitiesKHR>(pCapabilities->pNext);
|       |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:8263:26: note: candidate: 'template<class T> T* lvl_find_mod_in_chain(void*)'
|  8263 | template <typename T> T *lvl_find_mod_in_chain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:8263:26: note:   template argument deduction/substitution failed:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/function_definitions.h:2745:82: error: template argument 1 is invalid
|  2745 |     auto caps_decode_av1 = lvl_find_mod_in_chain<VkVideoDecodeAV1CapabilitiesKHR>(pCapabilities->pNext);
|       |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/function_definitions.h:2840:14: error: 'VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_CODEC_OPERATION_DECODE_H265_BIT_KHR'?
|  2840 |         case VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR: {
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_VIDEO_CODEC_OPERATION_DECODE_H265_BIT_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/function_definitions.h:2841:46: error: 'VkVideoDecodeAV1ProfileInfoKHR' was not declared in this scope; did you mean 'VkVideoDecodeH265ProfileInfoKHR'?
|  2841 |             auto profile = lvl_find_in_chain<VkVideoDecodeAV1ProfileInfoKHR>(pVideoProfile->pNext);
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                              VkVideoDecodeH265ProfileInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/function_definitions.h:2841:77: error: no matching function for call to 'lvl_find_in_chain<<expression error> >(const void* const&)'
|  2841 |             auto profile = lvl_find_in_chain<VkVideoDecodeAV1ProfileInfoKHR>(pVideoProfile->pNext);
|       |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:8249:32: note: candidate: 'template<class T> const T* lvl_find_in_chain(const void*)'
|  8249 | template <typename T> const T *lvl_find_in_chain(const void *next) {
|       |                                ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/vk_typemap_helper.h:8249:32: note:   template argument deduction/substitution failed:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/function_definitions.h:2841:77: error: template argument 1 is invalid
|  2841 |             auto profile = lvl_find_in_chain<VkVideoDecodeAV1ProfileInfoKHR>(pVideoProfile->pNext);
|       |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/function_definitions.h:2842:40: error: 'STD_VIDEO_AV1_PROFILE_MAIN' was not declared in this scope; did you mean 'STD_VIDEO_H265_PROFILE_IDC_MAIN'?
|  2842 |             if (profile->stdProfile != STD_VIDEO_AV1_PROFILE_MAIN) {
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                        STD_VIDEO_H265_PROFILE_IDC_MAIN
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/function_definitions.h:2854:64: error: 'VK_STD_VULKAN_VIDEO_CODEC_AV1_DECODE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_STD_VULKAN_VIDEO_CODEC_H264_DECODE_EXTENSION_NAME'?
|  2854 |             std::strncpy(caps->stdHeaderVersion.extensionName, VK_STD_VULKAN_VIDEO_CODEC_AV1_DECODE_EXTENSION_NAME,
|       |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                VK_STD_VULKAN_VIDEO_CODEC_H264_DECODE_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/function_definitions.h:2856:55: error: 'VK_STD_VULKAN_VIDEO_CODEC_AV1_DECODE_SPEC_VERSION' was not declared in this scope; did you mean 'VK_STD_VULKAN_VIDEO_CODEC_H265_DECODE_SPEC_VERSION'?
|  2856 |             caps->stdHeaderVersion.specVersion      = VK_STD_VULKAN_VIDEO_CODEC_AV1_DECODE_SPEC_VERSION;
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                       VK_STD_VULKAN_VIDEO_CODEC_H265_DECODE_SPEC_VERSION
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/function_definitions.h:2861:49: error: 'STD_VIDEO_AV1_LEVEL_6_2' was not declared in this scope; did you mean 'STD_VIDEO_H265_LEVEL_IDC_6_2'?
|  2861 |                     caps_decode_av1->maxLevel = STD_VIDEO_AV1_LEVEL_6_2;
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 STD_VIDEO_H265_LEVEL_IDC_6_2
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/function_definitions.h:2868:49: error: 'STD_VIDEO_AV1_LEVEL_5_0' was not declared in this scope; did you mean 'STD_VIDEO_H265_LEVEL_IDC_5_0'?
|  2868 |                     caps_decode_av1->maxLevel = STD_VIDEO_AV1_LEVEL_5_0;
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 STD_VIDEO_H265_LEVEL_IDC_5_0
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/function_definitions.h:2873:49: error: 'STD_VIDEO_AV1_LEVEL_3_2' was not declared in this scope; did you mean 'STD_VIDEO_H264_LEVEL_IDC_3_2'?
|  2873 |                     caps_decode_av1->maxLevel = STD_VIDEO_AV1_LEVEL_3_2;
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 STD_VIDEO_H264_LEVEL_IDC_3_2
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/function_definitions.h: In function 'VkResult vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/function_definitions.h:3131:14: error: 'VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_CODEC_OPERATION_DECODE_H265_BIT_KHR'?
|  3131 |         case VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_VIDEO_CODEC_OPERATION_DECODE_H265_BIT_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/function_definitions.h: In function 'void vkmock::GetPhysicalDeviceQueueFamilyProperties2KHR(VkPhysicalDevice, uint32_t*, VkQueueFamilyProperties2*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/function_definitions.h:3619:53: error: 'VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_CODEC_OPERATION_DECODE_H265_BIT_KHR'?
|  3619 |                                                   | VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VK_VIDEO_CODEC_OPERATION_DECODE_H265_BIT_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/function_definitions.h: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/function_definitions.h:4299:11: error: 'VkRenderingAttachmentLocationInfoKHR' does not name a type; did you mean 'VkRenderingAttachmentInfoKHR'?
|  4299 |     const VkRenderingAttachmentLocationInfoKHR* pLocationInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkRenderingAttachmentInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/icd/generated/function_definitions.h:4306:11: error: 'VkRenderingInputAttachmentIndexInfoKHR' does not name a type; did you mean 'VkRenderingAttachmentInfoKHR'?
|  4306 |     const VkRenderingInputAttachmentIndexInfoKHR* pLocationInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkRenderingAttachmentInfoKHR
| [2/4] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-pre
 fix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git=/usr/src/debug/vulkan-tools/1.3.280.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git=/usr/src/debug/vulkan-tools/1.3.280.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/build=/usr/src/debug/vulkan-tools/1.3.280.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/build=/usr/src/debug/vulkan-tools/1.3.280.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-
 poky-linux/vulkan-tools/1.3.280.0/recipe-sysroot-native=  -fvisibility-inlines-hidden -std=c++17 -fPIE -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-stringop-truncation -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/vulkaninfo.cpp
| FAILED: vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-ma
 p  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git=/usr/src/debug/vulkan-tools/1.3.280.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git=/usr/src/debug/vulkan-tools/1.3.280.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/build=/usr/src/debug/vulkan-tools/1.3.280.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/build=/usr/src/debug/vulkan-tools/1.3.280.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-l
 inux/vulkan-tools/1.3.280.0/recipe-sysroot-native=  -fvisibility-inlines-hidden -std=c++17 -fPIE -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-stringop-truncation -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/vulkaninfo.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/vulkaninfo.cpp:34:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkImageLayoutString(VkImageLayout)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:399:15: error: 'VK_IMAGE_LAYOUT_RENDERING_LOCAL_READ_KHR' was not declared in this scope; did you mean 'VK_IMAGE_LAYOUT_READ_ONLY_OPTIMAL_KHR'?
|   399 |         case (VK_IMAGE_LAYOUT_RENDERING_LOCAL_READ_KHR): return "IMAGE_LAYOUT_RENDERING_LOCAL_READ_KHR";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_IMAGE_LAYOUT_READ_ONLY_OPTIMAL_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkResultString(VkResult)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:566:15: error: 'VK_INCOMPATIBLE_SHADER_BINARY_EXT' was not declared in this scope; did you mean 'VK_ERROR_INCOMPATIBLE_SHADER_BINARY_EXT'?
|   566 |         case (VK_INCOMPATIBLE_SHADER_BINARY_EXT): return "INCOMPATIBLE_SHADER_BINARY_EXT";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_ERROR_INCOMPATIBLE_SHADER_BINARY_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkSubgroupFeatureFlagBitsGetStrings(VkSubgroupFeatureFlagBits)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:1198:9: error: 'VK_SUBGROUP_FEATURE_ROTATE_BIT_KHR' was not declared in this scope; did you mean 'VK_SUBGROUP_FEATURE_VOTE_BIT'?
|  1198 |     if (VK_SUBGROUP_FEATURE_ROTATE_BIT_KHR & value) strings.push_back("SUBGROUP_FEATURE_ROTATE_BIT_KHR");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_SUBGROUP_FEATURE_VOTE_BIT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:1199:9: error: 'VK_SUBGROUP_FEATURE_ROTATE_CLUSTERED_BIT_KHR' was not declared in this scope; did you mean 'VK_SUBGROUP_FEATURE_CLUSTERED_BIT'?
|  1199 |     if (VK_SUBGROUP_FEATURE_ROTATE_CLUSTERED_BIT_KHR & value) strings.push_back("SUBGROUP_FEATURE_ROTATE_CLUSTERED_BIT_KHR");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_SUBGROUP_FEATURE_CLUSTERED_BIT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkVideoCodecOperationFlagBitsKHRGetStrings(VkVideoCodecOperationFlagBitsKHR)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:1345:9: error: 'VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_CODEC_OPERATION_DECODE_H265_BIT_KHR'?
|  1345 |     if (VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR & value) strings.push_back("VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_VIDEO_CODEC_OPERATION_DECODE_H265_BIT_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:1736:99: error: 'VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceDynamicRenderingFeaturesKHR'?
|  1736 | void DumpVkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR &obj) {
|       |                                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                   VkPhysicalDeviceDynamicRenderingFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:1739:71: error: request for member 'dynamicRenderingLocalRead' in 'obj', which is of non-class type 'const int'
|  1739 |     p.PrintKeyBool("dynamicRenderingLocalRead", static_cast<bool>(obj.dynamicRenderingLocalRead));
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2075:88: error: 'VkPhysicalDeviceIndexTypeUint8FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceIndexTypeUint8FeaturesEXT'?
|  2075 | void DumpVkPhysicalDeviceIndexTypeUint8FeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceIndexTypeUint8FeaturesKHR &obj) {
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                        VkPhysicalDeviceIndexTypeUint8FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceIndexTypeUint8FeaturesKHR(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2078:60: error: request for member 'indexTypeUint8' in 'obj', which is of non-class type 'const int'
|  2078 |     p.PrintKeyBool("indexTypeUint8", static_cast<bool>(obj.indexTypeUint8));
|       |                                                            ^~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2232:91: error: 'VkPhysicalDeviceLineRasterizationFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceLineRasterizationFeaturesEXT'?
|  2232 | void DumpVkPhysicalDeviceLineRasterizationFeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceLineRasterizationFeaturesKHR &obj) {
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                           VkPhysicalDeviceLineRasterizationFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceLineRasterizationFeaturesKHR(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2235:62: error: request for member 'rectangularLines' in 'obj', which is of non-class type 'const int'
|  2235 |     p.PrintKeyBool("rectangularLines", static_cast<bool>(obj.rectangularLines));
|       |                                                              ^~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2236:60: error: request for member 'bresenhamLines' in 'obj', which is of non-class type 'const int'
|  2236 |     p.PrintKeyBool("bresenhamLines", static_cast<bool>(obj.bresenhamLines));
|       |                                                            ^~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2237:57: error: request for member 'smoothLines' in 'obj', which is of non-class type 'const int'
|  2237 |     p.PrintKeyBool("smoothLines", static_cast<bool>(obj.smoothLines));
|       |                                                         ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2238:70: error: request for member 'stippledRectangularLines' in 'obj', which is of non-class type 'const int'
|  2238 |     p.PrintKeyBool("stippledRectangularLines", static_cast<bool>(obj.stippledRectangularLines));
|       |                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2239:68: error: request for member 'stippledBresenhamLines' in 'obj', which is of non-class type 'const int'
|  2239 |     p.PrintKeyBool("stippledBresenhamLines", static_cast<bool>(obj.stippledBresenhamLines));
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2240:65: error: request for member 'stippledSmoothLines' in 'obj', which is of non-class type 'const int'
|  2240 |     p.PrintKeyBool("stippledSmoothLines", static_cast<bool>(obj.stippledSmoothLines));
|       |                                                                 ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2242:93: error: 'VkPhysicalDeviceLineRasterizationPropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceLineRasterizationPropertiesEXT'?
|  2242 | void DumpVkPhysicalDeviceLineRasterizationPropertiesKHR(Printer &p, std::string name, const VkPhysicalDeviceLineRasterizationPropertiesKHR &obj) {
|       |                                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                             VkPhysicalDeviceLineRasterizationPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceLineRasterizationPropertiesKHR(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2245:54: error: request for member 'lineSubPixelPrecisionBits' in 'obj', which is of non-class type 'const int'
|  2245 |     p.PrintKeyValue("lineSubPixelPrecisionBits", obj.lineSubPixelPrecisionBits);
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2290:89: error: 'VkPhysicalDeviceMapMemoryPlacedFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceMemoryPriorityFeaturesEXT'?
|  2290 | void DumpVkPhysicalDeviceMapMemoryPlacedFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceMapMemoryPlacedFeaturesEXT &obj) {
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                         VkPhysicalDeviceMemoryPriorityFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceMapMemoryPlacedFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2293:61: error: request for member 'memoryMapPlaced' in 'obj', which is of non-class type 'const int'
|  2293 |     p.PrintKeyBool("memoryMapPlaced", static_cast<bool>(obj.memoryMapPlaced));
|       |                                                             ^~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2294:66: error: request for member 'memoryMapRangePlaced' in 'obj', which is of non-class type 'const int'
|  2294 |     p.PrintKeyBool("memoryMapRangePlaced", static_cast<bool>(obj.memoryMapRangePlaced));
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2295:64: error: request for member 'memoryUnmapReserve' in 'obj', which is of non-class type 'const int'
|  2295 |     p.PrintKeyBool("memoryUnmapReserve", static_cast<bool>(obj.memoryUnmapReserve));
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2297:91: error: 'VkPhysicalDeviceMapMemoryPlacedPropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceMemoryBudgetPropertiesEXT'?
|  2297 | void DumpVkPhysicalDeviceMapMemoryPlacedPropertiesEXT(Printer &p, std::string name, const VkPhysicalDeviceMapMemoryPlacedPropertiesEXT &obj) {
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                           VkPhysicalDeviceMemoryBudgetPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceMapMemoryPlacedPropertiesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2300:70: error: request for member 'minPlacedMemoryMapAlignment' in 'obj', which is of non-class type 'const int'
|  2300 |     p.PrintKeyValue("minPlacedMemoryMapAlignment", to_hex_str(p, obj.minPlacedMemoryMapAlignment));
|       |                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2732:92: error: 'VkPhysicalDeviceShaderExpectAssumeFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceShaderFloat16Int8FeaturesKHR'?
|  2732 | void DumpVkPhysicalDeviceShaderExpectAssumeFeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceShaderExpectAssumeFeaturesKHR &obj) {
|       |                                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                            VkPhysicalDeviceShaderFloat16Int8FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderExpectAssumeFeaturesKHR(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2735:64: error: request for member 'shaderExpectAssume' in 'obj', which is of non-class type 'const int'
|  2735 |     p.PrintKeyBool("shaderExpectAssume", static_cast<bool>(obj.shaderExpectAssume));
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2743:94: error: 'VkPhysicalDeviceShaderFloatControls2FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceShaderFloat16Int8FeaturesKHR'?
|  2743 | void DumpVkPhysicalDeviceShaderFloatControls2FeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceShaderFloatControls2FeaturesKHR &obj) {
|       |                                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                              VkPhysicalDeviceShaderFloat16Int8FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderFloatControls2FeaturesKHR(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2746:66: error: request for member 'shaderFloatControls2' in 'obj', which is of non-class type 'const int'
|  2746 |     p.PrintKeyBool("shaderFloatControls2", static_cast<bool>(obj.shaderFloatControls2));
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2793:100: error: 'VkPhysicalDeviceShaderMaximalReconvergenceFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR'?
|  2793 | void DumpVkPhysicalDeviceShaderMaximalReconvergenceFeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceShaderMaximalReconvergenceFeaturesKHR &obj) {
|       |                                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                    VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderMaximalReconvergenceFeaturesKHR(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2796:72: error: request for member 'shaderMaximalReconvergence' in 'obj', which is of non-class type 'const int'
|  2796 |     p.PrintKeyBool("shaderMaximalReconvergence", static_cast<bool>(obj.shaderMaximalReconvergence));
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2819:91: error: 'VkPhysicalDeviceShaderQuadControlFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceShaderAtomicInt64FeaturesKHR'?
|  2819 | void DumpVkPhysicalDeviceShaderQuadControlFeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceShaderQuadControlFeaturesKHR &obj) {
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                           VkPhysicalDeviceShaderAtomicInt64FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderQuadControlFeaturesKHR(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2822:63: error: request for member 'shaderQuadControl' in 'obj', which is of non-class type 'const int'
|  2822 |     p.PrintKeyBool("shaderQuadControl", static_cast<bool>(obj.shaderQuadControl));
|       |                                                               ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2829:94: error: 'VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceShaderSubgroupExtendedTypesFeaturesKHR'?
|  2829 | void DumpVkPhysicalDeviceShaderSubgroupRotateFeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR &obj) {
|       |                                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                              VkPhysicalDeviceShaderSubgroupExtendedTypesFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderSubgroupRotateFeaturesKHR(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2832:66: error: request for member 'shaderSubgroupRotate' in 'obj', which is of non-class type 'const int'
|  2832 |     p.PrintKeyBool("shaderSubgroupRotate", static_cast<bool>(obj.shaderSubgroupRotate));
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:2833:75: error: request for member 'shaderSubgroupRotateClustered' in 'obj', which is of non-class type 'const int'
|  2833 |     p.PrintKeyBool("shaderSubgroupRotateClustered", static_cast<bool>(obj.shaderSubgroupRotateClustered));
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:3363:5: error: 'VkPhysicalDeviceLineRasterizationPropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceLineRasterizationPropertiesEXT'?
|  3363 |     VkPhysicalDeviceLineRasterizationPropertiesKHR PhysicalDeviceLineRasterizationPropertiesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceLineRasterizationPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:3368:5: error: 'VkPhysicalDeviceMapMemoryPlacedPropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceMemoryBudgetPropertiesEXT'?
|  3368 |     VkPhysicalDeviceMapMemoryPlacedPropertiesEXT PhysicalDeviceMapMemoryPlacedPropertiesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMemoryBudgetPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_props2_chain::initialize_chain(AppInstance&, AppGpu&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:3425:9: error: 'PhysicalDeviceLineRasterizationPropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceLineRasterizationPropertiesEXT'?
|  3425 |         PhysicalDeviceLineRasterizationPropertiesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceLineRasterizationPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:3425:62: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_EXT'?
|  3425 |         PhysicalDeviceLineRasterizationPropertiesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_KHR;
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:3430:9: error: 'PhysicalDeviceMapMemoryPlacedPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceMapMemoryPlacedPropertiesEXT'?
|  3430 |         PhysicalDeviceMapMemoryPlacedPropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAP_MEMORY_PLACED_PROPERTIES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceMapMemoryPlacedPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:3430:60: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAP_MEMORY_PLACED_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_BUDGET_PROPERTIES_EXT'?
|  3430 |         PhysicalDeviceMapMemoryPlacedPropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAP_MEMORY_PLACED_PROPERTIES_EXT;
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_BUDGET_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:3518:54: error: 'VK_KHR_LINE_RASTERIZATION_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_LINE_RASTERIZATION_EXTENSION_NAME'?
|  3518 |          || gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_LINE_RASTERIZATION_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_LINE_RASTERIZATION_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:3530:54: error: 'VK_EXT_MAP_MEMORY_PLACED_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_MAP_MEMORY_2_EXTENSION_NAME'?
|  3530 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_MAP_MEMORY_PLACED_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_MAP_MEMORY_2_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_props2(Printer&, AppInstance&, AppGpu&, void*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:3760:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_EXT'?
|  3760 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:3761:140: error: 'VK_KHR_LINE_RASTERIZATION_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_LINE_RASTERIZATION_EXTENSION_NAME'?
|  3761 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_LINE_RASTERIZATION_EXTENSION_NAME) || gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_LINE_RASTERIZATION_EXTENSION_NAME))) {
|       |                                                                                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                                            VK_EXT_LINE_RASTERIZATION_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:3762:13: error: 'VkPhysicalDeviceLineRasterizationPropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceLineRasterizationPropertiesEXT'?
|  3762 |             VkPhysicalDeviceLineRasterizationPropertiesKHR* props = (VkPhysicalDeviceLineRasterizationPropertiesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceLineRasterizationPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:3762:61: error: 'props' was not declared in this scope
|  3762 |             VkPhysicalDeviceLineRasterizationPropertiesKHR* props = (VkPhysicalDeviceLineRasterizationPropertiesKHR*)structure;
|       |                                                             ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:3762:117: error: expected primary-expression before ')' token
|  3762 |             VkPhysicalDeviceLineRasterizationPropertiesKHR* props = (VkPhysicalDeviceLineRasterizationPropertiesKHR*)structure;
|       |                                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:3792:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAP_MEMORY_PLACED_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_BUDGET_PROPERTIES_EXT'?
|  3792 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAP_MEMORY_PLACED_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_BUDGET_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:3793:54: error: 'VK_EXT_MAP_MEMORY_PLACED_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_MAP_MEMORY_2_EXTENSION_NAME'?
|  3793 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_MAP_MEMORY_PLACED_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_MAP_MEMORY_2_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:3794:13: error: 'VkPhysicalDeviceMapMemoryPlacedPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceMapMemoryPlacedPropertiesEXT'?
|  3794 |             VkPhysicalDeviceMapMemoryPlacedPropertiesEXT* props = (VkPhysicalDeviceMapMemoryPlacedPropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceMapMemoryPlacedPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:3794:59: error: 'props' was not declared in this scope
|  3794 |             VkPhysicalDeviceMapMemoryPlacedPropertiesEXT* props = (VkPhysicalDeviceMapMemoryPlacedPropertiesEXT*)structure;
|       |                                                           ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:3794:113: error: expected primary-expression before ')' token
|  3794 |             VkPhysicalDeviceMapMemoryPlacedPropertiesEXT* props = (VkPhysicalDeviceMapMemoryPlacedPropertiesEXT*)structure;
|       |                                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4054:5: error: 'VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceDynamicRenderingFeaturesKHR'?
|  4054 |     VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR PhysicalDeviceDynamicRenderingLocalReadFeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceDynamicRenderingFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4078:5: error: 'VkPhysicalDeviceIndexTypeUint8FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceIndexTypeUint8FeaturesEXT'?
|  4078 |     VkPhysicalDeviceIndexTypeUint8FeaturesKHR PhysicalDeviceIndexTypeUint8FeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceIndexTypeUint8FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4081:5: error: 'VkPhysicalDeviceLineRasterizationFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceLineRasterizationFeaturesEXT'?
|  4081 |     VkPhysicalDeviceLineRasterizationFeaturesKHR PhysicalDeviceLineRasterizationFeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceLineRasterizationFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4085:5: error: 'VkPhysicalDeviceMapMemoryPlacedFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceMemoryPriorityFeaturesEXT'?
|  4085 |     VkPhysicalDeviceMapMemoryPlacedFeaturesEXT PhysicalDeviceMapMemoryPlacedFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMemoryPriorityFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4129:5: error: 'VkPhysicalDeviceShaderExpectAssumeFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceShaderFloat16Int8FeaturesKHR'?
|  4129 |     VkPhysicalDeviceShaderExpectAssumeFeaturesKHR PhysicalDeviceShaderExpectAssumeFeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceShaderFloat16Int8FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4131:5: error: 'VkPhysicalDeviceShaderFloatControls2FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceShaderFloat16Int8FeaturesKHR'?
|  4131 |     VkPhysicalDeviceShaderFloatControls2FeaturesKHR PhysicalDeviceShaderFloatControls2FeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceShaderFloat16Int8FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4135:5: error: 'VkPhysicalDeviceShaderMaximalReconvergenceFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR'?
|  4135 |     VkPhysicalDeviceShaderMaximalReconvergenceFeaturesKHR PhysicalDeviceShaderMaximalReconvergenceFeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4138:5: error: 'VkPhysicalDeviceShaderQuadControlFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceShaderAtomicInt64FeaturesKHR'?
|  4138 |     VkPhysicalDeviceShaderQuadControlFeaturesKHR PhysicalDeviceShaderQuadControlFeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceShaderAtomicInt64FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4140:5: error: 'VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceShaderSubgroupExtendedTypesFeaturesKHR'?
|  4140 |     VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR PhysicalDeviceShaderSubgroupRotateFeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceShaderSubgroupExtendedTypesFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_features2_chain::initialize_chain(AppGpu&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4190:9: error: 'PhysicalDeviceDynamicRenderingLocalReadFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR'?
|  4190 |         PhysicalDeviceDynamicRenderingLocalReadFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4190:68: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES_KHR'?
|  4190 |         PhysicalDeviceDynamicRenderingLocalReadFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES_KHR;
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                    VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4213:9: error: 'PhysicalDeviceIndexTypeUint8FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceIndexTypeUint8FeaturesEXT'?
|  4213 |         PhysicalDeviceIndexTypeUint8FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceIndexTypeUint8FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4213:57: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT'?
|  4213 |         PhysicalDeviceIndexTypeUint8FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_KHR;
|       |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                         VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4216:9: error: 'PhysicalDeviceLineRasterizationFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceLineRasterizationFeaturesEXT'?
|  4216 |         PhysicalDeviceLineRasterizationFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceLineRasterizationFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4216:60: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_EXT'?
|  4216 |         PhysicalDeviceLineRasterizationFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_KHR;
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4220:9: error: 'PhysicalDeviceMapMemoryPlacedFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceMapMemoryPlacedFeaturesEXT'?
|  4220 |         PhysicalDeviceMapMemoryPlacedFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAP_MEMORY_PLACED_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceMapMemoryPlacedFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4220:58: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAP_MEMORY_PLACED_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT'?
|  4220 |         PhysicalDeviceMapMemoryPlacedFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAP_MEMORY_PLACED_FEATURES_EXT;
|       |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4264:9: error: 'PhysicalDeviceShaderExpectAssumeFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderExpectAssumeFeaturesKHR'?
|  4264 |         PhysicalDeviceShaderExpectAssumeFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceShaderExpectAssumeFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4264:61: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES_KHR'?
|  4264 |         PhysicalDeviceShaderExpectAssumeFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES_KHR;
|       |                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                             VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4266:9: error: 'PhysicalDeviceShaderFloatControls2FeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderFloatControls2FeaturesKHR'?
|  4266 |         PhysicalDeviceShaderFloatControls2FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceShaderFloatControls2FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4266:63: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES_KHR'?
|  4266 |         PhysicalDeviceShaderFloatControls2FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES_KHR;
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                               VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4269:9: error: 'PhysicalDeviceShaderMaximalReconvergenceFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderMaximalReconvergenceFeaturesKHR'?
|  4269 |         PhysicalDeviceShaderMaximalReconvergenceFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MAXIMAL_RECONVERGENCE_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceShaderMaximalReconvergenceFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4269:69: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MAXIMAL_RECONVERGENCE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR'?
|  4269 |         PhysicalDeviceShaderMaximalReconvergenceFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MAXIMAL_RECONVERGENCE_FEATURES_KHR;
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                     VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4272:9: error: 'PhysicalDeviceShaderQuadControlFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderQuadControlFeaturesKHR'?
|  4272 |         PhysicalDeviceShaderQuadControlFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_QUAD_CONTROL_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceShaderQuadControlFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4272:60: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_QUAD_CONTROL_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  4272 |         PhysicalDeviceShaderQuadControlFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_QUAD_CONTROL_FEATURES_KHR;
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4274:9: error: 'PhysicalDeviceShaderSubgroupRotateFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderSubgroupRotateFeaturesKHR'?
|  4274 |         PhysicalDeviceShaderSubgroupRotateFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceShaderSubgroupRotateFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4274:63: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_EXTENDED_TYPES_FEATURES_KHR'?
|  4274 |         PhysicalDeviceShaderSubgroupRotateFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES_KHR;
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                               VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_EXTENDED_TYPES_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4353:54: error: 'VK_KHR_DYNAMIC_RENDERING_LOCAL_READ_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_DYNAMIC_RENDERING_EXTENSION_NAME'?
|  4353 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_DYNAMIC_RENDERING_LOCAL_READ_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_DYNAMIC_RENDERING_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4405:54: error: 'VK_KHR_INDEX_TYPE_UINT8_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_INDEX_TYPE_UINT8_EXTENSION_NAME'?
|  4405 |          || gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_INDEX_TYPE_UINT8_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_INDEX_TYPE_UINT8_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4413:54: error: 'VK_KHR_LINE_RASTERIZATION_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_LINE_RASTERIZATION_EXTENSION_NAME'?
|  4413 |          || gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_LINE_RASTERIZATION_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_LINE_RASTERIZATION_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4422:54: error: 'VK_EXT_MAP_MEMORY_PLACED_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_MAP_MEMORY_2_EXTENSION_NAME'?
|  4422 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_MAP_MEMORY_PLACED_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_MAP_MEMORY_2_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4518:54: error: 'VK_KHR_SHADER_EXPECT_ASSUME_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_SHADER_CLOCK_EXTENSION_NAME'?
|  4518 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_SHADER_EXPECT_ASSUME_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_SHADER_CLOCK_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4523:54: error: 'VK_KHR_SHADER_FLOAT_CONTROLS_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_SHADER_FLOAT_CONTROLS_EXTENSION_NAME'?
|  4523 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_SHADER_FLOAT_CONTROLS_2_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_SHADER_FLOAT_CONTROLS_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4530:54: error: 'VK_KHR_SHADER_MAXIMAL_RECONVERGENCE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_SHADER_FLOAT_CONTROLS_EXTENSION_NAME'?
|  4530 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_SHADER_MAXIMAL_RECONVERGENCE_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_SHADER_FLOAT_CONTROLS_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4536:54: error: 'VK_KHR_SHADER_QUAD_CONTROL_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_SHADER_FLOAT_CONTROLS_EXTENSION_NAME'?
|  4536 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_SHADER_QUAD_CONTROL_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_SHADER_FLOAT_CONTROLS_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4541:54: error: 'VK_KHR_SHADER_SUBGROUP_ROTATE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_SHADER_SUBGROUP_VOTE_EXTENSION_NAME'?
|  4541 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_SHADER_SUBGROUP_ROTATE_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_SHADER_SUBGROUP_VOTE_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, void*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4769:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES_KHR'?
|  4769 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4770:54: error: 'VK_KHR_DYNAMIC_RENDERING_LOCAL_READ_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_DYNAMIC_RENDERING_EXTENSION_NAME'?
|  4770 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_DYNAMIC_RENDERING_LOCAL_READ_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_DYNAMIC_RENDERING_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4771:13: error: 'VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR'?
|  4771 |             VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR* props = (VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4771:67: error: 'props' was not declared in this scope
|  4771 |             VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR* props = (VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR*)structure;
|       |                                                                   ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4771:129: error: expected primary-expression before ')' token
|  4771 |             VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR* props = (VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR*)structure;
|       |                                                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4910:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT'?
|  4910 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4911:138: error: 'VK_KHR_INDEX_TYPE_UINT8_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_INDEX_TYPE_UINT8_EXTENSION_NAME'?
|  4911 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_INDEX_TYPE_UINT8_EXTENSION_NAME) || gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_INDEX_TYPE_UINT8_EXTENSION_NAME))) {
|       |                                                                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                                          VK_EXT_INDEX_TYPE_UINT8_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4912:13: error: 'VkPhysicalDeviceIndexTypeUint8FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceIndexTypeUint8FeaturesEXT'?
|  4912 |             VkPhysicalDeviceIndexTypeUint8FeaturesKHR* props = (VkPhysicalDeviceIndexTypeUint8FeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceIndexTypeUint8FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4912:56: error: 'props' was not declared in this scope
|  4912 |             VkPhysicalDeviceIndexTypeUint8FeaturesKHR* props = (VkPhysicalDeviceIndexTypeUint8FeaturesKHR*)structure;
|       |                                                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4912:107: error: expected primary-expression before ')' token
|  4912 |             VkPhysicalDeviceIndexTypeUint8FeaturesKHR* props = (VkPhysicalDeviceIndexTypeUint8FeaturesKHR*)structure;
|       |                                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4929:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_EXT'?
|  4929 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4930:140: error: 'VK_KHR_LINE_RASTERIZATION_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_LINE_RASTERIZATION_EXTENSION_NAME'?
|  4930 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_LINE_RASTERIZATION_EXTENSION_NAME) || gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_LINE_RASTERIZATION_EXTENSION_NAME))) {
|       |                                                                                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                                            VK_EXT_LINE_RASTERIZATION_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4931:13: error: 'VkPhysicalDeviceLineRasterizationFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceLineRasterizationFeaturesEXT'?
|  4931 |             VkPhysicalDeviceLineRasterizationFeaturesKHR* props = (VkPhysicalDeviceLineRasterizationFeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceLineRasterizationFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4931:59: error: 'props' was not declared in this scope
|  4931 |             VkPhysicalDeviceLineRasterizationFeaturesKHR* props = (VkPhysicalDeviceLineRasterizationFeaturesKHR*)structure;
|       |                                                           ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4931:113: error: expected primary-expression before ')' token
|  4931 |             VkPhysicalDeviceLineRasterizationFeaturesKHR* props = (VkPhysicalDeviceLineRasterizationFeaturesKHR*)structure;
|       |                                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4954:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAP_MEMORY_PLACED_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT'?
|  4954 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAP_MEMORY_PLACED_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4955:54: error: 'VK_EXT_MAP_MEMORY_PLACED_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_MAP_MEMORY_2_EXTENSION_NAME'?
|  4955 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_MAP_MEMORY_PLACED_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_MAP_MEMORY_2_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4956:13: error: 'VkPhysicalDeviceMapMemoryPlacedFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceMapMemoryPlacedFeaturesEXT'?
|  4956 |             VkPhysicalDeviceMapMemoryPlacedFeaturesEXT* props = (VkPhysicalDeviceMapMemoryPlacedFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceMapMemoryPlacedFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4956:57: error: 'props' was not declared in this scope
|  4956 |             VkPhysicalDeviceMapMemoryPlacedFeaturesEXT* props = (VkPhysicalDeviceMapMemoryPlacedFeaturesEXT*)structure;
|       |                                                         ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:4956:109: error: expected primary-expression before ')' token
|  4956 |             VkPhysicalDeviceMapMemoryPlacedFeaturesEXT* props = (VkPhysicalDeviceMapMemoryPlacedFeaturesEXT*)structure;
|       |                                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:5216:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES_KHR'?
|  5216 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:5217:54: error: 'VK_KHR_SHADER_EXPECT_ASSUME_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_SHADER_CLOCK_EXTENSION_NAME'?
|  5217 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_SHADER_EXPECT_ASSUME_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_SHADER_CLOCK_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:5218:13: error: 'VkPhysicalDeviceShaderExpectAssumeFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderExpectAssumeFeaturesKHR'?
|  5218 |             VkPhysicalDeviceShaderExpectAssumeFeaturesKHR* props = (VkPhysicalDeviceShaderExpectAssumeFeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceShaderExpectAssumeFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:5218:60: error: 'props' was not declared in this scope
|  5218 |             VkPhysicalDeviceShaderExpectAssumeFeaturesKHR* props = (VkPhysicalDeviceShaderExpectAssumeFeaturesKHR*)structure;
|       |                                                            ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:5218:115: error: expected primary-expression before ')' token
|  5218 |             VkPhysicalDeviceShaderExpectAssumeFeaturesKHR* props = (VkPhysicalDeviceShaderExpectAssumeFeaturesKHR*)structure;
|       |                                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:5229:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES_KHR'?
|  5229 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:5230:54: error: 'VK_KHR_SHADER_FLOAT_CONTROLS_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_SHADER_FLOAT_CONTROLS_EXTENSION_NAME'?
|  5230 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_SHADER_FLOAT_CONTROLS_2_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_SHADER_FLOAT_CONTROLS_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:5231:13: error: 'VkPhysicalDeviceShaderFloatControls2FeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderFloatControls2FeaturesKHR'?
|  5231 |             VkPhysicalDeviceShaderFloatControls2FeaturesKHR* props = (VkPhysicalDeviceShaderFloatControls2FeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceShaderFloatControls2FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:5231:62: error: 'props' was not declared in this scope
|  5231 |             VkPhysicalDeviceShaderFloatControls2FeaturesKHR* props = (VkPhysicalDeviceShaderFloatControls2FeaturesKHR*)structure;
|       |                                                              ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:5231:119: error: expected primary-expression before ')' token
|  5231 |             VkPhysicalDeviceShaderFloatControls2FeaturesKHR* props = (VkPhysicalDeviceShaderFloatControls2FeaturesKHR*)structure;
|       |                                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:5248:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MAXIMAL_RECONVERGENCE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR'?
|  5248 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MAXIMAL_RECONVERGENCE_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:5249:54: error: 'VK_KHR_SHADER_MAXIMAL_RECONVERGENCE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_SHADER_FLOAT_CONTROLS_EXTENSION_NAME'?
|  5249 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_SHADER_MAXIMAL_RECONVERGENCE_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_SHADER_FLOAT_CONTROLS_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:5250:13: error: 'VkPhysicalDeviceShaderMaximalReconvergenceFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderMaximalReconvergenceFeaturesKHR'?
|  5250 |             VkPhysicalDeviceShaderMaximalReconvergenceFeaturesKHR* props = (VkPhysicalDeviceShaderMaximalReconvergenceFeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceShaderMaximalReconvergenceFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:5250:68: error: 'props' was not declared in this scope
|  5250 |             VkPhysicalDeviceShaderMaximalReconvergenceFeaturesKHR* props = (VkPhysicalDeviceShaderMaximalReconvergenceFeaturesKHR*)structure;
|       |                                                                    ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:5250:131: error: expected primary-expression before ')' token
|  5250 |             VkPhysicalDeviceShaderMaximalReconvergenceFeaturesKHR* props = (VkPhysicalDeviceShaderMaximalReconvergenceFeaturesKHR*)structure;
|       |                                                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:5266:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_QUAD_CONTROL_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR'?
|  5266 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_QUAD_CONTROL_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:5267:54: error: 'VK_KHR_SHADER_QUAD_CONTROL_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_SHADER_FLOAT_CONTROLS_EXTENSION_NAME'?
|  5267 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_SHADER_QUAD_CONTROL_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_SHADER_FLOAT_CONTROLS_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:5268:13: error: 'VkPhysicalDeviceShaderQuadControlFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderQuadControlFeaturesKHR'?
|  5268 |             VkPhysicalDeviceShaderQuadControlFeaturesKHR* props = (VkPhysicalDeviceShaderQuadControlFeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceShaderQuadControlFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:5268:59: error: 'props' was not declared in this scope
|  5268 |             VkPhysicalDeviceShaderQuadControlFeaturesKHR* props = (VkPhysicalDeviceShaderQuadControlFeaturesKHR*)structure;
|       |                                                           ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:5268:113: error: expected primary-expression before ')' token
|  5268 |             VkPhysicalDeviceShaderQuadControlFeaturesKHR* props = (VkPhysicalDeviceShaderQuadControlFeaturesKHR*)structure;
|       |                                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:5279:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_EXTENDED_TYPES_FEATURES_KHR'?
|  5279 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_EXTENDED_TYPES_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:5280:54: error: 'VK_KHR_SHADER_SUBGROUP_ROTATE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_SHADER_SUBGROUP_VOTE_EXTENSION_NAME'?
|  5280 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_SHADER_SUBGROUP_ROTATE_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_SHADER_SUBGROUP_VOTE_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:5281:13: error: 'VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderSubgroupRotateFeaturesKHR'?
|  5281 |             VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR* props = (VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceShaderSubgroupRotateFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:5281:62: error: 'props' was not declared in this scope
|  5281 |             VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR* props = (VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR*)structure;
|       |                                                              ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/git/vulkaninfo/generated/vulkaninfo.hpp:5281:119: error: expected primary-expression before ')' token
|  5281 |             VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR* props = (VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR*)structure;
|       |                                                                                                                       ^
| ninja: build stopped: subcommand failed.
| 
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/temp/run.do_compile.1511076:153 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/temp/run.do_compile.1511076, line 153
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/temp/run.do_compile.1511076, line 147
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/temp/run.do_compile.1511076, line 142
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/temp/run.do_compile.1511076, line 166
NOTE: recipe vulkan-tools-1.3.280.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1599 tasks of which 1591 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240401140840.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240401140840.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.280.0.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-tools-1.3.280.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/temp/run.do_compile.1511076', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.280.0/temp/log.do_compile.1511076
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.280.0.bb:do_compile) failed with exit code '1'

--===============2681358253810331728==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.3.275.0-1.3.280.0.patch"

RnJvbSBjYjc3NDI5ZTk2NzJiOGRkZTQ1OWQ1YjRhYzJlYjVkYjM5ZWY3MzQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxNDowOTowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi10b29sczogdXBncmFkZSAxLjMuMjc1LjAgLT4gMS4zLjI4MC4wCgotLS0KIC4uLi97dnVs
a2FuLXRvb2xzXzEuMy4yNzUuMC5iYiA9PiB2dWxrYW4tdG9vbHNfMS4zLjI4MC4wLmJifSAgfCA0
ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLXRvb2xzXzEuMy4yNzUu
MC5iYiA9PiB2dWxrYW4tdG9vbHNfMS4zLjI4MC4wLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuMy4yNzUuMC5iYiBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuMy4yODAuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2Fu
L3Z1bGthbi10b29sc18xLjMuMjc1LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuMy4yODAuMC5iYgppbmRleCBmODY5MTJjOTAzLi5hN2U0
YTY3YWFhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10
b29sc18xLjMuMjc1LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxr
YW4tdG9vbHNfMS4zLjI4MC4wLmJiCkBAIC02LDggKzYsOCBAQCBTRUNUSU9OID0gImxpYnMiCiAK
IExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VO
U0UudHh0O21kNT0zYjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKLVNSQ19VUkkgPSAi
Z2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLVRvb2xzLmdpdDticmFuY2g9bWFp
bjtwcm90b2NvbD1odHRwcyIKLVNSQ1JFViA9ICJjODZkNDJjZjllYjYyMGVlYWMzNzdlM2JmZjQ2
YWUzNDJjNWNkNjY0IgorU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9W
dWxrYW4tVG9vbHMuZ2l0O2JyYW5jaD12dWxrYW4tc2RrLTEuMy4yODA7cHJvdG9jb2w9aHR0cHMi
CitTUkNSRVYgPSAiMTM2OTc2MDgyZDBiMTRkYWQ4Yjk2ODc5ODJiMmE4MGNjNmU2YTYzMyIKIAog
UyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi40Mi4wCgo=

--===============2681358253810331728==--

