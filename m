Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E48C54F55
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 07:24:33 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6071.1785309872355038202
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 00:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CwSLZCFD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AQqebZSl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019facc2bce6-c6ae2567-a79d-4f5f-8df9-f5fa4df0716b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785309871;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=othaNPSsiJSnFw9eWKuVNvGwQsMp2nEXL0/3FW08TuA=;
	b=CwSLZCFDZxJ22faJglojCIGtNr2oWBwByDcU8kFVeYz/Kx6k7Tj7/Akb4Z3zJSFT
	5ZqjTDAun0Q0RWTJ4GUMKWYN9C46guO7rsZp/POv3MqkOSHCSRHVLuSRuOTrH9f2zzY
	5h4r3AkFj+6plEb5tHkTtf5HlRRYARIYqDD1kWec=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785309871;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=othaNPSsiJSnFw9eWKuVNvGwQsMp2nEXL0/3FW08TuA=;
	b=AQqebZSl9D168rolA2cdlD4oJH8rawFY9KvVcYgLgm2BhT71btVaqbA38L+wAU+s
	VzY1FCV2olY6nEIF4he6v7vY3fl6RiuGtHPyQsVnCKWj3Ve7UxlwJ+BKVPbfM/VZKxa
	umcahI7id15Geu/pq8FUMAPwbDkfWZWvuUug1Tr0=
Content-Type: multipart/mixed; boundary="===============0668124941052467860=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-loader: upgrading to 1.4.357.0 FAILED
Message-ID: <0101019facc2bce6-c6ae2567-a79d-4f5f-8df9-f5fa4df0716b-000000@us-west-2.amazonses.com>
Date: Wed, 29 Jul 2026 07:24:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.29-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 07:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242252

--===============0668124941052467860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-loader* to *1.4.357.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-loader-upgrade-1.4.350.1-1.4.357.0.patch
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
From 9ffd49d273536ebcf356c240fbd9a4cfee55f91f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 29 Jul 2026 06:27:01 +0000
Subject: [PATCH] vulkan-loader: upgrade 1.4.350.1 -> 1.4.357.0

