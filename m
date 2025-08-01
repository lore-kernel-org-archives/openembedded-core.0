Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C800C87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:12 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.88806.1754057268275884223
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=eTleXSj+;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=OwFvig4/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019865f61fb0-88b0de02-fb0a-4816-b0b9-937975e61603-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057285;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yAoaXOWsPL+4hogxn7+F4ebjQs4VjUVe+1m2n32JA4o=;
	b=eTleXSj+v0qepiXRV21mcPKi5+10iAiMs4+/WwISzqfnyKZWZmibZBHggA8sVgLn
	emdTNjuj/DxLqGOsC4tF5Aiwgg4GnwR+UY8pGZ91Rs0TeK2tiDDoI9TDe1/3KP/EdTv
	TrKYZSf+0R29+rdUQ5eEIfzCW4Qfx0akFzLtJifU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057285;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yAoaXOWsPL+4hogxn7+F4ebjQs4VjUVe+1m2n32JA4o=;
	b=OwFvig4/pvsBQP10F5PqaiZqNHat4hAhJEan/s6rqSwBfSAD4AMWKsX+u/J2ypUC
	Z0eThooXt0DQ7EI2F04IHn+3bhq7kbTY8dAId78KDZ20wWaA0qc7eYrYzkTAYda+UQa
	ikicAjjqobX63Nnjrfj/xnhx6sO/RYglkxTO0nqM=
Content-Type: multipart/mixed; boundary="===============5659183427150335996=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.4.321.0 FAILED
Message-ID: <0101019865f61fb0-88b0de02-fb0a-4816-b0b9-937975e61603-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:08:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221320

--===============5659183427150335996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-tools* to *1.4.321.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.4.313.0-1.4.321.0.patch
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
From 1576d41e42933fb53c1d4acbf84da6fc330ae530 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 11:59:28 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.4.313.0 -> 1.4.321.0

---
 .../{vulkan-tools_1.4.313.0.bb => vulkan-tools_1.4.321.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.4.313.0.bb => vulkan-tools_1.4.321.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb
index c73e5caa13..a4916ba975 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.4.313;protocol=https"
-SRCREV = "ad2f0170f9466fadd96e3fdd65fad02cd3a3739b"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https"
+SRCREV = "06ae73a3dc3a03466817d8370355203dac7b79b1"
 
 inherit cmake features_check pkgconfig
 ANY_OF_DISTRO_FEATURES = "x11 wayland"
-- 
2.47.1


--===============5659183427150335996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1933 entries from dependency cache.
Parsing recipes...done.
Parsing of 942 .bb files complete (941 cached, 1 parsed). 1933 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-94ca4ff153ee90808fed9cc181f1c9d096c3998e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:94ca4ff153ee90808fed9cc181f1c9d096c3998e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 175 Local 163 Mirrors 0 Missed 12 Current 388 (93% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1429 of 1594 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb:do_recipe_qa)
NOTE: recipe vulkan-tools-1.4.321.0-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-tools-1.4.321.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1574 of 1594 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb:do_fetch)
NOTE: recipe vulkan-tools-1.4.321.0-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.4.321.0-r0: task do_fetch: Succeeded
NOTE: Running task 1575 of 1594 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb:do_unpack)
NOTE: Running task 1576 of 1594 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.4.321.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.4.321.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.4.321.0-r0: task do_unpack: Succeeded
NOTE: Running task 1577 of 1594 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb:do_patch)
NOTE: Running task 1578 of 1594 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-tools-1.4.321.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.4.321.0-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.4.321.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-tools-1.4.321.0-r0: task do_patch: Succeeded
NOTE: Running task 1579 of 1594 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1580 of 1594 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb:do_generate_toolchain_file)
NOTE: Running task 1581 of 1594 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb:do_populate_lic)
NOTE: recipe vulkan-tools-1.4.321.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.4.321.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.4.321.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-tools-1.4.321.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-tools-1.4.321.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.4.321.0-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-tools-1.4.321.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1582 of 1594 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.4.321.0-r0: task do_configure: Started
NOTE: recipe vulkan-tools-1.4.321.0-r0: task do_configure: Succeeded
NOTE: Running task 1583 of 1594 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb:do_compile)
NOTE: recipe vulkan-tools-1.4.321.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/build --target all --
| Change Dir: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/build'
| 
| Run Build Command(s): ninja -v -j 16 all
| [1/4] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot -DGIT_BRANCH_NAME=\"main\" -DGIT_TAG_INFO=\"v1.4.321\" -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-se
 curity  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0=/usr/src/debug/vulkan-tools/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/build=/usr/src/debug/vulkan-tools/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-stringop-truncation -Wpointer-arith -Wno-unused-function -Wno-sign-compare 
 -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/mock_icd.cpp