5f157b62e build: Update to header v1.4.357
e8b990859 Fix cJSON.c & .h to make clang-format-16 happy
95129070a terminate print_string_ptr output at the real end
2d396283a skip layers missing api_version or implementation_version
7b909b404 Fix errors from commit 8453647
bb0717c37 Update codeql in github actions to v4
5133fccfe bound icd debug list index by capacity in rollback and destroy
2feb31c48 break cyclic meta-layer recursion in loader_add_meta_layer
85fc45750 check khr_android_surface in terminator_CreateAndroidSurfaceKHR
6c47efce5 fix out-of-bounds read in windows_read_manifest_from_d3d_adapters
7ab4d368d gate debug create rollback icd destroy loop on reserved index
80ac6e1e5 reject metal surface creation when extension not enabled
2f8d700c4 Update codeql.yml to v4.36.3
5f72e1b8e zero grown entries in loader_resize_generic_list
9fd87c33d build: Update to header v1.4.356
0aa588e18 fix leaked loader_lock in terminator_CreateHeadlessSurfaceEXT
1baf96f69 reject over-long readlink result in loader_platform_executable_path
b56f8711b Remove support for meta layers enabling other meta layers
299c923e4 Add missing licenses, and adjust some missing copyright
0d210fdf8 build: Update to header v1.4.355
bb937b804 loader: Fix double free on Windows
e069cc27e clamp re-queried physical device count in setup_loader_term_phys_devs
d745850ce null-terminate registry value in windows_get_device_registry_entry
ef26bc764 fix out-of-bounds read in vk_string_validate on truncated utf-8
9a5f88e43 guard android/ios surfaces in DestroySurfaceKHR
848a2b27b clamp group physicalDeviceCount to VK_MAX_DEVICE_GROUP_SIZE
b1744af79 build(deps): bump actions/checkout from 6 to 7
ddaf5c7c2 clamp re-queried extension count in enumeration helpers
ef4ba15c0 clamp re-queried counts in terminator_EnumeratePhysicalDeviceGroups
449cd9cd6 null-terminate device name copies in linux device sort
255c7e3a1 check realloc result before zeroing grown bytes in loader_realloc
b14a119b0 use reserved index in debug messenger and report create rollback
5a5dc839e clamp emulated property copies to the caller-allocated count
b52703d43 Fix formatting in terminator.c
44bbf6e82 loader: Fix sparse format emulation array size
dc775506d log driverUUID instead of deviceUUID for missing device config
6056e5652 build(deps): bump actions/setup-python from 5 to 6
845364708 Use string lists for manifest search paths
8909da092 Check correct return value from realloc
f2eef0701 ci: Indent windows_arm64x to match the other jobs
a26ffce01 Add arm64x test to github actions
ea30f417c Add CMake code to support Arm64X builds
5f343b788 ci: Build and test arm64/arm64ec on Windows on Arm
5aee62b4b loader: Resolve armasm64 by full path for arm64 builds
f6cb6c96a tests: Compare proc-addr behavior, not identity, on arm64x
079c4b624 loader: Implement arm64ec adjustor thunks for unknown functions
8502778e3 loader: Add arm64ec/arm64x build configuration
92f423018 build: Update to header v1.4.354
9f37518d2 index pd_details by matc

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../{vulkan-loader_1.4.350.1.bb => vulkan-loader_1.4.357.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.4.350.1.bb => vulkan-loader_1.4.357.0.bb} (97%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.1.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb
similarity index 97%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb
index 1180cdc91c..1c21bea5e9 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "a9e72c66d5cb79911eb9a9063bf4016dd0a3a123"
+SRCREV = "5f157b62e333c63260d05d81bf66faa216ab0fb8"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.47.1


--===============0668124941052467860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 954 .bb files complete (0 cached, 954 parsed). 1983 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-543b92161926068f5172b335cac27fd6d6a59579"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:543b92161926068f5172b335cac27fd6d6a59579"
meta-yocto-bsp       
meta-poky            = "master:e4690557fb0fffcb5e9a86d1c1ebc550bb0da090"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 411 Local 389 Mirrors 0 Missed 22 Current 672 (94% match, 97% complete)
done.
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 8 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 901 of 1083 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 905 of 1083 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 914 of 1083 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 916 of 1083 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 923 of 1083 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-tools-native.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 924 of 1083 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 932 of 1083 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 942 of 1083 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.350.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 943 of 1083 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 948 of 1083 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 949 of 1083 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 953 of 1083 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe llvm-22.1.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.49-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe mesa-tools-native-2_26.1.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libdrm-2.4.134-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe elfutils-0.195-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glslang-native-1_1.4.350.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.49-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe llvm-22.1.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe mesa-tools-native-2_26.1.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1001 of 1083 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/makedepend_1.0.9.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1002 of 1083 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1007 of 1083 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1013 of 1083 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1014 of 1083 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/chrpath/chrpath_0.18.bb:do_create_recipe_spdx_setscene)
NOTE: recipe elfutils-0.195-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1059 of 1083 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1060 of 1083 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1061 of 1083 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1063 of 1083 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glslang-native-1_1.4.350.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe expat-2.8.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe makedepend-native-1_1.0.9-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe chrpath-native-0.18-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pyyaml-native-6.0.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-mako-native-1.3.12-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe llvm-native-22.1.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe wayland-native-1.26.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe makedepend-native-1_1.0.9-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe expat-2.8.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe chrpath-native-0.18-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1067 of 1083 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-mako-native-1.3.12-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-pyyaml-native-6.0.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe llvm-native-22.1.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe wayland-native-1.26.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1074 of 1083 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1076 of 1083 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 1759 of 2574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_recipe_qa)
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1083 of 1083 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_recipe_qa: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2434 of 2574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_create_recipe_spdx)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 2541 of 2574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_fetch)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2542 of 2574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_recipe_spdx)
NOTE: recipe mesa-2_26.1.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_fetch: Succeeded
NOTE: Running task 2543 of 2574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_unpack)
NOTE: Running task 2544 of 2574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_26.1.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_unpack: Succeeded
NOTE: Running task 2545 of 2574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_patch)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_patch: Succeeded
NOTE: Running task 2546 of 2574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2547 of 2574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_generate_toolchain_file)
NOTE: Running task 2548 of 2574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_populate_lic)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 2549 of 2574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_configure)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.4.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/au
 h/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_3.0.4.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['expat', 'gettext-minimal-native', 'glibc', 'libxml2', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'vulkan-headers', 'wayland', 'libpthread-stubs', 'libx11', 'libxau', 'libxcb', 'libxdmcp', 'libxext', 'libxrandr', 'libxrender', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'libffi', 'openssl-native', 'ncurses-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'make-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconf-native', 'pseudo-native', 'bzip2-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| The no-dev option is deprecated.  Use -Wno-author instead.
| -- The C compiler identification is GNU 16.1.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.357.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| CMake Error at CMakeLists.txt:56 (if):
|   if given arguments:
| 
|     "VERSION_GREATER" "1.4.357"
| 
|   Unknown arguments specified
| 
| 
| -- Configuring incomplete, errors occurred!
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.357.0/temp/run.do_configure.4032631:161 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.357.0/sources/vulkan-loader-1.4.357.0 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython3_EXECUTABLE:PATH=/srv/pokybuild
 /yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.357.0/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DBUILD_TESTS=OFF -DPYTHON_EXECUTABLE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/python3 -DASSEMBLER_WORKS=FALSE -DVulkanHeaders_INCLUDE_DIR=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.357.0/recipe-sysroot/usr/include -DVulkanRegistry_DIR=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.357.0/recipe-sysroot//usr/share -DBUILD_WSI_WAYLAND_SUPPORT=ON -DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.357.0/temp/run.do_configure.4032631, line 161
| 	#2: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.357.0/temp/run.do_configure.4032631, line 140
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.357.0/temp/run.do_configure.4032631, line 179
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2549 tasks of which 2538 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260729062646.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260729062646.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.357.0/temp/log.do_configure.4032631
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-loader-1.4.357.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.357.0/temp/run.do_configure.4032631' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.357.0/temp/log.do_configure.4032631
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_configure) failed with exit code '1'