| FAILED: [code=1] icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot -DGIT_BRANCH_NAME=\"main\" -DGIT_TAG_INFO=\"v1.4.321\" -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
   --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0=/usr/src/debug/vulkan-tools/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/build=/usr/src/debug/vulkan-tools/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-stringop-truncation -Wpointer-arith -Wno-unused-function -Wno-sign-compare -MD -M
 T icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/mock_icd.cpp
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/mock_icd.h:40,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/mock_icd.cpp:17:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3816:31: error: 'VkSurfaceCapabilitiesPresentId2KHR' was not declared in this scope; did you mean 'VkSurfaceCapabilitiesPresentBarrierNV'?
|  3816 | template <> struct LvlTypeMap<VkSurfaceCapabilitiesPresentId2KHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkSurfaceCapabilitiesPresentBarrierNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3816:65: error: template argument 1 is invalid
|  3816 | template <> struct LvlTypeMap<VkSurfaceCapabilitiesPresentId2KHR> {
|       |                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3820:32: error: 'VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_ID_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_BARRIER_NV'?
|  3820 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_ID_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_BARRIER_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3820:87: error: template argument 1 is invalid
|  3820 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_ID_2_KHR> {
|       |                                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3825:31: error: 'VkPresentId2KHR' was not declared in this scope; did you mean 'VkPresentIdKHR'?
|  3825 | template <> struct LvlTypeMap<VkPresentId2KHR> {
|       |                               ^~~~~~~~~~~~~~~
|       |                               VkPresentIdKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3825:46: error: template argument 1 is invalid
|  3825 | template <> struct LvlTypeMap<VkPresentId2KHR> {
|       |                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3829:32: error: 'VK_STRUCTURE_TYPE_PRESENT_ID_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PRESENT_ID_KHR'?
|  3829 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PRESENT_ID_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PRESENT_ID_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3829:66: error: template argument 1 is invalid
|  3829 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PRESENT_ID_2_KHR> {
|       |                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3834:31: error: 'VkPhysicalDevicePresentId2FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDevicePresentIdFeaturesKHR'?
|  3834 | template <> struct LvlTypeMap<VkPhysicalDevicePresentId2FeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDevicePresentIdFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3834:68: error: template argument 1 is invalid
|  3834 | template <> struct LvlTypeMap<VkPhysicalDevicePresentId2FeaturesKHR> {
|       |                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3838:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_ID_2_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_ID_FEATURES_KHR'?
|  3838 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_ID_2_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_ID_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3838:91: error: template argument 1 is invalid
|  3838 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_ID_2_FEATURES_KHR> {
|       |                                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3843:31: error: 'VkSurfaceCapabilitiesPresentWait2KHR' was not declared in this scope; did you mean 'VkSurfaceCapabilitiesPresentBarrierNV'?
|  3843 | template <> struct LvlTypeMap<VkSurfaceCapabilitiesPresentWait2KHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkSurfaceCapabilitiesPresentBarrierNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3843:67: error: template argument 1 is invalid
|  3843 | template <> struct LvlTypeMap<VkSurfaceCapabilitiesPresentWait2KHR> {
|       |                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3847:32: error: 'VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_WAIT_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_BARRIER_NV'?
|  3847 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_WAIT_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_BARRIER_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3847:89: error: template argument 1 is invalid
|  3847 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_WAIT_2_KHR> {
|       |                                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3852:31: error: 'VkPhysicalDevicePresentWait2FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDevicePresentWaitFeaturesKHR'?
|  3852 | template <> struct LvlTypeMap<VkPhysicalDevicePresentWait2FeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDevicePresentWaitFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3852:70: error: template argument 1 is invalid
|  3852 | template <> struct LvlTypeMap<VkPhysicalDevicePresentWait2FeaturesKHR> {
|       |                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3856:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_WAIT_2_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_WAIT_FEATURES_KHR'?
|  3856 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_WAIT_2_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_WAIT_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3856:93: error: template argument 1 is invalid
|  3856 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_WAIT_2_FEATURES_KHR> {
|       |                                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3861:31: error: 'VkPresentWait2InfoKHR' was not declared in this scope; did you mean 'VkPresentInfoKHR'?
|  3861 | template <> struct LvlTypeMap<VkPresentWait2InfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~
|       |                               VkPresentInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3861:52: error: template argument 1 is invalid
|  3861 | template <> struct LvlTypeMap<VkPresentWait2InfoKHR> {
|       |                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3865:32: error: 'VK_STRUCTURE_TYPE_PRESENT_WAIT_2_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PRESENT_INFO_KHR'?
|  3865 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PRESENT_WAIT_2_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PRESENT_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3865:73: error: template argument 1 is invalid
|  3865 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PRESENT_WAIT_2_INFO_KHR> {
|       |                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3969:31: error: 'VkSurfacePresentModeKHR' was not declared in this scope; did you mean 'VkSurfacePresentModeEXT'?
|  3969 | template <> struct LvlTypeMap<VkSurfacePresentModeKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkSurfacePresentModeEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3969:54: error: template argument 1 is invalid
|  3969 | template <> struct LvlTypeMap<VkSurfacePresentModeKHR> {
|       |                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3973:32: error: 'VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_EXT'?
|  3973 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3973:74: error: template argument 1 is invalid
|  3973 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_KHR> {
|       |                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3978:31: error: 'VkSurfacePresentScalingCapabilitiesKHR' was not declared in this scope; did you mean 'VkSurfacePresentScalingCapabilitiesEXT'?
|  3978 | template <> struct LvlTypeMap<VkSurfacePresentScalingCapabilitiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkSurfacePresentScalingCapabilitiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3978:69: error: template argument 1 is invalid
|  3978 | template <> struct LvlTypeMap<VkSurfacePresentScalingCapabilitiesKHR> {
|       |                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3982:32: error: 'VK_STRUCTURE_TYPE_SURFACE_PRESENT_SCALING_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SURFACE_PRESENT_SCALING_CAPABILITIES_EXT'?
|  3982 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SURFACE_PRESENT_SCALING_CAPABILITIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SURFACE_PRESENT_SCALING_CAPABILITIES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3982:90: error: template argument 1 is invalid
|  3982 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SURFACE_PRESENT_SCALING_CAPABILITIES_KHR> {
|       |                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3987:31: error: 'VkSurfacePresentModeCompatibilityKHR' was not declared in this scope; did you mean 'VkSurfacePresentModeCompatibilityEXT'?
|  3987 | template <> struct LvlTypeMap<VkSurfacePresentModeCompatibilityKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkSurfacePresentModeCompatibilityEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3987:67: error: template argument 1 is invalid
|  3987 | template <> struct LvlTypeMap<VkSurfacePresentModeCompatibilityKHR> {
|       |                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3991:32: error: 'VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_COMPATIBILITY_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_COMPATIBILITY_EXT'?
|  3991 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_COMPATIBILITY_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_COMPATIBILITY_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3991:88: error: template argument 1 is invalid
|  3991 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_COMPATIBILITY_KHR> {
|       |                                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3996:31: error: 'VkPhysicalDeviceSwapchainMaintenance1FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceSwapchainMaintenance1FeaturesEXT'?
|  3996 | template <> struct LvlTypeMap<VkPhysicalDeviceSwapchainMaintenance1FeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceSwapchainMaintenance1FeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:3996:79: error: template argument 1 is invalid
|  3996 | template <> struct LvlTypeMap<VkPhysicalDeviceSwapchainMaintenance1FeaturesKHR> {
|       |                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4000:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SWAPCHAIN_MAINTENANCE_1_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SWAPCHAIN_MAINTENANCE_1_FEATURES_EXT'?
|  4000 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SWAPCHAIN_MAINTENANCE_1_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SWAPCHAIN_MAINTENANCE_1_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4000:102: error: template argument 1 is invalid
|  4000 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SWAPCHAIN_MAINTENANCE_1_FEATURES_KHR> {
|       |                                                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4005:31: error: 'VkSwapchainPresentFenceInfoKHR' was not declared in this scope; did you mean 'VkSwapchainPresentFenceInfoEXT'?
|  4005 | template <> struct LvlTypeMap<VkSwapchainPresentFenceInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkSwapchainPresentFenceInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4005:61: error: template argument 1 is invalid
|  4005 | template <> struct LvlTypeMap<VkSwapchainPresentFenceInfoKHR> {
|       |                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4009:32: error: 'VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_FENCE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_FENCE_INFO_EXT'?
|  4009 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_FENCE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_FENCE_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4009:82: error: template argument 1 is invalid
|  4009 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_FENCE_INFO_KHR> {
|       |                                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4014:31: error: 'VkSwapchainPresentModesCreateInfoKHR' was not declared in this scope; did you mean 'VkSwapchainPresentModesCreateInfoEXT'?
|  4014 | template <> struct LvlTypeMap<VkSwapchainPresentModesCreateInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkSwapchainPresentModesCreateInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4014:67: error: template argument 1 is invalid
|  4014 | template <> struct LvlTypeMap<VkSwapchainPresentModesCreateInfoKHR> {
|       |                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4018:32: error: 'VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_MODES_CREATE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_MODES_CREATE_INFO_EXT'?
|  4018 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_MODES_CREATE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_MODES_CREATE_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4018:89: error: template argument 1 is invalid
|  4018 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_MODES_CREATE_INFO_KHR> {
|       |                                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4023:31: error: 'VkSwapchainPresentModeInfoKHR' was not declared in this scope; did you mean 'VkSwapchainPresentModeInfoEXT'?
|  4023 | template <> struct LvlTypeMap<VkSwapchainPresentModeInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkSwapchainPresentModeInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4023:60: error: template argument 1 is invalid
|  4023 | template <> struct LvlTypeMap<VkSwapchainPresentModeInfoKHR> {
|       |                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4027:32: error: 'VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_MODE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_MODE_INFO_EXT'?
|  4027 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_MODE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_MODE_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4027:81: error: template argument 1 is invalid
|  4027 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_MODE_INFO_KHR> {
|       |                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4032:31: error: 'VkSwapchainPresentScalingCreateInfoKHR' was not declared in this scope; did you mean 'VkSwapchainPresentScalingCreateInfoEXT'?
|  4032 | template <> struct LvlTypeMap<VkSwapchainPresentScalingCreateInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkSwapchainPresentScalingCreateInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4032:69: error: template argument 1 is invalid
|  4032 | template <> struct LvlTypeMap<VkSwapchainPresentScalingCreateInfoKHR> {
|       |                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4036:32: error: 'VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_SCALING_CREATE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_SCALING_CREATE_INFO_EXT'?
|  4036 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_SCALING_CREATE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_SCALING_CREATE_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4036:91: error: template argument 1 is invalid
|  4036 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_SCALING_CREATE_INFO_KHR> {
|       |                                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4041:31: error: 'VkReleaseSwapchainImagesInfoKHR' was not declared in this scope; did you mean 'VkReleaseSwapchainImagesInfoEXT'?
|  4041 | template <> struct LvlTypeMap<VkReleaseSwapchainImagesInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkReleaseSwapchainImagesInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4041:62: error: template argument 1 is invalid
|  4041 | template <> struct LvlTypeMap<VkReleaseSwapchainImagesInfoKHR> {
|       |                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4045:32: error: 'VK_STRUCTURE_TYPE_RELEASE_SWAPCHAIN_IMAGES_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_RELEASE_SWAPCHAIN_IMAGES_INFO_EXT'?
|  4045 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RELEASE_SWAPCHAIN_IMAGES_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_RELEASE_SWAPCHAIN_IMAGES_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4045:83: error: template argument 1 is invalid
|  4045 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RELEASE_SWAPCHAIN_IMAGES_INFO_KHR> {
|       |                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4239:31: error: 'VkPhysicalDeviceVideoDecodeVP9FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceVideoEncodeAV1FeaturesKHR'?
|  4239 | template <> struct LvlTypeMap<VkPhysicalDeviceVideoDecodeVP9FeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceVideoEncodeAV1FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4239:72: error: template argument 1 is invalid
|  4239 | template <> struct LvlTypeMap<VkPhysicalDeviceVideoDecodeVP9FeaturesKHR> {
|       |                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4243:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_DECODE_VP9_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR'?
|  4243 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_DECODE_VP9_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4243:95: error: template argument 1 is invalid
|  4243 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_DECODE_VP9_FEATURES_KHR> {
|       |                                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4248:31: error: 'VkVideoDecodeVP9ProfileInfoKHR' was not declared in this scope; did you mean 'VkVideoDecodeAV1ProfileInfoKHR'?
|  4248 | template <> struct LvlTypeMap<VkVideoDecodeVP9ProfileInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4248:61: error: template argument 1 is invalid
|  4248 | template <> struct LvlTypeMap<VkVideoDecodeVP9ProfileInfoKHR> {
|       |                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4252:32: error: 'VK_STRUCTURE_TYPE_VIDEO_DECODE_VP9_PROFILE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PROFILE_INFO_KHR'?
|  4252 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_VP9_PROFILE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PROFILE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4252:83: error: template argument 1 is invalid
|  4252 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_VP9_PROFILE_INFO_KHR> {
|       |                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4257:31: error: 'VkVideoDecodeVP9CapabilitiesKHR' was not declared in this scope; did you mean 'VkVideoDecodeCapabilitiesKHR'?
|  4257 | template <> struct LvlTypeMap<VkVideoDecodeVP9CapabilitiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoDecodeCapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4257:62: error: template argument 1 is invalid
|  4257 | template <> struct LvlTypeMap<VkVideoDecodeVP9CapabilitiesKHR> {
|       |                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4261:32: error: 'VK_STRUCTURE_TYPE_VIDEO_DECODE_VP9_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR'?
|  4261 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_VP9_CAPABILITIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4261:83: error: template argument 1 is invalid
|  4261 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_VP9_CAPABILITIES_KHR> {
|       |                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4266:31: error: 'VkVideoDecodeVP9PictureInfoKHR' was not declared in this scope; did you mean 'VkVideoDecodeAV1PictureInfoKHR'?
|  4266 | template <> struct LvlTypeMap<VkVideoDecodeVP9PictureInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoDecodeAV1PictureInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4266:61: error: template argument 1 is invalid
|  4266 | template <> struct LvlTypeMap<VkVideoDecodeVP9PictureInfoKHR> {
|       |                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4270:32: error: 'VK_STRUCTURE_TYPE_VIDEO_DECODE_VP9_PICTURE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PICTURE_INFO_KHR'?
|  4270 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_VP9_PICTURE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PICTURE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4270:83: error: template argument 1 is invalid
|  4270 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_VP9_PICTURE_INFO_KHR> {
|       |                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4293:31: error: 'VkPhysicalDeviceUnifiedImageLayoutsFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceTimelineSemaphoreFeaturesKHR'?
|  4293 | template <> struct LvlTypeMap<VkPhysicalDeviceUnifiedImageLayoutsFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceTimelineSemaphoreFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4293:77: error: template argument 1 is invalid
|  4293 | template <> struct LvlTypeMap<VkPhysicalDeviceUnifiedImageLayoutsFeaturesKHR> {
|       |                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4297:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_UNIFIED_IMAGE_LAYOUTS_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT'?
|  4297 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_UNIFIED_IMAGE_LAYOUTS_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4297:100: error: template argument 1 is invalid
|  4297 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_UNIFIED_IMAGE_LAYOUTS_FEATURES_KHR> {
|       |                                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4302:31: error: 'VkAttachmentFeedbackLoopInfoEXT' was not declared in this scope; did you mean 'vkCmdSetAttachmentFeedbackLoopEnableEXT'?
|  4302 | template <> struct LvlTypeMap<VkAttachmentFeedbackLoopInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               vkCmdSetAttachmentFeedbackLoopEnableEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4302:62: error: template argument 1 is invalid
|  4302 | template <> struct LvlTypeMap<VkAttachmentFeedbackLoopInfoEXT> {
|       |                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4306:32: error: 'VK_STRUCTURE_TYPE_ATTACHMENT_FEEDBACK_LOOP_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_ATTACHMENT_SAMPLE_COUNT_INFO_NV'?
|  4306 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ATTACHMENT_FEEDBACK_LOOP_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_ATTACHMENT_SAMPLE_COUNT_INFO_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4306:83: error: template argument 1 is invalid
|  4306 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ATTACHMENT_FEEDBACK_LOOP_INFO_EXT> {
|       |                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4338:31: error: 'VkVideoEncodeIntraRefreshCapabilitiesKHR' was not declared in this scope; did you mean 'VkVideoEncodeAV1CapabilitiesKHR'?
|  4338 | template <> struct LvlTypeMap<VkVideoEncodeIntraRefreshCapabilitiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4338:71: error: template argument 1 is invalid
|  4338 | template <> struct LvlTypeMap<VkVideoEncodeIntraRefreshCapabilitiesKHR> {
|       |                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4342:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_INTRA_REFRESH_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR'?
|  4342 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_INTRA_REFRESH_CAPABILITIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4342:93: error: template argument 1 is invalid
|  4342 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_INTRA_REFRESH_CAPABILITIES_KHR> {
|       |                                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4347:31: error: 'VkVideoEncodeSessionIntraRefreshCreateInfoKHR' was not declared in this scope; did you mean 'VkVideoEncodeAV1SessionParametersCreateInfoKHR'?
|  4347 | template <> struct LvlTypeMap<VkVideoEncodeSessionIntraRefreshCreateInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeAV1SessionParametersCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4347:76: error: template argument 1 is invalid
|  4347 | template <> struct LvlTypeMap<VkVideoEncodeSessionIntraRefreshCreateInfoKHR> {
|       |                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4351:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_SESSION_INTRA_REFRESH_CREATE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_SESSION_PARAMETERS_GET_INFO_KHR'?
|  4351 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_SESSION_INTRA_REFRESH_CREATE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_SESSION_PARAMETERS_GET_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4351:100: error: template argument 1 is invalid
|  4351 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_SESSION_INTRA_REFRESH_CREATE_INFO_KHR> {
|       |                                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4356:31: error: 'VkVideoEncodeIntraRefreshInfoKHR' was not declared in this scope; did you mean 'VkVideoEncodeUsageInfoKHR'?
|  4356 | template <> struct LvlTypeMap<VkVideoEncodeIntraRefreshInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeUsageInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4356:63: error: template argument 1 is invalid
|  4356 | template <> struct LvlTypeMap<VkVideoEncodeIntraRefreshInfoKHR> {
|       |                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4360:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_INTRA_REFRESH_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_USAGE_INFO_KHR'?
|  4360 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_INTRA_REFRESH_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_USAGE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4360:85: error: template argument 1 is invalid
|  4360 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_INTRA_REFRESH_INFO_KHR> {
|       |                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4365:31: error: 'VkVideoReferenceIntraRefreshInfoKHR' was not declared in this scope; did you mean 'VkVideoReferenceSlotInfoKHR'?
|  4365 | template <> struct LvlTypeMap<VkVideoReferenceIntraRefreshInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoReferenceSlotInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4365:66: error: template argument 1 is invalid
|  4365 | template <> struct LvlTypeMap<VkVideoReferenceIntraRefreshInfoKHR> {
|       |                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4369:32: error: 'VK_STRUCTURE_TYPE_VIDEO_REFERENCE_INTRA_REFRESH_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_REFERENCE_SLOT_INFO_KHR'?
|  4369 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_REFERENCE_INTRA_REFRESH_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_REFERENCE_SLOT_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4369:88: error: template argument 1 is invalid
|  4369 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_REFERENCE_INTRA_REFRESH_INFO_KHR> {
|       |                                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4374:31: error: 'VkPhysicalDeviceVideoEncodeIntraRefreshFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceVideoEncodeAV1FeaturesKHR'?
|  4374 | template <> struct LvlTypeMap<VkPhysicalDeviceVideoEncodeIntraRefreshFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceVideoEncodeAV1FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4374:81: error: template argument 1 is invalid
|  4374 | template <> struct LvlTypeMap<VkPhysicalDeviceVideoEncodeIntraRefreshFeaturesKHR> {
|       |                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4378:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_INTRA_REFRESH_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR'?
|  4378 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_INTRA_REFRESH_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4378:105: error: template argument 1 is invalid
|  4378 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_INTRA_REFRESH_FEATURES_KHR> {
|       |                                                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4545:31: error: 'VkPhysicalDeviceMaintenance9FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance8FeaturesKHR'?
|  4545 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance9FeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMaintenance8FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4545:70: error: template argument 1 is invalid
|  4545 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance9FeaturesKHR> {
|       |                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4549:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_9_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_8_FEATURES_KHR'?
|  4549 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_9_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_8_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4549:92: error: template argument 1 is invalid
|  4549 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_9_FEATURES_KHR> {
|       |                                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4554:31: error: 'VkPhysicalDeviceMaintenance9PropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance7PropertiesKHR'?
|  4554 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance9PropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMaintenance7PropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4554:72: error: template argument 1 is invalid
|  4554 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance9PropertiesKHR> {
|       |                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4558:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_9_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR'?
|  4558 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_9_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4558:94: error: template argument 1 is invalid
|  4558 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_9_PROPERTIES_KHR> {
|       |                                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4563:31: error: 'VkQueueFamilyOwnershipTransferPropertiesKHR' was not declared in this scope; did you mean 'VkQueueFamilyVideoPropertiesKHR'?
|  4563 | template <> struct LvlTypeMap<VkQueueFamilyOwnershipTransferPropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkQueueFamilyVideoPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4563:74: error: template argument 1 is invalid
|  4563 | template <> struct LvlTypeMap<VkQueueFamilyOwnershipTransferPropertiesKHR> {
|       |                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4567:32: error: 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_OWNERSHIP_TRANSFER_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_VIDEO_PROPERTIES_KHR'?
|  4567 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUEUE_FAMILY_OWNERSHIP_TRANSFER_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_QUEUE_FAMILY_VIDEO_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4567:96: error: template argument 1 is invalid
|  4567 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUEUE_FAMILY_OWNERSHIP_TRANSFER_PROPERTIES_KHR> {
|       |                                                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4617:31: error: 'VkPhysicalDeviceRobustness2FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceRobustness2FeaturesEXT'?
|  4617 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2FeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceRobustness2FeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4617:69: error: template argument 1 is invalid
|  4617 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2FeaturesKHR> {
|       |                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4621:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT'?
|  4621 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4621:91: error: template argument 1 is invalid
|  4621 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_KHR> {
|       |                                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4626:31: error: 'VkPhysicalDeviceRobustness2PropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceRobustness2PropertiesEXT'?
|  4626 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2PropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceRobustness2PropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4626:71: error: template argument 1 is invalid
|  4626 | template <> struct LvlTypeMap<VkPhysicalDeviceRobustness2PropertiesKHR> {
|       |                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4630:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT'?
|  4630 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4630:93: error: template argument 1 is invalid
|  4630 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_KHR> {
|       |                                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4635:31: error: 'VkPhysicalDevicePresentModeFifoLatestReadyFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT'?
|  4635 | template <> struct LvlTypeMap<VkPhysicalDevicePresentModeFifoLatestReadyFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4635:84: error: template argument 1 is invalid
|  4635 | template <> struct LvlTypeMap<VkPhysicalDevicePresentModeFifoLatestReadyFeaturesKHR> {
|       |                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4639:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_EXT'?
|  4639 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:4639:109: error: template argument 1 is invalid
|  4639 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_KHR> {
|       |                                                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8152:31: error: 'VkTensorDescriptionARM' was not declared in this scope
|  8152 | template <> struct LvlTypeMap<VkTensorDescriptionARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8152:53: error: template argument 1 is invalid
|  8152 | template <> struct LvlTypeMap<VkTensorDescriptionARM> {
|       |                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8156:32: error: 'VK_STRUCTURE_TYPE_TENSOR_DESCRIPTION_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SUBPASS_DESCRIPTION_2'?
|  8156 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_TENSOR_DESCRIPTION_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SUBPASS_DESCRIPTION_2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8156:72: error: template argument 1 is invalid
|  8156 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_TENSOR_DESCRIPTION_ARM> {
|       |                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8161:31: error: 'VkTensorCreateInfoARM' was not declared in this scope; did you mean 'VkFenceCreateInfo'?
|  8161 | template <> struct LvlTypeMap<VkTensorCreateInfoARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~
|       |                               VkFenceCreateInfo
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8161:52: error: template argument 1 is invalid
|  8161 | template <> struct LvlTypeMap<VkTensorCreateInfoARM> {
|       |                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8165:32: error: 'VK_STRUCTURE_TYPE_TENSOR_CREATE_INFO_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SHADER_CREATE_INFO_EXT'?
|  8165 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_TENSOR_CREATE_INFO_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SHADER_CREATE_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8165:72: error: template argument 1 is invalid
|  8165 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_TENSOR_CREATE_INFO_ARM> {
|       |                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8170:31: error: 'VkTensorViewCreateInfoARM' was not declared in this scope; did you mean 'VkBufferViewCreateInfo'?
|  8170 | template <> struct LvlTypeMap<VkTensorViewCreateInfoARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkBufferViewCreateInfo
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8170:56: error: template argument 1 is invalid
|  8170 | template <> struct LvlTypeMap<VkTensorViewCreateInfoARM> {
|       |                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8174:32: error: 'VK_STRUCTURE_TYPE_TENSOR_VIEW_CREATE_INFO_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BUFFER_VIEW_CREATE_INFO'?
|  8174 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_TENSOR_VIEW_CREATE_INFO_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BUFFER_VIEW_CREATE_INFO
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8174:77: error: template argument 1 is invalid
|  8174 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_TENSOR_VIEW_CREATE_INFO_ARM> {
|       |                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8179:31: error: 'VkTensorMemoryRequirementsInfoARM' was not declared in this scope; did you mean 'VkBufferMemoryRequirementsInfo2'?
|  8179 | template <> struct LvlTypeMap<VkTensorMemoryRequirementsInfoARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkBufferMemoryRequirementsInfo2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8179:64: error: template argument 1 is invalid
|  8179 | template <> struct LvlTypeMap<VkTensorMemoryRequirementsInfoARM> {
|       |                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8183:32: error: 'VK_STRUCTURE_TYPE_TENSOR_MEMORY_REQUIREMENTS_INFO_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2'?
|  8183 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_TENSOR_MEMORY_REQUIREMENTS_INFO_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8183:85: error: template argument 1 is invalid
|  8183 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_TENSOR_MEMORY_REQUIREMENTS_INFO_ARM> {
|       |                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8188:31: error: 'VkBindTensorMemoryInfoARM' was not declared in this scope; did you mean 'VkBindBufferMemoryInfoKHR'?
|  8188 | template <> struct LvlTypeMap<VkBindTensorMemoryInfoARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkBindBufferMemoryInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8188:56: error: template argument 1 is invalid
|  8188 | template <> struct LvlTypeMap<VkBindTensorMemoryInfoARM> {
|       |                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8192:32: error: 'VK_STRUCTURE_TYPE_BIND_TENSOR_MEMORY_INFO_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_INFO_KHR'?
|  8192 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BIND_TENSOR_MEMORY_INFO_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8192:77: error: template argument 1 is invalid
|  8192 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BIND_TENSOR_MEMORY_INFO_ARM> {
|       |                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8197:31: error: 'VkWriteDescriptorSetTensorARM' was not declared in this scope; did you mean 'VkWriteDescriptorSet'?
|  8197 | template <> struct LvlTypeMap<VkWriteDescriptorSetTensorARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkWriteDescriptorSet
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8197:60: error: template argument 1 is invalid
|  8197 | template <> struct LvlTypeMap<VkWriteDescriptorSetTensorARM> {
|       |                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8201:32: error: 'VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_TENSOR_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET'?
|  8201 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_TENSOR_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8201:81: error: template argument 1 is invalid
|  8201 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_TENSOR_ARM> {
|       |                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8206:31: error: 'VkTensorFormatPropertiesARM' was not declared in this scope; did you mean 'VkVideoFormatPropertiesKHR'?
|  8206 | template <> struct LvlTypeMap<VkTensorFormatPropertiesARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoFormatPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8206:58: error: template argument 1 is invalid
|  8206 | template <> struct LvlTypeMap<VkTensorFormatPropertiesARM> {
|       |                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8210:32: error: 'VK_STRUCTURE_TYPE_TENSOR_FORMAT_PROPERTIES_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR'?
|  8210 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_TENSOR_FORMAT_PROPERTIES_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8210:78: error: template argument 1 is invalid
|  8210 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_TENSOR_FORMAT_PROPERTIES_ARM> {
|       |                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8215:31: error: 'VkPhysicalDeviceTensorPropertiesARM' was not declared in this scope; did you mean 'VkPhysicalDeviceToolPropertiesEXT'?
|  8215 | template <> struct LvlTypeMap<VkPhysicalDeviceTensorPropertiesARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceToolPropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8215:66: error: template argument 1 is invalid
|  8215 | template <> struct LvlTypeMap<VkPhysicalDeviceTensorPropertiesARM> {
|       |                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8219:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TENSOR_PROPERTIES_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT'?
|  8219 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TENSOR_PROPERTIES_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8219:87: error: template argument 1 is invalid
|  8219 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TENSOR_PROPERTIES_ARM> {
|       |                                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8224:31: error: 'VkTensorMemoryBarrierARM' was not declared in this scope; did you mean 'VkBufferMemoryBarrier2'?
|  8224 | template <> struct LvlTypeMap<VkTensorMemoryBarrierARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkBufferMemoryBarrier2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8224:55: error: template argument 1 is invalid
|  8224 | template <> struct LvlTypeMap<VkTensorMemoryBarrierARM> {
|       |                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8228:32: error: 'VK_STRUCTURE_TYPE_TENSOR_MEMORY_BARRIER_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER_2'?
|  8228 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_TENSOR_MEMORY_BARRIER_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER_2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8228:75: error: template argument 1 is invalid
|  8228 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_TENSOR_MEMORY_BARRIER_ARM> {
|       |                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8233:31: error: 'VkTensorDependencyInfoARM' was not declared in this scope; did you mean 'VkDependencyInfoKHR'?
|  8233 | template <> struct LvlTypeMap<VkTensorDependencyInfoARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkDependencyInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8233:56: error: template argument 1 is invalid
|  8233 | template <> struct LvlTypeMap<VkTensorDependencyInfoARM> {
|       |                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8237:32: error: 'VK_STRUCTURE_TYPE_TENSOR_DEPENDENCY_INFO_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEPENDENCY_INFO_KHR'?
|  8237 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_TENSOR_DEPENDENCY_INFO_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DEPENDENCY_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8237:76: error: template argument 1 is invalid
|  8237 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_TENSOR_DEPENDENCY_INFO_ARM> {
|       |                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8242:31: error: 'VkPhysicalDeviceTensorFeaturesARM' was not declared in this scope; did you mean 'VkPhysicalDeviceFeatures2'?
|  8242 | template <> struct LvlTypeMap<VkPhysicalDeviceTensorFeaturesARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceFeatures2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8242:64: error: template argument 1 is invalid
|  8242 | template <> struct LvlTypeMap<VkPhysicalDeviceTensorFeaturesARM> {
|       |                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8246:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TENSOR_FEATURES_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FAULT_FEATURES_EXT'?
|  8246 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TENSOR_FEATURES_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FAULT_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8246:85: error: template argument 1 is invalid
|  8246 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TENSOR_FEATURES_ARM> {
|       |                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8251:31: error: 'VkDeviceTensorMemoryRequirementsARM' was not declared in this scope; did you mean 'VkDeviceBufferMemoryRequirementsKHR'?
|  8251 | template <> struct LvlTypeMap<VkDeviceTensorMemoryRequirementsARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkDeviceBufferMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8251:66: error: template argument 1 is invalid
|  8251 | template <> struct LvlTypeMap<VkDeviceTensorMemoryRequirementsARM> {
|       |                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8255:32: error: 'VK_STRUCTURE_TYPE_DEVICE_TENSOR_MEMORY_REQUIREMENTS_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEVICE_BUFFER_MEMORY_REQUIREMENTS_KHR'?
|  8255 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_TENSOR_MEMORY_REQUIREMENTS_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DEVICE_BUFFER_MEMORY_REQUIREMENTS_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8255:87: error: template argument 1 is invalid
|  8255 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_TENSOR_MEMORY_REQUIREMENTS_ARM> {
|       |                                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8260:31: error: 'VkTensorCopyARM' was not declared in this scope
|  8260 | template <> struct LvlTypeMap<VkTensorCopyARM> {
|       |                               ^~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8260:46: error: template argument 1 is invalid
|  8260 | template <> struct LvlTypeMap<VkTensorCopyARM> {
|       |                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8264:32: error: 'VK_STRUCTURE_TYPE_TENSOR_COPY_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BUFFER_COPY_2'?
|  8264 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_TENSOR_COPY_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BUFFER_COPY_2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8264:65: error: template argument 1 is invalid
|  8264 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_TENSOR_COPY_ARM> {
|       |                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8269:31: error: 'VkCopyTensorInfoARM' was not declared in this scope
|  8269 | template <> struct LvlTypeMap<VkCopyTensorInfoARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8269:50: error: template argument 1 is invalid
|  8269 | template <> struct LvlTypeMap<VkCopyTensorInfoARM> {
|       |                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8273:32: error: 'VK_STRUCTURE_TYPE_COPY_TENSOR_INFO_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_COPY_BUFFER_INFO_2'?
|  8273 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_TENSOR_INFO_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_COPY_BUFFER_INFO_2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8273:70: error: template argument 1 is invalid
|  8273 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_TENSOR_INFO_ARM> {
|       |                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8278:31: error: 'VkMemoryDedicatedAllocateInfoTensorARM' was not declared in this scope; did you mean 'VkMemoryDedicatedAllocateInfoKHR'?
|  8278 | template <> struct LvlTypeMap<VkMemoryDedicatedAllocateInfoTensorARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkMemoryDedicatedAllocateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8278:69: error: template argument 1 is invalid
|  8278 | template <> struct LvlTypeMap<VkMemoryDedicatedAllocateInfoTensorARM> {
|       |                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8282:32: error: 'VK_STRUCTURE_TYPE_MEMORY_DEDICATED_ALLOCATE_INFO_TENSOR_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_MEMORY_DEDICATED_ALLOCATE_INFO_KHR'?
|  8282 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MEMORY_DEDICATED_ALLOCATE_INFO_TENSOR_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_MEMORY_DEDICATED_ALLOCATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8282:91: error: template argument 1 is invalid
|  8282 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MEMORY_DEDICATED_ALLOCATE_INFO_TENSOR_ARM> {
|       |                                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8287:31: error: 'VkPhysicalDeviceExternalTensorInfoARM' was not declared in this scope; did you mean 'VkPhysicalDeviceExternalFenceInfoKHR'?
|  8287 | template <> struct LvlTypeMap<VkPhysicalDeviceExternalTensorInfoARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceExternalFenceInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8287:68: error: template argument 1 is invalid
|  8287 | template <> struct LvlTypeMap<VkPhysicalDeviceExternalTensorInfoARM> {
|       |                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8291:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_TENSOR_INFO_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_FENCE_INFO_KHR'?
|  8291 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_TENSOR_INFO_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_FENCE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8291:90: error: template argument 1 is invalid
|  8291 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_TENSOR_INFO_ARM> {
|       |                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8296:31: error: 'VkExternalTensorPropertiesARM' was not declared in this scope; did you mean 'VkExternalMemoryPropertiesKHR'?
|  8296 | template <> struct LvlTypeMap<VkExternalTensorPropertiesARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkExternalMemoryPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8296:60: error: template argument 1 is invalid
|  8296 | template <> struct LvlTypeMap<VkExternalTensorPropertiesARM> {
|       |                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8300:32: error: 'VK_STRUCTURE_TYPE_EXTERNAL_TENSOR_PROPERTIES_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_EXTERNAL_FENCE_PROPERTIES_KHR'?
|  8300 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_EXTERNAL_TENSOR_PROPERTIES_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_EXTERNAL_FENCE_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8300:80: error: template argument 1 is invalid
|  8300 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_EXTERNAL_TENSOR_PROPERTIES_ARM> {
|       |                                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8305:31: error: 'VkExternalMemoryTensorCreateInfoARM' was not declared in this scope; did you mean 'VkExternalMemoryBufferCreateInfoKHR'?
|  8305 | template <> struct LvlTypeMap<VkExternalMemoryTensorCreateInfoARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkExternalMemoryBufferCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8305:66: error: template argument 1 is invalid
|  8305 | template <> struct LvlTypeMap<VkExternalMemoryTensorCreateInfoARM> {
|       |                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8309:32: error: 'VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_TENSOR_CREATE_INFO_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_BUFFER_CREATE_INFO_KHR'?
|  8309 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_TENSOR_CREATE_INFO_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_BUFFER_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8309:88: error: template argument 1 is invalid
|  8309 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_TENSOR_CREATE_INFO_ARM> {
|       |                                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8314:31: error: 'VkPhysicalDeviceDescriptorBufferTensorFeaturesARM' was not declared in this scope; did you mean 'VkPhysicalDeviceDescriptorBufferFeaturesEXT'?
|  8314 | template <> struct LvlTypeMap<VkPhysicalDeviceDescriptorBufferTensorFeaturesARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceDescriptorBufferFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8314:80: error: template argument 1 is invalid
|  8314 | template <> struct LvlTypeMap<VkPhysicalDeviceDescriptorBufferTensorFeaturesARM> {
|       |                                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8318:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_TENSOR_FEATURES_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_FEATURES_EXT'?
|  8318 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_TENSOR_FEATURES_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8318:103: error: template argument 1 is invalid
|  8318 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_TENSOR_FEATURES_ARM> {
|       |                                                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8323:31: error: 'VkPhysicalDeviceDescriptorBufferTensorPropertiesARM' was not declared in this scope; did you mean 'VkPhysicalDeviceDescriptorBufferPropertiesEXT'?
|  8323 | template <> struct LvlTypeMap<VkPhysicalDeviceDescriptorBufferTensorPropertiesARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceDescriptorBufferPropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8323:82: error: template argument 1 is invalid
|  8323 | template <> struct LvlTypeMap<VkPhysicalDeviceDescriptorBufferTensorPropertiesARM> {
|       |                                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8327:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_TENSOR_PROPERTIES_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_PROPERTIES_EXT'?
|  8327 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_TENSOR_PROPERTIES_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_PROPERTIES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8327:105: error: template argument 1 is invalid
|  8327 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_TENSOR_PROPERTIES_ARM> {
|       |                                                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8332:31: error: 'VkDescriptorGetTensorInfoARM' was not declared in this scope; did you mean 'VkDescriptorGetInfoEXT'?
|  8332 | template <> struct LvlTypeMap<VkDescriptorGetTensorInfoARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkDescriptorGetInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8332:59: error: template argument 1 is invalid
|  8332 | template <> struct LvlTypeMap<VkDescriptorGetTensorInfoARM> {
|       |                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8336:32: error: 'VK_STRUCTURE_TYPE_DESCRIPTOR_GET_TENSOR_INFO_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DESCRIPTOR_GET_INFO_EXT'?
|  8336 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DESCRIPTOR_GET_TENSOR_INFO_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DESCRIPTOR_GET_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8336:80: error: template argument 1 is invalid
|  8336 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DESCRIPTOR_GET_TENSOR_INFO_ARM> {
|       |                                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8341:31: error: 'VkTensorCaptureDescriptorDataInfoARM' was not declared in this scope; did you mean 'VkBufferCaptureDescriptorDataInfoEXT'?
|  8341 | template <> struct LvlTypeMap<VkTensorCaptureDescriptorDataInfoARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkBufferCaptureDescriptorDataInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8341:67: error: template argument 1 is invalid
|  8341 | template <> struct LvlTypeMap<VkTensorCaptureDescriptorDataInfoARM> {
|       |                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8345:32: error: 'VK_STRUCTURE_TYPE_TENSOR_CAPTURE_DESCRIPTOR_DATA_INFO_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BUFFER_CAPTURE_DESCRIPTOR_DATA_INFO_EXT'?
|  8345 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_TENSOR_CAPTURE_DESCRIPTOR_DATA_INFO_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BUFFER_CAPTURE_DESCRIPTOR_DATA_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8345:89: error: template argument 1 is invalid
|  8345 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_TENSOR_CAPTURE_DESCRIPTOR_DATA_INFO_ARM> {
|       |                                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8350:31: error: 'VkTensorViewCaptureDescriptorDataInfoARM' was not declared in this scope; did you mean 'VkImageViewCaptureDescriptorDataInfoEXT'?
|  8350 | template <> struct LvlTypeMap<VkTensorViewCaptureDescriptorDataInfoARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkImageViewCaptureDescriptorDataInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8350:71: error: template argument 1 is invalid
|  8350 | template <> struct LvlTypeMap<VkTensorViewCaptureDescriptorDataInfoARM> {
|       |                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8354:32: error: 'VK_STRUCTURE_TYPE_TENSOR_VIEW_CAPTURE_DESCRIPTOR_DATA_INFO_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_VIEW_CAPTURE_DESCRIPTOR_DATA_INFO_EXT'?
|  8354 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_TENSOR_VIEW_CAPTURE_DESCRIPTOR_DATA_INFO_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_VIEW_CAPTURE_DESCRIPTOR_DATA_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8354:94: error: template argument 1 is invalid
|  8354 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_TENSOR_VIEW_CAPTURE_DESCRIPTOR_DATA_INFO_ARM> {
|       |                                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8359:31: error: 'VkFrameBoundaryTensorsARM' was not declared in this scope; did you mean 'VkFrameBoundaryFlagsEXT'?
|  8359 | template <> struct LvlTypeMap<VkFrameBoundaryTensorsARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkFrameBoundaryFlagsEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8359:56: error: template argument 1 is invalid
|  8359 | template <> struct LvlTypeMap<VkFrameBoundaryTensorsARM> {
|       |                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8363:32: error: 'VK_STRUCTURE_TYPE_FRAME_BOUNDARY_TENSORS_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_FRAME_BOUNDARY_EXT'?
|  8363 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_FRAME_BOUNDARY_TENSORS_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_FRAME_BOUNDARY_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8363:76: error: template argument 1 is invalid
|  8363 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_FRAME_BOUNDARY_TENSORS_ARM> {
|       |                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8824:31: error: 'VkPhysicalDeviceDataGraphFeaturesARM' was not declared in this scope; did you mean 'VkPhysicalDeviceAntiLagFeaturesAMD'?
|  8824 | template <> struct LvlTypeMap<VkPhysicalDeviceDataGraphFeaturesARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceAntiLagFeaturesAMD
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8824:67: error: template argument 1 is invalid
|  8824 | template <> struct LvlTypeMap<VkPhysicalDeviceDataGraphFeaturesARM> {
|       |                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8828:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DATA_GRAPH_FEATURES_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ANTI_LAG_FEATURES_AMD'?
|  8828 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DATA_GRAPH_FEATURES_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ANTI_LAG_FEATURES_AMD
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8828:89: error: template argument 1 is invalid
|  8828 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DATA_GRAPH_FEATURES_ARM> {
|       |                                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8833:31: error: 'VkDataGraphPipelineConstantARM' was not declared in this scope
|  8833 | template <> struct LvlTypeMap<VkDataGraphPipelineConstantARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8833:61: error: template argument 1 is invalid
|  8833 | template <> struct LvlTypeMap<VkDataGraphPipelineConstantARM> {
|       |                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8837:32: error: 'VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_CONSTANT_ARM' was not declared in this scope
|  8837 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_CONSTANT_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8837:82: error: template argument 1 is invalid
|  8837 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_CONSTANT_ARM> {
|       |                                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8842:31: error: 'VkDataGraphPipelineResourceInfoARM' was not declared in this scope
|  8842 | template <> struct LvlTypeMap<VkDataGraphPipelineResourceInfoARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8842:65: error: template argument 1 is invalid
|  8842 | template <> struct LvlTypeMap<VkDataGraphPipelineResourceInfoARM> {
|       |                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8846:32: error: 'VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_RESOURCE_INFO_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_CREATE_INFO_NV'?
|  8846 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_RESOURCE_INFO_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_CREATE_INFO_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8846:87: error: template argument 1 is invalid
|  8846 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_RESOURCE_INFO_ARM> {
|       |                                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8851:31: error: 'VkDataGraphPipelineCompilerControlCreateInfoARM' was not declared in this scope; did you mean 'VkPipelineCompilerControlCreateInfoAMD'?
|  8851 | template <> struct LvlTypeMap<VkDataGraphPipelineCompilerControlCreateInfoARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPipelineCompilerControlCreateInfoAMD
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8851:78: error: template argument 1 is invalid
|  8851 | template <> struct LvlTypeMap<VkDataGraphPipelineCompilerControlCreateInfoARM> {
|       |                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8855:32: error: 'VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_COMPILER_CONTROL_CREATE_INFO_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_COMPILER_CONTROL_CREATE_INFO_AMD'?
|  8855 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_COMPILER_CONTROL_CREATE_INFO_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_COMPILER_CONTROL_CREATE_INFO_AMD
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8855:102: error: template argument 1 is invalid
|  8855 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_COMPILER_CONTROL_CREATE_INFO_ARM> {
|       |                                                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8860:31: error: 'VkDataGraphPipelineCreateInfoARM' was not declared in this scope; did you mean 'VkGraphicsPipelineCreateInfo'?
|  8860 | template <> struct LvlTypeMap<VkDataGraphPipelineCreateInfoARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkGraphicsPipelineCreateInfo
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8860:63: error: template argument 1 is invalid
|  8860 | template <> struct LvlTypeMap<VkDataGraphPipelineCreateInfoARM> {
|       |                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8864:32: error: 'VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_CREATE_INFO_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_CREATE_INFO_NV'?
|  8864 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_CREATE_INFO_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_CREATE_INFO_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8864:85: error: template argument 1 is invalid
|  8864 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_CREATE_INFO_ARM> {
|       |                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8869:31: error: 'VkDataGraphPipelineShaderModuleCreateInfoARM' was not declared in this scope; did you mean 'VkGraphicsPipelineShaderGroupsCreateInfoNV'?
|  8869 | template <> struct LvlTypeMap<VkDataGraphPipelineShaderModuleCreateInfoARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkGraphicsPipelineShaderGroupsCreateInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8869:75: error: template argument 1 is invalid
|  8869 | template <> struct LvlTypeMap<VkDataGraphPipelineShaderModuleCreateInfoARM> {
|       |                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8873:32: error: 'VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_SHADER_MODULE_CREATE_INFO_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_SHADER_GROUPS_CREATE_INFO_NV'?
|  8873 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_SHADER_MODULE_CREATE_INFO_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_SHADER_GROUPS_CREATE_INFO_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8873:99: error: template argument 1 is invalid
|  8873 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_SHADER_MODULE_CREATE_INFO_ARM> {
|       |                                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8878:31: error: 'VkDataGraphPipelineSessionCreateInfoARM' was not declared in this scope
|  8878 | template <> struct LvlTypeMap<VkDataGraphPipelineSessionCreateInfoARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8878:70: error: template argument 1 is invalid
|  8878 | template <> struct LvlTypeMap<VkDataGraphPipelineSessionCreateInfoARM> {
|       |                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8882:32: error: 'VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_SESSION_CREATE_INFO_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_OPTICAL_FLOW_SESSION_CREATE_INFO_NV'?
|  8882 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_SESSION_CREATE_INFO_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_OPTICAL_FLOW_SESSION_CREATE_INFO_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8882:93: error: template argument 1 is invalid
|  8882 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_SESSION_CREATE_INFO_ARM> {
|       |                                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8887:31: error: 'VkDataGraphPipelineSessionBindPointRequirementsInfoARM' was not declared in this scope
|  8887 | template <> struct LvlTypeMap<VkDataGraphPipelineSessionBindPointRequirementsInfoARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8887:85: error: template argument 1 is invalid
|  8887 | template <> struct LvlTypeMap<VkDataGraphPipelineSessionBindPointRequirementsInfoARM> {
|       |                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8891:32: error: 'VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_SESSION_BIND_POINT_REQUIREMENTS_INFO_ARM' was not declared in this scope
|  8891 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_SESSION_BIND_POINT_REQUIREMENTS_INFO_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8891:110: error: template argument 1 is invalid
|  8891 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_SESSION_BIND_POINT_REQUIREMENTS_INFO_ARM> {
|       |                                                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8896:31: error: 'VkDataGraphPipelineSessionBindPointRequirementARM' was not declared in this scope
|  8896 | template <> struct LvlTypeMap<VkDataGraphPipelineSessionBindPointRequirementARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8896:80: error: template argument 1 is invalid
|  8896 | template <> struct LvlTypeMap<VkDataGraphPipelineSessionBindPointRequirementARM> {
|       |                                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8900:32: error: 'VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_SESSION_BIND_POINT_REQUIREMENT_ARM' was not declared in this scope
|  8900 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_SESSION_BIND_POINT_REQUIREMENT_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8900:104: error: template argument 1 is invalid
|  8900 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_SESSION_BIND_POINT_REQUIREMENT_ARM> {
|       |                                                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8905:31: error: 'VkDataGraphPipelineSessionMemoryRequirementsInfoARM' was not declared in this scope
|  8905 | template <> struct LvlTypeMap<VkDataGraphPipelineSessionMemoryRequirementsInfoARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8905:82: error: template argument 1 is invalid
|  8905 | template <> struct LvlTypeMap<VkDataGraphPipelineSessionMemoryRequirementsInfoARM> {
|       |                                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8909:32: error: 'VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_SESSION_MEMORY_REQUIREMENTS_INFO_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_PLANE_MEMORY_REQUIREMENTS_INFO_KHR'?
|  8909 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_SESSION_MEMORY_REQUIREMENTS_INFO_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_PLANE_MEMORY_REQUIREMENTS_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8909:106: error: template argument 1 is invalid
|  8909 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_SESSION_MEMORY_REQUIREMENTS_INFO_ARM> {
|       |                                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8914:31: error: 'VkBindDataGraphPipelineSessionMemoryInfoARM' was not declared in this scope
|  8914 | template <> struct LvlTypeMap<VkBindDataGraphPipelineSessionMemoryInfoARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8914:74: error: template argument 1 is invalid
|  8914 | template <> struct LvlTypeMap<VkBindDataGraphPipelineSessionMemoryInfoARM> {
|       |                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8918:32: error: 'VK_STRUCTURE_TYPE_BIND_DATA_GRAPH_PIPELINE_SESSION_MEMORY_INFO_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BIND_VIDEO_SESSION_MEMORY_INFO_KHR'?
|  8918 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BIND_DATA_GRAPH_PIPELINE_SESSION_MEMORY_INFO_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BIND_VIDEO_SESSION_MEMORY_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8918:98: error: template argument 1 is invalid
|  8918 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BIND_DATA_GRAPH_PIPELINE_SESSION_MEMORY_INFO_ARM> {
|       |                                                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8923:31: error: 'VkDataGraphPipelineInfoARM' was not declared in this scope
|  8923 | template <> struct LvlTypeMap<VkDataGraphPipelineInfoARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8923:57: error: template argument 1 is invalid
|  8923 | template <> struct LvlTypeMap<VkDataGraphPipelineInfoARM> {
|       |                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8927:32: error: 'VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_INFO_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_INFO_KHR'?
|  8927 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_INFO_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8927:78: error: template argument 1 is invalid
|  8927 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_INFO_ARM> {
|       |                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8932:31: error: 'VkDataGraphPipelinePropertyQueryResultARM' was not declared in this scope
|  8932 | template <> struct LvlTypeMap<VkDataGraphPipelinePropertyQueryResultARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8932:72: error: template argument 1 is invalid
|  8932 | template <> struct LvlTypeMap<VkDataGraphPipelinePropertyQueryResultARM> {
|       |                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8936:32: error: 'VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_PROPERTY_QUERY_RESULT_ARM' was not declared in this scope
|  8936 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_PROPERTY_QUERY_RESULT_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8936:95: error: template argument 1 is invalid
|  8936 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_PROPERTY_QUERY_RESULT_ARM> {
|       |                                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8941:31: error: 'VkDataGraphPipelineIdentifierCreateInfoARM' was not declared in this scope
|  8941 | template <> struct LvlTypeMap<VkDataGraphPipelineIdentifierCreateInfoARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8941:73: error: template argument 1 is invalid
|  8941 | template <> struct LvlTypeMap<VkDataGraphPipelineIdentifierCreateInfoARM> {
|       |                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8945:32: error: 'VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_IDENTIFIER_CREATE_INFO_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_INTERFACE_CREATE_INFO_KHR'?
|  8945 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_IDENTIFIER_CREATE_INFO_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_INTERFACE_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8945:96: error: template argument 1 is invalid
|  8945 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_IDENTIFIER_CREATE_INFO_ARM> {
|       |                                                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8950:31: error: 'VkDataGraphPipelineDispatchInfoARM' was not declared in this scope
|  8950 | template <> struct LvlTypeMap<VkDataGraphPipelineDispatchInfoARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8950:65: error: template argument 1 is invalid
|  8950 | template <> struct LvlTypeMap<VkDataGraphPipelineDispatchInfoARM> {
|       |                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8954:32: error: 'VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_DISPATCH_INFO_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_CREATE_INFO_NV'?
|  8954 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_DISPATCH_INFO_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_CREATE_INFO_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8954:87: error: template argument 1 is invalid
|  8954 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_DISPATCH_INFO_ARM> {
|       |                                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8959:31: error: 'VkQueueFamilyDataGraphPropertiesARM' was not declared in this scope; did you mean 'VkQueueFamilyVideoPropertiesKHR'?
|  8959 | template <> struct LvlTypeMap<VkQueueFamilyDataGraphPropertiesARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkQueueFamilyVideoPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8959:66: error: template argument 1 is invalid
|  8959 | template <> struct LvlTypeMap<VkQueueFamilyDataGraphPropertiesARM> {
|       |                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8963:32: error: 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_DATA_GRAPH_PROPERTIES_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_VIDEO_PROPERTIES_KHR'?
|  8963 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUEUE_FAMILY_DATA_GRAPH_PROPERTIES_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_QUEUE_FAMILY_VIDEO_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8963:88: error: template argument 1 is invalid
|  8963 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUEUE_FAMILY_DATA_GRAPH_PROPERTIES_ARM> {
|       |                                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8968:31: error: 'VkDataGraphProcessingEngineCreateInfoARM' was not declared in this scope
|  8968 | template <> struct LvlTypeMap<VkDataGraphProcessingEngineCreateInfoARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8968:71: error: template argument 1 is invalid
|  8968 | template <> struct LvlTypeMap<VkDataGraphProcessingEngineCreateInfoARM> {
|       |                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8972:32: error: 'VK_STRUCTURE_TYPE_DATA_GRAPH_PROCESSING_ENGINE_CREATE_INFO_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_SCALING_CREATE_INFO_EXT'?
|  8972 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PROCESSING_ENGINE_CREATE_INFO_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_SCALING_CREATE_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8972:94: error: template argument 1 is invalid
|  8972 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PROCESSING_ENGINE_CREATE_INFO_ARM> {
|       |                                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8977:31: error: 'VkPhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM' was not declared in this scope
|  8977 | template <> struct LvlTypeMap<VkPhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8977:90: error: template argument 1 is invalid
|  8977 | template <> struct LvlTypeMap<VkPhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM> {
|       |                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8981:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_QUEUE_FAMILY_DATA_GRAPH_PROCESSING_ENGINE_INFO_ARM' was not declared in this scope
|  8981 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_QUEUE_FAMILY_DATA_GRAPH_PROCESSING_ENGINE_INFO_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8981:116: error: template argument 1 is invalid
|  8981 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_QUEUE_FAMILY_DATA_GRAPH_PROCESSING_ENGINE_INFO_ARM> {
|       |                                                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8986:31: error: 'VkQueueFamilyDataGraphProcessingEnginePropertiesARM' was not declared in this scope
|  8986 | template <> struct LvlTypeMap<VkQueueFamilyDataGraphProcessingEnginePropertiesARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8986:82: error: template argument 1 is invalid
|  8986 | template <> struct LvlTypeMap<VkQueueFamilyDataGraphProcessingEnginePropertiesARM> {
|       |                                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8990:32: error: 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_DATA_GRAPH_PROCESSING_ENGINE_PROPERTIES_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_QUERY_RESULT_STATUS_PROPERTIES_KHR'?
|  8990 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUEUE_FAMILY_DATA_GRAPH_PROCESSING_ENGINE_PROPERTIES_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_QUEUE_FAMILY_QUERY_RESULT_STATUS_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8990:106: error: template argument 1 is invalid
|  8990 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUEUE_FAMILY_DATA_GRAPH_PROCESSING_ENGINE_PROPERTIES_ARM> {
|       |                                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8995:31: error: 'VkDataGraphPipelineConstantTensorSemiStructuredSparsityInfoARM' was not declared in this scope
|  8995 | template <> struct LvlTypeMap<VkDataGraphPipelineConstantTensorSemiStructuredSparsityInfoARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8995:93: error: template argument 1 is invalid
|  8995 | template <> struct LvlTypeMap<VkDataGraphPipelineConstantTensorSemiStructuredSparsityInfoARM> {
|       |                                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8999:32: error: 'VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_CONSTANT_TENSOR_SEMI_STRUCTURED_SPARSITY_INFO_ARM' was not declared in this scope
|  8999 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_CONSTANT_TENSOR_SEMI_STRUCTURED_SPARSITY_INFO_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:8999:119: error: template argument 1 is invalid
|  8999 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DATA_GRAPH_PIPELINE_CONSTANT_TENSOR_SEMI_STRUCTURED_SPARSITY_INFO_ARM> {
|       |                                                                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9329:31: error: 'VkPhysicalDeviceShaderFloat8FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderObjectFeaturesEXT'?
|  9329 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderFloat8FeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderObjectFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9329:70: error: template argument 1 is invalid
|  9329 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderFloat8FeaturesEXT> {
|       |                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9333:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT8_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_OBJECT_FEATURES_EXT'?
|  9333 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT8_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_OBJECT_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9333:92: error: template argument 1 is invalid
|  9333 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT8_FEATURES_EXT> {
|       |                                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9760:31: error: 'VkPhysicalDeviceFormatPackFeaturesARM' was not declared in this scope; did you mean 'VkPhysicalDevicePrivateDataFeaturesEXT'?
|  9760 | template <> struct LvlTypeMap<VkPhysicalDeviceFormatPackFeaturesARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDevicePrivateDataFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9760:68: error: template argument 1 is invalid
|  9760 | template <> struct LvlTypeMap<VkPhysicalDeviceFormatPackFeaturesARM> {
|       |                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9764:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FORMAT_PACK_FEATURES_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT'?
|  9764 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FORMAT_PACK_FEATURES_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9764:90: error: template argument 1 is invalid
|  9764 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FORMAT_PACK_FEATURES_ARM> {
|       |                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9769:31: error: 'VkPhysicalDeviceFragmentDensityMapLayeredFeaturesVALVE' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapOffsetFeaturesQCOM'?
|  9769 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMapLayeredFeaturesVALVE> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceFragmentDensityMapOffsetFeaturesQCOM
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9769:85: error: template argument 1 is invalid
|  9769 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMapLayeredFeaturesVALVE> {
|       |                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9773:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_LAYERED_FEATURES_VALVE' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_OFFSET_FEATURES_QCOM'?
|  9773 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_LAYERED_FEATURES_VALVE> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_OFFSET_FEATURES_QCOM
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9773:109: error: template argument 1 is invalid
|  9773 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_LAYERED_FEATURES_VALVE> {
|       |                                                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9778:31: error: 'VkPhysicalDeviceFragmentDensityMapLayeredPropertiesVALVE' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapOffsetPropertiesQCOM'?
|  9778 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMapLayeredPropertiesVALVE> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceFragmentDensityMapOffsetPropertiesQCOM
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9778:87: error: template argument 1 is invalid
|  9778 | template <> struct LvlTypeMap<VkPhysicalDeviceFragmentDensityMapLayeredPropertiesVALVE> {
|       |                                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9782:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_LAYERED_PROPERTIES_VALVE' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_OFFSET_PROPERTIES_QCOM'?
|  9782 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_LAYERED_PROPERTIES_VALVE> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_OFFSET_PROPERTIES_QCOM
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9782:111: error: template argument 1 is invalid
|  9782 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_LAYERED_PROPERTIES_VALVE> {
|       |                                                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9787:31: error: 'VkPipelineFragmentDensityMapLayeredCreateInfoVALVE' was not declared in this scope
|  9787 | template <> struct LvlTypeMap<VkPipelineFragmentDensityMapLayeredCreateInfoVALVE> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9787:81: error: template argument 1 is invalid
|  9787 | template <> struct LvlTypeMap<VkPipelineFragmentDensityMapLayeredCreateInfoVALVE> {
|       |                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9791:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_DENSITY_MAP_LAYERED_CREATE_INFO_VALVE' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_STATE_CREATE_INFO_KHR'?
|  9791 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_DENSITY_MAP_LAYERED_CREATE_INFO_VALVE> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_STATE_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9791:105: error: template argument 1 is invalid
|  9791 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_DENSITY_MAP_LAYERED_CREATE_INFO_VALVE> {
|       |                                                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9827:31: error: 'VkPhysicalDeviceZeroInitializeDeviceMemoryFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR'?
|  9827 | template <> struct LvlTypeMap<VkPhysicalDeviceZeroInitializeDeviceMemoryFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9827:84: error: template argument 1 is invalid
|  9827 | template <> struct LvlTypeMap<VkPhysicalDeviceZeroInitializeDeviceMemoryFeaturesEXT> {
|       |                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9831:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ZERO_INITIALIZE_DEVICE_MEMORY_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ZERO_INITIALIZE_WORKGROUP_MEMORY_FEATURES_KHR'?
|  9831 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ZERO_INITIALIZE_DEVICE_MEMORY_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ZERO_INITIALIZE_WORKGROUP_MEMORY_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9831:108: error: template argument 1 is invalid
|  9831 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ZERO_INITIALIZE_DEVICE_MEMORY_FEATURES_EXT> {
|       |                                                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9836:31: error: 'VkPhysicalDevicePipelineCacheIncrementalModeFeaturesSEC' was not declared in this scope
|  9836 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineCacheIncrementalModeFeaturesSEC> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9836:86: error: template argument 1 is invalid
|  9836 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineCacheIncrementalModeFeaturesSEC> {
|       |                                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9840:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_CACHE_INCREMENTAL_MODE_FEATURES_SEC' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_OPACITY_MICROMAP_FEATURES_ARM'?
|  9840 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_CACHE_INCREMENTAL_MODE_FEATURES_SEC> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_OPACITY_MICROMAP_FEATURES_ARM
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:9840:110: error: template argument 1 is invalid
|  9840 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_CACHE_INCREMENTAL_MODE_FEATURES_SEC> {
|       |                                                                                                              ^
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:25,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/mock_icd.cpp:18:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:2642:11: error: 'VkPresentWait2InfoKHR' does not name a type; did you mean 'VkPresentInfoKHR'?
|  2642 |     const VkPresentWait2InfoKHR*                pPresentWait2Info);
|       |           ^~~~~~~~~~~~~~~~~~~~~
|       |           VkPresentInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:2678:11: error: 'VkReleaseSwapchainImagesInfoKHR' does not name a type; did you mean 'VkReleaseSwapchainImagesInfoEXT'?
|  2678 |     const VkReleaseSwapchainImagesInfoKHR*      pReleaseInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkReleaseSwapchainImagesInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:3714:11: error: 'VkReleaseSwapchainImagesInfoKHR' does not name a type; did you mean 'VkReleaseSwapchainImagesInfoEXT'?
|  3714 |     const VkReleaseSwapchainImagesInfoKHR*      pReleaseInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkReleaseSwapchainImagesInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4445:11: error: 'VkTensorCreateInfoARM' does not name a type; did you mean 'VkFenceCreateInfo'?
|  4445 |     const VkTensorCreateInfoARM*                pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~
|       |           VkFenceCreateInfo
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4447:5: error: 'VkTensorARM' has not been declared
|  4447 |     VkTensorARM*                                pTensor);
|       |     ^~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4451:5: error: 'VkTensorARM' has not been declared
|  4451 |     VkTensorARM                                 tensor,
|       |     ^~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4456:11: error: 'VkTensorViewCreateInfoARM' does not name a type; did you mean 'VkBufferViewCreateInfo'?
|  4456 |     const VkTensorViewCreateInfoARM*            pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkBufferViewCreateInfo
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4458:5: error: 'VkTensorViewARM' has not been declared
|  4458 |     VkTensorViewARM*                            pView);
|       |     ^~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4462:5: error: 'VkTensorViewARM' has not been declared
|  4462 |     VkTensorViewARM                             tensorView,
|       |     ^~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4467:11: error: 'VkTensorMemoryRequirementsInfoARM' does not name a type; did you mean 'VkBufferMemoryRequirementsInfo2'?
|  4467 |     const VkTensorMemoryRequirementsInfoARM*    pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkBufferMemoryRequirementsInfo2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4473:11: error: 'VkBindTensorMemoryInfoARM' does not name a type; did you mean 'VkBindBufferMemoryInfoKHR'?
|  4473 |     const VkBindTensorMemoryInfoARM*            pBindInfos);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkBindBufferMemoryInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4477:11: error: 'VkDeviceTensorMemoryRequirementsARM' does not name a type; did you mean 'VkDeviceBufferMemoryRequirementsKHR'?
|  4477 |     const VkDeviceTensorMemoryRequirementsARM*  pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkDeviceBufferMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4482:12: error: 'VkCopyTensorInfoARM' does not name a type
|  4482 |      const VkCopyTensorInfoARM*                 pCopyTensorInfo);
|       |            ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4486:11: error: 'VkPhysicalDeviceExternalTensorInfoARM' does not name a type; did you mean 'VkPhysicalDeviceExternalFenceInfoKHR'?
|  4486 |     const VkPhysicalDeviceExternalTensorInfoARM* pExternalTensorInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPhysicalDeviceExternalFenceInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4487:5: error: 'VkExternalTensorPropertiesARM' has not been declared; did you mean 'VkExternalMemoryPropertiesKHR'?
|  4487 |     VkExternalTensorPropertiesARM*              pExternalTensorProperties);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkExternalMemoryPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4491:11: error: 'VkTensorCaptureDescriptorDataInfoARM' does not name a type; did you mean 'VkBufferCaptureDescriptorDataInfoEXT'?
|  4491 |     const VkTensorCaptureDescriptorDataInfoARM* pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkBufferCaptureDescriptorDataInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4496:11: error: 'VkTensorViewCaptureDescriptorDataInfoARM' does not name a type; did you mean 'VkImageViewCaptureDescriptorDataInfoEXT'?
|  4496 |     const VkTensorViewCaptureDescriptorDataInfoARM* pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkImageViewCaptureDescriptorDataInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4649:11: error: 'VkDataGraphPipelineCreateInfoARM' does not name a type; did you mean 'VkGraphicsPipelineCreateInfo'?
|  4649 |     const VkDataGraphPipelineCreateInfoARM*     pCreateInfos,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkGraphicsPipelineCreateInfo
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4655:11: error: 'VkDataGraphPipelineSessionCreateInfoARM' does not name a type
|  4655 |     const VkDataGraphPipelineSessionCreateInfoARM* pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4657:5: error: 'VkDataGraphPipelineSessionARM' has not been declared
|  4657 |     VkDataGraphPipelineSessionARM*              pSession);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4661:11: error: 'VkDataGraphPipelineSessionBindPointRequirementsInfoARM' does not name a type
|  4661 |     const VkDataGraphPipelineSessionBindPointRequirementsInfoARM* pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4663:5: error: 'VkDataGraphPipelineSessionBindPointRequirementARM' has not been declared
|  4663 |     VkDataGraphPipelineSessionBindPointRequirementARM* pBindPointRequirements);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4667:11: error: 'VkDataGraphPipelineSessionMemoryRequirementsInfoARM' does not name a type
|  4667 |     const VkDataGraphPipelineSessionMemoryRequirementsInfoARM* pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4673:11: error: 'VkBindDataGraphPipelineSessionMemoryInfoARM' does not name a type
|  4673 |     const VkBindDataGraphPipelineSessionMemoryInfoARM* pBindInfos);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4677:5: error: 'VkDataGraphPipelineSessionARM' has not been declared
|  4677 |     VkDataGraphPipelineSessionARM               session,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4682:5: error: 'VkDataGraphPipelineSessionARM' has not been declared
|  4682 |     VkDataGraphPipelineSessionARM               session,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4683:11: error: 'VkDataGraphPipelineDispatchInfoARM' does not name a type
|  4683 |     const VkDataGraphPipelineDispatchInfoARM*   pInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4687:11: error: 'VkDataGraphPipelineInfoARM' does not name a type
|  4687 |     const VkDataGraphPipelineInfoARM*           pPipelineInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4689:5: error: 'VkDataGraphPipelinePropertyARM' has not been declared
|  4689 |     VkDataGraphPipelinePropertyARM*             pProperties);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4693:11: error: 'VkDataGraphPipelineInfoARM' does not name a type
|  4693 |     const VkDataGraphPipelineInfoARM*           pPipelineInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4695:5: error: 'VkDataGraphPipelinePropertyQueryResultARM' has not been declared
|  4695 |     VkDataGraphPipelinePropertyQueryResultARM*  pProperties);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4701:5: error: 'VkQueueFamilyDataGraphPropertiesARM' has not been declared; did you mean 'VkQueueFamilyVideoPropertiesKHR'?
|  4701 |     VkQueueFamilyDataGraphPropertiesARM*        pQueueFamilyDataGraphProperties);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkQueueFamilyVideoPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4705:11: error: 'VkPhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM' does not name a type
|  4705 |     const VkPhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM* pQueueFamilyDataGraphProcessingEngineInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_declarations.h:4706:5: error: 'VkQueueFamilyDataGraphProcessingEnginePropertiesARM' has not been declared
|  4706 |     VkQueueFamilyDataGraphProcessingEnginePropertiesARM* pQueueFamilyDataGraphProcessingEngineProperties);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:5189:11: error: 'VkPresentWait2InfoKHR' does not name a type; did you mean 'VkPresentInfoKHR'?
|  5189 |     const VkPresentWait2InfoKHR*                pPresentWait2Info)
|       |           ^~~~~~~~~~~~~~~~~~~~~
|       |           VkPresentInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:5251:11: error: 'VkReleaseSwapchainImagesInfoKHR' does not name a type; did you mean 'VkReleaseSwapchainImagesInfoEXT'?
|  5251 |     const VkReleaseSwapchainImagesInfoKHR*      pReleaseInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkReleaseSwapchainImagesInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:6890:11: error: 'VkReleaseSwapchainImagesInfoKHR' does not name a type; did you mean 'VkReleaseSwapchainImagesInfoEXT'?
|  6890 |     const VkReleaseSwapchainImagesInfoKHR*      pReleaseInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkReleaseSwapchainImagesInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8038:11: error: 'VkTensorCreateInfoARM' does not name a type; did you mean 'VkFenceCreateInfo'?
|  8038 |     const VkTensorCreateInfoARM*                pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~
|       |           VkFenceCreateInfo
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8040:5: error: 'VkTensorARM' has not been declared
|  8040 |     VkTensorARM*                                pTensor)
|       |     ^~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h: In function 'VkResult vkmock::CreateTensorARM(VkDevice, const int*, const VkAllocationCallbacks*, int*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8043:17: error: 'VkTensorARM' was not declared in this scope
|  8043 |     *pTensor = (VkTensorARM)global_unique_handle++;
|       |                 ^~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8049:5: error: 'VkTensorARM' has not been declared
|  8049 |     VkTensorARM                                 tensor,
|       |     ^~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8057:11: error: 'VkTensorViewCreateInfoARM' does not name a type; did you mean 'VkBufferViewCreateInfo'?
|  8057 |     const VkTensorViewCreateInfoARM*            pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkBufferViewCreateInfo
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8059:5: error: 'VkTensorViewARM' has not been declared
|  8059 |     VkTensorViewARM*                            pView)
|       |     ^~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h: In function 'VkResult vkmock::CreateTensorViewARM(VkDevice, const int*, const VkAllocationCallbacks*, int*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8062:15: error: 'VkTensorViewARM' was not declared in this scope; did you mean 'CreateTensorViewARM'?
|  8062 |     *pView = (VkTensorViewARM)global_unique_handle++;
|       |               ^~~~~~~~~~~~~~~
|       |               CreateTensorViewARM
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8068:5: error: 'VkTensorViewARM' has not been declared
|  8068 |     VkTensorViewARM                             tensorView,
|       |     ^~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8076:11: error: 'VkTensorMemoryRequirementsInfoARM' does not name a type; did you mean 'VkBufferMemoryRequirementsInfo2'?
|  8076 |     const VkTensorMemoryRequirementsInfoARM*    pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkBufferMemoryRequirementsInfo2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8085:11: error: 'VkBindTensorMemoryInfoARM' does not name a type; did you mean 'VkBindBufferMemoryInfoKHR'?
|  8085 |     const VkBindTensorMemoryInfoARM*            pBindInfos)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkBindBufferMemoryInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8093:11: error: 'VkDeviceTensorMemoryRequirementsARM' does not name a type; did you mean 'VkDeviceBufferMemoryRequirementsKHR'?
|  8093 |     const VkDeviceTensorMemoryRequirementsARM*  pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkDeviceBufferMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8101:12: error: 'VkCopyTensorInfoARM' does not name a type
|  8101 |      const VkCopyTensorInfoARM*                 pCopyTensorInfo)
|       |            ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8108:11: error: 'VkPhysicalDeviceExternalTensorInfoARM' does not name a type; did you mean 'VkPhysicalDeviceExternalFenceInfoKHR'?
|  8108 |     const VkPhysicalDeviceExternalTensorInfoARM* pExternalTensorInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPhysicalDeviceExternalFenceInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8109:5: error: 'VkExternalTensorPropertiesARM' has not been declared; did you mean 'VkExternalMemoryPropertiesKHR'?
|  8109 |     VkExternalTensorPropertiesARM*              pExternalTensorProperties)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkExternalMemoryPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8116:11: error: 'VkTensorCaptureDescriptorDataInfoARM' does not name a type; did you mean 'VkBufferCaptureDescriptorDataInfoEXT'?
|  8116 |     const VkTensorCaptureDescriptorDataInfoARM* pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkBufferCaptureDescriptorDataInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8125:11: error: 'VkTensorViewCaptureDescriptorDataInfoARM' does not name a type; did you mean 'VkImageViewCaptureDescriptorDataInfoEXT'?
|  8125 |     const VkTensorViewCaptureDescriptorDataInfoARM* pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkImageViewCaptureDescriptorDataInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8370:11: error: 'VkDataGraphPipelineCreateInfoARM' does not name a type; did you mean 'VkGraphicsPipelineCreateInfo'?
|  8370 |     const VkDataGraphPipelineCreateInfoARM*     pCreateInfos,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkGraphicsPipelineCreateInfo
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8383:11: error: 'VkDataGraphPipelineSessionCreateInfoARM' does not name a type
|  8383 |     const VkDataGraphPipelineSessionCreateInfoARM* pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8385:5: error: 'VkDataGraphPipelineSessionARM' has not been declared
|  8385 |     VkDataGraphPipelineSessionARM*              pSession)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h: In function 'VkResult vkmock::CreateDataGraphPipelineSessionARM(VkDevice, const int*, const VkAllocationCallbacks*, int*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8388:18: error: 'VkDataGraphPipelineSessionARM' was not declared in this scope; did you mean 'CreateDataGraphPipelineSessionARM'?
|  8388 |     *pSession = (VkDataGraphPipelineSessionARM)global_unique_handle++;
|       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                  CreateDataGraphPipelineSessionARM
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8394:11: error: 'VkDataGraphPipelineSessionBindPointRequirementsInfoARM' does not name a type
|  8394 |     const VkDataGraphPipelineSessionBindPointRequirementsInfoARM* pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8396:5: error: 'VkDataGraphPipelineSessionBindPointRequirementARM' has not been declared
|  8396 |     VkDataGraphPipelineSessionBindPointRequirementARM* pBindPointRequirements)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8404:11: error: 'VkDataGraphPipelineSessionMemoryRequirementsInfoARM' does not name a type
|  8404 |     const VkDataGraphPipelineSessionMemoryRequirementsInfoARM* pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8413:11: error: 'VkBindDataGraphPipelineSessionMemoryInfoARM' does not name a type
|  8413 |     const VkBindDataGraphPipelineSessionMemoryInfoARM* pBindInfos)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8421:5: error: 'VkDataGraphPipelineSessionARM' has not been declared
|  8421 |     VkDataGraphPipelineSessionARM               session,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8429:5: error: 'VkDataGraphPipelineSessionARM' has not been declared
|  8429 |     VkDataGraphPipelineSessionARM               session,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8430:11: error: 'VkDataGraphPipelineDispatchInfoARM' does not name a type
|  8430 |     const VkDataGraphPipelineDispatchInfoARM*   pInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8437:11: error: 'VkDataGraphPipelineInfoARM' does not name a type
|  8437 |     const VkDataGraphPipelineInfoARM*           pPipelineInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8439:5: error: 'VkDataGraphPipelinePropertyARM' has not been declared
|  8439 |     VkDataGraphPipelinePropertyARM*             pProperties)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8447:11: error: 'VkDataGraphPipelineInfoARM' does not name a type
|  8447 |     const VkDataGraphPipelineInfoARM*           pPipelineInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8449:5: error: 'VkDataGraphPipelinePropertyQueryResultARM' has not been declared
|  8449 |     VkDataGraphPipelinePropertyQueryResultARM*  pProperties)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8459:5: error: 'VkQueueFamilyDataGraphPropertiesARM' has not been declared; did you mean 'VkQueueFamilyVideoPropertiesKHR'?
|  8459 |     VkQueueFamilyDataGraphPropertiesARM*        pQueueFamilyDataGraphProperties)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkQueueFamilyVideoPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8467:11: error: 'VkPhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM' does not name a type
|  8467 |     const VkPhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM* pQueueFamilyDataGraphProcessingEngineInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:8468:5: error: 'VkQueueFamilyDataGraphProcessingEnginePropertiesARM' has not been declared
|  8468 |     VkQueueFamilyDataGraphProcessingEnginePropertiesARM* pQueueFamilyDataGraphProcessingEngineProperties)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h: In instantiation of 'T* lvl_find_mod_in_chain(void*) [with T = VkSurfacePresentModeCompatibilityEXT]':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/function_definitions.h:4582:99:   required from here
|  4582 |     auto *present_mode_compatibility = lvl_find_mod_in_chain<VkSurfacePresentModeCompatibilityEXT>(pSurfaceCapabilities->pNext);
|       |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/icd/generated/vk_typemap_helper.h:10071:28: error: 'kSType' is not a member of 'LvlTypeMap<VkSurfacePresentModeCompatibilityEXT>'
| 10071 |         if (LvlTypeMap<T>::kSType == current->sType) {
|       |                            ^~~~~~
| [2/4] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot  -O2 -g
   -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0=/usr/src/debug/vulkan-tools/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/build=/usr/src/debug/vulkan-tools/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIE -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-stringop-truncation -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /srv/poky
 build/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/vulkaninfo.cpp
| FAILED: [code=1] vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot  -O2 -g  -ffi
 le-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0=/usr/src/debug/vulkan-tools/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/build=/usr/src/debug/vulkan-tools/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIE -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-stringop-truncation -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /srv/pokybuild/
 yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/vulkaninfo.cpp
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/vulkaninfo.cpp:34:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:359:38: error: 'StdVideoVP9Profile' was not declared in this scope; did you mean 'StdVideoAV1Profile'?
|   359 | std::string StdVideoVP9ProfileString(StdVideoVP9Profile value) {
|       |                                      ^~~~~~~~~~~~~~~~~~
|       |                                      StdVideoAV1Profile
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:359:64: error: expected ',' or ';' before '{' token
|   359 | std::string StdVideoVP9ProfileString(StdVideoVP9Profile value) {
|       |                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:369:59: error: 'StdVideoVP9Profile' has not been declared; did you mean 'StdVideoAV1Profile'?
|   369 | void DumpStdVideoVP9Profile(Printer &p, std::string name, StdVideoVP9Profile value) {
|       |                                                           ^~~~~~~~~~~~~~~~~~
|       |                                                           StdVideoAV1Profile
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpStdVideoVP9Profile(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:370:52: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|   370 |     p.PrintKeyString(name, StdVideoVP9ProfileString(value));
|       |                            ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:372:36: error: 'StdVideoVP9Level' was not declared in this scope; did you mean 'StdVideoAV1Level'?
|   372 | std::string StdVideoVP9LevelString(StdVideoVP9Level value) {
|       |                                    ^~~~~~~~~~~~~~~~
|       |                                    StdVideoAV1Level
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:372:60: error: expected ',' or ';' before '{' token
|   372 | std::string StdVideoVP9LevelString(StdVideoVP9Level value) {
|       |                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:392:57: error: 'StdVideoVP9Level' has not been declared; did you mean 'StdVideoAV1Level'?
|   392 | void DumpStdVideoVP9Level(Printer &p, std::string name, StdVideoVP9Level value) {
|       |                                                         ^~~~~~~~~~~~~~~~
|       |                                                         StdVideoAV1Level
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpStdVideoVP9Level(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:393:50: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|   393 |     p.PrintKeyString(name, StdVideoVP9LevelString(value));
|       |                            ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:395:40: error: 'StdVideoVP9FrameType' was not declared in this scope; did you mean 'StdVideoAV1FrameType'?
|   395 | std::string StdVideoVP9FrameTypeString(StdVideoVP9FrameType value) {
|       |                                        ^~~~~~~~~~~~~~~~~~~~
|       |                                        StdVideoAV1FrameType
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:395:68: error: expected ',' or ';' before '{' token
|   395 | std::string StdVideoVP9FrameTypeString(StdVideoVP9FrameType value) {
|       |                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:403:61: error: 'StdVideoVP9FrameType' has not been declared; did you mean 'StdVideoAV1FrameType'?
|   403 | void DumpStdVideoVP9FrameType(Printer &p, std::string name, StdVideoVP9FrameType value) {
|       |                                                             ^~~~~~~~~~~~~~~~~~~~
|       |                                                             StdVideoAV1FrameType
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpStdVideoVP9FrameType(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:404:54: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|   404 |     p.PrintKeyString(name, StdVideoVP9FrameTypeString(value));
|       |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:406:44: error: 'StdVideoVP9ReferenceName' was not declared in this scope; did you mean 'StdVideoAV1ReferenceName'?
|   406 | std::string StdVideoVP9ReferenceNameString(StdVideoVP9ReferenceName value) {
|       |                                            ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                                            StdVideoAV1ReferenceName
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:406:76: error: expected ',' or ';' before '{' token
|   406 | std::string StdVideoVP9ReferenceNameString(StdVideoVP9ReferenceName value) {
|       |                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:416:65: error: 'StdVideoVP9ReferenceName' has not been declared; did you mean 'StdVideoAV1ReferenceName'?
|   416 | void DumpStdVideoVP9ReferenceName(Printer &p, std::string name, StdVideoVP9ReferenceName value) {
|       |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                 StdVideoAV1ReferenceName
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpStdVideoVP9ReferenceName(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:417:58: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|   417 |     p.PrintKeyString(name, StdVideoVP9ReferenceNameString(value));
|       |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:419:50: error: 'StdVideoVP9InterpolationFilter' was not declared in this scope; did you mean 'StdVideoAV1InterpolationFilter'?
|   419 | std::string StdVideoVP9InterpolationFilterString(StdVideoVP9InterpolationFilter value) {
|       |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                  StdVideoAV1InterpolationFilter
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:419:88: error: expected ',' or ';' before '{' token
|   419 | std::string StdVideoVP9InterpolationFilterString(StdVideoVP9InterpolationFilter value) {
|       |                                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:430:71: error: 'StdVideoVP9InterpolationFilter' has not been declared; did you mean 'StdVideoAV1InterpolationFilter'?
|   430 | void DumpStdVideoVP9InterpolationFilter(Printer &p, std::string name, StdVideoVP9InterpolationFilter value) {
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                       StdVideoAV1InterpolationFilter
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpStdVideoVP9InterpolationFilter(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:431:64: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|   431 |     p.PrintKeyString(name, StdVideoVP9InterpolationFilterString(value));
|       |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:433:41: error: 'StdVideoVP9ColorSpace' was not declared in this scope; did you mean 'StdVideoVP9ColorSpaceString'?
|   433 | std::string StdVideoVP9ColorSpaceString(StdVideoVP9ColorSpace value) {
|       |                                         ^~~~~~~~~~~~~~~~~~~~~
|       |                                         StdVideoVP9ColorSpaceString
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:433:70: error: expected ',' or ';' before '{' token
|   433 | std::string StdVideoVP9ColorSpaceString(StdVideoVP9ColorSpace value) {
|       |                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:447:62: error: 'StdVideoVP9ColorSpace' has not been declared
|   447 | void DumpStdVideoVP9ColorSpace(Printer &p, std::string name, StdVideoVP9ColorSpace value) {
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpStdVideoVP9ColorSpace(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:448:55: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|   448 |     p.PrintKeyString(name, StdVideoVP9ColorSpaceString(value));
|       |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:695:52: error: 'VkDefaultVertexAttributeValueKHR' was not declared in this scope; did you mean 'VkDefaultVertexAttributeValueKHRString'?
|   695 | std::string VkDefaultVertexAttributeValueKHRString(VkDefaultVertexAttributeValueKHR value) {
|       |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                    VkDefaultVertexAttributeValueKHRString
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:695:92: error: expected ',' or ';' before '{' token
|   695 | std::string VkDefaultVertexAttributeValueKHRString(VkDefaultVertexAttributeValueKHR value) {
|       |                                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:702:73: error: 'VkDefaultVertexAttributeValueKHR' has not been declared
|   702 | void DumpVkDefaultVertexAttributeValueKHR(Printer &p, std::string name, VkDefaultVertexAttributeValueKHR value) {
|       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkDefaultVertexAttributeValueKHR(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:704:91: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|   704 |         p.PrintKeyString(name, std::string("VK_") + VkDefaultVertexAttributeValueKHRString(value));
|       |                                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:706:70: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|   706 |         p.PrintKeyString(name, VkDefaultVertexAttributeValueKHRString(value));
|       |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkFormatString(VkFormat)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:997:15: error: 'VK_FORMAT_R8_BOOL_ARM' was not declared in this scope; did you mean 'VK_FORMAT_R8_UNORM'?
|   997 |         case (VK_FORMAT_R8_BOOL_ARM): return "FORMAT_R8_BOOL_ARM";
|       |               ^~~~~~~~~~~~~~~~~~~~~
|       |               VK_FORMAT_R8_UNORM
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:999:15: error: 'VK_FORMAT_R10X6_UINT_PACK16_ARM' was not declared in this scope; did you mean 'VK_FORMAT_R10X6_UNORM_PACK16_KHR'?
|   999 |         case (VK_FORMAT_R10X6_UINT_PACK16_ARM): return "FORMAT_R10X6_UINT_PACK16_ARM";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_FORMAT_R10X6_UNORM_PACK16_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1000:15: error: 'VK_FORMAT_R10X6G10X6_UINT_2PACK16_ARM' was not declared in this scope; did you mean 'VK_FORMAT_R10X6G10X6_UNORM_2PACK16_KHR'?
|  1000 |         case (VK_FORMAT_R10X6G10X6_UINT_2PACK16_ARM): return "FORMAT_R10X6G10X6_UINT_2PACK16_ARM";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_FORMAT_R10X6G10X6_UNORM_2PACK16_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1001:15: error: 'VK_FORMAT_R10X6G10X6B10X6A10X6_UINT_4PACK16_ARM' was not declared in this scope; did you mean 'VK_FORMAT_R10X6G10X6B10X6A10X6_UNORM_4PACK16_KHR'?
|  1001 |         case (VK_FORMAT_R10X6G10X6B10X6A10X6_UINT_4PACK16_ARM): return "FORMAT_R10X6G10X6B10X6A10X6_UINT_4PACK16_ARM";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_FORMAT_R10X6G10X6B10X6A10X6_UNORM_4PACK16_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1002:15: error: 'VK_FORMAT_R12X4_UINT_PACK16_ARM' was not declared in this scope; did you mean 'VK_FORMAT_R12X4_UNORM_PACK16_KHR'?
|  1002 |         case (VK_FORMAT_R12X4_UINT_PACK16_ARM): return "FORMAT_R12X4_UINT_PACK16_ARM";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_FORMAT_R12X4_UNORM_PACK16_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1003:15: error: 'VK_FORMAT_R12X4G12X4_UINT_2PACK16_ARM' was not declared in this scope; did you mean 'VK_FORMAT_R12X4G12X4_UNORM_2PACK16_KHR'?
|  1003 |         case (VK_FORMAT_R12X4G12X4_UINT_2PACK16_ARM): return "FORMAT_R12X4G12X4_UINT_2PACK16_ARM";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_FORMAT_R12X4G12X4_UNORM_2PACK16_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1004:15: error: 'VK_FORMAT_R12X4G12X4B12X4A12X4_UINT_4PACK16_ARM' was not declared in this scope; did you mean 'VK_FORMAT_R12X4G12X4B12X4A12X4_UNORM_4PACK16_KHR'?
|  1004 |         case (VK_FORMAT_R12X4G12X4B12X4A12X4_UINT_4PACK16_ARM): return "FORMAT_R12X4G12X4B12X4A12X4_UINT_4PACK16_ARM";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_FORMAT_R12X4G12X4B12X4A12X4_UNORM_4PACK16_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1005:15: error: 'VK_FORMAT_R14X2_UINT_PACK16_ARM' was not declared in this scope; did you mean 'VK_FORMAT_R12X4_UNORM_PACK16_KHR'?
|  1005 |         case (VK_FORMAT_R14X2_UINT_PACK16_ARM): return "FORMAT_R14X2_UINT_PACK16_ARM";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_FORMAT_R12X4_UNORM_PACK16_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1006:15: error: 'VK_FORMAT_R14X2G14X2_UINT_2PACK16_ARM' was not declared in this scope; did you mean 'VK_FORMAT_R12X4G12X4_UNORM_2PACK16_KHR'?
|  1006 |         case (VK_FORMAT_R14X2G14X2_UINT_2PACK16_ARM): return "FORMAT_R14X2G14X2_UINT_2PACK16_ARM";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_FORMAT_R12X4G12X4_UNORM_2PACK16_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1007:15: error: 'VK_FORMAT_R14X2G14X2B14X2A14X2_UINT_4PACK16_ARM' was not declared in this scope; did you mean 'VK_FORMAT_R12X4G12X4B12X4A12X4_UNORM_4PACK16_KHR'?
|  1007 |         case (VK_FORMAT_R14X2G14X2B14X2A14X2_UINT_4PACK16_ARM): return "FORMAT_R14X2G14X2B14X2A14X2_UINT_4PACK16_ARM";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_FORMAT_R12X4G12X4B12X4A12X4_UNORM_4PACK16_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1008:15: error: 'VK_FORMAT_R14X2_UNORM_PACK16_ARM' was not declared in this scope; did you mean 'VK_FORMAT_R12X4_UNORM_PACK16_KHR'?
|  1008 |         case (VK_FORMAT_R14X2_UNORM_PACK16_ARM): return "FORMAT_R14X2_UNORM_PACK16_ARM";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_FORMAT_R12X4_UNORM_PACK16_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1009:15: error: 'VK_FORMAT_R14X2G14X2_UNORM_2PACK16_ARM' was not declared in this scope; did you mean 'VK_FORMAT_R12X4G12X4_UNORM_2PACK16_KHR'?
|  1009 |         case (VK_FORMAT_R14X2G14X2_UNORM_2PACK16_ARM): return "FORMAT_R14X2G14X2_UNORM_2PACK16_ARM";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_FORMAT_R12X4G12X4_UNORM_2PACK16_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1010:15: error: 'VK_FORMAT_R14X2G14X2B14X2A14X2_UNORM_4PACK16_ARM' was not declared in this scope; did you mean 'VK_FORMAT_R12X4G12X4B12X4A12X4_UNORM_4PACK16_KHR'?
|  1010 |         case (VK_FORMAT_R14X2G14X2B14X2A14X2_UNORM_4PACK16_ARM): return "FORMAT_R14X2G14X2B14X2A14X2_UNORM_4PACK16_ARM";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_FORMAT_R12X4G12X4B12X4A12X4_UNORM_4PACK16_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1011:15: error: 'VK_FORMAT_G14X2_B14X2R14X2_2PLANE_420_UNORM_3PACK16_ARM' was not declared in this scope; did you mean 'VK_FORMAT_G12X4_B12X4R12X4_2PLANE_420_UNORM_3PACK16_KHR'?
|  1011 |         case (VK_FORMAT_G14X2_B14X2R14X2_2PLANE_420_UNORM_3PACK16_ARM): return "FORMAT_G14X2_B14X2R14X2_2PLANE_420_UNORM_3PACK16_ARM";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_FORMAT_G12X4_B12X4R12X4_2PLANE_420_UNORM_3PACK16_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1012:15: error: 'VK_FORMAT_G14X2_B14X2R14X2_2PLANE_422_UNORM_3PACK16_ARM' was not declared in this scope; did you mean 'VK_FORMAT_G12X4_B12X4R12X4_2PLANE_422_UNORM_3PACK16_KHR'?
|  1012 |         case (VK_FORMAT_G14X2_B14X2R14X2_2PLANE_422_UNORM_3PACK16_ARM): return "FORMAT_G14X2_B14X2R14X2_2PLANE_422_UNORM_3PACK16_ARM";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_FORMAT_G12X4_B12X4R12X4_2PLANE_422_UNORM_3PACK16_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkImageLayoutString(VkImageLayout)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1053:15: error: 'VK_IMAGE_LAYOUT_TENSOR_ALIASING_ARM' was not declared in this scope
|  1053 |         case (VK_IMAGE_LAYOUT_TENSOR_ALIASING_ARM): return "IMAGE_LAYOUT_TENSOR_ALIASING_ARM";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1055:15: error: 'VK_IMAGE_LAYOUT_ZERO_INITIALIZED_EXT' was not declared in this scope; did you mean 'VK_IMAGE_LAYOUT_PREINITIALIZED'?
|  1055 |         case (VK_IMAGE_LAYOUT_ZERO_INITIALIZED_EXT): return "IMAGE_LAYOUT_ZERO_INITIALIZED_EXT";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_IMAGE_LAYOUT_PREINITIALIZED
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkPresentModeKHRString(VkPresentModeKHR)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1176:15: error: 'VK_PRESENT_MODE_FIFO_LATEST_READY_KHR' was not declared in this scope; did you mean 'VK_PRESENT_MODE_FIFO_LATEST_READY_EXT'?
|  1176 |         case (VK_PRESENT_MODE_FIFO_LATEST_READY_KHR): return "PRESENT_MODE_FIFO_LATEST_READY_KHR";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_PRESENT_MODE_FIFO_LATEST_READY_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkFormatFeatureFlagBits2GetStrings(VkFormatFeatureFlagBits2)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1467:9: error: 'VK_FORMAT_FEATURE_2_TENSOR_SHADER_BIT_ARM' was not declared in this scope; did you mean 'VK_FORMAT_FEATURE_2_WEIGHT_IMAGE_BIT_QCOM'?
|  1467 |     if (VK_FORMAT_FEATURE_2_TENSOR_SHADER_BIT_ARM & value) strings.push_back("FORMAT_FEATURE_2_TENSOR_SHADER_BIT_ARM");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_FORMAT_FEATURE_2_WEIGHT_IMAGE_BIT_QCOM
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1468:9: error: 'VK_FORMAT_FEATURE_2_TENSOR_IMAGE_ALIASING_BIT_ARM' was not declared in this scope; did you mean 'VK_FORMAT_FEATURE_2_STORAGE_IMAGE_ATOMIC_BIT_KHR'?
|  1468 |     if (VK_FORMAT_FEATURE_2_TENSOR_IMAGE_ALIASING_BIT_ARM & value) strings.push_back("FORMAT_FEATURE_2_TENSOR_IMAGE_ALIASING_BIT_ARM");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_FORMAT_FEATURE_2_STORAGE_IMAGE_ATOMIC_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1472:9: error: 'VK_FORMAT_FEATURE_2_TENSOR_DATA_GRAPH_BIT_ARM' was not declared in this scope; did you mean 'VK_FORMAT_FEATURE_2_TRANSFER_DST_BIT_KHR'?
|  1472 |     if (VK_FORMAT_FEATURE_2_TENSOR_DATA_GRAPH_BIT_ARM & value) strings.push_back("FORMAT_FEATURE_2_TENSOR_DATA_GRAPH_BIT_ARM");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_FORMAT_FEATURE_2_TRANSFER_DST_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkImageUsageFlagBitsGetStrings(VkImageUsageFlagBits)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1578:9: error: 'VK_IMAGE_USAGE_TENSOR_ALIASING_BIT_ARM' was not declared in this scope
|  1578 |     if (VK_IMAGE_USAGE_TENSOR_ALIASING_BIT_ARM & value) strings.push_back("IMAGE_USAGE_TENSOR_ALIASING_BIT_ARM");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1579:9: error: 'VK_IMAGE_USAGE_TILE_MEMORY_BIT_QCOM' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_TILE_MEMORY_QCOM'?
|  1579 |     if (VK_IMAGE_USAGE_TILE_MEMORY_BIT_QCOM & value) strings.push_back("IMAGE_USAGE_TILE_MEMORY_BIT_QCOM");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_IMAGE_USAGE_TILE_MEMORY_QCOM
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1717:65: error: 'VkPresentGravityFlagBitsKHR' was not declared in this scope; did you mean 'VkPresentGravityFlagBitsEXT'?
|  1717 | std::vector<const char *> VkPresentGravityFlagBitsKHRGetStrings(VkPresentGravityFlagBitsKHR value) {
|       |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                 VkPresentGravityFlagBitsEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1717:100: error: expected ',' or ';' before '{' token
|  1717 | std::vector<const char *> VkPresentGravityFlagBitsKHRGetStrings(VkPresentGravityFlagBitsKHR value) {
|       |                                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1725:65: error: 'VkPresentGravityFlagsKHR' has not been declared; did you mean 'VkPresentGravityFlagsEXT'?
|  1725 | void DumpVkPresentGravityFlagsKHR(Printer &p, std::string name, VkPresentGravityFlagsKHR value) {
|       |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                 VkPresentGravityFlagsEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPresentGravityFlagsKHR(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1726:21: error: 'VkPresentGravityFlagBitsKHR' does not name a type; did you mean 'VkPresentGravityFlagBitsEXT'?
|  1726 |     if (static_cast<VkPresentGravityFlagBitsKHR>(value) == 0) {
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                     VkPresentGravityFlagBitsEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1732:70: error: 'VkPresentGravityFlagBitsKHR' does not name a type; did you mean 'VkPresentGravityFlagBitsEXT'?
|  1732 |     auto strings = VkPresentGravityFlagBitsKHRGetStrings(static_cast<VkPresentGravityFlagBitsKHR>(value));
|       |                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                      VkPresentGravityFlagBitsEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1741:68: error: 'VkPresentGravityFlagBitsKHR' has not been declared; did you mean 'VkPresentGravityFlagBitsEXT'?
|  1741 | void DumpVkPresentGravityFlagBitsKHR(Printer &p, std::string name, VkPresentGravityFlagBitsKHR value) {
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                    VkPresentGravityFlagBitsEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPresentGravityFlagBitsKHR(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1742:57: error: no match for call to '(std::vector<const char*>) (int&)'
|  1742 |     auto strings = VkPresentGravityFlagBitsKHRGetStrings(value);
|       |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1751:65: error: 'VkPresentScalingFlagBitsKHR' was not declared in this scope; did you mean 'VkPresentScalingFlagBitsEXT'?
|  1751 | std::vector<const char *> VkPresentScalingFlagBitsKHRGetStrings(VkPresentScalingFlagBitsKHR value) {
|       |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                 VkPresentScalingFlagBitsEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1751:100: error: expected ',' or ';' before '{' token
|  1751 | std::vector<const char *> VkPresentScalingFlagBitsKHRGetStrings(VkPresentScalingFlagBitsKHR value) {
|       |                                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1759:65: error: 'VkPresentScalingFlagsKHR' has not been declared; did you mean 'VkPresentScalingFlagsEXT'?
|  1759 | void DumpVkPresentScalingFlagsKHR(Printer &p, std::string name, VkPresentScalingFlagsKHR value) {
|       |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                 VkPresentScalingFlagsEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPresentScalingFlagsKHR(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1760:21: error: 'VkPresentScalingFlagBitsKHR' does not name a type; did you mean 'VkPresentScalingFlagBitsEXT'?
|  1760 |     if (static_cast<VkPresentScalingFlagBitsKHR>(value) == 0) {
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                     VkPresentScalingFlagBitsEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1766:70: error: 'VkPresentScalingFlagBitsKHR' does not name a type; did you mean 'VkPresentScalingFlagBitsEXT'?
|  1766 |     auto strings = VkPresentScalingFlagBitsKHRGetStrings(static_cast<VkPresentScalingFlagBitsKHR>(value));
|       |                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                      VkPresentScalingFlagBitsEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1775:68: error: 'VkPresentScalingFlagBitsKHR' has not been declared; did you mean 'VkPresentScalingFlagBitsEXT'?
|  1775 | void DumpVkPresentScalingFlagBitsKHR(Printer &p, std::string name, VkPresentScalingFlagBitsKHR value) {
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                    VkPresentScalingFlagBitsEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPresentScalingFlagBitsKHR(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1776:57: error: no match for call to '(std::vector<const char*>) (int&)'
|  1776 |     auto strings = VkPresentScalingFlagBitsKHRGetStrings(value);
|       |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkQueueFlagBitsGetStrings(VkQueueFlagBits)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1796:9: error: 'VK_QUEUE_DATA_GRAPH_BIT_ARM' was not declared in this scope
|  1796 |     if (VK_QUEUE_DATA_GRAPH_BIT_ARM & value) strings.push_back("QUEUE_DATA_GRAPH_BIT_ARM");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkQueueFlagsString(VkQueueFlags)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1860:9: error: 'VK_QUEUE_DATA_GRAPH_BIT_ARM' was not declared in this scope
|  1860 |     if (VK_QUEUE_DATA_GRAPH_BIT_ARM & value) {
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkResolveModeFlagBitsGetStrings(VkResolveModeFlagBits)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:1873:9: error: 'VK_RESOLVE_MODE_EXTERNAL_FORMAT_DOWNSAMPLE_BIT_ANDROID' was not declared in this scope; did you mean 'VK_RESOLVE_MODE_EXTERNAL_FORMAT_DOWNSAMPLE_ANDROID'?
|  1873 |     if (VK_RESOLVE_MODE_EXTERNAL_FORMAT_DOWNSAMPLE_BIT_ANDROID & value) strings.push_back("RESOLVE_MODE_EXTERNAL_FORMAT_DOWNSAMPLE_BIT_ANDROID");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_RESOLVE_MODE_EXTERNAL_FORMAT_DOWNSAMPLE_ANDROID
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkVideoCodecOperationFlagBitsKHRGetStrings(VkVideoCodecOperationFlagBitsKHR)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:2216:9: error: 'VK_VIDEO_CODEC_OPERATION_DECODE_VP9_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR'?
|  2216 |     if (VK_VIDEO_CODEC_OPERATION_DECODE_VP9_BIT_KHR & value) strings.push_back("VIDEO_CODEC_OPERATION_DECODE_VP9_BIT_KHR");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkVideoEncodeAV1CapabilityFlagBitsKHRGetStrings(VkVideoEncodeAV1CapabilityFlagBitsKHR)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:2387:9: error: 'VK_VIDEO_ENCODE_AV1_CAPABILITY_COMPOUND_PREDICTION_INTRA_REFRESH_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_AV1_CAPABILITY_MOTION_VECTOR_SCALING_BIT_KHR'?
|  2387 |     if (VK_VIDEO_ENCODE_AV1_CAPABILITY_COMPOUND_PREDICTION_INTRA_REFRESH_BIT_KHR & value) strings.push_back("VIDEO_ENCODE_AV1_CAPABILITY_COMPOUND_PREDICTION_INTRA_REFRESH_BIT_KHR");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_VIDEO_ENCODE_AV1_CAPABILITY_MOTION_VECTOR_SCALING_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkVideoEncodeH264CapabilityFlagBitsKHRGetStrings(VkVideoEncodeH264CapabilityFlagBitsKHR)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:2599:9: error: 'VK_VIDEO_ENCODE_H264_CAPABILITY_B_PICTURE_INTRA_REFRESH_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_H264_CAPABILITY_B_FRAME_IN_L1_LIST_BIT_KHR'?
|  2599 |     if (VK_VIDEO_ENCODE_H264_CAPABILITY_B_PICTURE_INTRA_REFRESH_BIT_KHR & value) strings.push_back("VIDEO_ENCODE_H264_CAPABILITY_B_PICTURE_INTRA_REFRESH_BIT_KHR");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_VIDEO_ENCODE_H264_CAPABILITY_B_FRAME_IN_L1_LIST_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkVideoEncodeH265CapabilityFlagBitsKHRGetStrings(VkVideoEncodeH265CapabilityFlagBitsKHR)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:2693:9: error: 'VK_VIDEO_ENCODE_H265_CAPABILITY_B_PICTURE_INTRA_REFRESH_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_H265_CAPABILITY_B_FRAME_IN_L1_LIST_BIT_KHR'?
|  2693 |     if (VK_VIDEO_ENCODE_H265_CAPABILITY_B_PICTURE_INTRA_REFRESH_BIT_KHR & value) strings.push_back("VIDEO_ENCODE_H265_CAPABILITY_B_PICTURE_INTRA_REFRESH_BIT_KHR");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_VIDEO_ENCODE_H265_CAPABILITY_B_FRAME_IN_L1_LIST_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:2844:78: error: 'VkVideoEncodeIntraRefreshModeFlagBitsKHR' was not declared in this scope; did you mean 'VkVideoEncodeRateControlModeFlagBitsKHR'?
|  2844 | std::vector<const char *> VkVideoEncodeIntraRefreshModeFlagBitsKHRGetStrings(VkVideoEncodeIntraRefreshModeFlagBitsKHR value) {
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                              VkVideoEncodeRateControlModeFlagBitsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:2844:126: error: expected ',' or ';' before '{' token
|  2844 | std::vector<const char *> VkVideoEncodeIntraRefreshModeFlagBitsKHRGetStrings(VkVideoEncodeIntraRefreshModeFlagBitsKHR value) {
|       |                                                                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:2853:78: error: 'VkVideoEncodeIntraRefreshModeFlagsKHR' has not been declared; did you mean 'VkVideoEncodeRateControlModeFlagsKHR'?
|  2853 | void DumpVkVideoEncodeIntraRefreshModeFlagsKHR(Printer &p, std::string name, VkVideoEncodeIntraRefreshModeFlagsKHR value) {
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                              VkVideoEncodeRateControlModeFlagsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkVideoEncodeIntraRefreshModeFlagsKHR(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:2854:21: error: 'VkVideoEncodeIntraRefreshModeFlagBitsKHR' does not name a type; did you mean 'VkVideoEncodeRateControlModeFlagBitsKHR'?
|  2854 |     if (static_cast<VkVideoEncodeIntraRefreshModeFlagBitsKHR>(value) == 0) {
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                     VkVideoEncodeRateControlModeFlagBitsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:2860:83: error: 'VkVideoEncodeIntraRefreshModeFlagBitsKHR' does not name a type; did you mean 'VkVideoEncodeRateControlModeFlagBitsKHR'?
|  2860 |     auto strings = VkVideoEncodeIntraRefreshModeFlagBitsKHRGetStrings(static_cast<VkVideoEncodeIntraRefreshModeFlagBitsKHR>(value));
|       |                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                   VkVideoEncodeRateControlModeFlagBitsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:2869:81: error: 'VkVideoEncodeIntraRefreshModeFlagBitsKHR' has not been declared; did you mean 'VkVideoEncodeRateControlModeFlagBitsKHR'?
|  2869 | void DumpVkVideoEncodeIntraRefreshModeFlagBitsKHR(Printer &p, std::string name, VkVideoEncodeIntraRefreshModeFlagBitsKHR value) {
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                 VkVideoEncodeRateControlModeFlagBitsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkVideoEncodeIntraRefreshModeFlagBitsKHR(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:2870:70: error: no match for call to '(std::vector<const char*>) (int&)'
|  2870 |     auto strings = VkVideoEncodeIntraRefreshModeFlagBitsKHRGetStrings(value);
|       |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:3971:86: error: 'VkPhysicalDeviceMaintenance9FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance8FeaturesKHR'?
|  3971 | void DumpVkPhysicalDeviceMaintenance9FeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceMaintenance9FeaturesKHR &obj) {
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                      VkPhysicalDeviceMaintenance8FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceMaintenance9FeaturesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:3974:58: error: request for member 'maintenance9' in 'obj', which is of non-class type 'const int'
|  3974 |     p.PrintKeyBool("maintenance9", static_cast<bool>(obj.maintenance9));
|       |                                                          ^~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:3976:88: error: 'VkPhysicalDeviceMaintenance9PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance7PropertiesKHR'?
|  3976 | void DumpVkPhysicalDeviceMaintenance9PropertiesKHR(Printer &p, std::string name, const VkPhysicalDeviceMaintenance9PropertiesKHR &obj) {
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                        VkPhysicalDeviceMaintenance7PropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceMaintenance9PropertiesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:3979:67: error: request for member 'image2DViewOf3DSparse' in 'obj', which is of non-class type 'const int'
|  3979 |     p.PrintKeyBool("image2DViewOf3DSparse", static_cast<bool>(obj.image2DViewOf3DSparse));
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:3980:80: error: request for member 'defaultVertexAttributeValue' in 'obj', which is of non-class type 'const int'
|  3980 |     DumpVkDefaultVertexAttributeValueKHR(p, "defaultVertexAttributeValue", obj.defaultVertexAttributeValue);
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:4234:84: error: 'VkPhysicalDevicePresentId2FeaturesKHR' does not name a type; did you mean 'VkPhysicalDevicePresentIdFeaturesKHR'?
|  4234 | void DumpVkPhysicalDevicePresentId2FeaturesKHR(Printer &p, std::string name, const VkPhysicalDevicePresentId2FeaturesKHR &obj) {
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                    VkPhysicalDevicePresentIdFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePresentId2FeaturesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:4237:56: error: request for member 'presentId2' in 'obj', which is of non-class type 'const int'
|  4237 |     p.PrintKeyBool("presentId2", static_cast<bool>(obj.presentId2));
|       |                                                        ^~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:4244:100: error: 'VkPhysicalDevicePresentModeFifoLatestReadyFeaturesKHR' does not name a type; did you mean 'VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT'?
|  4244 | void DumpVkPhysicalDevicePresentModeFifoLatestReadyFeaturesKHR(Printer &p, std::string name, const VkPhysicalDevicePresentModeFifoLatestReadyFeaturesKHR &obj) {
|       |                                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                    VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePresentModeFifoLatestReadyFeaturesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:4247:72: error: request for member 'presentModeFifoLatestReady' in 'obj', which is of non-class type 'const int'
|  4247 |     p.PrintKeyBool("presentModeFifoLatestReady", static_cast<bool>(obj.presentModeFifoLatestReady));
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:4249:86: error: 'VkPhysicalDevicePresentWait2FeaturesKHR' does not name a type; did you mean 'VkPhysicalDevicePresentWaitFeaturesKHR'?
|  4249 | void DumpVkPhysicalDevicePresentWait2FeaturesKHR(Printer &p, std::string name, const VkPhysicalDevicePresentWait2FeaturesKHR &obj) {
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                      VkPhysicalDevicePresentWaitFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePresentWait2FeaturesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:4252:58: error: request for member 'presentWait2' in 'obj', which is of non-class type 'const int'
|  4252 |     p.PrintKeyBool("presentWait2", static_cast<bool>(obj.presentWait2));
|       |                                                          ^~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:4353:85: error: 'VkPhysicalDeviceRobustness2FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceRobustness2FeaturesEXT'?
|  4353 | void DumpVkPhysicalDeviceRobustness2FeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceRobustness2FeaturesKHR &obj) {
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                     VkPhysicalDeviceRobustness2FeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRobustness2FeaturesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:4356:65: error: request for member 'robustBufferAccess2' in 'obj', which is of non-class type 'const int'
|  4356 |     p.PrintKeyBool("robustBufferAccess2", static_cast<bool>(obj.robustBufferAccess2));
|       |                                                                 ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:4357:64: error: request for member 'robustImageAccess2' in 'obj', which is of non-class type 'const int'
|  4357 |     p.PrintKeyBool("robustImageAccess2", static_cast<bool>(obj.robustImageAccess2));
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:4358:60: error: request for member 'nullDescriptor' in 'obj', which is of non-class type 'const int'
|  4358 |     p.PrintKeyBool("nullDescriptor", static_cast<bool>(obj.nullDescriptor));
|       |                                                            ^~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:4360:87: error: 'VkPhysicalDeviceRobustness2PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceRobustness2PropertiesEXT'?
|  4360 | void DumpVkPhysicalDeviceRobustness2PropertiesKHR(Printer &p, std::string name, const VkPhysicalDeviceRobustness2PropertiesKHR &obj) {
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                       VkPhysicalDeviceRobustness2PropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRobustness2PropertiesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:4363:81: error: request for member 'robustStorageBufferAccessSizeAlignment' in 'obj', which is of non-class type 'const int'
|  4363 |     p.PrintKeyValue("robustStorageBufferAccessSizeAlignment", to_hex_str(p, obj.robustStorageBufferAccessSizeAlignment));
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:4364:81: error: request for member 'robustUniformBufferAccessSizeAlignment' in 'obj', which is of non-class type 'const int'
|  4364 |     p.PrintKeyValue("robustUniformBufferAccessSizeAlignment", to_hex_str(p, obj.robustUniformBufferAccessSizeAlignment));
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:4471:86: error: 'VkPhysicalDeviceShaderFloat8FeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceShaderObjectFeaturesEXT'?
|  4471 | void DumpVkPhysicalDeviceShaderFloat8FeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceShaderFloat8FeaturesEXT &obj) {
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                      VkPhysicalDeviceShaderObjectFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderFloat8FeaturesEXT(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:4474:58: error: request for member 'shaderFloat8' in 'obj', which is of non-class type 'const int'
|  4474 |     p.PrintKeyBool("shaderFloat8", static_cast<bool>(obj.shaderFloat8));
|       |                                                          ^~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:4475:75: error: request for member 'shaderFloat8CooperativeMatrix' in 'obj', which is of non-class type 'const int'
|  4475 |     p.PrintKeyBool("shaderFloat8CooperativeMatrix", static_cast<bool>(obj.shaderFloat8CooperativeMatrix));
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:4643:95: error: 'VkPhysicalDeviceSwapchainMaintenance1FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceSwapchainMaintenance1FeaturesEXT'?
|  4643 | void DumpVkPhysicalDeviceSwapchainMaintenance1FeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceSwapchainMaintenance1FeaturesKHR &obj) {
|       |                                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                               VkPhysicalDeviceSwapchainMaintenance1FeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceSwapchainMaintenance1FeaturesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:4646:67: error: request for member 'swapchainMaintenance1' in 'obj', which is of non-class type 'const int'
|  4646 |     p.PrintKeyBool("swapchainMaintenance1", static_cast<bool>(obj.swapchainMaintenance1));
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:4710:93: error: 'VkPhysicalDeviceUnifiedImageLayoutsFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceTimelineSemaphoreFeaturesKHR'?
|  4710 | void DumpVkPhysicalDeviceUnifiedImageLayoutsFeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceUnifiedImageLayoutsFeaturesKHR &obj) {
|       |                                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                             VkPhysicalDeviceTimelineSemaphoreFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceUnifiedImageLayoutsFeaturesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:4713:65: error: request for member 'unifiedImageLayouts' in 'obj', which is of non-class type 'const int'
|  4713 |     p.PrintKeyBool("unifiedImageLayouts", static_cast<bool>(obj.unifiedImageLayouts));
|       |                                                                 ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:4714:70: error: request for member 'unifiedImageLayoutsVideo' in 'obj', which is of non-class type 'const int'
|  4714 |     p.PrintKeyBool("unifiedImageLayoutsVideo", static_cast<bool>(obj.unifiedImageLayoutsVideo));
|       |                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:4754:88: error: 'VkPhysicalDeviceVideoDecodeVP9FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceVideoEncodeAV1FeaturesKHR'?
|  4754 | void DumpVkPhysicalDeviceVideoDecodeVP9FeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceVideoDecodeVP9FeaturesKHR &obj) {
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                        VkPhysicalDeviceVideoEncodeAV1FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceVideoDecodeVP9FeaturesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:4757:60: error: request for member 'videoDecodeVP9' in 'obj', which is of non-class type 'const int'
|  4757 |     p.PrintKeyBool("videoDecodeVP9", static_cast<bool>(obj.videoDecodeVP9));
|       |                                                            ^~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:4764:97: error: 'VkPhysicalDeviceVideoEncodeIntraRefreshFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceVideoEncodeAV1FeaturesKHR'?
|  4764 | void DumpVkPhysicalDeviceVideoEncodeIntraRefreshFeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceVideoEncodeIntraRefreshFeaturesKHR &obj) {
|       |                                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                 VkPhysicalDeviceVideoEncodeAV1FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceVideoEncodeIntraRefreshFeaturesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:4767:69: error: request for member 'videoEncodeIntraRefresh' in 'obj', which is of non-class type 'const int'
|  4767 |     p.PrintKeyBool("videoEncodeIntraRefresh", static_cast<bool>(obj.videoEncodeIntraRefresh));
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5089:100: error: 'VkPhysicalDeviceZeroInitializeDeviceMemoryFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR'?
|  5089 | void DumpVkPhysicalDeviceZeroInitializeDeviceMemoryFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceZeroInitializeDeviceMemoryFeaturesEXT &obj) {
|       |                                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                    VkPhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceZeroInitializeDeviceMemoryFeaturesEXT(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5092:72: error: request for member 'zeroInitializeDeviceMemory' in 'obj', which is of non-class type 'const int'
|  5092 |     p.PrintKeyBool("zeroInitializeDeviceMemory", static_cast<bool>(obj.zeroInitializeDeviceMemory));
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5111:90: error: 'VkQueueFamilyOwnershipTransferPropertiesKHR' does not name a type; did you mean 'VkQueueFamilyVideoPropertiesKHR'?
|  5111 | void DumpVkQueueFamilyOwnershipTransferPropertiesKHR(Printer &p, std::string name, const VkQueueFamilyOwnershipTransferPropertiesKHR &obj) {
|       |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                          VkQueueFamilyVideoPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkQueueFamilyOwnershipTransferPropertiesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5114:64: error: request for member 'optimalImageTransferToQueueFamilies' in 'obj', which is of non-class type 'const int'
|  5114 |     p.PrintKeyValue("optimalImageTransferToQueueFamilies", obj.optimalImageTransferToQueueFamilies);
|       |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5155:81: error: 'VkSurfaceCapabilitiesPresentId2KHR' does not name a type; did you mean 'VkSurfaceCapabilitiesPresentBarrierNV'?
|  5155 | void DumpVkSurfaceCapabilitiesPresentId2KHR(Printer &p, std::string name, const VkSurfaceCapabilitiesPresentId2KHR &obj) {
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                 VkSurfaceCapabilitiesPresentBarrierNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkSurfaceCapabilitiesPresentId2KHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5158:65: error: request for member 'presentId2Supported' in 'obj', which is of non-class type 'const int'
|  5158 |     p.PrintKeyBool("presentId2Supported", static_cast<bool>(obj.presentId2Supported));
|       |                                                                 ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5160:83: error: 'VkSurfaceCapabilitiesPresentWait2KHR' does not name a type; did you mean 'VkSurfaceCapabilitiesPresentBarrierNV'?
|  5160 | void DumpVkSurfaceCapabilitiesPresentWait2KHR(Printer &p, std::string name, const VkSurfaceCapabilitiesPresentWait2KHR &obj) {
|       |                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                   VkSurfaceCapabilitiesPresentBarrierNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkSurfaceCapabilitiesPresentWait2KHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5163:67: error: request for member 'presentWait2Supported' in 'obj', which is of non-class type 'const int'
|  5163 |     p.PrintKeyBool("presentWait2Supported", static_cast<bool>(obj.presentWait2Supported));
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5170:83: error: 'VkSurfacePresentModeCompatibilityKHR' does not name a type; did you mean 'VkSurfacePresentModeCompatibilityEXT'?
|  5170 | void DumpVkSurfacePresentModeCompatibilityKHR(Printer &p, std::string name, const VkSurfacePresentModeCompatibilityKHR &obj) {
|       |                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                   VkSurfacePresentModeCompatibilityEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkSurfacePresentModeCompatibilityKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5173:45: error: request for member 'presentModeCount' in 'obj', which is of non-class type 'const int'
|  5173 |     p.PrintKeyValue("presentModeCount", obj.presentModeCount);
|       |                                             ^~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5174:13: error: request for member 'presentModeCount' in 'obj', which is of non-class type 'const int'
|  5174 |     if (obj.presentModeCount == 0 || obj.pPresentModes == nullptr) {
|       |             ^~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5174:42: error: request for member 'pPresentModes' in 'obj', which is of non-class type 'const int'
|  5174 |     if (obj.presentModeCount == 0 || obj.pPresentModes == nullptr) {
|       |                                          ^~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5177:49: error: request for member 'presentModeCount' in 'obj', which is of non-class type 'const int'
|  5177 |         ArrayWrapper arr(p,"pPresentModes", obj.presentModeCount);
|       |                                                 ^~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5178:38: error: request for member 'presentModeCount' in 'obj', which is of non-class type 'const int'
|  5178 |         for (uint32_t i = 0; i < obj.presentModeCount; i++) {
|       |                                      ^~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5179:60: error: request for member 'pPresentModes' in 'obj', which is of non-class type 'const int'
|  5179 |             DumpVkPresentModeKHR(p, std::to_string(i), obj.pPresentModes[i]);
|       |                                                            ^~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5183:85: error: 'VkSurfacePresentScalingCapabilitiesKHR' does not name a type; did you mean 'VkSurfacePresentScalingCapabilitiesEXT'?
|  5183 | void DumpVkSurfacePresentScalingCapabilitiesKHR(Printer &p, std::string name, const VkSurfacePresentScalingCapabilitiesKHR &obj) {
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                     VkSurfacePresentScalingCapabilitiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkSurfacePresentScalingCapabilitiesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5185:68: error: request for member 'supportedPresentScaling' in 'obj', which is of non-class type 'const int'
|  5185 |     DumpVkPresentScalingFlagsKHR(p, "supportedPresentScaling", obj.supportedPresentScaling);
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5186:69: error: request for member 'supportedPresentGravityX' in 'obj', which is of non-class type 'const int'
|  5186 |     DumpVkPresentGravityFlagsKHR(p, "supportedPresentGravityX", obj.supportedPresentGravityX);
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5187:69: error: request for member 'supportedPresentGravityY' in 'obj', which is of non-class type 'const int'
|  5187 |     DumpVkPresentGravityFlagsKHR(p, "supportedPresentGravityY", obj.supportedPresentGravityY);
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5188:51: error: request for member 'minScaledImageExtent' in 'obj', which is of non-class type 'const int'
|  5188 |     DumpVkExtent2D(p, "minScaledImageExtent", obj.minScaledImageExtent);
|       |                                                   ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5189:51: error: request for member 'maxScaledImageExtent' in 'obj', which is of non-class type 'const int'
|  5189 |     DumpVkExtent2D(p, "maxScaledImageExtent", obj.maxScaledImageExtent);
|       |                                                   ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5245:78: error: 'VkVideoDecodeVP9CapabilitiesKHR' does not name a type; did you mean 'VkVideoDecodeCapabilitiesKHR'?
|  5245 | void DumpVkVideoDecodeVP9CapabilitiesKHR(Printer &p, std::string name, const VkVideoDecodeVP9CapabilitiesKHR &obj) {
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                              VkVideoDecodeCapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkVideoDecodeVP9CapabilitiesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5247:45: error: request for member 'maxLevel' in 'obj', which is of non-class type 'const int'
|  5247 |     DumpStdVideoVP9Level(p, "maxLevel", obj.maxLevel);
|       |                                             ^~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5249:77: error: 'VkVideoDecodeVP9ProfileInfoKHR' does not name a type; did you mean 'VkVideoDecodeAV1ProfileInfoKHR'?
|  5249 | void DumpVkVideoDecodeVP9ProfileInfoKHR(Printer &p, std::string name, const VkVideoDecodeVP9ProfileInfoKHR &obj) {
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                             VkVideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkVideoDecodeVP9ProfileInfoKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5251:49: error: request for member 'stdProfile' in 'obj', which is of non-class type 'const int'
|  5251 |     DumpStdVideoVP9Profile(p, "stdProfile", obj.stdProfile);
|       |                                                 ^~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5359:87: error: 'VkVideoEncodeIntraRefreshCapabilitiesKHR' does not name a type; did you mean 'VkVideoEncodeAV1CapabilitiesKHR'?
|  5359 | void DumpVkVideoEncodeIntraRefreshCapabilitiesKHR(Printer &p, std::string name, const VkVideoEncodeIntraRefreshCapabilitiesKHR &obj) {
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                       VkVideoEncodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkVideoEncodeIntraRefreshCapabilitiesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5362:75: error: request for member 'intraRefreshModes' in 'obj', which is of non-class type 'const int'
|  5362 |     DumpVkVideoEncodeIntraRefreshModeFlagsKHR(p, "intraRefreshModes", obj.intraRefreshModes);
|       |                                                                           ^~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5363:57: error: request for member 'maxIntraRefreshCycleDuration' in 'obj', which is of non-class type 'const int'
|  5363 |     p.PrintKeyValue("maxIntraRefreshCycleDuration", obj.maxIntraRefreshCycleDuration);
|       |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5364:67: error: request for member 'maxIntraRefreshActiveReferencePictures' in 'obj', which is of non-class type 'const int'
|  5364 |     p.PrintKeyValue("maxIntraRefreshActiveReferencePictures", obj.maxIntraRefreshActiveReferencePictures);
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5365:85: error: request for member 'partitionIndependentIntraRefreshRegions' in 'obj', which is of non-class type 'const int'
|  5365 |     p.PrintKeyBool("partitionIndependentIntraRefreshRegions", static_cast<bool>(obj.partitionIndependentIntraRefreshRegions));
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5366:79: error: request for member 'nonRectangularIntraRefreshRegions' in 'obj', which is of non-class type 'const int'
|  5366 |     p.PrintKeyBool("nonRectangularIntraRefreshRegions", static_cast<bool>(obj.nonRectangularIntraRefreshRegions));
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5450:5: error: 'VkPhysicalDeviceMaintenance9PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance7PropertiesKHR'?
|  5450 |     VkPhysicalDeviceMaintenance9PropertiesKHR PhysicalDeviceMaintenance9PropertiesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance7PropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5469:5: error: 'VkPhysicalDeviceRobustness2PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceRobustness2PropertiesEXT'?
|  5469 |     VkPhysicalDeviceRobustness2PropertiesKHR PhysicalDeviceRobustness2PropertiesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceRobustness2PropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_props2_chain::initialize_chain(AppInstance&, AppGpu&, bool)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5524:9: error: 'PhysicalDeviceMaintenance9PropertiesKHR' was not declared in this scope; did you mean 'PhysicalDeviceMaintenance7PropertiesKHR'?
|  5524 |         PhysicalDeviceMaintenance9PropertiesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_9_PROPERTIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceMaintenance7PropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5524:57: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_9_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR'?
|  5524 |         PhysicalDeviceMaintenance9PropertiesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_9_PROPERTIES_KHR;
|       |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                         VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5543:9: error: 'PhysicalDeviceRobustness2PropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceRobustness2PropertiesEXT'?
|  5543 |         PhysicalDeviceRobustness2PropertiesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceRobustness2PropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5543:56: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT'?
|  5543 |         PhysicalDeviceRobustness2PropertiesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_KHR;
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                        VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5646:54: error: 'VK_KHR_MAINTENANCE_9_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_MAINTENANCE_3_EXTENSION_NAME'?
|  5646 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_MAINTENANCE_9_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_MAINTENANCE_3_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5687:54: error: 'VK_KHR_ROBUSTNESS_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_ROBUSTNESS_2_EXTENSION_NAME'?
|  5687 |          || gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_ROBUSTNESS_2_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_ROBUSTNESS_2_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_props2(Printer&, AppInstance&, AppGpu&, bool, const void*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5918:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_9_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR'?
|  5918 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_9_PROPERTIES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5919:19: error: 'VkPhysicalDeviceMaintenance9PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance7PropertiesKHR'?
|  5919 |             const VkPhysicalDeviceMaintenance9PropertiesKHR* props = (const VkPhysicalDeviceMaintenance9PropertiesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceMaintenance7PropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:5920:108: error: 'props' was not declared in this scope
|  5920 |             DumpVkPhysicalDeviceMaintenance9PropertiesKHR(p, "VkPhysicalDeviceMaintenance9PropertiesKHR", *props);
|       |                                                                                                            ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6005:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT'?
|  6005 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6006:19: error: 'VkPhysicalDeviceRobustness2PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceRobustness2PropertiesEXT'?
|  6006 |             const VkPhysicalDeviceRobustness2PropertiesKHR* props = (const VkPhysicalDeviceRobustness2PropertiesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceRobustness2PropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6007:106: error: 'props' was not declared in this scope
|  6007 |             DumpVkPhysicalDeviceRobustness2PropertiesKHR(p, "VkPhysicalDeviceRobustness2PropertiesKHR", *props);
|       |                                                                                                          ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6213:5: error: 'VkPhysicalDeviceMaintenance9FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance8FeaturesKHR'?
|  6213 |     VkPhysicalDeviceMaintenance9FeaturesKHR PhysicalDeviceMaintenance9FeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance8FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6236:5: error: 'VkPhysicalDevicePresentId2FeaturesKHR' does not name a type; did you mean 'VkPhysicalDevicePresentIdFeaturesKHR'?
|  6236 |     VkPhysicalDevicePresentId2FeaturesKHR PhysicalDevicePresentId2FeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDevicePresentIdFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6238:5: error: 'VkPhysicalDevicePresentModeFifoLatestReadyFeaturesKHR' does not name a type; did you mean 'VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT'?
|  6238 |     VkPhysicalDevicePresentModeFifoLatestReadyFeaturesKHR PhysicalDevicePresentModeFifoLatestReadyFeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6239:5: error: 'VkPhysicalDevicePresentWait2FeaturesKHR' does not name a type; did you mean 'VkPhysicalDevicePresentWaitFeaturesKHR'?
|  6239 |     VkPhysicalDevicePresentWait2FeaturesKHR PhysicalDevicePresentWait2FeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDevicePresentWaitFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6252:5: error: 'VkPhysicalDeviceRobustness2FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceRobustness2FeaturesEXT'?
|  6252 |     VkPhysicalDeviceRobustness2FeaturesKHR PhysicalDeviceRobustness2FeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceRobustness2FeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6265:5: error: 'VkPhysicalDeviceShaderFloat8FeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceShaderObjectFeaturesEXT'?
|  6265 |     VkPhysicalDeviceShaderFloat8FeaturesEXT PhysicalDeviceShaderFloat8FeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceShaderObjectFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6283:5: error: 'VkPhysicalDeviceSwapchainMaintenance1FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceSwapchainMaintenance1FeaturesEXT'?
|  6283 |     VkPhysicalDeviceSwapchainMaintenance1FeaturesKHR PhysicalDeviceSwapchainMaintenance1FeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceSwapchainMaintenance1FeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6289:5: error: 'VkPhysicalDeviceUnifiedImageLayoutsFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceTimelineSemaphoreFeaturesKHR'?
|  6289 |     VkPhysicalDeviceUnifiedImageLayoutsFeaturesKHR PhysicalDeviceUnifiedImageLayoutsFeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceTimelineSemaphoreFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6295:5: error: 'VkPhysicalDeviceVideoDecodeVP9FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceVideoEncodeAV1FeaturesKHR'?
|  6295 |     VkPhysicalDeviceVideoDecodeVP9FeaturesKHR PhysicalDeviceVideoDecodeVP9FeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceVideoEncodeAV1FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6297:5: error: 'VkPhysicalDeviceVideoEncodeIntraRefreshFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceVideoEncodeAV1FeaturesKHR'?
|  6297 |     VkPhysicalDeviceVideoEncodeIntraRefreshFeaturesKHR PhysicalDeviceVideoEncodeIntraRefreshFeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceVideoEncodeAV1FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6309:5: error: 'VkPhysicalDeviceZeroInitializeDeviceMemoryFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR'?
|  6309 |     VkPhysicalDeviceZeroInitializeDeviceMemoryFeaturesEXT PhysicalDeviceZeroInitializeDeviceMemoryFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_features2_chain::initialize_chain(AppGpu&, bool)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6373:9: error: 'PhysicalDeviceMaintenance9FeaturesKHR' was not declared in this scope; did you mean 'PhysicalDeviceMaintenance7FeaturesKHR'?
|  6373 |         PhysicalDeviceMaintenance9FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_9_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceMaintenance7FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6373:55: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_9_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_8_FEATURES_KHR'?
|  6373 |         PhysicalDeviceMaintenance9FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_9_FEATURES_KHR;
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                       VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_8_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6396:9: error: 'PhysicalDevicePresentId2FeaturesKHR' was not declared in this scope; did you mean 'PhysicalDevicePresentIdFeaturesKHR'?
|  6396 |         PhysicalDevicePresentId2FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_ID_2_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDevicePresentIdFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6396:53: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_ID_2_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_ID_FEATURES_KHR'?
|  6396 |         PhysicalDevicePresentId2FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_ID_2_FEATURES_KHR;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_ID_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6398:9: error: 'PhysicalDevicePresentModeFifoLatestReadyFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT'?
|  6398 |         PhysicalDevicePresentModeFifoLatestReadyFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6398:69: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_EXT'?
|  6398 |         PhysicalDevicePresentModeFifoLatestReadyFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_KHR;
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                     VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6399:9: error: 'PhysicalDevicePresentWait2FeaturesKHR' was not declared in this scope; did you mean 'PhysicalDevicePresentWaitFeaturesKHR'?
|  6399 |         PhysicalDevicePresentWait2FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_WAIT_2_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDevicePresentWaitFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6399:55: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_WAIT_2_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_WAIT_FEATURES_KHR'?
|  6399 |         PhysicalDevicePresentWait2FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_WAIT_2_FEATURES_KHR;
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                       VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_WAIT_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6412:9: error: 'PhysicalDeviceRobustness2FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceRobustness2FeaturesEXT'?
|  6412 |         PhysicalDeviceRobustness2FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceRobustness2FeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6412:54: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT'?
|  6412 |         PhysicalDeviceRobustness2FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_KHR;
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6425:9: error: 'PhysicalDeviceShaderFloat8FeaturesEXT' was not declared in this scope; did you mean 'PhysicalDeviceShaderObjectFeaturesEXT'?
|  6425 |         PhysicalDeviceShaderFloat8FeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT8_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceShaderObjectFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6425:55: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT8_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_OBJECT_FEATURES_EXT'?
|  6425 |         PhysicalDeviceShaderFloat8FeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT8_FEATURES_EXT;
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                       VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_OBJECT_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6442:9: error: 'PhysicalDeviceSwapchainMaintenance1FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceSwapchainMaintenance1FeaturesEXT'?
|  6442 |         PhysicalDeviceSwapchainMaintenance1FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SWAPCHAIN_MAINTENANCE_1_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceSwapchainMaintenance1FeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6442:64: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SWAPCHAIN_MAINTENANCE_1_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SWAPCHAIN_MAINTENANCE_1_FEATURES_EXT'?
|  6442 |         PhysicalDeviceSwapchainMaintenance1FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SWAPCHAIN_MAINTENANCE_1_FEATURES_KHR;
|       |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SWAPCHAIN_MAINTENANCE_1_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6448:9: error: 'PhysicalDeviceUnifiedImageLayoutsFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceUnifiedImageLayoutsFeaturesKHR'?
|  6448 |         PhysicalDeviceUnifiedImageLayoutsFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_UNIFIED_IMAGE_LAYOUTS_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceUnifiedImageLayoutsFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6448:62: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_UNIFIED_IMAGE_LAYOUTS_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT'?
|  6448 |         PhysicalDeviceUnifiedImageLayoutsFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_UNIFIED_IMAGE_LAYOUTS_FEATURES_KHR;
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6454:9: error: 'PhysicalDeviceVideoDecodeVP9FeaturesKHR' was not declared in this scope; did you mean 'PhysicalDeviceVideoEncodeAV1FeaturesKHR'?
|  6454 |         PhysicalDeviceVideoDecodeVP9FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_DECODE_VP9_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceVideoEncodeAV1FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6454:57: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_DECODE_VP9_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR'?
|  6454 |         PhysicalDeviceVideoDecodeVP9FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_DECODE_VP9_FEATURES_KHR;
|       |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                         VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6456:9: error: 'PhysicalDeviceVideoEncodeIntraRefreshFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceVideoEncodeIntraRefreshFeaturesKHR'?
|  6456 |         PhysicalDeviceVideoEncodeIntraRefreshFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_INTRA_REFRESH_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceVideoEncodeIntraRefreshFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6456:66: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_INTRA_REFRESH_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR'?
|  6456 |         PhysicalDeviceVideoEncodeIntraRefreshFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_INTRA_REFRESH_FEATURES_KHR;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                  VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6468:9: error: 'PhysicalDeviceZeroInitializeDeviceMemoryFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceZeroInitializeDeviceMemoryFeaturesEXT'?
|  6468 |         PhysicalDeviceZeroInitializeDeviceMemoryFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ZERO_INITIALIZE_DEVICE_MEMORY_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceZeroInitializeDeviceMemoryFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6468:69: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ZERO_INITIALIZE_DEVICE_MEMORY_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ZERO_INITIALIZE_WORKGROUP_MEMORY_FEATURES_KHR'?
|  6468 |         PhysicalDeviceZeroInitializeDeviceMemoryFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ZERO_INITIALIZE_DEVICE_MEMORY_FEATURES_EXT;
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                     VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ZERO_INITIALIZE_WORKGROUP_MEMORY_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6617:54: error: 'VK_KHR_MAINTENANCE_9_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_MAINTENANCE_3_EXTENSION_NAME'?
|  6617 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_MAINTENANCE_9_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_MAINTENANCE_3_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6666:54: error: 'VK_KHR_PRESENT_ID_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_PRESENT_ID_EXTENSION_NAME'?
|  6666 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_PRESENT_ID_2_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_PRESENT_ID_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6671:54: error: 'VK_KHR_PRESENT_MODE_FIFO_LATEST_READY_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_PRESENT_MODE_FIFO_LATEST_READY_EXTENSION_NAME'?
|  6671 |          || gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_PRESENT_MODE_FIFO_LATEST_READY_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_PRESENT_MODE_FIFO_LATEST_READY_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6673:54: error: 'VK_KHR_PRESENT_WAIT_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_PRESENT_WAIT_EXTENSION_NAME'?
|  6673 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_PRESENT_WAIT_2_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_PRESENT_WAIT_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6702:54: error: 'VK_KHR_ROBUSTNESS_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_ROBUSTNESS_2_EXTENSION_NAME'?
|  6702 |          || gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_ROBUSTNESS_2_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_ROBUSTNESS_2_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6735:54: error: 'VK_EXT_SHADER_FLOAT8_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_SHADER_OBJECT_EXTENSION_NAME'?
|  6735 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_SHADER_FLOAT8_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_SHADER_OBJECT_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6776:54: error: 'VK_KHR_SWAPCHAIN_MAINTENANCE_1_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_SWAPCHAIN_MAINTENANCE_1_EXTENSION_NAME'?
|  6776 |          || gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_SWAPCHAIN_MAINTENANCE_1_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_SWAPCHAIN_MAINTENANCE_1_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6791:54: error: 'VK_KHR_UNIFIED_IMAGE_LAYOUTS_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_RELAXED_BLOCK_LAYOUT_EXTENSION_NAME'?
|  6791 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_UNIFIED_IMAGE_LAYOUTS_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_RELAXED_BLOCK_LAYOUT_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6807:54: error: 'VK_KHR_VIDEO_DECODE_VP9_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_DECODE_AV1_EXTENSION_NAME'?
|  6807 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_DECODE_VP9_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_VIDEO_DECODE_AV1_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6811:54: error: 'VK_KHR_VIDEO_ENCODE_INTRA_REFRESH_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  6811 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_INTRA_REFRESH_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:6836:54: error: 'VK_EXT_ZERO_INITIALIZE_DEVICE_MEMORY_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_ZERO_INITIALIZE_WORKGROUP_MEMORY_EXTENSION_NAME'?
|  6836 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_ZERO_INITIALIZE_DEVICE_MEMORY_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_ZERO_INITIALIZE_WORKGROUP_MEMORY_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, bool, const void*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7165:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_9_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_8_FEATURES_KHR'?
|  7165 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_9_FEATURES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_8_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7166:19: error: 'VkPhysicalDeviceMaintenance9FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance8FeaturesKHR'?
|  7166 |             const VkPhysicalDeviceMaintenance9FeaturesKHR* props = (const VkPhysicalDeviceMaintenance9FeaturesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceMaintenance8FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7167:104: error: 'props' was not declared in this scope
|  7167 |             DumpVkPhysicalDeviceMaintenance9FeaturesKHR(p, "VkPhysicalDeviceMaintenance9FeaturesKHR", *props);
|       |                                                                                                        ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7272:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_ID_2_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_ID_FEATURES_KHR'?
|  7272 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_ID_2_FEATURES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_ID_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7273:19: error: 'VkPhysicalDevicePresentId2FeaturesKHR' does not name a type; did you mean 'VkPhysicalDevicePresentIdFeaturesKHR'?
|  7273 |             const VkPhysicalDevicePresentId2FeaturesKHR* props = (const VkPhysicalDevicePresentId2FeaturesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDevicePresentIdFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7274:100: error: 'props' was not declared in this scope
|  7274 |             DumpVkPhysicalDevicePresentId2FeaturesKHR(p, "VkPhysicalDevicePresentId2FeaturesKHR", *props);
|       |                                                                                                    ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7282:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_EXT'?
|  7282 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7283:19: error: 'VkPhysicalDevicePresentModeFifoLatestReadyFeaturesKHR' does not name a type; did you mean 'VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT'?
|  7283 |             const VkPhysicalDevicePresentModeFifoLatestReadyFeaturesKHR* props = (const VkPhysicalDevicePresentModeFifoLatestReadyFeaturesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7284:132: error: 'props' was not declared in this scope
|  7284 |             DumpVkPhysicalDevicePresentModeFifoLatestReadyFeaturesKHR(p, "VkPhysicalDevicePresentModeFifoLatestReadyFeaturesKHR", *props);
|       |                                                                                                                                    ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7287:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_WAIT_2_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_WAIT_FEATURES_KHR'?
|  7287 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_WAIT_2_FEATURES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_WAIT_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7288:19: error: 'VkPhysicalDevicePresentWait2FeaturesKHR' does not name a type; did you mean 'VkPhysicalDevicePresentWaitFeaturesKHR'?
|  7288 |             const VkPhysicalDevicePresentWait2FeaturesKHR* props = (const VkPhysicalDevicePresentWait2FeaturesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDevicePresentWaitFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7289:104: error: 'props' was not declared in this scope
|  7289 |             DumpVkPhysicalDevicePresentWait2FeaturesKHR(p, "VkPhysicalDevicePresentWait2FeaturesKHR", *props);
|       |                                                                                                        ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7352:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT'?
|  7352 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7353:19: error: 'VkPhysicalDeviceRobustness2FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceRobustness2FeaturesEXT'?
|  7353 |             const VkPhysicalDeviceRobustness2FeaturesKHR* props = (const VkPhysicalDeviceRobustness2FeaturesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceRobustness2FeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7354:102: error: 'props' was not declared in this scope
|  7354 |             DumpVkPhysicalDeviceRobustness2FeaturesKHR(p, "VkPhysicalDeviceRobustness2FeaturesKHR", *props);
|       |                                                                                                      ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7417:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT8_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_OBJECT_FEATURES_EXT'?
|  7417 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT8_FEATURES_EXT) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_OBJECT_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7418:19: error: 'VkPhysicalDeviceShaderFloat8FeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceShaderObjectFeaturesEXT'?
|  7418 |             const VkPhysicalDeviceShaderFloat8FeaturesEXT* props = (const VkPhysicalDeviceShaderFloat8FeaturesEXT*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceShaderObjectFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7419:104: error: 'props' was not declared in this scope
|  7419 |             DumpVkPhysicalDeviceShaderFloat8FeaturesEXT(p, "VkPhysicalDeviceShaderFloat8FeaturesEXT", *props);
|       |                                                                                                        ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7502:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SWAPCHAIN_MAINTENANCE_1_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SWAPCHAIN_MAINTENANCE_1_FEATURES_EXT'?
|  7502 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SWAPCHAIN_MAINTENANCE_1_FEATURES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SWAPCHAIN_MAINTENANCE_1_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7503:19: error: 'VkPhysicalDeviceSwapchainMaintenance1FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceSwapchainMaintenance1FeaturesEXT'?
|  7503 |             const VkPhysicalDeviceSwapchainMaintenance1FeaturesKHR* props = (const VkPhysicalDeviceSwapchainMaintenance1FeaturesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceSwapchainMaintenance1FeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7504:122: error: 'props' was not declared in this scope
|  7504 |             DumpVkPhysicalDeviceSwapchainMaintenance1FeaturesKHR(p, "VkPhysicalDeviceSwapchainMaintenance1FeaturesKHR", *props);
|       |                                                                                                                          ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7532:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_UNIFIED_IMAGE_LAYOUTS_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT'?
|  7532 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_UNIFIED_IMAGE_LAYOUTS_FEATURES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7533:19: error: 'VkPhysicalDeviceUnifiedImageLayoutsFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceTimelineSemaphoreFeaturesKHR'?
|  7533 |             const VkPhysicalDeviceUnifiedImageLayoutsFeaturesKHR* props = (const VkPhysicalDeviceUnifiedImageLayoutsFeaturesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceTimelineSemaphoreFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7534:118: error: 'props' was not declared in this scope
|  7534 |             DumpVkPhysicalDeviceUnifiedImageLayoutsFeaturesKHR(p, "VkPhysicalDeviceUnifiedImageLayoutsFeaturesKHR", *props);
|       |                                                                                                                      ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7562:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_DECODE_VP9_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR'?
|  7562 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_DECODE_VP9_FEATURES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7563:19: error: 'VkPhysicalDeviceVideoDecodeVP9FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceVideoEncodeAV1FeaturesKHR'?
|  7563 |             const VkPhysicalDeviceVideoDecodeVP9FeaturesKHR* props = (const VkPhysicalDeviceVideoDecodeVP9FeaturesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceVideoEncodeAV1FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7564:108: error: 'props' was not declared in this scope
|  7564 |             DumpVkPhysicalDeviceVideoDecodeVP9FeaturesKHR(p, "VkPhysicalDeviceVideoDecodeVP9FeaturesKHR", *props);
|       |                                                                                                            ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7572:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_INTRA_REFRESH_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR'?
|  7572 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_INTRA_REFRESH_FEATURES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7573:19: error: 'VkPhysicalDeviceVideoEncodeIntraRefreshFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceVideoEncodeAV1FeaturesKHR'?
|  7573 |             const VkPhysicalDeviceVideoEncodeIntraRefreshFeaturesKHR* props = (const VkPhysicalDeviceVideoEncodeIntraRefreshFeaturesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceVideoEncodeAV1FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7574:126: error: 'props' was not declared in this scope
|  7574 |             DumpVkPhysicalDeviceVideoEncodeIntraRefreshFeaturesKHR(p, "VkPhysicalDeviceVideoEncodeIntraRefreshFeaturesKHR", *props);
|       |                                                                                                                              ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7632:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ZERO_INITIALIZE_DEVICE_MEMORY_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ZERO_INITIALIZE_WORKGROUP_MEMORY_FEATURES_KHR'?
|  7632 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ZERO_INITIALIZE_DEVICE_MEMORY_FEATURES_EXT) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ZERO_INITIALIZE_WORKGROUP_MEMORY_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7633:19: error: 'VkPhysicalDeviceZeroInitializeDeviceMemoryFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR'?
|  7633 |             const VkPhysicalDeviceZeroInitializeDeviceMemoryFeaturesEXT* props = (const VkPhysicalDeviceZeroInitializeDeviceMemoryFeaturesEXT*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7634:132: error: 'props' was not declared in this scope
|  7634 |             DumpVkPhysicalDeviceZeroInitializeDeviceMemoryFeaturesEXT(p, "VkPhysicalDeviceZeroInitializeDeviceMemoryFeaturesEXT", *props);
|       |                                                                                                                                    ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7661:5: error: 'VkSurfaceCapabilitiesPresentId2KHR' does not name a type; did you mean 'VkSurfaceCapabilitiesPresentBarrierNV'?
|  7661 |     VkSurfaceCapabilitiesPresentId2KHR SurfaceCapabilitiesPresentId2KHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkSurfaceCapabilitiesPresentBarrierNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7662:5: error: 'VkSurfaceCapabilitiesPresentWait2KHR' does not name a type; did you mean 'VkSurfaceCapabilitiesPresentBarrierNV'?
|  7662 |     VkSurfaceCapabilitiesPresentWait2KHR SurfaceCapabilitiesPresentWait2KHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkSurfaceCapabilitiesPresentBarrierNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void surface_capabilities2_chain::initialize_chain(AppInstance&, AppGpu&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7669:9: error: 'SurfaceCapabilitiesPresentId2KHR' was not declared in this scope; did you mean 'DumpVkSurfaceCapabilitiesPresentId2KHR'?
|  7669 |         SurfaceCapabilitiesPresentId2KHR.sType = VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_ID_2_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkSurfaceCapabilitiesPresentId2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7669:50: error: 'VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_ID_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_BARRIER_NV'?
|  7669 |         SurfaceCapabilitiesPresentId2KHR.sType = VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_ID_2_KHR;
|       |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                  VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_BARRIER_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7670:9: error: 'SurfaceCapabilitiesPresentWait2KHR' was not declared in this scope; did you mean 'DumpVkSurfaceCapabilitiesPresentWait2KHR'?
|  7670 |         SurfaceCapabilitiesPresentWait2KHR.sType = VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_WAIT_2_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkSurfaceCapabilitiesPresentWait2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7670:52: error: 'VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_WAIT_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_BARRIER_NV'?
|  7670 |         SurfaceCapabilitiesPresentWait2KHR.sType = VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_WAIT_2_KHR;
|       |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                    VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_BARRIER_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7679:54: error: 'VK_KHR_PRESENT_ID_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_PRESENT_ID_EXTENSION_NAME'?
|  7679 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_PRESENT_ID_2_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_PRESENT_ID_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7681:54: error: 'VK_KHR_PRESENT_WAIT_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_PRESENT_WAIT_EXTENSION_NAME'?
|  7681 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_PRESENT_WAIT_2_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_PRESENT_WAIT_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_surface_capabilities2(Printer&, AppInstance&, AppGpu&, const void*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7716:33: error: 'VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_ID_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_BARRIER_NV'?
|  7716 |         if (structure->sType == VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_ID_2_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_BARRIER_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7717:19: error: 'VkSurfaceCapabilitiesPresentId2KHR' does not name a type; did you mean 'VkSurfaceCapabilitiesPresentBarrierNV'?
|  7717 |             const VkSurfaceCapabilitiesPresentId2KHR* props = (const VkSurfaceCapabilitiesPresentId2KHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkSurfaceCapabilitiesPresentBarrierNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7718:94: error: 'props' was not declared in this scope
|  7718 |             DumpVkSurfaceCapabilitiesPresentId2KHR(p, "VkSurfaceCapabilitiesPresentId2KHR", *props);
|       |                                                                                              ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7721:33: error: 'VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_WAIT_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_BARRIER_NV'?
|  7721 |         if (structure->sType == VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_WAIT_2_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_BARRIER_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7722:19: error: 'VkSurfaceCapabilitiesPresentWait2KHR' does not name a type; did you mean 'VkSurfaceCapabilitiesPresentBarrierNV'?
|  7722 |             const VkSurfaceCapabilitiesPresentWait2KHR* props = (const VkSurfaceCapabilitiesPresentWait2KHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkSurfaceCapabilitiesPresentBarrierNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7723:98: error: 'props' was not declared in this scope
|  7723 |             DumpVkSurfaceCapabilitiesPresentWait2KHR(p, "VkSurfaceCapabilitiesPresentWait2KHR", *props);
|       |                                                                                                  ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7802:5: error: 'VkQueueFamilyOwnershipTransferPropertiesKHR' does not name a type; did you mean 'VkQueueFamilyVideoPropertiesKHR'?
|  7802 |     VkQueueFamilyOwnershipTransferPropertiesKHR QueueFamilyOwnershipTransferPropertiesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkQueueFamilyVideoPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void queue_properties2_chain::initialize_chain(AppGpu&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7807:9: error: 'QueueFamilyOwnershipTransferPropertiesKHR' was not declared in this scope; did you mean 'DumpVkQueueFamilyOwnershipTransferPropertiesKHR'?
|  7807 |         QueueFamilyOwnershipTransferPropertiesKHR.sType = VK_STRUCTURE_TYPE_QUEUE_FAMILY_OWNERSHIP_TRANSFER_PROPERTIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkQueueFamilyOwnershipTransferPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7807:59: error: 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_OWNERSHIP_TRANSFER_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_VIDEO_PROPERTIES_KHR'?
|  7807 |         QueueFamilyOwnershipTransferPropertiesKHR.sType = VK_STRUCTURE_TYPE_QUEUE_FAMILY_OWNERSHIP_TRANSFER_PROPERTIES_KHR;
|       |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                           VK_STRUCTURE_TYPE_QUEUE_FAMILY_VIDEO_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7815:54: error: 'VK_KHR_MAINTENANCE_9_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_MAINTENANCE_3_EXTENSION_NAME'?
|  7815 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_MAINTENANCE_9_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_MAINTENANCE_3_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_queue_properties2(Printer&, AppGpu&, const void*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7845:33: error: 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_OWNERSHIP_TRANSFER_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_VIDEO_PROPERTIES_KHR'?
|  7845 |         if (structure->sType == VK_STRUCTURE_TYPE_QUEUE_FAMILY_OWNERSHIP_TRANSFER_PROPERTIES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_QUEUE_FAMILY_VIDEO_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7846:19: error: 'VkQueueFamilyOwnershipTransferPropertiesKHR' does not name a type; did you mean 'VkQueueFamilyVideoPropertiesKHR'?
|  7846 |             const VkQueueFamilyOwnershipTransferPropertiesKHR* props = (const VkQueueFamilyOwnershipTransferPropertiesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkQueueFamilyVideoPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7847:112: error: 'props' was not declared in this scope
|  7847 |             DumpVkQueueFamilyOwnershipTransferPropertiesKHR(p, "VkQueueFamilyOwnershipTransferPropertiesKHR", *props);
|       |                                                                                                                ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7879:5: error: 'VkVideoDecodeVP9ProfileInfoKHR' does not name a type; did you mean 'VkVideoDecodeAV1ProfileInfoKHR'?
|  7879 |     VkVideoDecodeVP9ProfileInfoKHR VideoDecodeVP9ProfileInfoKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkVideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void video_profile_info_chain::initialize_chain(AppGpu&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7889:9: error: 'VideoDecodeVP9ProfileInfoKHR' was not declared in this scope; did you mean 'VideoDecodeAV1ProfileInfoKHR'?
|  7889 |         VideoDecodeVP9ProfileInfoKHR.sType = VK_STRUCTURE_TYPE_VIDEO_DECODE_VP9_PROFILE_INFO_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7889:46: error: 'VK_STRUCTURE_TYPE_VIDEO_DECODE_VP9_PROFILE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PROFILE_INFO_KHR'?
|  7889 |         VideoDecodeVP9ProfileInfoKHR.sType = VK_STRUCTURE_TYPE_VIDEO_DECODE_VP9_PROFILE_INFO_KHR;
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                              VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PROFILE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7903:54: error: 'VK_KHR_VIDEO_DECODE_VP9_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_DECODE_AV1_EXTENSION_NAME'?
|  7903 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_DECODE_VP9_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_VIDEO_DECODE_AV1_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_video_profile_info(Printer&, AppGpu&, const void*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7952:33: error: 'VK_STRUCTURE_TYPE_VIDEO_DECODE_VP9_PROFILE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PROFILE_INFO_KHR'?
|  7952 |         if (structure->sType == VK_STRUCTURE_TYPE_VIDEO_DECODE_VP9_PROFILE_INFO_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PROFILE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7953:19: error: 'VkVideoDecodeVP9ProfileInfoKHR' does not name a type; did you mean 'VkVideoDecodeAV1ProfileInfoKHR'?
|  7953 |             const VkVideoDecodeVP9ProfileInfoKHR* props = (const VkVideoDecodeVP9ProfileInfoKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkVideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7954:86: error: 'props' was not declared in this scope
|  7954 |             DumpVkVideoDecodeVP9ProfileInfoKHR(p, "VkVideoDecodeVP9ProfileInfoKHR", *props);
|       |                                                                                      ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:7996:5: error: 'VkVideoDecodeVP9CapabilitiesKHR' does not name a type; did you mean 'VkVideoDecodeCapabilitiesKHR'?
|  7996 |     VkVideoDecodeVP9CapabilitiesKHR VideoDecodeVP9CapabilitiesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkVideoDecodeCapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8004:5: error: 'VkVideoEncodeIntraRefreshCapabilitiesKHR' does not name a type; did you mean 'VkVideoEncodeAV1CapabilitiesKHR'?
|  8004 |     VkVideoEncodeIntraRefreshCapabilitiesKHR VideoEncodeIntraRefreshCapabilitiesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkVideoEncodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void video_capabilities_chain::initialize_chain(AppGpu&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8011:9: error: 'VideoDecodeVP9CapabilitiesKHR' was not declared in this scope; did you mean 'VideoDecodeAV1CapabilitiesKHR'?
|  8011 |         VideoDecodeVP9CapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_DECODE_VP9_CAPABILITIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VideoDecodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8011:47: error: 'VK_STRUCTURE_TYPE_VIDEO_DECODE_VP9_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR'?
|  8011 |         VideoDecodeVP9CapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_DECODE_VP9_CAPABILITIES_KHR;
|       |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                               VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8019:9: error: 'VideoEncodeIntraRefreshCapabilitiesKHR' was not declared in this scope; did you mean 'DumpVkVideoEncodeIntraRefreshCapabilitiesKHR'?
|  8019 |         VideoEncodeIntraRefreshCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_INTRA_REFRESH_CAPABILITIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkVideoEncodeIntraRefreshCapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8019:56: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_INTRA_REFRESH_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR'?
|  8019 |         VideoEncodeIntraRefreshCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_INTRA_REFRESH_CAPABILITIES_KHR;
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                        VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8030:54: error: 'VK_KHR_VIDEO_DECODE_VP9_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_DECODE_AV1_EXTENSION_NAME'?
|  8030 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_DECODE_VP9_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_VIDEO_DECODE_AV1_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8046:54: error: 'VK_KHR_VIDEO_ENCODE_INTRA_REFRESH_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  8046 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_INTRA_REFRESH_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_video_capabilities(Printer&, AppGpu&, const void*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8089:33: error: 'VK_STRUCTURE_TYPE_VIDEO_DECODE_VP9_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR'?
|  8089 |         if (structure->sType == VK_STRUCTURE_TYPE_VIDEO_DECODE_VP9_CAPABILITIES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8090:19: error: 'VkVideoDecodeVP9CapabilitiesKHR' does not name a type; did you mean 'VkVideoDecodeCapabilitiesKHR'?
|  8090 |             const VkVideoDecodeVP9CapabilitiesKHR* props = (const VkVideoDecodeVP9CapabilitiesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkVideoDecodeCapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8091:88: error: 'props' was not declared in this scope
|  8091 |             DumpVkVideoDecodeVP9CapabilitiesKHR(p, "VkVideoDecodeVP9CapabilitiesKHR", *props);
|       |                                                                                        ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8129:33: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_INTRA_REFRESH_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR'?
|  8129 |         if (structure->sType == VK_STRUCTURE_TYPE_VIDEO_ENCODE_INTRA_REFRESH_CAPABILITIES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8130:19: error: 'VkVideoEncodeIntraRefreshCapabilitiesKHR' does not name a type; did you mean 'VkVideoEncodeAV1CapabilitiesKHR'?
|  8130 |             const VkVideoEncodeIntraRefreshCapabilitiesKHR* props = (const VkVideoEncodeIntraRefreshCapabilitiesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkVideoEncodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8131:106: error: 'props' was not declared in this scope
|  8131 |             DumpVkVideoEncodeIntraRefreshCapabilitiesKHR(p, "VkVideoEncodeIntraRefreshCapabilitiesKHR", *props);
|       |                                                                                                          ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8271:20: error: 'VK_ARM_TENSORS_EXTENSION_NAME' was not declared in this scope
|  8271 |     FormatRange{0, VK_ARM_TENSORS_EXTENSION_NAME, static_cast<VkFormat>(1000460000), static_cast<VkFormat>(1000460000)},
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8273:20: error: 'VK_ARM_FORMAT_PACK_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_IMG_FORMAT_PVRTC_EXTENSION_NAME'?
|  8273 |     FormatRange{0, VK_ARM_FORMAT_PACK_EXTENSION_NAME, static_cast<VkFormat>(1000609000), static_cast<VkFormat>(1000609013)},
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                    VK_IMG_FORMAT_PVRTC_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<std::unique_ptr<AppVideoProfile> > enumerate_supported_video_profiles(AppGpu&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8670:50: error: 'VK_KHR_VIDEO_DECODE_VP9_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_DECODE_AV1_EXTENSION_NAME'?
|  8670 |     if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_DECODE_VP9_EXTENSION_NAME)) {
|       |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                  VK_KHR_VIDEO_DECODE_AV1_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8685:25: error: 'VK_VIDEO_CODEC_OPERATION_DECODE_VP9_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR'?
|  8685 |                         VK_VIDEO_CODEC_OPERATION_DECODE_VP9_BIT_KHR,
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8694:49: error: 'struct video_profile_info_chain' has no member named 'VideoDecodeVP9ProfileInfoKHR'; did you mean 'VideoDecodeAV1ProfileInfoKHR'?
|  8694 |                             profile_info_chain->VideoDecodeVP9ProfileInfoKHR.sType = VK_STRUCTURE_TYPE_VIDEO_DECODE_VP9_PROFILE_INFO_KHR;
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 VideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8694:86: error: 'VK_STRUCTURE_TYPE_VIDEO_DECODE_VP9_PROFILE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PROFILE_INFO_KHR'?
|  8694 |                             profile_info_chain->VideoDecodeVP9ProfileInfoKHR.sType = VK_STRUCTURE_TYPE_VIDEO_DECODE_VP9_PROFILE_INFO_KHR;
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                      VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PROFILE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8695:49: error: 'struct video_profile_info_chain' has no member named 'VideoDecodeVP9ProfileInfoKHR'; did you mean 'VideoDecodeAV1ProfileInfoKHR'?
|  8695 |                             profile_info_chain->VideoDecodeVP9ProfileInfoKHR.pNext = nullptr;
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 VideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8696:60: error: 'struct video_profile_info_chain' has no member named 'VideoDecodeVP9ProfileInfoKHR'; did you mean 'VideoDecodeAV1ProfileInfoKHR'?
|  8696 |                             *ppnext = &profile_info_chain->VideoDecodeVP9ProfileInfoKHR;
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            VideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8697:59: error: 'struct video_profile_info_chain' has no member named 'VideoDecodeVP9ProfileInfoKHR'; did you mean 'VideoDecodeAV1ProfileInfoKHR'?
|  8697 |                             ppnext = &profile_info_chain->VideoDecodeVP9ProfileInfoKHR.pNext;
|       |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                           VideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8714:53: error: 'struct video_capabilities_chain' has no member named 'VideoDecodeVP9CapabilitiesKHR'; did you mean 'VideoDecodeAV1CapabilitiesKHR'?
|  8714 |                                 capabilities_chain->VideoDecodeVP9CapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_DECODE_VP9_CAPABILITIES_KHR;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VideoDecodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8714:91: error: 'VK_STRUCTURE_TYPE_VIDEO_DECODE_VP9_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR'?
|  8714 |                                 capabilities_chain->VideoDecodeVP9CapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_DECODE_VP9_CAPABILITIES_KHR;
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                           VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8715:53: error: 'struct video_capabilities_chain' has no member named 'VideoDecodeVP9CapabilitiesKHR'; did you mean 'VideoDecodeAV1CapabilitiesKHR'?
|  8715 |                                 capabilities_chain->VideoDecodeVP9CapabilitiesKHR.pNext = nullptr;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VideoDecodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8716:64: error: 'struct video_capabilities_chain' has no member named 'VideoDecodeVP9CapabilitiesKHR'; did you mean 'VideoDecodeAV1CapabilitiesKHR'?
|  8716 |                                 *ppnext = &capabilities_chain->VideoDecodeVP9CapabilitiesKHR;
|       |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                VideoDecodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8717:63: error: 'struct video_capabilities_chain' has no member named 'VideoDecodeVP9CapabilitiesKHR'; did you mean 'VideoDecodeAV1CapabilitiesKHR'?
|  8717 |                                 ppnext = &capabilities_chain->VideoDecodeVP9CapabilitiesKHR.pNext;
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                               VideoDecodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8754:53: error: 'struct video_profile_info_chain' has no member named 'VideoDecodeVP9ProfileInfoKHR'; did you mean 'VideoDecodeAV1ProfileInfoKHR'?
|  8754 |                         profile.profile_info_chain->VideoDecodeVP9ProfileInfoKHR.stdProfile = STD_VIDEO_VP9_PROFILE_0;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8754:95: error: 'STD_VIDEO_VP9_PROFILE_0' was not declared in this scope; did you mean 'STD_VIDEO_AV1_PROFILE_MAIN'?
|  8754 |                         profile.profile_info_chain->VideoDecodeVP9ProfileInfoKHR.stdProfile = STD_VIDEO_VP9_PROFILE_0;
|       |                                                                                               ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                               STD_VIDEO_AV1_PROFILE_MAIN
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8760:53: error: 'struct video_profile_info_chain' has no member named 'VideoDecodeVP9ProfileInfoKHR'; did you mean 'VideoDecodeAV1ProfileInfoKHR'?
|  8760 |                         profile.profile_info_chain->VideoDecodeVP9ProfileInfoKHR.stdProfile = STD_VIDEO_VP9_PROFILE_1;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8760:95: error: 'STD_VIDEO_VP9_PROFILE_1' was not declared in this scope; did you mean 'STD_VIDEO_AV1_PROFILE_MAIN'?
|  8760 |                         profile.profile_info_chain->VideoDecodeVP9ProfileInfoKHR.stdProfile = STD_VIDEO_VP9_PROFILE_1;
|       |                                                                                               ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                               STD_VIDEO_AV1_PROFILE_MAIN
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8766:53: error: 'struct video_profile_info_chain' has no member named 'VideoDecodeVP9ProfileInfoKHR'; did you mean 'VideoDecodeAV1ProfileInfoKHR'?
|  8766 |                         profile.profile_info_chain->VideoDecodeVP9ProfileInfoKHR.stdProfile = STD_VIDEO_VP9_PROFILE_2;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8766:95: error: 'STD_VIDEO_VP9_PROFILE_2' was not declared in this scope; did you mean 'STD_VIDEO_AV1_PROFILE_MAIN'?
|  8766 |                         profile.profile_info_chain->VideoDecodeVP9ProfileInfoKHR.stdProfile = STD_VIDEO_VP9_PROFILE_2;
|       |                                                                                               ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                               STD_VIDEO_AV1_PROFILE_MAIN
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8772:53: error: 'struct video_profile_info_chain' has no member named 'VideoDecodeVP9ProfileInfoKHR'; did you mean 'VideoDecodeAV1ProfileInfoKHR'?
|  8772 |                         profile.profile_info_chain->VideoDecodeVP9ProfileInfoKHR.stdProfile = STD_VIDEO_VP9_PROFILE_3;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8772:95: error: 'STD_VIDEO_VP9_PROFILE_3' was not declared in this scope; did you mean 'STD_VIDEO_AV1_PROFILE_MAIN'?
|  8772 |                         profile.profile_info_chain->VideoDecodeVP9ProfileInfoKHR.stdProfile = STD_VIDEO_VP9_PROFILE_3;
|       |                                                                                               ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                               STD_VIDEO_AV1_PROFILE_MAIN
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8957:74: error: 'VK_KHR_VIDEO_ENCODE_INTRA_REFRESH_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  8957 |                             if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_INTRA_REFRESH_EXTENSION_NAME)) {
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                          VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8958:53: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeIntraRefreshCapabilitiesKHR'; did you mean 'VideoEncodeAV1CapabilitiesKHR'?
|  8958 |                                 capabilities_chain->VideoEncodeIntraRefreshCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_INTRA_REFRESH_CAPABILITIES_KHR;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VideoEncodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8958:100: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_INTRA_REFRESH_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR'?
|  8958 |                                 capabilities_chain->VideoEncodeIntraRefreshCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_INTRA_REFRESH_CAPABILITIES_KHR;
|       |                                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                    VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8959:53: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeIntraRefreshCapabilitiesKHR'; did you mean 'VideoEncodeAV1CapabilitiesKHR'?
|  8959 |                                 capabilities_chain->VideoEncodeIntraRefreshCapabilitiesKHR.pNext = nullptr;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VideoEncodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8960:64: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeIntraRefreshCapabilitiesKHR'; did you mean 'VideoEncodeAV1CapabilitiesKHR'?
|  8960 |                                 *ppnext = &capabilities_chain->VideoEncodeIntraRefreshCapabilitiesKHR;
|       |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                VideoEncodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:8961:63: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeIntraRefreshCapabilitiesKHR'; did you mean 'VideoEncodeAV1CapabilitiesKHR'?
|  8961 |                                 ppnext = &capabilities_chain->VideoEncodeIntraRefreshCapabilitiesKHR.pNext;
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                               VideoEncodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:9150:74: error: 'VK_KHR_VIDEO_ENCODE_INTRA_REFRESH_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  9150 |                             if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_INTRA_REFRESH_EXTENSION_NAME)) {
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                          VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:9151:53: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeIntraRefreshCapabilitiesKHR'; did you mean 'VideoEncodeAV1CapabilitiesKHR'?
|  9151 |                                 capabilities_chain->VideoEncodeIntraRefreshCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_INTRA_REFRESH_CAPABILITIES_KHR;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VideoEncodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:9151:100: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_INTRA_REFRESH_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR'?
|  9151 |                                 capabilities_chain->VideoEncodeIntraRefreshCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_INTRA_REFRESH_CAPABILITIES_KHR;
|       |                                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                    VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:9152:53: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeIntraRefreshCapabilitiesKHR'; did you mean 'VideoEncodeAV1CapabilitiesKHR'?
|  9152 |                                 capabilities_chain->VideoEncodeIntraRefreshCapabilitiesKHR.pNext = nullptr;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VideoEncodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:9153:64: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeIntraRefreshCapabilitiesKHR'; did you mean 'VideoEncodeAV1CapabilitiesKHR'?
|  9153 |                                 *ppnext = &capabilities_chain->VideoEncodeIntraRefreshCapabilitiesKHR;
|       |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                VideoEncodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:9154:63: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeIntraRefreshCapabilitiesKHR'; did you mean 'VideoEncodeAV1CapabilitiesKHR'?
|  9154 |                                 ppnext = &capabilities_chain->VideoEncodeIntraRefreshCapabilitiesKHR.pNext;
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                               VideoEncodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:9365:74: error: 'VK_KHR_VIDEO_ENCODE_INTRA_REFRESH_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  9365 |                             if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_INTRA_REFRESH_EXTENSION_NAME)) {
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                          VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:9366:53: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeIntraRefreshCapabilitiesKHR'; did you mean 'VideoEncodeAV1CapabilitiesKHR'?
|  9366 |                                 capabilities_chain->VideoEncodeIntraRefreshCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_INTRA_REFRESH_CAPABILITIES_KHR;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VideoEncodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:9366:100: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_INTRA_REFRESH_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR'?
|  9366 |                                 capabilities_chain->VideoEncodeIntraRefreshCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_INTRA_REFRESH_CAPABILITIES_KHR;
|       |                                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                    VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:9367:53: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeIntraRefreshCapabilitiesKHR'; did you mean 'VideoEncodeAV1CapabilitiesKHR'?
|  9367 |                                 capabilities_chain->VideoEncodeIntraRefreshCapabilitiesKHR.pNext = nullptr;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VideoEncodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:9368:64: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeIntraRefreshCapabilitiesKHR'; did you mean 'VideoEncodeAV1CapabilitiesKHR'?
|  9368 |                                 *ppnext = &capabilities_chain->VideoEncodeIntraRefreshCapabilitiesKHR;
|       |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                VideoEncodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:9369:63: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeIntraRefreshCapabilitiesKHR'; did you mean 'VideoEncodeAV1CapabilitiesKHR'?
|  9369 |                                 ppnext = &capabilities_chain->VideoEncodeIntraRefreshCapabilitiesKHR.pNext;
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                               VideoEncodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/vulkaninfo.cpp: In function 'void DumpSurfaceCapabilities(Printer&, AppInstance&, AppGpu&, AppSurface&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/vulkaninfo.cpp:174:36: error: 'VK_KHR_SURFACE_MAINTENANCE_1_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_SURFACE_MAINTENANCE_1_EXTENSION_NAME'?
|   174 |         inst.CheckExtensionEnabled(VK_KHR_SURFACE_MAINTENANCE_1_EXTENSION_NAME)) {
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    VK_EXT_SURFACE_MAINTENANCE_1_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/vulkaninfo.cpp:182:13: error: 'VkSurfacePresentModeKHR' was not declared in this scope; did you mean 'VkSurfacePresentModeEXT'?
|   182 |             VkSurfacePresentModeKHR present_mode{};
|       |             ^~~~~~~~~~~~~~~~~~~~~~~
|       |             VkSurfacePresentModeEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/vulkaninfo.cpp:183:13: error: 'present_mode' was not declared in this scope
|   183 |             present_mode.sType = VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_KHR;
|       |             ^~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/vulkaninfo.cpp:183:34: error: 'VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_EXT'?
|   183 |             present_mode.sType = VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_KHR;
|       |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                  VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/vulkaninfo.cpp:191:13: error: 'VkSurfacePresentModeCompatibilityKHR' was not declared in this scope; did you mean 'VkSurfacePresentModeCompatibilityEXT'?
|   191 |             VkSurfacePresentModeCompatibilityKHR SurfacePresentModeCompatibilityKHR{};
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkSurfacePresentModeCompatibilityEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/vulkaninfo.cpp:192:13: error: 'SurfacePresentModeCompatibilityKHR' was not declared in this scope; did you mean 'VkSurfacePresentModeCompatibilityEXT'?
|   192 |             SurfacePresentModeCompatibilityKHR.sType = VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_COMPATIBILITY_KHR;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkSurfacePresentModeCompatibilityEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/vulkaninfo.cpp:192:56: error: 'VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_COMPATIBILITY_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_COMPATIBILITY_EXT'?
|   192 |             SurfacePresentModeCompatibilityKHR.sType = VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_COMPATIBILITY_KHR;
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                        VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_COMPATIBILITY_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/vulkaninfo.cpp:194:13: error: 'VkSurfacePresentScalingCapabilitiesKHR' was not declared in this scope; did you mean 'VkSurfacePresentScalingCapabilitiesEXT'?
|   194 |             VkSurfacePresentScalingCapabilitiesKHR SurfacePresentScalingCapabilitiesKHR{};
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkSurfacePresentScalingCapabilitiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/vulkaninfo.cpp:195:13: error: 'SurfacePresentScalingCapabilitiesKHR' was not declared in this scope; did you mean 'VkSurfacePresentScalingCapabilitiesEXT'?
|   195 |             SurfacePresentScalingCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_SURFACE_PRESENT_SCALING_CAPABILITIES_EXT;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkSurfacePresentScalingCapabilitiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/vulkaninfo.cpp:207:119: error: no matching function for call to 'std::vector<VkPresentModeKHR>::vector(<brace-enclosed initializer list>)'
|   207 |             std::vector<VkPresentModeKHR> compatible_present_modes{SurfacePresentModeCompatibilityKHR.presentModeCount};
|       |                                                                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/vulkaninfo.cpp:207:119: note: there are 12 candidates
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot/usr/include/c++/15.1.0/vector:68,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/./vulkaninfo.h:42,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/sources/vulkan-tools-1.4.321.0/vulkaninfo/generated/vulkaninfo.hpp:28:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot/usr/include/c++/15.1.0/bits/stl_vector.h:736:9: note: candidate 1: 'template<class _InputIterator, class> std::vector<_Tp, _Alloc>::vector(_InputIterator, _InputIterator, const allocator_type&) [with <template-parameter-2-2> = _InputIterator; _Tp = VkPresentModeKHR; _Alloc = std::allocator<VkPresentModeKHR>]'
|   736 |         vector(_InputIterator __first, _InputIterator __last,
|       |         ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot/usr/include/c++/15.1.0/bits/stl_vector.h:736:9: note: candidate expects 2 arguments, 1 provided
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot/usr/include/c++/15.1.0/bits/stl_vector.h:708:7: note: candidate 2: 'std::vector<_Tp, _Alloc>::vector(std::initializer_list<_Tp>, const allocator_type&) [with _Tp = VkPresentModeKHR; _Alloc = std::allocator<VkPresentModeKHR>; allocator_type = std::allocator<VkPresentModeKHR>]'
|   708 |       vector(initializer_list<value_type> __l,
|       |       ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot/usr/include/c++/15.1.0/bits/stl_vector.h:708:7: note: conversion of argument 1 would be ill-formed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot/usr/include/c++/15.1.0/bits/stl_vector.h:689:7: note: candidate 3: 'std::vector<_Tp, _Alloc>::vector(std::vector<_Tp, _Alloc>&&, std::__type_identity_t<_Alloc>&) [with _Tp = VkPresentModeKHR; _Alloc = std::allocator<VkPresentModeKHR>; std::__type_identity_t<_Alloc> = std::allocator<VkPresentModeKHR>]'
|   689 |       vector(vector&& __rv, const __type_identity_t<allocator_type>& __m)
|       |       ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot/usr/include/c++/15.1.0/bits/stl_vector.h:689:7: note: candidate expects 2 arguments, 1 provided
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot/usr/include/c++/15.1.0/bits/stl_vector.h:670:7: note: candidate 4: 'std::vector<_Tp, _Alloc>::vector(std::vector<_Tp, _Alloc>&&, const allocator_type&, std::false_type) [with _Tp = VkPresentModeKHR; _Alloc = std::allocator<VkPresentModeKHR>; allocator_type = std::allocator<VkPresentModeKHR>; std::false_type = std::false_type]'
|   670 |       vector(vector&& __rv, const allocator_type& __m, false_type)
|       |       ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot/usr/include/c++/15.1.0/bits/stl_vector.h:670:7: note: candidate expects 3 arguments, 1 provided
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot/usr/include/c++/15.1.0/bits/stl_vector.h:665:7: note: candidate 5: 'std::vector<_Tp, _Alloc>::vector(std::vector<_Tp, _Alloc>&&, const allocator_type&, std::true_type) [with _Tp = VkPresentModeKHR; _Alloc = std::allocator<VkPresentModeKHR>; allocator_type = std::allocator<VkPresentModeKHR>; std::true_type = std::true_type]'
|   665 |       vector(vector&& __rv, const allocator_type& __m, true_type) noexcept
|       |       ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot/usr/include/c++/15.1.0/bits/stl_vector.h:665:7: note: candidate expects 3 arguments, 1 provided
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot/usr/include/c++/15.1.0/bits/stl_vector.h:654:7: note: candidate 6: 'std::vector<_Tp, _Alloc>::vector(const std::vector<_Tp, _Alloc>&, std::__type_identity_t<_Alloc>&) [with _Tp = VkPresentModeKHR; _Alloc = std::allocator<VkPresentModeKHR>; std::__type_identity_t<_Alloc> = std::allocator<VkPresentModeKHR>]'
|   654 |       vector(const vector& __x, const __type_identity_t<allocator_type>& __a)
|       |       ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot/usr/include/c++/15.1.0/bits/stl_vector.h:654:7: note: candidate expects 2 arguments, 1 provided
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot/usr/include/c++/15.1.0/bits/stl_vector.h:650:7: note: candidate 7: 'std::vector<_Tp, _Alloc>::vector(std::vector<_Tp, _Alloc>&&) [with _Tp = VkPresentModeKHR; _Alloc = std::allocator<VkPresentModeKHR>]'
|   650 |       vector(vector&&) noexcept = default;
|       |       ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot/usr/include/c++/15.1.0/bits/stl_vector.h:650:7: note: conversion of argument 1 would be ill-formed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot/usr/include/c++/15.1.0/bits/stl_vector.h:631:7: note: candidate 8: 'std::vector<_Tp, _Alloc>::vector(const std::vector<_Tp, _Alloc>&) [with _Tp = VkPresentModeKHR; _Alloc = std::allocator<VkPresentModeKHR>]'
|   631 |       vector(const vector& __x)
|       |       ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot/usr/include/c++/15.1.0/bits/stl_vector.h:631:7: note: conversion of argument 1 would be ill-formed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot/usr/include/c++/15.1.0/bits/stl_vector.h:599:7: note: candidate 9: 'std::vector<_Tp, _Alloc>::vector(size_type, const value_type&, const allocator_type&) [with _Tp = VkPresentModeKHR; _Alloc = std::allocator<VkPresentModeKHR>; size_type = long unsigned int; value_type = VkPresentModeKHR; allocator_type = std::allocator<VkPresentModeKHR>]'
|   599 |       vector(size_type __n, const value_type& __value,
|       |       ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot/usr/include/c++/15.1.0/bits/stl_vector.h:599:7: note: candidate expects 3 arguments, 1 provided
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot/usr/include/c++/15.1.0/bits/stl_vector.h:586:7: note: candidate 10: 'std::vector<_Tp, _Alloc>::vector(size_type, const allocator_type&) [with _Tp = VkPresentModeKHR; _Alloc = std::allocator<VkPresentModeKHR>; size_type = long unsigned int; allocator_type = std::allocator<VkPresentModeKHR>]'
|   586 |       vector(size_type __n, const allocator_type& __a = allocator_type())
|       |       ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot/usr/include/c++/15.1.0/bits/stl_vector.h:586:7: note: conversion of argument 1 would be ill-formed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot/usr/include/c++/15.1.0/bits/stl_vector.h:572:7: note: candidate 11: 'std::vector<_Tp, _Alloc>::vector(const allocator_type&) [with _Tp = VkPresentModeKHR; _Alloc = std::allocator<VkPresentModeKHR>; allocator_type = std::allocator<VkPresentModeKHR>]'
|   572 |       vector(const allocator_type& __a) _GLIBCXX_NOEXCEPT
|       |       ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot/usr/include/c++/15.1.0/bits/stl_vector.h:572:7: note: conversion of argument 1 would be ill-formed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot/usr/include/c++/15.1.0/bits/stl_vector.h:561:7: note: candidate 12: 'std::vector<_Tp, _Alloc>::vector() [with _Tp = VkPresentModeKHR; _Alloc = std::allocator<VkPresentModeKHR>]'
|   561 |       vector() = default;
|       |       ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/recipe-sysroot/usr/include/c++/15.1.0/bits/stl_vector.h:561:7: note: candidate expects 0 arguments, 1 provided
| ninja: build stopped: subcommand failed.
| 
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/temp/run.do_compile.2916941:153 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/temp/run.do_compile.2916941, line 153
| 	#2: cmake_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/temp/run.do_compile.2916941, line 147
| 	#3: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/temp/run.do_compile.2916941, line 142
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/temp/run.do_compile.2916941, line 166
NOTE: recipe vulkan-tools-1.4.321.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1583 tasks of which 1572 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250801115908.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250801115908.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/temp/log.do_compile.2916941
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-tools-1.4.321.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/temp/run.do_compile.2916941' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.321.0/temp/log.do_compile.2916941
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb:do_compile) failed with exit code '1'

--===============5659183427150335996==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.4.313.0-1.4.321.0.patch"

RnJvbSAxNTc2ZDQxZTQyOTMzZmI1M2MxZDRhY2JmODRkYTZmYzMzMGFlNTMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAxMTo1OToyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi10b29sczogdXBncmFkZSAxLjQuMzEzLjAgLT4gMS40LjMyMS4wCgotLS0KIC4uLi97dnVs
a2FuLXRvb2xzXzEuNC4zMTMuMC5iYiA9PiB2dWxrYW4tdG9vbHNfMS40LjMyMS4wLmJifSAgfCA0
ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLXRvb2xzXzEuNC4zMTMu
MC5iYiA9PiB2dWxrYW4tdG9vbHNfMS40LjMyMS4wLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuNC4zMTMuMC5iYiBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuNC4zMjEuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2Fu
L3Z1bGthbi10b29sc18xLjQuMzEzLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuNC4zMjEuMC5iYgppbmRleCBjNzNlNWNhYTEzLi5hNDkx
NmJhOTc1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10
b29sc18xLjQuMzEzLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxr
YW4tdG9vbHNfMS40LjMyMS4wLmJiCkBAIC02LDggKzYsOCBAQCBTRUNUSU9OID0gImxpYnMiCiAK
IExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VO
U0UudHh0O21kNT0zYjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKLVNSQ19VUkkgPSAi
Z2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLVRvb2xzLmdpdDticmFuY2g9dnVs
a2FuLXNkay0xLjQuMzEzO3Byb3RvY29sPWh0dHBzIgotU1JDUkVWID0gImFkMmYwMTcwZjk0NjZm
YWRkOTZlM2ZkZDY1ZmFkMDJjZDNhMzczOWIiCitTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20v
S2hyb25vc0dyb3VwL1Z1bGthbi1Ub29scy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMi
CitTUkNSRVYgPSAiMDZhZTczYTNkYzNhMDM0NjY4MTdkODM3MDM1NTIwM2RhYzdiNzliMSIKIAog
aW5oZXJpdCBjbWFrZSBmZWF0dXJlc19jaGVjayBwa2djb25maWcKIEFOWV9PRl9ESVNUUk9fRkVB
VFVSRVMgPSAieDExIHdheWxhbmQiCi0tIAoyLjQ3LjEKCg==

--===============5659183427150335996==--