--===============0668124941052467860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="vulkan-loader-changelog.txt"

Changelog for vulkan-loader: 1.4.350.1 -> 1.4.357.0

5f157b62e build: Update to header v1.4.357
e8b990859 Fix cJSON.c & .h to make clang-format-16 happy
95129070a terminate print_string_ptr output at the real end
2d396283a skip layers missing api_version or implementation_version
7b909b404 Fix errors from commit 8453647
bb0717c37 Update codeql in github actions to v4
5133fccfe bound icd debug list index by capacity in rollback and destroy
2feb31c48 break cyclic meta-layer recursion in loader_add_meta_layer
85fc45750 check khr_android_surface in terminator_CreateAndroidSurfaceKHR
6c47efce5 fix out-of-bounds read in windows_read_manifest_from_d3d_adapters
7ab4d368d gate debug create rollback icd destroy loop on reserved index
80ac6e1e5 reject metal surface creation when extension not enabled
2f8d700c4 Update codeql.yml to v4.36.3
5f72e1b8e zero grown entries in loader_resize_generic_list
9fd87c33d build: Update to header v1.4.356
0aa588e18 fix leaked loader_lock in terminator_CreateHeadlessSurfaceEXT
1baf96f69 reject over-long readlink result in loader_platform_executable_path
b56f8711b Remove support for meta layers enabling other meta layers
299c923e4 Add missing licenses, and adjust some missing copyright
0d210fdf8 build: Update to header v1.4.355
bb937b804 loader: Fix double free on Windows
e069cc27e clamp re-queried physical device count in setup_loader_term_phys_devs
d745850ce null-terminate registry value in windows_get_device_registry_entry
ef26bc764 fix out-of-bounds read in vk_string_validate on truncated utf-8
9a5f88e43 guard android/ios surfaces in DestroySurfaceKHR
848a2b27b clamp group physicalDeviceCount to VK_MAX_DEVICE_GROUP_SIZE
b1744af79 build(deps): bump actions/checkout from 6 to 7
ddaf5c7c2 clamp re-queried extension count in enumeration helpers
ef4ba15c0 clamp re-queried counts in terminator_EnumeratePhysicalDeviceGroups
449cd9cd6 null-terminate device name copies in linux device sort
255c7e3a1 check realloc result before zeroing grown bytes in loader_realloc
b14a119b0 use reserved index in debug messenger and report create rollback
5a5dc839e clamp emulated property copies to the caller-allocated count
b52703d43 Fix formatting in terminator.c
44bbf6e82 loader: Fix sparse format emulation array size
dc775506d log driverUUID instead of deviceUUID for missing device config
6056e5652 build(deps): bump actions/setup-python from 5 to 6
845364708 Use string lists for manifest search paths
8909da092 Check correct return value from realloc
f2eef0701 ci: Indent windows_arm64x to match the other jobs
a26ffce01 Add arm64x test to github actions
ea30f417c Add CMake code to support Arm64X builds
5f343b788 ci: Build and test arm64/arm64ec on Windows on Arm
5aee62b4b loader: Resolve armasm64 by full path for arm64 builds
f6cb6c96a tests: Compare proc-addr behavior, not identity, on arm64x
079c4b624 loader: Implement arm64ec adjustor thunks for unknown functions
8502778e3 loader: Add arm64ec/arm64x build configuration
92f423018 build: Update to header v1.4.354
9f37518d2 index pd_details by matched device in settings device config apply
78e38b99a build(deps): bump github/codeql-action from 4.36.1 to 4.36.2
dd42aa7fe size string copies by str_len in copy_str_to_string_list
18c25b6b2 Don't log null strings in VkInstanceCreateInfo
b3f623088 Initialize VkApplicationInfo in tests
ae6ae0178 loader: Log VkInstanceCreateInfo for debugging
8d0e69d7c Remove unused bools in loader_device
792ddbab1 heap overflow when appending oversized manifest paths
c17422ca6 loader: Match select/disable filters on full name
4b9fa87f4 Check handles in PhysicalDeviceFunctionErrorPath
fcbdd87a3 Ensure test_icd validates dispatchable handles
8a423e2e8 Remove unused function
3cafbb76d Fix test function returning invalid type
7d3c552c8 Remove test code .finish() as it is redundant
9d94f6607 Refactor test_icd to support multiple instances
e4bd12760 Make test layer physical devices dispatchable
52cf1b2ee Small cleanup of wrap objects test layer
55c2c47dd compute json suffix inside is_json to avoid out-of-bounds pointer
942f0dbde Cast to unsigned char before tolower in env var parsing
1025d2a5a build: Update to header v1.4.353
9fe2d47e9 build(deps): bump github/codeql-action from 4.36.0 to 4.36.1
bd74c3c89 bound name length in check_name_matches_filter_environment_var
cf0cf82ea loader: Fix missing bounds check in parse_id_filter_environment_var
0fdc7a4c7 loader: Propagate OOM from loader_add_to_ext_list in two call sites
70e3d876c fix: allocate additional_drivers with correct element type
121cfd052 tests: Fix overflow in vkCreateSharedSwapchainsKHR
48eaacc83 fix: vkCreateSharedSwapchains stale bad list check
19c64f958 build(deps): bump github/codeql-action from 4.35.5 to 4.36.0
e99951e80 build(deps): bump github/codeql-action from 4.35.4 to 4.35.5
ebc06b831 build: Update to header v1.4.352
1fbd783a8 build(deps): bump actions/checkout from 4 to 6
19bf529b3 build(deps): bump github/codeql-action from 4.35.3 to 4.35.4
9032bede9 chore: Cleanup REUSE
d34e10320 chore: Remove LICENSE_EXCEPTIONS.md
8e5fd19e4 chore: add REUSE compliance configuration
506124c4a build: Update to header v1.4.351
fc1daa956 Add AI-Assisted Contributions to CONTRIBUTING
073ca9f6f build(deps): bump github/codeql-action from 4.35.2 to 4.35.3

--===============0668124941052467860==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-loader-upgrade-1.4.350.1-1.4.357.0.patch"

RnJvbSA5ZmZkNDlkMjczNTM2ZWJjZjM1NmMyNDBmYmQ5YTRjZmVlNTVmOTFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjkgSnVsIDIwMjYgMDY6Mjc6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tbG9hZGVyOiB1cGdyYWRlIDEuNC4zNTAuMSAtPiAxLjQuMzU3LjAKCjVmMTU3YjYyZSBi
dWlsZDogVXBkYXRlIHRvIGhlYWRlciB2MS40LjM1NwplOGI5OTA4NTkgRml4IGNKU09OLmMgJiAu
aCB0byBtYWtlIGNsYW5nLWZvcm1hdC0xNiBoYXBweQo5NTEyOTA3MGEgdGVybWluYXRlIHByaW50
X3N0cmluZ19wdHIgb3V0cHV0IGF0IHRoZSByZWFsIGVuZAoyZDM5NjI4M2Egc2tpcCBsYXllcnMg
bWlzc2luZyBhcGlfdmVyc2lvbiBvciBpbXBsZW1lbnRhdGlvbl92ZXJzaW9uCjdiOTA5YjQwNCBG
aXggZXJyb3JzIGZyb20gY29tbWl0IDg0NTM2NDcKYmIwNzE3YzM3IFVwZGF0ZSBjb2RlcWwgaW4g
Z2l0aHViIGFjdGlvbnMgdG8gdjQKNTEzM2ZjY2ZlIGJvdW5kIGljZCBkZWJ1ZyBsaXN0IGluZGV4
IGJ5IGNhcGFjaXR5IGluIHJvbGxiYWNrIGFuZCBkZXN0cm95CjJmZWIzMWM0OCBicmVhayBjeWNs
aWMgbWV0YS1sYXllciByZWN1cnNpb24gaW4gbG9hZGVyX2FkZF9tZXRhX2xheWVyCjg1ZmM0NTc1
MCBjaGVjayBraHJfYW5kcm9pZF9zdXJmYWNlIGluIHRlcm1pbmF0b3JfQ3JlYXRlQW5kcm9pZFN1
cmZhY2VLSFIKNmM0N2VmY2U1IGZpeCBvdXQtb2YtYm91bmRzIHJlYWQgaW4gd2luZG93c19yZWFk
X21hbmlmZXN0X2Zyb21fZDNkX2FkYXB0ZXJzCjdhYjRkMzY4ZCBnYXRlIGRlYnVnIGNyZWF0ZSBy
b2xsYmFjayBpY2QgZGVzdHJveSBsb29wIG9uIHJlc2VydmVkIGluZGV4CjgwYWM2ZTFlNSByZWpl
Y3QgbWV0YWwgc3VyZmFjZSBjcmVhdGlvbiB3aGVuIGV4dGVuc2lvbiBub3QgZW5hYmxlZAoyZjhk
NzAwYzQgVXBkYXRlIGNvZGVxbC55bWwgdG8gdjQuMzYuMwo1ZjcyZTFiOGUgemVybyBncm93biBl
bnRyaWVzIGluIGxvYWRlcl9yZXNpemVfZ2VuZXJpY19saXN0CjlmZDg3YzMzZCBidWlsZDogVXBk
YXRlIHRvIGhlYWRlciB2MS40LjM1NgowYWE1ODhlMTggZml4IGxlYWtlZCBsb2FkZXJfbG9jayBp
biB0ZXJtaW5hdG9yX0NyZWF0ZUhlYWRsZXNzU3VyZmFjZUVYVAoxYmFmOTZmNjkgcmVqZWN0IG92
ZXItbG9uZyByZWFkbGluayByZXN1bHQgaW4gbG9hZGVyX3BsYXRmb3JtX2V4ZWN1dGFibGVfcGF0
aApiNTZmODcxMWIgUmVtb3ZlIHN1cHBvcnQgZm9yIG1ldGEgbGF5ZXJzIGVuYWJsaW5nIG90aGVy
IG1ldGEgbGF5ZXJzCjI5OWM5MjNlNCBBZGQgbWlzc2luZyBsaWNlbnNlcywgYW5kIGFkanVzdCBz
b21lIG1pc3NpbmcgY29weXJpZ2h0CjBkMjEwZmRmOCBidWlsZDogVXBkYXRlIHRvIGhlYWRlciB2
MS40LjM1NQpiYjkzN2I4MDQgbG9hZGVyOiBGaXggZG91YmxlIGZyZWUgb24gV2luZG93cwplMDY5
Y2MyN2UgY2xhbXAgcmUtcXVlcmllZCBwaHlzaWNhbCBkZXZpY2UgY291bnQgaW4gc2V0dXBfbG9h
ZGVyX3Rlcm1fcGh5c19kZXZzCmQ3NDU4NTBjZSBudWxsLXRlcm1pbmF0ZSByZWdpc3RyeSB2YWx1
ZSBpbiB3aW5kb3dzX2dldF9kZXZpY2VfcmVnaXN0cnlfZW50cnkKZWYyNmJjNzY0IGZpeCBvdXQt
b2YtYm91bmRzIHJlYWQgaW4gdmtfc3RyaW5nX3ZhbGlkYXRlIG9uIHRydW5jYXRlZCB1dGYtOAo5
YTVmODhlNDMgZ3VhcmQgYW5kcm9pZC9pb3Mgc3VyZmFjZXMgaW4gRGVzdHJveVN1cmZhY2VLSFIK
ODQ4YTJiMjdiIGNsYW1wIGdyb3VwIHBoeXNpY2FsRGV2aWNlQ291bnQgdG8gVktfTUFYX0RFVklD
RV9HUk9VUF9TSVpFCmIxNzQ0YWY3OSBidWlsZChkZXBzKTogYnVtcCBhY3Rpb25zL2NoZWNrb3V0
IGZyb20gNiB0byA3CmRkYWY1YzdjMiBjbGFtcCByZS1xdWVyaWVkIGV4dGVuc2lvbiBjb3VudCBp
biBlbnVtZXJhdGlvbiBoZWxwZXJzCmVmNGJhMTVjMCBjbGFtcCByZS1xdWVyaWVkIGNvdW50cyBp
biB0ZXJtaW5hdG9yX0VudW1lcmF0ZVBoeXNpY2FsRGV2aWNlR3JvdXBzCjQ0OWNkOWNkNiBudWxs
LXRlcm1pbmF0ZSBkZXZpY2UgbmFtZSBjb3BpZXMgaW4gbGludXggZGV2aWNlIHNvcnQKMjU1Yzdl
M2ExIGNoZWNrIHJlYWxsb2MgcmVzdWx0IGJlZm9yZSB6ZXJvaW5nIGdyb3duIGJ5dGVzIGluIGxv
YWRlcl9yZWFsbG9jCmIxNGExMTliMCB1c2UgcmVzZXJ2ZWQgaW5kZXggaW4gZGVidWcgbWVzc2Vu
Z2VyIGFuZCByZXBvcnQgY3JlYXRlIHJvbGxiYWNrCjVhNWRjODM5ZSBjbGFtcCBlbXVsYXRlZCBw
cm9wZXJ0eSBjb3BpZXMgdG8gdGhlIGNhbGxlci1hbGxvY2F0ZWQgY291bnQKYjUyNzAzZDQzIEZp
eCBmb3JtYXR0aW5nIGluIHRlcm1pbmF0b3IuYwo0NGJiZjZlODIgbG9hZGVyOiBGaXggc3BhcnNl
IGZvcm1hdCBlbXVsYXRpb24gYXJyYXkgc2l6ZQpkYzc3NTUwNmQgbG9nIGRyaXZlclVVSUQgaW5z
dGVhZCBvZiBkZXZpY2VVVUlEIGZvciBtaXNzaW5nIGRldmljZSBjb25maWcKNjA1NmU1NjUyIGJ1
aWxkKGRlcHMpOiBidW1wIGFjdGlvbnMvc2V0dXAtcHl0aG9uIGZyb20gNSB0byA2Cjg0NTM2NDcw
OCBVc2Ugc3RyaW5nIGxpc3RzIGZvciBtYW5pZmVzdCBzZWFyY2ggcGF0aHMKODkwOWRhMDkyIENo
ZWNrIGNvcnJlY3QgcmV0dXJuIHZhbHVlIGZyb20gcmVhbGxvYwpmMmVlZjA3MDEgY2k6IEluZGVu
dCB3aW5kb3dzX2FybTY0eCB0byBtYXRjaCB0aGUgb3RoZXIgam9icwphMjZmZmNlMDEgQWRkIGFy
bTY0eCB0ZXN0IHRvIGdpdGh1YiBhY3Rpb25zCmVhMzBmNDE3YyBBZGQgQ01ha2UgY29kZSB0byBz
dXBwb3J0IEFybTY0WCBidWlsZHMKNWYzNDNiNzg4IGNpOiBCdWlsZCBhbmQgdGVzdCBhcm02NC9h
cm02NGVjIG9uIFdpbmRvd3Mgb24gQXJtCjVhZWU2MmI0YiBsb2FkZXI6IFJlc29sdmUgYXJtYXNt
NjQgYnkgZnVsbCBwYXRoIGZvciBhcm02NCBidWlsZHMKZjZjYjZjOTZhIHRlc3RzOiBDb21wYXJl
IHByb2MtYWRkciBiZWhhdmlvciwgbm90IGlkZW50aXR5LCBvbiBhcm02NHgKMDc5YzRiNjI0IGxv
YWRlcjogSW1wbGVtZW50IGFybTY0ZWMgYWRqdXN0b3IgdGh1bmtzIGZvciB1bmtub3duIGZ1bmN0
aW9ucwo4NTAyNzc4ZTMgbG9hZGVyOiBBZGQgYXJtNjRlYy9hcm02NHggYnVpbGQgY29uZmlndXJh
dGlvbgo5MmY0MjMwMTggYnVpbGQ6IFVwZGF0ZSB0byBoZWFkZXIgdjEuNC4zNTQKOWYzNzUxOGQy
IGluZGV4IHBkX2RldGFpbHMgYnkgbWF0YwoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhj
ZWVkcyAzMDAwIGNoYXJhY3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4g
YW4gYXR0YWNobWVudCB0byB0aGUgQVVIIGVtYWlsXQotLS0KIC4uLi97dnVsa2FuLWxvYWRlcl8x
LjQuMzUwLjEuYmIgPT4gdnVsa2FuLWxvYWRlcl8xLjQuMzU3LjAuYmJ9ICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi1sb2FkZXJfMS40LjM1MC4xLmJiID0+IHZ1bGth
bi1sb2FkZXJfMS40LjM1Ny4wLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1n
cmFwaGljcy92dWxrYW4vdnVsa2FuLWxvYWRlcl8xLjQuMzUwLjEuYmIgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1sb2FkZXJfMS40LjM1Ny4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLWxv
YWRlcl8xLjQuMzUwLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4v
dnVsa2FuLWxvYWRlcl8xLjQuMzU3LjAuYmIKaW5kZXggMTE4MGNkYzkxYy4uMWMyMWJlYTVlOSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tbG9hZGVyXzEu
NC4zNTAuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1sb2Fk
ZXJfMS40LjM1Ny4wLmJiCkBAIC0xMCw3ICsxMCw3IEBAIFNFQ1RJT04gPSAibGlicyIKIExJQ0VO
U0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0
O21kNT03ZGJlZmVkMjMyNDI3NjBhYTM0NzVlZTQyODAxYzVhYyIKIFNSQ19VUkkgPSAiZ2l0Oi8v
Z2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLUxvYWRlci5naXQ7YnJhbmNoPW1haW47cHJv
dG9jb2w9aHR0cHM7dGFnPXZ1bGthbi1zZGstJHtQVn0iCi1TUkNSRVYgPSAiYTllNzJjNjZkNWNi
Nzk5MTFlYjlhOTA2M2JmNDAxNmRkMGEzYTEyMyIKK1NSQ1JFViA9ICI1ZjE1N2I2MmUzMzNjNjMy
NjBkMDVkODFiZjY2ZmFhMjE2YWIwZmI4IgogCiBSRVFVSVJFRF9ESVNUUk9fRkVBVFVSRVMgPSAi
dnVsa2FuIgogCi0tIAoyLjQ3LjEKCg==

--===============0668124941052467860==--

