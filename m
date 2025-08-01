Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54D0CA0EFE
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:13 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.88810.1754057271036723123
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=teFasCBP;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=IZyEIhoO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019865f61a81-b4ae2482-0adc-48f9-bd53-1974cd54b904-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057284;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=op/Z2M6lMKdWss174SHoTSjBJmMFwNhnhxaiuRwJFpc=;
	b=teFasCBP9wgAbilPzwwNVCg/A1ClDQON4knk/gWC+uI45QZBrNLyUNlRTX1psPfo
	6086T0KgGecKOlyzWAUU/5vTtLPHNxXcKf2BMCqJZIkBh6U0j7nryTHPzvo1n67+KyG
	KTi5zjedy47zTHm0r7RwtabFTsAAJCpwhlIifJ/U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057284;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=op/Z2M6lMKdWss174SHoTSjBJmMFwNhnhxaiuRwJFpc=;
	b=IZyEIhoOy5tDrem0iJJh1dDDp32KwvUGchjGMK4eD+3XS24bDQNk2TIdCmCOndPh
	ttqOzjO+yfSLRwycKZIinCtYoRou0xpnQXlxgTwqEFylsTbakwazd3yj7lbm0TUSQID
	zVXEXndITCkAS9Jl0M/w4Fl5Eka5GQ97JJrdiD8o=
Content-Type: multipart/mixed; boundary="===============8040723973190504473=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-loader: upgrading to 1.4.321.0 FAILED
Message-ID: <0101019865f61a81-b4ae2482-0adc-48f9-bd53-1974cd54b904-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:08:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221319

--===============8040723973190504473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-loader* to *1.4.321.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-loader-upgrade-1.4.313.0-1.4.321.0.patch
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
From 0805a7d3935e09012a8f70acd66c70d40f3829ee Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 11:49:33 +0000
Subject: [PATCH] vulkan-loader: upgrade 1.4.313.0 -> 1.4.321.0

---
 ...{vulkan-loader_1.4.313.0.bb => vulkan-loader_1.4.321.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.4.313.0.bb => vulkan-loader_1.4.321.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb
index c739ba15dc..a65f7fc32a 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.4.313;protocol=https"
-SRCREV = "fb78607414e154c7a5c01b23177ba719c8a44909"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=main;protocol=https"
+SRCREV = "da8d2caad9341ca8c5a7c3deba217d7da50a7c24"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.47.1


--===============8040723973190504473==
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
DISTRO_VERSION       = "5.2.99+snapshot-ba1a42be3987a7b10d531a0e9b65ebc833eb3ce1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ba1a42be3987a7b10d531a0e9b65ebc833eb3ce1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 435 Local 415 Mirrors 0 Missed 20 Current 529 (95% match, 97% complete)
Removing 5 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 639 of 964 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: Running setscene task 642 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 646 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 647 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 648 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_create_spdx_setscene)
NOTE: Running setscene task 649 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 653 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 654 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 658 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 664 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 665 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 667 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_create_spdx_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libclc-20.1.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_25.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-native-2_25.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 671 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libclc-20.1.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 673 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 674 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 677 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 678 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 679 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 682 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 683 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 684 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 685 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 689 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_25.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-native-2_25.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 693 of 964 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libclc-20.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe clang-20.1.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 703 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 711 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe clang-20.1.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 722 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 726 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-native-2_25.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 740 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 741 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 743 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 746 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 750 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 751 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 753 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: recipe clang-20.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 799 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe libclc-20.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 819 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 822 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1152 of 2698 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_recipe_qa)
NOTE: recipe mesa-native-2_25.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 824 of 964 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 827 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 828 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 829 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe libclc-20.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 833 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_recipe_qa: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libclc-20.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1402 of 2698 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-native-2_25.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1506 of 2698 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 846 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe mesa-native-2_25.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_25.1.6-r0: task do_fetch: Started
NOTE: Running task 1628 of 2698 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_fetch)
NOTE: Running setscene task 858 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_25.1.6-r0: task do_fetch: Succeeded
NOTE: Running task 1635 of 2698 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe mesa-2_25.1.6-r0: task do_write_config: Started
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_25.1.6-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_25.1.6-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 859 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_fetch: Succeeded
NOTE: Running task 1647 of 2698 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_unpack)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 864 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_unpack: Started
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 870 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_unpack: Succeeded
NOTE: Running task 1695 of 2698 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_patch)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_patch: Succeeded
NOTE: Running task 1696 of 2698 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1697 of 2698 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_generate_toolchain_file)
NOTE: Running task 1698 of 2698 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_populate_lic)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe clang-20.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 884 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 885 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_25.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1712 of 2698 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe binutils-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe clang-20.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe clang-20.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_25.1.6-r0: task do_patch: Started
NOTE: recipe binutils-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 890 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 891 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_25.1.6-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1721 of 2698 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: Running setscene task 893 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 894 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 895 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 896 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_25.1.6-r0: task do_rust_gen_targets: Started
NOTE: recipe mesa-2_25.1.6-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 898 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 899 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 900 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 901 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 902 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 905 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 907 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 908 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 910 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 911 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 913 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 916 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 917 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 918 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 919 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 920 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 921 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 922 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 923 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 924 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 926 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 927 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 929 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 931 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 932 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 934 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 936 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 938 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 940 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 943 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 944 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 946 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 947 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 948 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 950 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 952 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 956 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 957 of 964 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2483 of 2698 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2647 of 2698 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2672 of 2698 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_configure)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_configure: Succeeded
NOTE: Running task 2673 of 2698 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_compile)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build --target all --
| Change Dir: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build'
| 
| Run Build Command(s): ninja -v -j 16 all
| [1/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/
 work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibilit
 y=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/allocation.c.o -MF loader/CMakeFiles/vulkan.dir/allocation.c.o.d -o loader/CMakeFiles/vulkan.dir/allocation.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/allocation.c
| FAILED: [code=1] loader/CMakeFiles/vulkan.dir/allocation.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/co
 re2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidde
 n -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/allocation.c.o -MF loader/CMakeFiles/vulkan.dir/allocation.c.o.d -o loader/CMakeFiles/vulkan.dir/allocation.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/allocation.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/allocation.h:31,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/allocation.c:27:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:293:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   293 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:302:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   302 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:303:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   303 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkWaitForPresent2KHR'; did you mean 'PFN_vkWaitForPresentKHR'?
|   723 |     PFN_vkWaitForPresent2KHR WaitForPresent2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkWaitForPresentKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:733:5: error: unknown type name 'PFN_vkReleaseSwapchainImagesKHR'; did you mean 'PFN_vkReleaseSwapchainImagesEXT'?
|   733 |     PFN_vkReleaseSwapchainImagesKHR ReleaseSwapchainImagesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkReleaseSwapchainImagesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1175:5: error: unknown type name 'PFN_vkCreateTensorARM'; did you mean 'PFN_vkCreateRenderPass'?
|  1175 |     PFN_vkCreateTensorARM CreateTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1176:5: error: unknown type name 'PFN_vkDestroyTensorARM'; did you mean 'PFN_vkDestroyRenderPass'?
|  1176 |     PFN_vkDestroyTensorARM DestroyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1177:5: error: unknown type name 'PFN_vkCreateTensorViewARM'; did you mean 'PFN_vkCreateBufferView'?
|  1177 |     PFN_vkCreateTensorViewARM CreateTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1178:5: error: unknown type name 'PFN_vkDestroyTensorViewARM'; did you mean 'PFN_vkDestroyBufferView'?
|  1178 |     PFN_vkDestroyTensorViewARM DestroyTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1179:5: error: unknown type name 'PFN_vkGetTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetBufferMemoryRequirements2'?
|  1179 |     PFN_vkGetTensorMemoryRequirementsARM GetTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferMemoryRequirements2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1180:5: error: unknown type name 'PFN_vkBindTensorMemoryARM'; did you mean 'PFN_vkBindBufferMemory2'?
|  1180 |     PFN_vkBindTensorMemoryARM BindTensorMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkBindBufferMemory2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1181:5: error: unknown type name 'PFN_vkGetDeviceTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetDeviceBufferMemoryRequirementsKHR'?
|  1181 |     PFN_vkGetDeviceTensorMemoryRequirementsARM GetDeviceTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceBufferMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1182:5: error: unknown type name 'PFN_vkCmdCopyTensorARM'; did you mean 'PFN_vkCmdCopyBuffer2'?
|  1182 |     PFN_vkCmdCopyTensorARM CmdCopyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdCopyBuffer2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1183:5: error: unknown type name 'PFN_vkGetTensorOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT'?
|  1183 |     PFN_vkGetTensorOpaqueCaptureDescriptorDataARM GetTensorOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1184:5: error: unknown type name 'PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT'?
|  1184 |     PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM GetTensorViewOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1222:5: error: unknown type name 'PFN_vkCreateDataGraphPipelinesARM'; did you mean 'PFN_vkCreateGraphicsPipelines'?
|  1222 |     PFN_vkCreateDataGraphPipelinesARM CreateDataGraphPipelinesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateGraphicsPipelines
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1223:5: error: unknown type name 'PFN_vkCreateDataGraphPipelineSessionARM'
|  1223 |     PFN_vkCreateDataGraphPipelineSessionARM CreateDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1224:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM'
|  1224 |     PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM GetDataGraphPipelineSessionBindPointRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1225:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM'; did you mean 'PFN_vkGetVideoSessionMemoryRequirementsKHR'?
|  1225 |     PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM GetDataGraphPipelineSessionMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetVideoSessionMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1226:5: error: unknown type name 'PFN_vkBindDataGraphPipelineSessionMemoryARM'
|  1226 |     PFN_vkBindDataGraphPipelineSessionMemoryARM BindDataGraphPipelineSessionMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1227:5: error: unknown type name 'PFN_vkDestroyDataGraphPipelineSessionARM'
|  1227 |     PFN_vkDestroyDataGraphPipelineSessionARM DestroyDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1228:5: error: unknown type name 'PFN_vkCmdDispatchDataGraphARM'; did you mean 'PFN_vkCmdDispatchGraphAMDX'?
|  1228 |     PFN_vkCmdDispatchDataGraphARM CmdDispatchDataGraphARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdDispatchGraphAMDX
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1229:5: error: unknown type name 'PFN_vkGetDataGraphPipelineAvailablePropertiesARM'
|  1229 |     PFN_vkGetDataGraphPipelineAvailablePropertiesARM GetDataGraphPipelineAvailablePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1230:5: error: unknown type name 'PFN_vkGetDataGraphPipelinePropertiesARM'; did you mean 'PFN_vkGetPipelinePropertiesEXT'?
|  1230 |     PFN_vkGetDataGraphPipelinePropertiesARM GetDataGraphPipelinePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelinePropertiesEXT
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   481 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:490:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   490 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:491:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   491 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [2/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/
 work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibilit
 y=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/unknown_function_handling.c
| FAILED: [code=1] loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/co
 re2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidde
 n -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/unknown_function_handling.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/unknown_function_handling.h:27,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/unknown_function_handling.c:25:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:293:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   293 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:302:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   302 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:303:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   303 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkWaitForPresent2KHR'; did you mean 'PFN_vkWaitForPresentKHR'?
|   723 |     PFN_vkWaitForPresent2KHR WaitForPresent2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkWaitForPresentKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:733:5: error: unknown type name 'PFN_vkReleaseSwapchainImagesKHR'; did you mean 'PFN_vkReleaseSwapchainImagesEXT'?
|   733 |     PFN_vkReleaseSwapchainImagesKHR ReleaseSwapchainImagesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkReleaseSwapchainImagesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1175:5: error: unknown type name 'PFN_vkCreateTensorARM'; did you mean 'PFN_vkCreateRenderPass'?
|  1175 |     PFN_vkCreateTensorARM CreateTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1176:5: error: unknown type name 'PFN_vkDestroyTensorARM'; did you mean 'PFN_vkDestroyRenderPass'?
|  1176 |     PFN_vkDestroyTensorARM DestroyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1177:5: error: unknown type name 'PFN_vkCreateTensorViewARM'; did you mean 'PFN_vkCreateBufferView'?
|  1177 |     PFN_vkCreateTensorViewARM CreateTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1178:5: error: unknown type name 'PFN_vkDestroyTensorViewARM'; did you mean 'PFN_vkDestroyBufferView'?
|  1178 |     PFN_vkDestroyTensorViewARM DestroyTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1179:5: error: unknown type name 'PFN_vkGetTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetBufferMemoryRequirements2'?
|  1179 |     PFN_vkGetTensorMemoryRequirementsARM GetTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferMemoryRequirements2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1180:5: error: unknown type name 'PFN_vkBindTensorMemoryARM'; did you mean 'PFN_vkBindBufferMemory2'?
|  1180 |     PFN_vkBindTensorMemoryARM BindTensorMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkBindBufferMemory2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1181:5: error: unknown type name 'PFN_vkGetDeviceTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetDeviceBufferMemoryRequirementsKHR'?
|  1181 |     PFN_vkGetDeviceTensorMemoryRequirementsARM GetDeviceTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceBufferMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1182:5: error: unknown type name 'PFN_vkCmdCopyTensorARM'; did you mean 'PFN_vkCmdCopyBuffer2'?
|  1182 |     PFN_vkCmdCopyTensorARM CmdCopyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdCopyBuffer2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1183:5: error: unknown type name 'PFN_vkGetTensorOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT'?
|  1183 |     PFN_vkGetTensorOpaqueCaptureDescriptorDataARM GetTensorOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1184:5: error: unknown type name 'PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT'?
|  1184 |     PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM GetTensorViewOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1222:5: error: unknown type name 'PFN_vkCreateDataGraphPipelinesARM'; did you mean 'PFN_vkCreateGraphicsPipelines'?
|  1222 |     PFN_vkCreateDataGraphPipelinesARM CreateDataGraphPipelinesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateGraphicsPipelines
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1223:5: error: unknown type name 'PFN_vkCreateDataGraphPipelineSessionARM'
|  1223 |     PFN_vkCreateDataGraphPipelineSessionARM CreateDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1224:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM'
|  1224 |     PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM GetDataGraphPipelineSessionBindPointRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1225:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM'; did you mean 'PFN_vkGetVideoSessionMemoryRequirementsKHR'?
|  1225 |     PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM GetDataGraphPipelineSessionMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetVideoSessionMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1226:5: error: unknown type name 'PFN_vkBindDataGraphPipelineSessionMemoryARM'
|  1226 |     PFN_vkBindDataGraphPipelineSessionMemoryARM BindDataGraphPipelineSessionMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1227:5: error: unknown type name 'PFN_vkDestroyDataGraphPipelineSessionARM'
|  1227 |     PFN_vkDestroyDataGraphPipelineSessionARM DestroyDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1228:5: error: unknown type name 'PFN_vkCmdDispatchDataGraphARM'; did you mean 'PFN_vkCmdDispatchGraphAMDX'?
|  1228 |     PFN_vkCmdDispatchDataGraphARM CmdDispatchDataGraphARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdDispatchGraphAMDX
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1229:5: error: unknown type name 'PFN_vkGetDataGraphPipelineAvailablePropertiesARM'
|  1229 |     PFN_vkGetDataGraphPipelineAvailablePropertiesARM GetDataGraphPipelineAvailablePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1230:5: error: unknown type name 'PFN_vkGetDataGraphPipelinePropertiesARM'; did you mean 'PFN_vkGetPipelinePropertiesEXT'?
|  1230 |     PFN_vkGetDataGraphPipelinePropertiesARM GetDataGraphPipelinePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelinePropertiesEXT
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   481 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:490:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   490 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:491:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   491 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [3/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/
 work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibilit
 y=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/log.c.o -MF loader/CMakeFiles/vulkan.dir/log.c.o.d -o loader/CMakeFiles/vulkan.dir/log.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/log.c
| FAILED: [code=1] loader/CMakeFiles/vulkan.dir/log.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/co
 re2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidde
 n -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/log.c.o -MF loader/CMakeFiles/vulkan.dir/log.c.o.d -o loader/CMakeFiles/vulkan.dir/log.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/log.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/debug_utils.h:27,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/log.c:34:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:293:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   293 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:302:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   302 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:303:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   303 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkWaitForPresent2KHR'; did you mean 'PFN_vkWaitForPresentKHR'?
|   723 |     PFN_vkWaitForPresent2KHR WaitForPresent2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkWaitForPresentKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:733:5: error: unknown type name 'PFN_vkReleaseSwapchainImagesKHR'; did you mean 'PFN_vkReleaseSwapchainImagesEXT'?
|   733 |     PFN_vkReleaseSwapchainImagesKHR ReleaseSwapchainImagesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkReleaseSwapchainImagesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1175:5: error: unknown type name 'PFN_vkCreateTensorARM'; did you mean 'PFN_vkCreateRenderPass'?
|  1175 |     PFN_vkCreateTensorARM CreateTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1176:5: error: unknown type name 'PFN_vkDestroyTensorARM'; did you mean 'PFN_vkDestroyRenderPass'?
|  1176 |     PFN_vkDestroyTensorARM DestroyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1177:5: error: unknown type name 'PFN_vkCreateTensorViewARM'; did you mean 'PFN_vkCreateBufferView'?
|  1177 |     PFN_vkCreateTensorViewARM CreateTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1178:5: error: unknown type name 'PFN_vkDestroyTensorViewARM'; did you mean 'PFN_vkDestroyBufferView'?
|  1178 |     PFN_vkDestroyTensorViewARM DestroyTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1179:5: error: unknown type name 'PFN_vkGetTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetBufferMemoryRequirements2'?
|  1179 |     PFN_vkGetTensorMemoryRequirementsARM GetTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferMemoryRequirements2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1180:5: error: unknown type name 'PFN_vkBindTensorMemoryARM'; did you mean 'PFN_vkBindBufferMemory2'?
|  1180 |     PFN_vkBindTensorMemoryARM BindTensorMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkBindBufferMemory2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1181:5: error: unknown type name 'PFN_vkGetDeviceTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetDeviceBufferMemoryRequirementsKHR'?
|  1181 |     PFN_vkGetDeviceTensorMemoryRequirementsARM GetDeviceTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceBufferMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1182:5: error: unknown type name 'PFN_vkCmdCopyTensorARM'; did you mean 'PFN_vkCmdCopyBuffer2'?
|  1182 |     PFN_vkCmdCopyTensorARM CmdCopyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdCopyBuffer2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1183:5: error: unknown type name 'PFN_vkGetTensorOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT'?
|  1183 |     PFN_vkGetTensorOpaqueCaptureDescriptorDataARM GetTensorOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1184:5: error: unknown type name 'PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT'?
|  1184 |     PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM GetTensorViewOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1222:5: error: unknown type name 'PFN_vkCreateDataGraphPipelinesARM'; did you mean 'PFN_vkCreateGraphicsPipelines'?
|  1222 |     PFN_vkCreateDataGraphPipelinesARM CreateDataGraphPipelinesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateGraphicsPipelines
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1223:5: error: unknown type name 'PFN_vkCreateDataGraphPipelineSessionARM'
|  1223 |     PFN_vkCreateDataGraphPipelineSessionARM CreateDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1224:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM'
|  1224 |     PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM GetDataGraphPipelineSessionBindPointRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1225:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM'; did you mean 'PFN_vkGetVideoSessionMemoryRequirementsKHR'?
|  1225 |     PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM GetDataGraphPipelineSessionMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetVideoSessionMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1226:5: error: unknown type name 'PFN_vkBindDataGraphPipelineSessionMemoryARM'
|  1226 |     PFN_vkBindDataGraphPipelineSessionMemoryARM BindDataGraphPipelineSessionMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1227:5: error: unknown type name 'PFN_vkDestroyDataGraphPipelineSessionARM'
|  1227 |     PFN_vkDestroyDataGraphPipelineSessionARM DestroyDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1228:5: error: unknown type name 'PFN_vkCmdDispatchDataGraphARM'; did you mean 'PFN_vkCmdDispatchGraphAMDX'?
|  1228 |     PFN_vkCmdDispatchDataGraphARM CmdDispatchDataGraphARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdDispatchGraphAMDX
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1229:5: error: unknown type name 'PFN_vkGetDataGraphPipelineAvailablePropertiesARM'
|  1229 |     PFN_vkGetDataGraphPipelineAvailablePropertiesARM GetDataGraphPipelineAvailablePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1230:5: error: unknown type name 'PFN_vkGetDataGraphPipelinePropertiesARM'; did you mean 'PFN_vkGetPipelinePropertiesEXT'?
|  1230 |     PFN_vkGetDataGraphPipelinePropertiesARM GetDataGraphPipelinePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelinePropertiesEXT
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   481 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:490:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   490 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:491:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   491 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [4/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/
 work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibilit
 y=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader_linux.c.o -MF loader/CMakeFiles/vulkan.dir/loader_linux.c.o.d -o loader/CMakeFiles/vulkan.dir/loader_linux.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_linux.c
| FAILED: [code=1] loader/CMakeFiles/vulkan.dir/loader_linux.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/co
 re2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidde
 n -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader_linux.c.o -MF loader/CMakeFiles/vulkan.dir/loader_linux.c.o.d -o loader/CMakeFiles/vulkan.dir/loader_linux.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_linux.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_linux.h:27,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_linux.c:30:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:293:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   293 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:302:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   302 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:303:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   303 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkWaitForPresent2KHR'; did you mean 'PFN_vkWaitForPresentKHR'?
|   723 |     PFN_vkWaitForPresent2KHR WaitForPresent2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkWaitForPresentKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:733:5: error: unknown type name 'PFN_vkReleaseSwapchainImagesKHR'; did you mean 'PFN_vkReleaseSwapchainImagesEXT'?
|   733 |     PFN_vkReleaseSwapchainImagesKHR ReleaseSwapchainImagesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkReleaseSwapchainImagesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1175:5: error: unknown type name 'PFN_vkCreateTensorARM'; did you mean 'PFN_vkCreateRenderPass'?
|  1175 |     PFN_vkCreateTensorARM CreateTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1176:5: error: unknown type name 'PFN_vkDestroyTensorARM'; did you mean 'PFN_vkDestroyRenderPass'?
|  1176 |     PFN_vkDestroyTensorARM DestroyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1177:5: error: unknown type name 'PFN_vkCreateTensorViewARM'; did you mean 'PFN_vkCreateBufferView'?
|  1177 |     PFN_vkCreateTensorViewARM CreateTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1178:5: error: unknown type name 'PFN_vkDestroyTensorViewARM'; did you mean 'PFN_vkDestroyBufferView'?
|  1178 |     PFN_vkDestroyTensorViewARM DestroyTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1179:5: error: unknown type name 'PFN_vkGetTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetBufferMemoryRequirements2'?
|  1179 |     PFN_vkGetTensorMemoryRequirementsARM GetTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferMemoryRequirements2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1180:5: error: unknown type name 'PFN_vkBindTensorMemoryARM'; did you mean 'PFN_vkBindBufferMemory2'?
|  1180 |     PFN_vkBindTensorMemoryARM BindTensorMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkBindBufferMemory2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1181:5: error: unknown type name 'PFN_vkGetDeviceTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetDeviceBufferMemoryRequirementsKHR'?
|  1181 |     PFN_vkGetDeviceTensorMemoryRequirementsARM GetDeviceTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceBufferMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1182:5: error: unknown type name 'PFN_vkCmdCopyTensorARM'; did you mean 'PFN_vkCmdCopyBuffer2'?
|  1182 |     PFN_vkCmdCopyTensorARM CmdCopyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdCopyBuffer2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1183:5: error: unknown type name 'PFN_vkGetTensorOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT'?
|  1183 |     PFN_vkGetTensorOpaqueCaptureDescriptorDataARM GetTensorOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1184:5: error: unknown type name 'PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT'?
|  1184 |     PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM GetTensorViewOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1222:5: error: unknown type name 'PFN_vkCreateDataGraphPipelinesARM'; did you mean 'PFN_vkCreateGraphicsPipelines'?
|  1222 |     PFN_vkCreateDataGraphPipelinesARM CreateDataGraphPipelinesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateGraphicsPipelines
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1223:5: error: unknown type name 'PFN_vkCreateDataGraphPipelineSessionARM'
|  1223 |     PFN_vkCreateDataGraphPipelineSessionARM CreateDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1224:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM'
|  1224 |     PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM GetDataGraphPipelineSessionBindPointRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1225:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM'; did you mean 'PFN_vkGetVideoSessionMemoryRequirementsKHR'?
|  1225 |     PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM GetDataGraphPipelineSessionMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetVideoSessionMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1226:5: error: unknown type name 'PFN_vkBindDataGraphPipelineSessionMemoryARM'
|  1226 |     PFN_vkBindDataGraphPipelineSessionMemoryARM BindDataGraphPipelineSessionMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1227:5: error: unknown type name 'PFN_vkDestroyDataGraphPipelineSessionARM'
|  1227 |     PFN_vkDestroyDataGraphPipelineSessionARM DestroyDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1228:5: error: unknown type name 'PFN_vkCmdDispatchDataGraphARM'; did you mean 'PFN_vkCmdDispatchGraphAMDX'?
|  1228 |     PFN_vkCmdDispatchDataGraphARM CmdDispatchDataGraphARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdDispatchGraphAMDX
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1229:5: error: unknown type name 'PFN_vkGetDataGraphPipelineAvailablePropertiesARM'
|  1229 |     PFN_vkGetDataGraphPipelineAvailablePropertiesARM GetDataGraphPipelineAvailablePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1230:5: error: unknown type name 'PFN_vkGetDataGraphPipelinePropertiesARM'; did you mean 'PFN_vkGetPipelinePropertiesEXT'?
|  1230 |     PFN_vkGetDataGraphPipelinePropertiesARM GetDataGraphPipelinePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelinePropertiesEXT
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   481 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:490:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   490 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:491:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   491 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [5/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/
 work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibilit
 y=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/extension_manual.c
| FAILED: [code=1] loader/CMakeFiles/vulkan.dir/extension_manual.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/co
 re2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidde
 n -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/extension_manual.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/allocation.h:31,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/extension_manual.c:29:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:293:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   293 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:302:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   302 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:303:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   303 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkWaitForPresent2KHR'; did you mean 'PFN_vkWaitForPresentKHR'?
|   723 |     PFN_vkWaitForPresent2KHR WaitForPresent2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkWaitForPresentKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:733:5: error: unknown type name 'PFN_vkReleaseSwapchainImagesKHR'; did you mean 'PFN_vkReleaseSwapchainImagesEXT'?
|   733 |     PFN_vkReleaseSwapchainImagesKHR ReleaseSwapchainImagesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkReleaseSwapchainImagesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1175:5: error: unknown type name 'PFN_vkCreateTensorARM'; did you mean 'PFN_vkCreateRenderPass'?
|  1175 |     PFN_vkCreateTensorARM CreateTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1176:5: error: unknown type name 'PFN_vkDestroyTensorARM'; did you mean 'PFN_vkDestroyRenderPass'?
|  1176 |     PFN_vkDestroyTensorARM DestroyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1177:5: error: unknown type name 'PFN_vkCreateTensorViewARM'; did you mean 'PFN_vkCreateBufferView'?
|  1177 |     PFN_vkCreateTensorViewARM CreateTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1178:5: error: unknown type name 'PFN_vkDestroyTensorViewARM'; did you mean 'PFN_vkDestroyBufferView'?
|  1178 |     PFN_vkDestroyTensorViewARM DestroyTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1179:5: error: unknown type name 'PFN_vkGetTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetBufferMemoryRequirements2'?
|  1179 |     PFN_vkGetTensorMemoryRequirementsARM GetTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferMemoryRequirements2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1180:5: error: unknown type name 'PFN_vkBindTensorMemoryARM'; did you mean 'PFN_vkBindBufferMemory2'?
|  1180 |     PFN_vkBindTensorMemoryARM BindTensorMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkBindBufferMemory2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1181:5: error: unknown type name 'PFN_vkGetDeviceTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetDeviceBufferMemoryRequirementsKHR'?
|  1181 |     PFN_vkGetDeviceTensorMemoryRequirementsARM GetDeviceTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceBufferMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1182:5: error: unknown type name 'PFN_vkCmdCopyTensorARM'; did you mean 'PFN_vkCmdCopyBuffer2'?
|  1182 |     PFN_vkCmdCopyTensorARM CmdCopyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdCopyBuffer2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1183:5: error: unknown type name 'PFN_vkGetTensorOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT'?
|  1183 |     PFN_vkGetTensorOpaqueCaptureDescriptorDataARM GetTensorOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1184:5: error: unknown type name 'PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT'?
|  1184 |     PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM GetTensorViewOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1222:5: error: unknown type name 'PFN_vkCreateDataGraphPipelinesARM'; did you mean 'PFN_vkCreateGraphicsPipelines'?
|  1222 |     PFN_vkCreateDataGraphPipelinesARM CreateDataGraphPipelinesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateGraphicsPipelines
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1223:5: error: unknown type name 'PFN_vkCreateDataGraphPipelineSessionARM'
|  1223 |     PFN_vkCreateDataGraphPipelineSessionARM CreateDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1224:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM'
|  1224 |     PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM GetDataGraphPipelineSessionBindPointRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1225:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM'; did you mean 'PFN_vkGetVideoSessionMemoryRequirementsKHR'?
|  1225 |     PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM GetDataGraphPipelineSessionMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetVideoSessionMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1226:5: error: unknown type name 'PFN_vkBindDataGraphPipelineSessionMemoryARM'
|  1226 |     PFN_vkBindDataGraphPipelineSessionMemoryARM BindDataGraphPipelineSessionMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1227:5: error: unknown type name 'PFN_vkDestroyDataGraphPipelineSessionARM'
|  1227 |     PFN_vkDestroyDataGraphPipelineSessionARM DestroyDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1228:5: error: unknown type name 'PFN_vkCmdDispatchDataGraphARM'; did you mean 'PFN_vkCmdDispatchGraphAMDX'?
|  1228 |     PFN_vkCmdDispatchDataGraphARM CmdDispatchDataGraphARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdDispatchGraphAMDX
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1229:5: error: unknown type name 'PFN_vkGetDataGraphPipelineAvailablePropertiesARM'
|  1229 |     PFN_vkGetDataGraphPipelineAvailablePropertiesARM GetDataGraphPipelineAvailablePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1230:5: error: unknown type name 'PFN_vkGetDataGraphPipelinePropertiesARM'; did you mean 'PFN_vkGetPipelinePropertiesEXT'?
|  1230 |     PFN_vkGetDataGraphPipelinePropertiesARM GetDataGraphPipelinePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelinePropertiesEXT
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   481 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:490:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   490 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:491:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   491 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [6/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/
 work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibilit
 y=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/terminator.c.o -MF loader/CMakeFiles/vulkan.dir/terminator.c.o.d -o loader/CMakeFiles/vulkan.dir/terminator.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/terminator.c
| FAILED: [code=1] loader/CMakeFiles/vulkan.dir/terminator.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/co
 re2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidde
 n -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/terminator.c.o -MF loader/CMakeFiles/vulkan.dir/terminator.c.o.d -o loader/CMakeFiles/vulkan.dir/terminator.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/terminator.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/terminator.c:34:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:293:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   293 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:302:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   302 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:303:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   303 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkWaitForPresent2KHR'; did you mean 'PFN_vkWaitForPresentKHR'?
|   723 |     PFN_vkWaitForPresent2KHR WaitForPresent2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkWaitForPresentKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:733:5: error: unknown type name 'PFN_vkReleaseSwapchainImagesKHR'; did you mean 'PFN_vkReleaseSwapchainImagesEXT'?
|   733 |     PFN_vkReleaseSwapchainImagesKHR ReleaseSwapchainImagesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkReleaseSwapchainImagesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1175:5: error: unknown type name 'PFN_vkCreateTensorARM'; did you mean 'PFN_vkCreateRenderPass'?
|  1175 |     PFN_vkCreateTensorARM CreateTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1176:5: error: unknown type name 'PFN_vkDestroyTensorARM'; did you mean 'PFN_vkDestroyRenderPass'?
|  1176 |     PFN_vkDestroyTensorARM DestroyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1177:5: error: unknown type name 'PFN_vkCreateTensorViewARM'; did you mean 'PFN_vkCreateBufferView'?
|  1177 |     PFN_vkCreateTensorViewARM CreateTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1178:5: error: unknown type name 'PFN_vkDestroyTensorViewARM'; did you mean 'PFN_vkDestroyBufferView'?
|  1178 |     PFN_vkDestroyTensorViewARM DestroyTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1179:5: error: unknown type name 'PFN_vkGetTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetBufferMemoryRequirements2'?
|  1179 |     PFN_vkGetTensorMemoryRequirementsARM GetTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferMemoryRequirements2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1180:5: error: unknown type name 'PFN_vkBindTensorMemoryARM'; did you mean 'PFN_vkBindBufferMemory2'?
|  1180 |     PFN_vkBindTensorMemoryARM BindTensorMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkBindBufferMemory2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1181:5: error: unknown type name 'PFN_vkGetDeviceTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetDeviceBufferMemoryRequirementsKHR'?
|  1181 |     PFN_vkGetDeviceTensorMemoryRequirementsARM GetDeviceTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceBufferMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1182:5: error: unknown type name 'PFN_vkCmdCopyTensorARM'; did you mean 'PFN_vkCmdCopyBuffer2'?
|  1182 |     PFN_vkCmdCopyTensorARM CmdCopyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdCopyBuffer2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1183:5: error: unknown type name 'PFN_vkGetTensorOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT'?
|  1183 |     PFN_vkGetTensorOpaqueCaptureDescriptorDataARM GetTensorOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1184:5: error: unknown type name 'PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT'?
|  1184 |     PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM GetTensorViewOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1222:5: error: unknown type name 'PFN_vkCreateDataGraphPipelinesARM'; did you mean 'PFN_vkCreateGraphicsPipelines'?
|  1222 |     PFN_vkCreateDataGraphPipelinesARM CreateDataGraphPipelinesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateGraphicsPipelines
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1223:5: error: unknown type name 'PFN_vkCreateDataGraphPipelineSessionARM'
|  1223 |     PFN_vkCreateDataGraphPipelineSessionARM CreateDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1224:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM'
|  1224 |     PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM GetDataGraphPipelineSessionBindPointRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1225:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM'; did you mean 'PFN_vkGetVideoSessionMemoryRequirementsKHR'?
|  1225 |     PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM GetDataGraphPipelineSessionMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetVideoSessionMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1226:5: error: unknown type name 'PFN_vkBindDataGraphPipelineSessionMemoryARM'
|  1226 |     PFN_vkBindDataGraphPipelineSessionMemoryARM BindDataGraphPipelineSessionMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1227:5: error: unknown type name 'PFN_vkDestroyDataGraphPipelineSessionARM'
|  1227 |     PFN_vkDestroyDataGraphPipelineSessionARM DestroyDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1228:5: error: unknown type name 'PFN_vkCmdDispatchDataGraphARM'; did you mean 'PFN_vkCmdDispatchGraphAMDX'?
|  1228 |     PFN_vkCmdDispatchDataGraphARM CmdDispatchDataGraphARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdDispatchGraphAMDX
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1229:5: error: unknown type name 'PFN_vkGetDataGraphPipelineAvailablePropertiesARM'
|  1229 |     PFN_vkGetDataGraphPipelineAvailablePropertiesARM GetDataGraphPipelineAvailablePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1230:5: error: unknown type name 'PFN_vkGetDataGraphPipelinePropertiesARM'; did you mean 'PFN_vkGetPipelinePropertiesEXT'?
|  1230 |     PFN_vkGetDataGraphPipelinePropertiesARM GetDataGraphPipelinePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelinePropertiesEXT
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   481 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:490:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   490 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:491:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   491 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [7/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/
 work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibilit
 y=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader_environment.c.o -MF loader/CMakeFiles/vulkan.dir/loader_environment.c.o.d -o loader/CMakeFiles/vulkan.dir/loader_environment.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_environment.c
| FAILED: [code=1] loader/CMakeFiles/vulkan.dir/loader_environment.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/co
 re2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidde
 n -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader_environment.c.o -MF loader/CMakeFiles/vulkan.dir/loader_environment.c.o.d -o loader/CMakeFiles/vulkan.dir/loader_environment.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_environment.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_environment.h:31,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_environment.c:29:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:293:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   293 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:302:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   302 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:303:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   303 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkWaitForPresent2KHR'; did you mean 'PFN_vkWaitForPresentKHR'?
|   723 |     PFN_vkWaitForPresent2KHR WaitForPresent2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkWaitForPresentKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:733:5: error: unknown type name 'PFN_vkReleaseSwapchainImagesKHR'; did you mean 'PFN_vkReleaseSwapchainImagesEXT'?
|   733 |     PFN_vkReleaseSwapchainImagesKHR ReleaseSwapchainImagesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkReleaseSwapchainImagesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1175:5: error: unknown type name 'PFN_vkCreateTensorARM'; did you mean 'PFN_vkCreateRenderPass'?
|  1175 |     PFN_vkCreateTensorARM CreateTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1176:5: error: unknown type name 'PFN_vkDestroyTensorARM'; did you mean 'PFN_vkDestroyRenderPass'?
|  1176 |     PFN_vkDestroyTensorARM DestroyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1177:5: error: unknown type name 'PFN_vkCreateTensorViewARM'; did you mean 'PFN_vkCreateBufferView'?
|  1177 |     PFN_vkCreateTensorViewARM CreateTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1178:5: error: unknown type name 'PFN_vkDestroyTensorViewARM'; did you mean 'PFN_vkDestroyBufferView'?
|  1178 |     PFN_vkDestroyTensorViewARM DestroyTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1179:5: error: unknown type name 'PFN_vkGetTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetBufferMemoryRequirements2'?
|  1179 |     PFN_vkGetTensorMemoryRequirementsARM GetTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferMemoryRequirements2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1180:5: error: unknown type name 'PFN_vkBindTensorMemoryARM'; did you mean 'PFN_vkBindBufferMemory2'?
|  1180 |     PFN_vkBindTensorMemoryARM BindTensorMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkBindBufferMemory2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1181:5: error: unknown type name 'PFN_vkGetDeviceTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetDeviceBufferMemoryRequirementsKHR'?
|  1181 |     PFN_vkGetDeviceTensorMemoryRequirementsARM GetDeviceTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceBufferMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1182:5: error: unknown type name 'PFN_vkCmdCopyTensorARM'; did you mean 'PFN_vkCmdCopyBuffer2'?
|  1182 |     PFN_vkCmdCopyTensorARM CmdCopyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdCopyBuffer2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1183:5: error: unknown type name 'PFN_vkGetTensorOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT'?
|  1183 |     PFN_vkGetTensorOpaqueCaptureDescriptorDataARM GetTensorOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1184:5: error: unknown type name 'PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT'?
|  1184 |     PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM GetTensorViewOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1222:5: error: unknown type name 'PFN_vkCreateDataGraphPipelinesARM'; did you mean 'PFN_vkCreateGraphicsPipelines'?
|  1222 |     PFN_vkCreateDataGraphPipelinesARM CreateDataGraphPipelinesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateGraphicsPipelines
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1223:5: error: unknown type name 'PFN_vkCreateDataGraphPipelineSessionARM'
|  1223 |     PFN_vkCreateDataGraphPipelineSessionARM CreateDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1224:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM'
|  1224 |     PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM GetDataGraphPipelineSessionBindPointRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1225:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM'; did you mean 'PFN_vkGetVideoSessionMemoryRequirementsKHR'?
|  1225 |     PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM GetDataGraphPipelineSessionMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetVideoSessionMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1226:5: error: unknown type name 'PFN_vkBindDataGraphPipelineSessionMemoryARM'
|  1226 |     PFN_vkBindDataGraphPipelineSessionMemoryARM BindDataGraphPipelineSessionMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1227:5: error: unknown type name 'PFN_vkDestroyDataGraphPipelineSessionARM'
|  1227 |     PFN_vkDestroyDataGraphPipelineSessionARM DestroyDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1228:5: error: unknown type name 'PFN_vkCmdDispatchDataGraphARM'; did you mean 'PFN_vkCmdDispatchGraphAMDX'?
|  1228 |     PFN_vkCmdDispatchDataGraphARM CmdDispatchDataGraphARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdDispatchGraphAMDX
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1229:5: error: unknown type name 'PFN_vkGetDataGraphPipelineAvailablePropertiesARM'
|  1229 |     PFN_vkGetDataGraphPipelineAvailablePropertiesARM GetDataGraphPipelineAvailablePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1230:5: error: unknown type name 'PFN_vkGetDataGraphPipelinePropertiesARM'; did you mean 'PFN_vkGetPipelinePropertiesEXT'?
|  1230 |     PFN_vkGetDataGraphPipelinePropertiesARM GetDataGraphPipelinePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelinePropertiesEXT
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   481 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:490:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   490 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:491:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   491 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [8/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/
 work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibilit
 y=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/settings.c.o -MF loader/CMakeFiles/vulkan.dir/settings.c.o.d -o loader/CMakeFiles/vulkan.dir/settings.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/settings.c
| FAILED: [code=1] loader/CMakeFiles/vulkan.dir/settings.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/co
 re2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidde
 n -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/settings.c.o -MF loader/CMakeFiles/vulkan.dir/settings.c.o.d -o loader/CMakeFiles/vulkan.dir/settings.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/settings.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/allocation.h:31,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/settings.c:26:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:293:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   293 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:302:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   302 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:303:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   303 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkWaitForPresent2KHR'; did you mean 'PFN_vkWaitForPresentKHR'?
|   723 |     PFN_vkWaitForPresent2KHR WaitForPresent2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkWaitForPresentKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:733:5: error: unknown type name 'PFN_vkReleaseSwapchainImagesKHR'; did you mean 'PFN_vkReleaseSwapchainImagesEXT'?
|   733 |     PFN_vkReleaseSwapchainImagesKHR ReleaseSwapchainImagesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkReleaseSwapchainImagesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1175:5: error: unknown type name 'PFN_vkCreateTensorARM'; did you mean 'PFN_vkCreateRenderPass'?
|  1175 |     PFN_vkCreateTensorARM CreateTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1176:5: error: unknown type name 'PFN_vkDestroyTensorARM'; did you mean 'PFN_vkDestroyRenderPass'?
|  1176 |     PFN_vkDestroyTensorARM DestroyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1177:5: error: unknown type name 'PFN_vkCreateTensorViewARM'; did you mean 'PFN_vkCreateBufferView'?
|  1177 |     PFN_vkCreateTensorViewARM CreateTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1178:5: error: unknown type name 'PFN_vkDestroyTensorViewARM'; did you mean 'PFN_vkDestroyBufferView'?
|  1178 |     PFN_vkDestroyTensorViewARM DestroyTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1179:5: error: unknown type name 'PFN_vkGetTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetBufferMemoryRequirements2'?
|  1179 |     PFN_vkGetTensorMemoryRequirementsARM GetTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferMemoryRequirements2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1180:5: error: unknown type name 'PFN_vkBindTensorMemoryARM'; did you mean 'PFN_vkBindBufferMemory2'?
|  1180 |     PFN_vkBindTensorMemoryARM BindTensorMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkBindBufferMemory2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1181:5: error: unknown type name 'PFN_vkGetDeviceTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetDeviceBufferMemoryRequirementsKHR'?
|  1181 |     PFN_vkGetDeviceTensorMemoryRequirementsARM GetDeviceTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceBufferMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1182:5: error: unknown type name 'PFN_vkCmdCopyTensorARM'; did you mean 'PFN_vkCmdCopyBuffer2'?
|  1182 |     PFN_vkCmdCopyTensorARM CmdCopyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdCopyBuffer2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1183:5: error: unknown type name 'PFN_vkGetTensorOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT'?
|  1183 |     PFN_vkGetTensorOpaqueCaptureDescriptorDataARM GetTensorOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1184:5: error: unknown type name 'PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT'?
|  1184 |     PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM GetTensorViewOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1222:5: error: unknown type name 'PFN_vkCreateDataGraphPipelinesARM'; did you mean 'PFN_vkCreateGraphicsPipelines'?
|  1222 |     PFN_vkCreateDataGraphPipelinesARM CreateDataGraphPipelinesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateGraphicsPipelines
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1223:5: error: unknown type name 'PFN_vkCreateDataGraphPipelineSessionARM'
|  1223 |     PFN_vkCreateDataGraphPipelineSessionARM CreateDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1224:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM'
|  1224 |     PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM GetDataGraphPipelineSessionBindPointRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1225:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM'; did you mean 'PFN_vkGetVideoSessionMemoryRequirementsKHR'?
|  1225 |     PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM GetDataGraphPipelineSessionMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetVideoSessionMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1226:5: error: unknown type name 'PFN_vkBindDataGraphPipelineSessionMemoryARM'
|  1226 |     PFN_vkBindDataGraphPipelineSessionMemoryARM BindDataGraphPipelineSessionMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1227:5: error: unknown type name 'PFN_vkDestroyDataGraphPipelineSessionARM'
|  1227 |     PFN_vkDestroyDataGraphPipelineSessionARM DestroyDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1228:5: error: unknown type name 'PFN_vkCmdDispatchDataGraphARM'; did you mean 'PFN_vkCmdDispatchGraphAMDX'?
|  1228 |     PFN_vkCmdDispatchDataGraphARM CmdDispatchDataGraphARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdDispatchGraphAMDX
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1229:5: error: unknown type name 'PFN_vkGetDataGraphPipelineAvailablePropertiesARM'
|  1229 |     PFN_vkGetDataGraphPipelineAvailablePropertiesARM GetDataGraphPipelineAvailablePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1230:5: error: unknown type name 'PFN_vkGetDataGraphPipelinePropertiesARM'; did you mean 'PFN_vkGetPipelinePropertiesEXT'?
|  1230 |     PFN_vkGetDataGraphPipelinePropertiesARM GetDataGraphPipelinePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelinePropertiesEXT
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   481 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:490:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   490 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:491:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   491 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [9/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/
 work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibilit
 y=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/gpa_helper.c.o -MF loader/CMakeFiles/vulkan.dir/gpa_helper.c.o.d -o loader/CMakeFiles/vulkan.dir/gpa_helper.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/gpa_helper.c
| FAILED: [code=1] loader/CMakeFiles/vulkan.dir/gpa_helper.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/co
 re2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidde
 n -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/gpa_helper.c.o -MF loader/CMakeFiles/vulkan.dir/gpa_helper.c.o.d -o loader/CMakeFiles/vulkan.dir/gpa_helper.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/gpa_helper.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/gpa_helper.h:25,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/gpa_helper.c:23:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:293:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   293 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:302:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   302 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:303:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   303 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkWaitForPresent2KHR'; did you mean 'PFN_vkWaitForPresentKHR'?
|   723 |     PFN_vkWaitForPresent2KHR WaitForPresent2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkWaitForPresentKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:733:5: error: unknown type name 'PFN_vkReleaseSwapchainImagesKHR'; did you mean 'PFN_vkReleaseSwapchainImagesEXT'?
|   733 |     PFN_vkReleaseSwapchainImagesKHR ReleaseSwapchainImagesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkReleaseSwapchainImagesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1175:5: error: unknown type name 'PFN_vkCreateTensorARM'; did you mean 'PFN_vkCreateRenderPass'?
|  1175 |     PFN_vkCreateTensorARM CreateTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1176:5: error: unknown type name 'PFN_vkDestroyTensorARM'; did you mean 'PFN_vkDestroyRenderPass'?
|  1176 |     PFN_vkDestroyTensorARM DestroyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1177:5: error: unknown type name 'PFN_vkCreateTensorViewARM'; did you mean 'PFN_vkCreateBufferView'?
|  1177 |     PFN_vkCreateTensorViewARM CreateTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1178:5: error: unknown type name 'PFN_vkDestroyTensorViewARM'; did you mean 'PFN_vkDestroyBufferView'?
|  1178 |     PFN_vkDestroyTensorViewARM DestroyTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1179:5: error: unknown type name 'PFN_vkGetTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetBufferMemoryRequirements2'?
|  1179 |     PFN_vkGetTensorMemoryRequirementsARM GetTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferMemoryRequirements2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1180:5: error: unknown type name 'PFN_vkBindTensorMemoryARM'; did you mean 'PFN_vkBindBufferMemory2'?
|  1180 |     PFN_vkBindTensorMemoryARM BindTensorMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkBindBufferMemory2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1181:5: error: unknown type name 'PFN_vkGetDeviceTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetDeviceBufferMemoryRequirementsKHR'?
|  1181 |     PFN_vkGetDeviceTensorMemoryRequirementsARM GetDeviceTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceBufferMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1182:5: error: unknown type name 'PFN_vkCmdCopyTensorARM'; did you mean 'PFN_vkCmdCopyBuffer2'?
|  1182 |     PFN_vkCmdCopyTensorARM CmdCopyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdCopyBuffer2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1183:5: error: unknown type name 'PFN_vkGetTensorOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT'?
|  1183 |     PFN_vkGetTensorOpaqueCaptureDescriptorDataARM GetTensorOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1184:5: error: unknown type name 'PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT'?
|  1184 |     PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM GetTensorViewOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1222:5: error: unknown type name 'PFN_vkCreateDataGraphPipelinesARM'; did you mean 'PFN_vkCreateGraphicsPipelines'?
|  1222 |     PFN_vkCreateDataGraphPipelinesARM CreateDataGraphPipelinesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateGraphicsPipelines
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1223:5: error: unknown type name 'PFN_vkCreateDataGraphPipelineSessionARM'
|  1223 |     PFN_vkCreateDataGraphPipelineSessionARM CreateDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1224:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM'
|  1224 |     PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM GetDataGraphPipelineSessionBindPointRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1225:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM'; did you mean 'PFN_vkGetVideoSessionMemoryRequirementsKHR'?
|  1225 |     PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM GetDataGraphPipelineSessionMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetVideoSessionMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1226:5: error: unknown type name 'PFN_vkBindDataGraphPipelineSessionMemoryARM'
|  1226 |     PFN_vkBindDataGraphPipelineSessionMemoryARM BindDataGraphPipelineSessionMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1227:5: error: unknown type name 'PFN_vkDestroyDataGraphPipelineSessionARM'
|  1227 |     PFN_vkDestroyDataGraphPipelineSessionARM DestroyDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1228:5: error: unknown type name 'PFN_vkCmdDispatchDataGraphARM'; did you mean 'PFN_vkCmdDispatchGraphAMDX'?
|  1228 |     PFN_vkCmdDispatchDataGraphARM CmdDispatchDataGraphARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdDispatchGraphAMDX
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1229:5: error: unknown type name 'PFN_vkGetDataGraphPipelineAvailablePropertiesARM'
|  1229 |     PFN_vkGetDataGraphPipelineAvailablePropertiesARM GetDataGraphPipelineAvailablePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1230:5: error: unknown type name 'PFN_vkGetDataGraphPipelinePropertiesARM'; did you mean 'PFN_vkGetPipelinePropertiesEXT'?
|  1230 |     PFN_vkGetDataGraphPipelinePropertiesARM GetDataGraphPipelinePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelinePropertiesEXT
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   481 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:490:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   490 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:491:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   491 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [10/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp
 /work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibili
 ty=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/trampoline.c
| FAILED: [code=1] loader/CMakeFiles/vulkan.dir/trampoline.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/co
 re2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidde
 n -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/trampoline.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/allocation.h:31,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/trampoline.c:32:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:293:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   293 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:302:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   302 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:303:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   303 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkWaitForPresent2KHR'; did you mean 'PFN_vkWaitForPresentKHR'?
|   723 |     PFN_vkWaitForPresent2KHR WaitForPresent2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkWaitForPresentKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:733:5: error: unknown type name 'PFN_vkReleaseSwapchainImagesKHR'; did you mean 'PFN_vkReleaseSwapchainImagesEXT'?
|   733 |     PFN_vkReleaseSwapchainImagesKHR ReleaseSwapchainImagesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkReleaseSwapchainImagesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1175:5: error: unknown type name 'PFN_vkCreateTensorARM'; did you mean 'PFN_vkCreateRenderPass'?
|  1175 |     PFN_vkCreateTensorARM CreateTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1176:5: error: unknown type name 'PFN_vkDestroyTensorARM'; did you mean 'PFN_vkDestroyRenderPass'?
|  1176 |     PFN_vkDestroyTensorARM DestroyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1177:5: error: unknown type name 'PFN_vkCreateTensorViewARM'; did you mean 'PFN_vkCreateBufferView'?
|  1177 |     PFN_vkCreateTensorViewARM CreateTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1178:5: error: unknown type name 'PFN_vkDestroyTensorViewARM'; did you mean 'PFN_vkDestroyBufferView'?
|  1178 |     PFN_vkDestroyTensorViewARM DestroyTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1179:5: error: unknown type name 'PFN_vkGetTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetBufferMemoryRequirements2'?
|  1179 |     PFN_vkGetTensorMemoryRequirementsARM GetTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferMemoryRequirements2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1180:5: error: unknown type name 'PFN_vkBindTensorMemoryARM'; did you mean 'PFN_vkBindBufferMemory2'?
|  1180 |     PFN_vkBindTensorMemoryARM BindTensorMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkBindBufferMemory2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1181:5: error: unknown type name 'PFN_vkGetDeviceTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetDeviceBufferMemoryRequirementsKHR'?
|  1181 |     PFN_vkGetDeviceTensorMemoryRequirementsARM GetDeviceTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceBufferMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1182:5: error: unknown type name 'PFN_vkCmdCopyTensorARM'; did you mean 'PFN_vkCmdCopyBuffer2'?
|  1182 |     PFN_vkCmdCopyTensorARM CmdCopyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdCopyBuffer2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1183:5: error: unknown type name 'PFN_vkGetTensorOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT'?
|  1183 |     PFN_vkGetTensorOpaqueCaptureDescriptorDataARM GetTensorOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1184:5: error: unknown type name 'PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT'?
|  1184 |     PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM GetTensorViewOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1222:5: error: unknown type name 'PFN_vkCreateDataGraphPipelinesARM'; did you mean 'PFN_vkCreateGraphicsPipelines'?
|  1222 |     PFN_vkCreateDataGraphPipelinesARM CreateDataGraphPipelinesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateGraphicsPipelines
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1223:5: error: unknown type name 'PFN_vkCreateDataGraphPipelineSessionARM'
|  1223 |     PFN_vkCreateDataGraphPipelineSessionARM CreateDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1224:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM'
|  1224 |     PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM GetDataGraphPipelineSessionBindPointRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1225:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM'; did you mean 'PFN_vkGetVideoSessionMemoryRequirementsKHR'?
|  1225 |     PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM GetDataGraphPipelineSessionMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetVideoSessionMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1226:5: error: unknown type name 'PFN_vkBindDataGraphPipelineSessionMemoryARM'
|  1226 |     PFN_vkBindDataGraphPipelineSessionMemoryARM BindDataGraphPipelineSessionMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1227:5: error: unknown type name 'PFN_vkDestroyDataGraphPipelineSessionARM'
|  1227 |     PFN_vkDestroyDataGraphPipelineSessionARM DestroyDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1228:5: error: unknown type name 'PFN_vkCmdDispatchDataGraphARM'; did you mean 'PFN_vkCmdDispatchGraphAMDX'?
|  1228 |     PFN_vkCmdDispatchDataGraphARM CmdDispatchDataGraphARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdDispatchGraphAMDX
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1229:5: error: unknown type name 'PFN_vkGetDataGraphPipelineAvailablePropertiesARM'
|  1229 |     PFN_vkGetDataGraphPipelineAvailablePropertiesARM GetDataGraphPipelineAvailablePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1230:5: error: unknown type name 'PFN_vkGetDataGraphPipelinePropertiesARM'; did you mean 'PFN_vkGetPipelinePropertiesEXT'?
|  1230 |     PFN_vkGetDataGraphPipelinePropertiesARM GetDataGraphPipelinePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelinePropertiesEXT
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   481 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:490:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   490 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:491:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   491 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [11/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp
 /work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibili
 ty=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/cJSON.c.o -MF loader/CMakeFiles/vulkan.dir/cJSON.c.o.d -o loader/CMakeFiles/vulkan.dir/cJSON.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/cJSON.c
| FAILED: [code=1] loader/CMakeFiles/vulkan.dir/cJSON.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/co
 re2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidde
 n -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/cJSON.c.o -MF loader/CMakeFiles/vulkan.dir/cJSON.c.o.d -o loader/CMakeFiles/vulkan.dir/cJSON.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/cJSON.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/allocation.h:31,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/cJSON.c:63:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:293:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   293 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:302:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   302 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:303:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   303 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkWaitForPresent2KHR'; did you mean 'PFN_vkWaitForPresentKHR'?
|   723 |     PFN_vkWaitForPresent2KHR WaitForPresent2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkWaitForPresentKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:733:5: error: unknown type name 'PFN_vkReleaseSwapchainImagesKHR'; did you mean 'PFN_vkReleaseSwapchainImagesEXT'?
|   733 |     PFN_vkReleaseSwapchainImagesKHR ReleaseSwapchainImagesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkReleaseSwapchainImagesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1175:5: error: unknown type name 'PFN_vkCreateTensorARM'; did you mean 'PFN_vkCreateRenderPass'?
|  1175 |     PFN_vkCreateTensorARM CreateTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1176:5: error: unknown type name 'PFN_vkDestroyTensorARM'; did you mean 'PFN_vkDestroyRenderPass'?
|  1176 |     PFN_vkDestroyTensorARM DestroyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1177:5: error: unknown type name 'PFN_vkCreateTensorViewARM'; did you mean 'PFN_vkCreateBufferView'?
|  1177 |     PFN_vkCreateTensorViewARM CreateTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1178:5: error: unknown type name 'PFN_vkDestroyTensorViewARM'; did you mean 'PFN_vkDestroyBufferView'?
|  1178 |     PFN_vkDestroyTensorViewARM DestroyTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1179:5: error: unknown type name 'PFN_vkGetTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetBufferMemoryRequirements2'?
|  1179 |     PFN_vkGetTensorMemoryRequirementsARM GetTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferMemoryRequirements2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1180:5: error: unknown type name 'PFN_vkBindTensorMemoryARM'; did you mean 'PFN_vkBindBufferMemory2'?
|  1180 |     PFN_vkBindTensorMemoryARM BindTensorMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkBindBufferMemory2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1181:5: error: unknown type name 'PFN_vkGetDeviceTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetDeviceBufferMemoryRequirementsKHR'?
|  1181 |     PFN_vkGetDeviceTensorMemoryRequirementsARM GetDeviceTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceBufferMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1182:5: error: unknown type name 'PFN_vkCmdCopyTensorARM'; did you mean 'PFN_vkCmdCopyBuffer2'?
|  1182 |     PFN_vkCmdCopyTensorARM CmdCopyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdCopyBuffer2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1183:5: error: unknown type name 'PFN_vkGetTensorOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT'?
|  1183 |     PFN_vkGetTensorOpaqueCaptureDescriptorDataARM GetTensorOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1184:5: error: unknown type name 'PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT'?
|  1184 |     PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM GetTensorViewOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1222:5: error: unknown type name 'PFN_vkCreateDataGraphPipelinesARM'; did you mean 'PFN_vkCreateGraphicsPipelines'?
|  1222 |     PFN_vkCreateDataGraphPipelinesARM CreateDataGraphPipelinesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateGraphicsPipelines
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1223:5: error: unknown type name 'PFN_vkCreateDataGraphPipelineSessionARM'
|  1223 |     PFN_vkCreateDataGraphPipelineSessionARM CreateDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1224:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM'
|  1224 |     PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM GetDataGraphPipelineSessionBindPointRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1225:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM'; did you mean 'PFN_vkGetVideoSessionMemoryRequirementsKHR'?
|  1225 |     PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM GetDataGraphPipelineSessionMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetVideoSessionMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1226:5: error: unknown type name 'PFN_vkBindDataGraphPipelineSessionMemoryARM'
|  1226 |     PFN_vkBindDataGraphPipelineSessionMemoryARM BindDataGraphPipelineSessionMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1227:5: error: unknown type name 'PFN_vkDestroyDataGraphPipelineSessionARM'
|  1227 |     PFN_vkDestroyDataGraphPipelineSessionARM DestroyDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1228:5: error: unknown type name 'PFN_vkCmdDispatchDataGraphARM'; did you mean 'PFN_vkCmdDispatchGraphAMDX'?
|  1228 |     PFN_vkCmdDispatchDataGraphARM CmdDispatchDataGraphARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdDispatchGraphAMDX
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1229:5: error: unknown type name 'PFN_vkGetDataGraphPipelineAvailablePropertiesARM'
|  1229 |     PFN_vkGetDataGraphPipelineAvailablePropertiesARM GetDataGraphPipelineAvailablePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1230:5: error: unknown type name 'PFN_vkGetDataGraphPipelinePropertiesARM'; did you mean 'PFN_vkGetPipelinePropertiesEXT'?
|  1230 |     PFN_vkGetDataGraphPipelinePropertiesARM GetDataGraphPipelinePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelinePropertiesEXT
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   481 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:490:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   490 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:491:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   491 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [12/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp
 /work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibili
 ty=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader_json.c.o -MF loader/CMakeFiles/vulkan.dir/loader_json.c.o.d -o loader/CMakeFiles/vulkan.dir/loader_json.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_json.c
| FAILED: [code=1] loader/CMakeFiles/vulkan.dir/loader_json.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/co
 re2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidde
 n -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader_json.c.o -MF loader/CMakeFiles/vulkan.dir/loader_json.c.o.d -o loader/CMakeFiles/vulkan.dir/loader_json.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_json.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/allocation.h:31,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_json.c:37:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:293:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   293 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:302:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   302 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:303:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   303 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkWaitForPresent2KHR'; did you mean 'PFN_vkWaitForPresentKHR'?
|   723 |     PFN_vkWaitForPresent2KHR WaitForPresent2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkWaitForPresentKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:733:5: error: unknown type name 'PFN_vkReleaseSwapchainImagesKHR'; did you mean 'PFN_vkReleaseSwapchainImagesEXT'?
|   733 |     PFN_vkReleaseSwapchainImagesKHR ReleaseSwapchainImagesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkReleaseSwapchainImagesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1175:5: error: unknown type name 'PFN_vkCreateTensorARM'; did you mean 'PFN_vkCreateRenderPass'?
|  1175 |     PFN_vkCreateTensorARM CreateTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1176:5: error: unknown type name 'PFN_vkDestroyTensorARM'; did you mean 'PFN_vkDestroyRenderPass'?
|  1176 |     PFN_vkDestroyTensorARM DestroyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1177:5: error: unknown type name 'PFN_vkCreateTensorViewARM'; did you mean 'PFN_vkCreateBufferView'?
|  1177 |     PFN_vkCreateTensorViewARM CreateTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1178:5: error: unknown type name 'PFN_vkDestroyTensorViewARM'; did you mean 'PFN_vkDestroyBufferView'?
|  1178 |     PFN_vkDestroyTensorViewARM DestroyTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1179:5: error: unknown type name 'PFN_vkGetTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetBufferMemoryRequirements2'?
|  1179 |     PFN_vkGetTensorMemoryRequirementsARM GetTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferMemoryRequirements2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1180:5: error: unknown type name 'PFN_vkBindTensorMemoryARM'; did you mean 'PFN_vkBindBufferMemory2'?
|  1180 |     PFN_vkBindTensorMemoryARM BindTensorMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkBindBufferMemory2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1181:5: error: unknown type name 'PFN_vkGetDeviceTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetDeviceBufferMemoryRequirementsKHR'?
|  1181 |     PFN_vkGetDeviceTensorMemoryRequirementsARM GetDeviceTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceBufferMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1182:5: error: unknown type name 'PFN_vkCmdCopyTensorARM'; did you mean 'PFN_vkCmdCopyBuffer2'?
|  1182 |     PFN_vkCmdCopyTensorARM CmdCopyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdCopyBuffer2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1183:5: error: unknown type name 'PFN_vkGetTensorOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT'?
|  1183 |     PFN_vkGetTensorOpaqueCaptureDescriptorDataARM GetTensorOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1184:5: error: unknown type name 'PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT'?
|  1184 |     PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM GetTensorViewOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1222:5: error: unknown type name 'PFN_vkCreateDataGraphPipelinesARM'; did you mean 'PFN_vkCreateGraphicsPipelines'?
|  1222 |     PFN_vkCreateDataGraphPipelinesARM CreateDataGraphPipelinesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateGraphicsPipelines
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1223:5: error: unknown type name 'PFN_vkCreateDataGraphPipelineSessionARM'
|  1223 |     PFN_vkCreateDataGraphPipelineSessionARM CreateDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1224:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM'
|  1224 |     PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM GetDataGraphPipelineSessionBindPointRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1225:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM'; did you mean 'PFN_vkGetVideoSessionMemoryRequirementsKHR'?
|  1225 |     PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM GetDataGraphPipelineSessionMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetVideoSessionMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1226:5: error: unknown type name 'PFN_vkBindDataGraphPipelineSessionMemoryARM'
|  1226 |     PFN_vkBindDataGraphPipelineSessionMemoryARM BindDataGraphPipelineSessionMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1227:5: error: unknown type name 'PFN_vkDestroyDataGraphPipelineSessionARM'
|  1227 |     PFN_vkDestroyDataGraphPipelineSessionARM DestroyDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1228:5: error: unknown type name 'PFN_vkCmdDispatchDataGraphARM'; did you mean 'PFN_vkCmdDispatchGraphAMDX'?
|  1228 |     PFN_vkCmdDispatchDataGraphARM CmdDispatchDataGraphARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdDispatchGraphAMDX
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1229:5: error: unknown type name 'PFN_vkGetDataGraphPipelineAvailablePropertiesARM'
|  1229 |     PFN_vkGetDataGraphPipelineAvailablePropertiesARM GetDataGraphPipelineAvailablePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1230:5: error: unknown type name 'PFN_vkGetDataGraphPipelinePropertiesARM'; did you mean 'PFN_vkGetPipelinePropertiesEXT'?
|  1230 |     PFN_vkGetDataGraphPipelinePropertiesARM GetDataGraphPipelinePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelinePropertiesEXT
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   481 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:490:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   490 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:491:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   491 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [13/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp
 /work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibili
 ty=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/debug_utils.c
| FAILED: [code=1] loader/CMakeFiles/vulkan.dir/debug_utils.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/co
 re2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidde
 n -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/debug_utils.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/debug_utils.c:31:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_object_types.h:282:5: error: 'VK_OBJECT_TYPE_TENSOR_ARM' undeclared here (not in a function); did you mean 'VK_OBJECT_TYPE_RENDER_PASS'?
|   282 |     VK_OBJECT_TYPE_TENSOR_ARM,   // kVulkanObjectTypeTensorARM
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VK_OBJECT_TYPE_RENDER_PASS
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_object_types.h:283:5: error: 'VK_OBJECT_TYPE_TENSOR_VIEW_ARM' undeclared here (not in a function); did you mean 'VK_OBJECT_TYPE_BUFFER_VIEW'?
|   283 |     VK_OBJECT_TYPE_TENSOR_VIEW_ARM,   // kVulkanObjectTypeTensorViewARM
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VK_OBJECT_TYPE_BUFFER_VIEW
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_object_types.h:286:5: error: 'VK_OBJECT_TYPE_DATA_GRAPH_PIPELINE_SESSION_ARM' undeclared here (not in a function)
|   286 |     VK_OBJECT_TYPE_DATA_GRAPH_PIPELINE_SESSION_ARM,   // kVulkanObjectTypeDataGraphPipelineSessionARM
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/allocation.h:31,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/debug_utils.c:33:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:293:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   293 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:302:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   302 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:303:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   303 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkWaitForPresent2KHR'; did you mean 'PFN_vkWaitForPresentKHR'?
|   723 |     PFN_vkWaitForPresent2KHR WaitForPresent2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkWaitForPresentKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:733:5: error: unknown type name 'PFN_vkReleaseSwapchainImagesKHR'; did you mean 'PFN_vkReleaseSwapchainImagesEXT'?
|   733 |     PFN_vkReleaseSwapchainImagesKHR ReleaseSwapchainImagesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkReleaseSwapchainImagesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1175:5: error: unknown type name 'PFN_vkCreateTensorARM'; did you mean 'PFN_vkCreateRenderPass'?
|  1175 |     PFN_vkCreateTensorARM CreateTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1176:5: error: unknown type name 'PFN_vkDestroyTensorARM'; did you mean 'PFN_vkDestroyRenderPass'?
|  1176 |     PFN_vkDestroyTensorARM DestroyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1177:5: error: unknown type name 'PFN_vkCreateTensorViewARM'; did you mean 'PFN_vkCreateBufferView'?
|  1177 |     PFN_vkCreateTensorViewARM CreateTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1178:5: error: unknown type name 'PFN_vkDestroyTensorViewARM'; did you mean 'PFN_vkDestroyBufferView'?
|  1178 |     PFN_vkDestroyTensorViewARM DestroyTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1179:5: error: unknown type name 'PFN_vkGetTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetBufferMemoryRequirements2'?
|  1179 |     PFN_vkGetTensorMemoryRequirementsARM GetTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferMemoryRequirements2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1180:5: error: unknown type name 'PFN_vkBindTensorMemoryARM'; did you mean 'PFN_vkBindBufferMemory2'?
|  1180 |     PFN_vkBindTensorMemoryARM BindTensorMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkBindBufferMemory2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1181:5: error: unknown type name 'PFN_vkGetDeviceTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetDeviceBufferMemoryRequirementsKHR'?
|  1181 |     PFN_vkGetDeviceTensorMemoryRequirementsARM GetDeviceTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceBufferMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1182:5: error: unknown type name 'PFN_vkCmdCopyTensorARM'; did you mean 'PFN_vkCmdCopyBuffer2'?
|  1182 |     PFN_vkCmdCopyTensorARM CmdCopyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdCopyBuffer2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1183:5: error: unknown type name 'PFN_vkGetTensorOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT'?
|  1183 |     PFN_vkGetTensorOpaqueCaptureDescriptorDataARM GetTensorOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1184:5: error: unknown type name 'PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT'?
|  1184 |     PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM GetTensorViewOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1222:5: error: unknown type name 'PFN_vkCreateDataGraphPipelinesARM'; did you mean 'PFN_vkCreateGraphicsPipelines'?
|  1222 |     PFN_vkCreateDataGraphPipelinesARM CreateDataGraphPipelinesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateGraphicsPipelines
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1223:5: error: unknown type name 'PFN_vkCreateDataGraphPipelineSessionARM'
|  1223 |     PFN_vkCreateDataGraphPipelineSessionARM CreateDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1224:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM'
|  1224 |     PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM GetDataGraphPipelineSessionBindPointRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1225:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM'; did you mean 'PFN_vkGetVideoSessionMemoryRequirementsKHR'?
|  1225 |     PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM GetDataGraphPipelineSessionMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetVideoSessionMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1226:5: error: unknown type name 'PFN_vkBindDataGraphPipelineSessionMemoryARM'
|  1226 |     PFN_vkBindDataGraphPipelineSessionMemoryARM BindDataGraphPipelineSessionMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1227:5: error: unknown type name 'PFN_vkDestroyDataGraphPipelineSessionARM'
|  1227 |     PFN_vkDestroyDataGraphPipelineSessionARM DestroyDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1228:5: error: unknown type name 'PFN_vkCmdDispatchDataGraphARM'; did you mean 'PFN_vkCmdDispatchGraphAMDX'?
|  1228 |     PFN_vkCmdDispatchDataGraphARM CmdDispatchDataGraphARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdDispatchGraphAMDX
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1229:5: error: unknown type name 'PFN_vkGetDataGraphPipelineAvailablePropertiesARM'
|  1229 |     PFN_vkGetDataGraphPipelineAvailablePropertiesARM GetDataGraphPipelineAvailablePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1230:5: error: unknown type name 'PFN_vkGetDataGraphPipelinePropertiesARM'; did you mean 'PFN_vkGetPipelinePropertiesEXT'?
|  1230 |     PFN_vkGetDataGraphPipelinePropertiesARM GetDataGraphPipelinePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelinePropertiesEXT
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   481 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:490:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   490 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:491:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   491 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [14/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp
 /work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibili
 ty=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c
| FAILED: [code=1] loader/CMakeFiles/vulkan.dir/wsi.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/co
 re2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidde
 n -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/allocation.h:31,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c:31:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:293:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   293 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:302:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   302 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:303:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   303 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkWaitForPresent2KHR'; did you mean 'PFN_vkWaitForPresentKHR'?
|   723 |     PFN_vkWaitForPresent2KHR WaitForPresent2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkWaitForPresentKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:733:5: error: unknown type name 'PFN_vkReleaseSwapchainImagesKHR'; did you mean 'PFN_vkReleaseSwapchainImagesEXT'?
|   733 |     PFN_vkReleaseSwapchainImagesKHR ReleaseSwapchainImagesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkReleaseSwapchainImagesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1175:5: error: unknown type name 'PFN_vkCreateTensorARM'; did you mean 'PFN_vkCreateRenderPass'?
|  1175 |     PFN_vkCreateTensorARM CreateTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1176:5: error: unknown type name 'PFN_vkDestroyTensorARM'; did you mean 'PFN_vkDestroyRenderPass'?
|  1176 |     PFN_vkDestroyTensorARM DestroyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1177:5: error: unknown type name 'PFN_vkCreateTensorViewARM'; did you mean 'PFN_vkCreateBufferView'?
|  1177 |     PFN_vkCreateTensorViewARM CreateTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1178:5: error: unknown type name 'PFN_vkDestroyTensorViewARM'; did you mean 'PFN_vkDestroyBufferView'?
|  1178 |     PFN_vkDestroyTensorViewARM DestroyTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1179:5: error: unknown type name 'PFN_vkGetTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetBufferMemoryRequirements2'?
|  1179 |     PFN_vkGetTensorMemoryRequirementsARM GetTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferMemoryRequirements2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1180:5: error: unknown type name 'PFN_vkBindTensorMemoryARM'; did you mean 'PFN_vkBindBufferMemory2'?
|  1180 |     PFN_vkBindTensorMemoryARM BindTensorMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkBindBufferMemory2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1181:5: error: unknown type name 'PFN_vkGetDeviceTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetDeviceBufferMemoryRequirementsKHR'?
|  1181 |     PFN_vkGetDeviceTensorMemoryRequirementsARM GetDeviceTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceBufferMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1182:5: error: unknown type name 'PFN_vkCmdCopyTensorARM'; did you mean 'PFN_vkCmdCopyBuffer2'?
|  1182 |     PFN_vkCmdCopyTensorARM CmdCopyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdCopyBuffer2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1183:5: error: unknown type name 'PFN_vkGetTensorOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT'?
|  1183 |     PFN_vkGetTensorOpaqueCaptureDescriptorDataARM GetTensorOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1184:5: error: unknown type name 'PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT'?
|  1184 |     PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM GetTensorViewOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1222:5: error: unknown type name 'PFN_vkCreateDataGraphPipelinesARM'; did you mean 'PFN_vkCreateGraphicsPipelines'?
|  1222 |     PFN_vkCreateDataGraphPipelinesARM CreateDataGraphPipelinesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateGraphicsPipelines
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1223:5: error: unknown type name 'PFN_vkCreateDataGraphPipelineSessionARM'
|  1223 |     PFN_vkCreateDataGraphPipelineSessionARM CreateDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1224:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM'
|  1224 |     PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM GetDataGraphPipelineSessionBindPointRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1225:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM'; did you mean 'PFN_vkGetVideoSessionMemoryRequirementsKHR'?
|  1225 |     PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM GetDataGraphPipelineSessionMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetVideoSessionMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1226:5: error: unknown type name 'PFN_vkBindDataGraphPipelineSessionMemoryARM'
|  1226 |     PFN_vkBindDataGraphPipelineSessionMemoryARM BindDataGraphPipelineSessionMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1227:5: error: unknown type name 'PFN_vkDestroyDataGraphPipelineSessionARM'
|  1227 |     PFN_vkDestroyDataGraphPipelineSessionARM DestroyDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1228:5: error: unknown type name 'PFN_vkCmdDispatchDataGraphARM'; did you mean 'PFN_vkCmdDispatchGraphAMDX'?
|  1228 |     PFN_vkCmdDispatchDataGraphARM CmdDispatchDataGraphARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdDispatchGraphAMDX
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1229:5: error: unknown type name 'PFN_vkGetDataGraphPipelineAvailablePropertiesARM'
|  1229 |     PFN_vkGetDataGraphPipelineAvailablePropertiesARM GetDataGraphPipelineAvailablePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1230:5: error: unknown type name 'PFN_vkGetDataGraphPipelinePropertiesARM'; did you mean 'PFN_vkGetPipelinePropertiesEXT'?
|  1230 |     PFN_vkGetDataGraphPipelinePropertiesARM GetDataGraphPipelinePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelinePropertiesEXT
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   481 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:490:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   490 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:491:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   491 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c: In function 'emulate_VK_KHR_surface_maintenance1':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c:2597:36: error: 'VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_KHR' undeclared (first use in this function); did you mean 'VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_EXT'?
|  2597 |         if (out_structure.sType == VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_KHR) {
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c:2597:36: note: each undeclared identifier is reported only once for each function it appears in
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c:2598:13: error: unknown type name 'VkSurfacePresentModeKHR'; did you mean 'VkSurfacePresentModeEXT'?
|  2598 |             VkSurfacePresentModeKHR *surface_present_mode = (VkSurfacePresentModeKHR *)void_pNext;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~
|       |             VkSurfacePresentModeEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c:2598:62: error: 'VkSurfacePresentModeKHR' undeclared (first use in this function); did you mean 'VkSurfacePresentModeEXT'?
|  2598 |             VkSurfacePresentModeKHR *surface_present_mode = (VkSurfacePresentModeKHR *)void_pNext;
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                                              VkSurfacePresentModeEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c:2598:87: error: expected expression before ')' token
|  2598 |             VkSurfacePresentModeKHR *surface_present_mode = (VkSurfacePresentModeKHR *)void_pNext;
|       |                                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c:2599:48: error: request for member 'presentMode' in something not a structure or union
|  2599 |             present_mode = surface_present_mode->presentMode;
|       |                                                ^~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c:2612:36: error: 'VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_COMPATIBILITY_KHR' undeclared (first use in this function); did you mean 'VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_COMPATIBILITY_EXT'?
|  2612 |         if (out_structure.sType == VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_COMPATIBILITY_KHR) {
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_COMPATIBILITY_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c:2613:13: error: unknown type name 'VkSurfacePresentModeCompatibilityKHR'; did you mean 'VkSurfacePresentModeCompatibilityEXT'?
|  2613 |             VkSurfacePresentModeCompatibilityKHR *surface_present_mode_compatibility =
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkSurfacePresentModeCompatibilityEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c:2614:18: error: 'VkSurfacePresentModeCompatibilityKHR' undeclared (first use in this function); did you mean 'VkSurfacePresentModeCompatibilityEXT'?
|  2614 |                 (VkSurfacePresentModeCompatibilityKHR *)void_pNext;
|       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                  VkSurfacePresentModeCompatibilityEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c:2614:56: error: expected expression before ')' token
|  2614 |                 (VkSurfacePresentModeCompatibilityKHR *)void_pNext;
|       |                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c:2615:51: error: request for member 'pPresentModes' in something not a structure or union
|  2615 |             if (surface_present_mode_compatibility->pPresentModes) {
|       |                                                   ^~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c:2616:55: error: request for member 'presentModeCount' in something not a structure or union
|  2616 |                 if (surface_present_mode_compatibility->presentModeCount != 0) {
|       |                                                       ^~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c:2617:55: error: request for member 'pPresentModes' in something not a structure or union
|  2617 |                     surface_present_mode_compatibility->pPresentModes[0] = present_mode;
|       |                                                       ^~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c:2618:55: error: request for member 'presentModeCount' in something not a structure or union
|  2618 |                     surface_present_mode_compatibility->presentModeCount = 1;
|       |                                                       ^~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c:2621:51: error: request for member 'presentModeCount' in something not a structure or union
|  2621 |                 surface_present_mode_compatibility->presentModeCount = 1;
|       |                                                   ^~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c:2624:43: error: 'VK_STRUCTURE_TYPE_SURFACE_PRESENT_SCALING_CAPABILITIES_KHR' undeclared (first use in this function); did you mean 'VK_STRUCTURE_TYPE_SURFACE_PRESENT_SCALING_CAPABILITIES_EXT'?
|  2624 |         } else if (out_structure.sType == VK_STRUCTURE_TYPE_SURFACE_PRESENT_SCALING_CAPABILITIES_KHR) {
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VK_STRUCTURE_TYPE_SURFACE_PRESENT_SCALING_CAPABILITIES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c:2627:13: error: unknown type name 'VkSurfacePresentScalingCapabilitiesKHR'; did you mean 'VkSurfacePresentScalingCapabilitiesEXT'?
|  2627 |             VkSurfacePresentScalingCapabilitiesKHR *surface_present_scaling_capabilities =
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkSurfacePresentScalingCapabilitiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c:2628:18: error: 'VkSurfacePresentScalingCapabilitiesKHR' undeclared (first use in this function); did you mean 'VkSurfacePresentScalingCapabilitiesEXT'?
|  2628 |                 (VkSurfacePresentScalingCapabilitiesKHR *)void_pNext;
|       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                  VkSurfacePresentScalingCapabilitiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c:2628:58: error: expected expression before ')' token
|  2628 |                 (VkSurfacePresentScalingCapabilitiesKHR *)void_pNext;
|       |                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c:2629:49: error: request for member 'supportedPresentScaling' in something not a structure or union
|  2629 |             surface_present_scaling_capabilities->supportedPresentScaling = 0;
|       |                                                 ^~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c:2630:49: error: request for member 'supportedPresentGravityX' in something not a structure or union
|  2630 |             surface_present_scaling_capabilities->supportedPresentGravityX = 0;
|       |                                                 ^~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c:2631:49: error: request for member 'supportedPresentGravityY' in something not a structure or union
|  2631 |             surface_present_scaling_capabilities->supportedPresentGravityY = 0;
|       |                                                 ^~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c:2632:49: error: request for member 'maxScaledImageExtent' in something not a structure or union
|  2632 |             surface_present_scaling_capabilities->maxScaledImageExtent = pSurfaceCapabilities->surfaceCapabilities.maxImageExtent;
|       |                                                 ^~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/wsi.c:2633:49: error: request for member 'minScaledImageExtent' in something not a structure or union
|  2633 |             surface_present_scaling_capabilities->minScaledImageExtent = pSurfaceCapabilities->surfaceCapabilities.minImageExtent;
|       |                                                 ^~
| [15/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp
 /work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibili
 ty=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader.c
| FAILED: [code=1] loader/CMakeFiles/vulkan.dir/loader.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/co
 re2-64-poky-linux/vulkan-loader/1.4.321.0/build/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build=/usr/src/debug/vulkan-loader/1.4.321.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidde
 n -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader.h:32,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader.c:31:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:293:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   293 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:302:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   302 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:303:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   303 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkWaitForPresent2KHR'; did you mean 'PFN_vkWaitForPresentKHR'?
|   723 |     PFN_vkWaitForPresent2KHR WaitForPresent2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkWaitForPresentKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:733:5: error: unknown type name 'PFN_vkReleaseSwapchainImagesKHR'; did you mean 'PFN_vkReleaseSwapchainImagesEXT'?
|   733 |     PFN_vkReleaseSwapchainImagesKHR ReleaseSwapchainImagesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkReleaseSwapchainImagesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1175:5: error: unknown type name 'PFN_vkCreateTensorARM'; did you mean 'PFN_vkCreateRenderPass'?
|  1175 |     PFN_vkCreateTensorARM CreateTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1176:5: error: unknown type name 'PFN_vkDestroyTensorARM'; did you mean 'PFN_vkDestroyRenderPass'?
|  1176 |     PFN_vkDestroyTensorARM DestroyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1177:5: error: unknown type name 'PFN_vkCreateTensorViewARM'; did you mean 'PFN_vkCreateBufferView'?
|  1177 |     PFN_vkCreateTensorViewARM CreateTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1178:5: error: unknown type name 'PFN_vkDestroyTensorViewARM'; did you mean 'PFN_vkDestroyBufferView'?
|  1178 |     PFN_vkDestroyTensorViewARM DestroyTensorViewARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1179:5: error: unknown type name 'PFN_vkGetTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetBufferMemoryRequirements2'?
|  1179 |     PFN_vkGetTensorMemoryRequirementsARM GetTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferMemoryRequirements2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1180:5: error: unknown type name 'PFN_vkBindTensorMemoryARM'; did you mean 'PFN_vkBindBufferMemory2'?
|  1180 |     PFN_vkBindTensorMemoryARM BindTensorMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkBindBufferMemory2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1181:5: error: unknown type name 'PFN_vkGetDeviceTensorMemoryRequirementsARM'; did you mean 'PFN_vkGetDeviceBufferMemoryRequirementsKHR'?
|  1181 |     PFN_vkGetDeviceTensorMemoryRequirementsARM GetDeviceTensorMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceBufferMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1182:5: error: unknown type name 'PFN_vkCmdCopyTensorARM'; did you mean 'PFN_vkCmdCopyBuffer2'?
|  1182 |     PFN_vkCmdCopyTensorARM CmdCopyTensorARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdCopyBuffer2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1183:5: error: unknown type name 'PFN_vkGetTensorOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT'?
|  1183 |     PFN_vkGetTensorOpaqueCaptureDescriptorDataARM GetTensorOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1184:5: error: unknown type name 'PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM'; did you mean 'PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT'?
|  1184 |     PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM GetTensorViewOpaqueCaptureDescriptorDataARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1222:5: error: unknown type name 'PFN_vkCreateDataGraphPipelinesARM'; did you mean 'PFN_vkCreateGraphicsPipelines'?
|  1222 |     PFN_vkCreateDataGraphPipelinesARM CreateDataGraphPipelinesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateGraphicsPipelines
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1223:5: error: unknown type name 'PFN_vkCreateDataGraphPipelineSessionARM'
|  1223 |     PFN_vkCreateDataGraphPipelineSessionARM CreateDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1224:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM'
|  1224 |     PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM GetDataGraphPipelineSessionBindPointRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1225:5: error: unknown type name 'PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM'; did you mean 'PFN_vkGetVideoSessionMemoryRequirementsKHR'?
|  1225 |     PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM GetDataGraphPipelineSessionMemoryRequirementsARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetVideoSessionMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1226:5: error: unknown type name 'PFN_vkBindDataGraphPipelineSessionMemoryARM'
|  1226 |     PFN_vkBindDataGraphPipelineSessionMemoryARM BindDataGraphPipelineSessionMemoryARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1227:5: error: unknown type name 'PFN_vkDestroyDataGraphPipelineSessionARM'
|  1227 |     PFN_vkDestroyDataGraphPipelineSessionARM DestroyDataGraphPipelineSessionARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1228:5: error: unknown type name 'PFN_vkCmdDispatchDataGraphARM'; did you mean 'PFN_vkCmdDispatchGraphAMDX'?
|  1228 |     PFN_vkCmdDispatchDataGraphARM CmdDispatchDataGraphARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdDispatchGraphAMDX
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1229:5: error: unknown type name 'PFN_vkGetDataGraphPipelineAvailablePropertiesARM'
|  1229 |     PFN_vkGetDataGraphPipelineAvailablePropertiesARM GetDataGraphPipelineAvailablePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1230:5: error: unknown type name 'PFN_vkGetDataGraphPipelinePropertiesARM'; did you mean 'PFN_vkGetPipelinePropertiesEXT'?
|  1230 |     PFN_vkGetDataGraphPipelinePropertiesARM GetDataGraphPipelinePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelinePropertiesEXT
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|   481 |     PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM GetPhysicalDeviceExternalTensorPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:490:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM'; did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|   490 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.h:491:5: error: unknown type name 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM'
|   491 |     PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/loader.c:76:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: In function 'loader_icd_init_entries':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:55:54: error: 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM' undeclared (first use in this function); did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|    55 | #define LOOKUP_GIPA(func) icd_term->dispatch.func = (PFN_vk##func)fp_gipa(icd_term->instance, "vk" #func);
|       |                                                      ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:314:5: note: in expansion of macro 'LOOKUP_GIPA'
|   314 |     LOOKUP_GIPA(GetPhysicalDeviceExternalTensorPropertiesARM);
|       |     ^~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:55:54: note: each undeclared identifier is reported only once for each function it appears in
|    55 | #define LOOKUP_GIPA(func) icd_term->dispatch.func = (PFN_vk##func)fp_gipa(icd_term->instance, "vk" #func);
|       |                                                      ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:314:5: note: in expansion of macro 'LOOKUP_GIPA'
|   314 |     LOOKUP_GIPA(GetPhysicalDeviceExternalTensorPropertiesARM);
|       |     ^~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:55:67: error: expected ';' before 'fp_gipa'
|    55 | #define LOOKUP_GIPA(func) icd_term->dispatch.func = (PFN_vk##func)fp_gipa(icd_term->instance, "vk" #func);
|       |                                                                   ^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:314:5: note: in expansion of macro 'LOOKUP_GIPA'
|   314 |     LOOKUP_GIPA(GetPhysicalDeviceExternalTensorPropertiesARM);
|       |     ^~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:55:54: error: 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM' undeclared (first use in this function); did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|    55 | #define LOOKUP_GIPA(func) icd_term->dispatch.func = (PFN_vk##func)fp_gipa(icd_term->instance, "vk" #func);
|       |                                                      ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:323:5: note: in expansion of macro 'LOOKUP_GIPA'
|   323 |     LOOKUP_GIPA(GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM);
|       |     ^~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:55:67: error: expected ';' before 'fp_gipa'
|    55 | #define LOOKUP_GIPA(func) icd_term->dispatch.func = (PFN_vk##func)fp_gipa(icd_term->instance, "vk" #func);
|       |                                                                   ^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:323:5: note: in expansion of macro 'LOOKUP_GIPA'
|   323 |     LOOKUP_GIPA(GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM);
|       |     ^~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:55:54: error: 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM' undeclared (first use in this function)
|    55 | #define LOOKUP_GIPA(func) icd_term->dispatch.func = (PFN_vk##func)fp_gipa(icd_term->instance, "vk" #func);
|       |                                                      ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:324:5: note: in expansion of macro 'LOOKUP_GIPA'
|   324 |     LOOKUP_GIPA(GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM);
|       |     ^~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:55:67: error: expected ';' before 'fp_gipa'
|    55 | #define LOOKUP_GIPA(func) icd_term->dispatch.func = (PFN_vk##func)fp_gipa(icd_term->instance, "vk" #func);
|       |                                                                   ^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:324:5: note: in expansion of macro 'LOOKUP_GIPA'
|   324 |     LOOKUP_GIPA(GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM);
|       |     ^~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: In function 'loader_init_device_extension_dispatch_table':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:761:34: error: 'PFN_vkWaitForPresent2KHR' undeclared (first use in this function); did you mean 'PFN_vkWaitForPresentKHR'?
|   761 |     table->WaitForPresent2KHR = (PFN_vkWaitForPresent2KHR)gdpa(dev, "vkWaitForPresent2KHR");
|       |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                                  PFN_vkWaitForPresentKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:761:59: error: expected ';' before 'gdpa'
|   761 |     table->WaitForPresent2KHR = (PFN_vkWaitForPresent2KHR)gdpa(dev, "vkWaitForPresent2KHR");
|       |                                                           ^~~~
|       |                                                           ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:771:41: error: 'PFN_vkReleaseSwapchainImagesKHR' undeclared (first use in this function); did you mean 'PFN_vkReleaseSwapchainImagesEXT'?
|   771 |     table->ReleaseSwapchainImagesKHR = (PFN_vkReleaseSwapchainImagesKHR)gdpa(dev, "vkReleaseSwapchainImagesKHR");
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                         PFN_vkReleaseSwapchainImagesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:771:73: error: expected ';' before 'gdpa'
|   771 |     table->ReleaseSwapchainImagesKHR = (PFN_vkReleaseSwapchainImagesKHR)gdpa(dev, "vkReleaseSwapchainImagesKHR");
|       |                                                                         ^~~~
|       |                                                                         ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1213:31: error: 'PFN_vkCreateTensorARM' undeclared (first use in this function); did you mean 'PFN_vkCreateRenderPass'?
|  1213 |     table->CreateTensorARM = (PFN_vkCreateTensorARM)gdpa(dev, "vkCreateTensorARM");
|       |                               ^~~~~~~~~~~~~~~~~~~~~
|       |                               PFN_vkCreateRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1213:53: error: expected ';' before 'gdpa'
|  1213 |     table->CreateTensorARM = (PFN_vkCreateTensorARM)gdpa(dev, "vkCreateTensorARM");
|       |                                                     ^~~~
|       |                                                     ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1214:32: error: 'PFN_vkDestroyTensorARM' undeclared (first use in this function); did you mean 'PFN_vkDestroyRenderPass'?
|  1214 |     table->DestroyTensorARM = (PFN_vkDestroyTensorARM)gdpa(dev, "vkDestroyTensorARM");
|       |                                ^~~~~~~~~~~~~~~~~~~~~~
|       |                                PFN_vkDestroyRenderPass
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1214:55: error: expected ';' before 'gdpa'
|  1214 |     table->DestroyTensorARM = (PFN_vkDestroyTensorARM)gdpa(dev, "vkDestroyTensorARM");
|       |                                                       ^~~~
|       |                                                       ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1215:35: error: 'PFN_vkCreateTensorViewARM' undeclared (first use in this function); did you mean 'PFN_vkCreateBufferView'?
|  1215 |     table->CreateTensorViewARM = (PFN_vkCreateTensorViewARM)gdpa(dev, "vkCreateTensorViewARM");
|       |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                   PFN_vkCreateBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1215:61: error: expected ';' before 'gdpa'
|  1215 |     table->CreateTensorViewARM = (PFN_vkCreateTensorViewARM)gdpa(dev, "vkCreateTensorViewARM");
|       |                                                             ^~~~
|       |                                                             ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1216:36: error: 'PFN_vkDestroyTensorViewARM' undeclared (first use in this function); did you mean 'PFN_vkDestroyBufferView'?
|  1216 |     table->DestroyTensorViewARM = (PFN_vkDestroyTensorViewARM)gdpa(dev, "vkDestroyTensorViewARM");
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    PFN_vkDestroyBufferView
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1216:63: error: expected ';' before 'gdpa'
|  1216 |     table->DestroyTensorViewARM = (PFN_vkDestroyTensorViewARM)gdpa(dev, "vkDestroyTensorViewARM");
|       |                                                               ^~~~
|       |                                                               ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1217:46: error: 'PFN_vkGetTensorMemoryRequirementsARM' undeclared (first use in this function); did you mean 'PFN_vkGetBufferMemoryRequirements2'?
|  1217 |     table->GetTensorMemoryRequirementsARM = (PFN_vkGetTensorMemoryRequirementsARM)gdpa(dev, "vkGetTensorMemoryRequirementsARM");
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                              PFN_vkGetBufferMemoryRequirements2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1217:83: error: expected ';' before 'gdpa'
|  1217 |     table->GetTensorMemoryRequirementsARM = (PFN_vkGetTensorMemoryRequirementsARM)gdpa(dev, "vkGetTensorMemoryRequirementsARM");
|       |                                                                                   ^~~~
|       |                                                                                   ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1218:35: error: 'PFN_vkBindTensorMemoryARM' undeclared (first use in this function); did you mean 'PFN_vkBindBufferMemory2'?
|  1218 |     table->BindTensorMemoryARM = (PFN_vkBindTensorMemoryARM)gdpa(dev, "vkBindTensorMemoryARM");
|       |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                   PFN_vkBindBufferMemory2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1218:61: error: expected ';' before 'gdpa'
|  1218 |     table->BindTensorMemoryARM = (PFN_vkBindTensorMemoryARM)gdpa(dev, "vkBindTensorMemoryARM");
|       |                                                             ^~~~
|       |                                                             ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1219:52: error: 'PFN_vkGetDeviceTensorMemoryRequirementsARM' undeclared (first use in this function); did you mean 'PFN_vkGetDeviceBufferMemoryRequirementsKHR'?
|  1219 |     table->GetDeviceTensorMemoryRequirementsARM = (PFN_vkGetDeviceTensorMemoryRequirementsARM)gdpa(dev, "vkGetDeviceTensorMemoryRequirementsARM");
|       |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                    PFN_vkGetDeviceBufferMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1219:95: error: expected ';' before 'gdpa'
|  1219 |     table->GetDeviceTensorMemoryRequirementsARM = (PFN_vkGetDeviceTensorMemoryRequirementsARM)gdpa(dev, "vkGetDeviceTensorMemoryRequirementsARM");
|       |                                                                                               ^~~~
|       |                                                                                               ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1220:32: error: 'PFN_vkCmdCopyTensorARM' undeclared (first use in this function); did you mean 'PFN_vkCmdCopyBuffer2'?
|  1220 |     table->CmdCopyTensorARM = (PFN_vkCmdCopyTensorARM)gdpa(dev, "vkCmdCopyTensorARM");
|       |                                ^~~~~~~~~~~~~~~~~~~~~~
|       |                                PFN_vkCmdCopyBuffer2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1220:55: error: expected ';' before 'gdpa'
|  1220 |     table->CmdCopyTensorARM = (PFN_vkCmdCopyTensorARM)gdpa(dev, "vkCmdCopyTensorARM");
|       |                                                       ^~~~
|       |                                                       ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1221:55: error: 'PFN_vkGetTensorOpaqueCaptureDescriptorDataARM' undeclared (first use in this function); did you mean 'PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT'?
|  1221 |     table->GetTensorOpaqueCaptureDescriptorDataARM = (PFN_vkGetTensorOpaqueCaptureDescriptorDataARM)gdpa(dev, "vkGetTensorOpaqueCaptureDescriptorDataARM");
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                       PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1221:101: error: expected ';' before 'gdpa'
|  1221 |     table->GetTensorOpaqueCaptureDescriptorDataARM = (PFN_vkGetTensorOpaqueCaptureDescriptorDataARM)gdpa(dev, "vkGetTensorOpaqueCaptureDescriptorDataARM");
|       |                                                                                                     ^~~~
|       |                                                                                                     ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1222:59: error: 'PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM' undeclared (first use in this function); did you mean 'PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT'?
|  1222 |     table->GetTensorViewOpaqueCaptureDescriptorDataARM = (PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM)gdpa(dev, "vkGetTensorViewOpaqueCaptureDescriptorDataARM");
|       |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                           PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1222:109: error: expected ';' before 'gdpa'
|  1222 |     table->GetTensorViewOpaqueCaptureDescriptorDataARM = (PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM)gdpa(dev, "vkGetTensorViewOpaqueCaptureDescriptorDataARM");
|       |                                                                                                             ^~~~
|       |                                                                                                             ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1260:43: error: 'PFN_vkCreateDataGraphPipelinesARM' undeclared (first use in this function); did you mean 'PFN_vkCreateGraphicsPipelines'?
|  1260 |     table->CreateDataGraphPipelinesARM = (PFN_vkCreateDataGraphPipelinesARM)gdpa(dev, "vkCreateDataGraphPipelinesARM");
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           PFN_vkCreateGraphicsPipelines
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1260:77: error: expected ';' before 'gdpa'
|  1260 |     table->CreateDataGraphPipelinesARM = (PFN_vkCreateDataGraphPipelinesARM)gdpa(dev, "vkCreateDataGraphPipelinesARM");
|       |                                                                             ^~~~
|       |                                                                             ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1261:49: error: 'PFN_vkCreateDataGraphPipelineSessionARM' undeclared (first use in this function)
|  1261 |     table->CreateDataGraphPipelineSessionARM = (PFN_vkCreateDataGraphPipelineSessionARM)gdpa(dev, "vkCreateDataGraphPipelineSessionARM");
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1261:89: error: expected ';' before 'gdpa'
|  1261 |     table->CreateDataGraphPipelineSessionARM = (PFN_vkCreateDataGraphPipelineSessionARM)gdpa(dev, "vkCreateDataGraphPipelineSessionARM");
|       |                                                                                         ^~~~
|       |                                                                                         ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1262:67: error: 'PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM' undeclared (first use in this function)
|  1262 |     table->GetDataGraphPipelineSessionBindPointRequirementsARM = (PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM)gdpa(dev, "vkGetDataGraphPipelineSessionBindPointRequirementsARM");
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1262:125: error: expected ';' before 'gdpa'
|  1262 |     table->GetDataGraphPipelineSessionBindPointRequirementsARM = (PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM)gdpa(dev, "vkGetDataGraphPipelineSessionBindPointRequirementsARM");
|       |                                                                                                                             ^~~~
|       |                                                                                                                             ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1263:64: error: 'PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM' undeclared (first use in this function); did you mean 'PFN_vkGetVideoSessionMemoryRequirementsKHR'?
|  1263 |     table->GetDataGraphPipelineSessionMemoryRequirementsARM = (PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM)gdpa(dev, "vkGetDataGraphPipelineSessionMemoryRequirementsARM");
|       |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                PFN_vkGetVideoSessionMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1263:119: error: expected ';' before 'gdpa'
|  1263 |     table->GetDataGraphPipelineSessionMemoryRequirementsARM = (PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM)gdpa(dev, "vkGetDataGraphPipelineSessionMemoryRequirementsARM");
|       |                                                                                                                       ^~~~
|       |                                                                                                                       ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1264:53: error: 'PFN_vkBindDataGraphPipelineSessionMemoryARM' undeclared (first use in this function)
|  1264 |     table->BindDataGraphPipelineSessionMemoryARM = (PFN_vkBindDataGraphPipelineSessionMemoryARM)gdpa(dev, "vkBindDataGraphPipelineSessionMemoryARM");
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1264:97: error: expected ';' before 'gdpa'
|  1264 |     table->BindDataGraphPipelineSessionMemoryARM = (PFN_vkBindDataGraphPipelineSessionMemoryARM)gdpa(dev, "vkBindDataGraphPipelineSessionMemoryARM");
|       |                                                                                                 ^~~~
|       |                                                                                                 ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1265:50: error: 'PFN_vkDestroyDataGraphPipelineSessionARM' undeclared (first use in this function)
|  1265 |     table->DestroyDataGraphPipelineSessionARM = (PFN_vkDestroyDataGraphPipelineSessionARM)gdpa(dev, "vkDestroyDataGraphPipelineSessionARM");
|       |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1265:91: error: expected ';' before 'gdpa'
|  1265 |     table->DestroyDataGraphPipelineSessionARM = (PFN_vkDestroyDataGraphPipelineSessionARM)gdpa(dev, "vkDestroyDataGraphPipelineSessionARM");
|       |                                                                                           ^~~~
|       |                                                                                           ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1266:39: error: 'PFN_vkCmdDispatchDataGraphARM' undeclared (first use in this function); did you mean 'PFN_vkCmdDispatchGraphAMDX'?
|  1266 |     table->CmdDispatchDataGraphARM = (PFN_vkCmdDispatchDataGraphARM)gdpa(dev, "vkCmdDispatchDataGraphARM");
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                       PFN_vkCmdDispatchGraphAMDX
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1266:69: error: expected ';' before 'gdpa'
|  1266 |     table->CmdDispatchDataGraphARM = (PFN_vkCmdDispatchDataGraphARM)gdpa(dev, "vkCmdDispatchDataGraphARM");
|       |                                                                     ^~~~
|       |                                                                     ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1267:58: error: 'PFN_vkGetDataGraphPipelineAvailablePropertiesARM' undeclared (first use in this function)
|  1267 |     table->GetDataGraphPipelineAvailablePropertiesARM = (PFN_vkGetDataGraphPipelineAvailablePropertiesARM)gdpa(dev, "vkGetDataGraphPipelineAvailablePropertiesARM");
|       |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1267:107: error: expected ';' before 'gdpa'
|  1267 |     table->GetDataGraphPipelineAvailablePropertiesARM = (PFN_vkGetDataGraphPipelineAvailablePropertiesARM)gdpa(dev, "vkGetDataGraphPipelineAvailablePropertiesARM");
|       |                                                                                                           ^~~~
|       |                                                                                                           ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1268:49: error: 'PFN_vkGetDataGraphPipelinePropertiesARM' undeclared (first use in this function); did you mean 'PFN_vkGetPipelinePropertiesEXT'?
|  1268 |     table->GetDataGraphPipelinePropertiesARM = (PFN_vkGetDataGraphPipelinePropertiesARM)gdpa(dev, "vkGetDataGraphPipelinePropertiesARM");
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 PFN_vkGetPipelinePropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1268:89: error: expected ';' before 'gdpa'
|  1268 |     table->GetDataGraphPipelinePropertiesARM = (PFN_vkGetDataGraphPipelinePropertiesARM)gdpa(dev, "vkGetDataGraphPipelinePropertiesARM");
|       |                                                                                         ^~~~
|       |                                                                                         ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: In function 'loader_init_instance_extension_dispatch_table':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1603:60: error: 'PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM' undeclared (first use in this function); did you mean 'PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR'?
|  1603 |     table->GetPhysicalDeviceExternalTensorPropertiesARM = (PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM)gpa(inst, "vkGetPhysicalDeviceExternalTensorPropertiesARM");
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1603:111: error: expected ';' before 'gpa'
|  1603 |     table->GetPhysicalDeviceExternalTensorPropertiesARM = (PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM)gpa(inst, "vkGetPhysicalDeviceExternalTensorPropertiesARM");
|       |                                                                                                               ^~~
|       |                                                                                                               ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1612:66: error: 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM' undeclared (first use in this function); did you mean 'PFN_vkGetPhysicalDeviceQueueFamilyProperties2'?
|  1612 |     table->GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM = (PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM)gpa(inst, "vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM");
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                  PFN_vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1612:123: error: expected ';' before 'gpa'
|  1612 |     table->GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM = (PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM)gpa(inst, "vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM");
|       |                                                                                                                           ^~~
|       |                                                                                                                           ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1613:82: error: 'PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM' undeclared (first use in this function)
|  1613 |     table->GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM = (PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM)gpa(inst, "vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM");
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:1613:155: error: expected ';' before 'gpa'
|  1613 |     table->GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM = (PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM)gpa(inst, "vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM");
|       |                                                                                                                                                           ^~~
|       |                                                                                                                                                           ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: In function 'loader_lookup_device_dispatch_table':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:2723:53: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2723 |     if (!strcmp(name, "WaitForPresent2KHR")) return (void *)table->WaitForPresent2KHR;
|       |                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:2733:60: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2733 |     if (!strcmp(name, "ReleaseSwapchainImagesKHR")) return (void *)table->ReleaseSwapchainImagesKHR;
|       |                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:3175:50: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  3175 |     if (!strcmp(name, "CreateTensorARM")) return (void *)table->CreateTensorARM;
|       |                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:3176:51: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  3176 |     if (!strcmp(name, "DestroyTensorARM")) return (void *)table->DestroyTensorARM;
|       |                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:3177:54: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  3177 |     if (!strcmp(name, "CreateTensorViewARM")) return (void *)table->CreateTensorViewARM;
|       |                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:3178:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  3178 |     if (!strcmp(name, "DestroyTensorViewARM")) return (void *)table->DestroyTensorViewARM;
|       |                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:3179:65: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  3179 |     if (!strcmp(name, "GetTensorMemoryRequirementsARM")) return (void *)table->GetTensorMemoryRequirementsARM;
|       |                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:3180:54: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  3180 |     if (!strcmp(name, "BindTensorMemoryARM")) return (void *)table->BindTensorMemoryARM;
|       |                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:3181:71: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  3181 |     if (!strcmp(name, "GetDeviceTensorMemoryRequirementsARM")) return (void *)table->GetDeviceTensorMemoryRequirementsARM;
|       |                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:3182:51: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  3182 |     if (!strcmp(name, "CmdCopyTensorARM")) return (void *)table->CmdCopyTensorARM;
|       |                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:3183:74: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  3183 |     if (!strcmp(name, "GetTensorOpaqueCaptureDescriptorDataARM")) return (void *)table->GetTensorOpaqueCaptureDescriptorDataARM;
|       |                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:3184:78: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  3184 |     if (!strcmp(name, "GetTensorViewOpaqueCaptureDescriptorDataARM")) return (void *)table->GetTensorViewOpaqueCaptureDescriptorDataARM;
|       |                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:3222:62: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  3222 |     if (!strcmp(name, "CreateDataGraphPipelinesARM")) return (void *)table->CreateDataGraphPipelinesARM;
|       |                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:3223:68: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  3223 |     if (!strcmp(name, "CreateDataGraphPipelineSessionARM")) return (void *)table->CreateDataGraphPipelineSessionARM;
|       |                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:3224:86: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  3224 |     if (!strcmp(name, "GetDataGraphPipelineSessionBindPointRequirementsARM")) return (void *)table->GetDataGraphPipelineSessionBindPointRequirementsARM;
|       |                                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:3225:83: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  3225 |     if (!strcmp(name, "GetDataGraphPipelineSessionMemoryRequirementsARM")) return (void *)table->GetDataGraphPipelineSessionMemoryRequirementsARM;
|       |                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:3226:72: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  3226 |     if (!strcmp(name, "BindDataGraphPipelineSessionMemoryARM")) return (void *)table->BindDataGraphPipelineSessionMemoryARM;
|       |                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:3227:69: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  3227 |     if (!strcmp(name, "DestroyDataGraphPipelineSessionARM")) return (void *)table->DestroyDataGraphPipelineSessionARM;
|       |                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:3228:58: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  3228 |     if (!strcmp(name, "CmdDispatchDataGraphARM")) return (void *)table->CmdDispatchDataGraphARM;
|       |                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:3229:77: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  3229 |     if (!strcmp(name, "GetDataGraphPipelineAvailablePropertiesARM")) return (void *)table->GetDataGraphPipelineAvailablePropertiesARM;
|       |                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:3230:68: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  3230 |     if (!strcmp(name, "GetDataGraphPipelinePropertiesARM")) return (void *)table->GetDataGraphPipelinePropertiesARM;
|       |                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: In function 'loader_lookup_instance_dispatch_table':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:3570:79: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  3570 |     if (!strcmp(name, "GetPhysicalDeviceExternalTensorPropertiesARM")) return (void *)table->GetPhysicalDeviceExternalTensorPropertiesARM;
|       |                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:3579:85: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  3579 |     if (!strcmp(name, "GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM")) return (void *)table->GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:3580:101: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  3580 |     if (!strcmp(name, "GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM")) return (void *)table->GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |                                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:5212:11: error: unknown type name 'VkPresentWait2InfoKHR'; did you mean 'VkPresentInfoKHR'?
|  5212 |     const VkPresentWait2InfoKHR*                pPresentWait2Info) {
|       |           ^~~~~~~~~~~~~~~~~~~~~
|       |           VkPresentInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: In function 'WaitForPresent2KHR':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:5220:12: error: called object is not a function or function pointer
|  5220 |     return disp->WaitForPresent2KHR(device, swapchain, pPresentWait2Info);
|       |            ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:5304:11: error: unknown type name 'VkReleaseSwapchainImagesInfoKHR'; did you mean 'VkReleaseSwapchainImagesInfoEXT'?
|  5304 |     const VkReleaseSwapchainImagesInfoKHR*      pReleaseInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkReleaseSwapchainImagesInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: In function 'ReleaseSwapchainImagesKHR':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:5312:12: error: called object is not a function or function pointer
|  5312 |     return disp->ReleaseSwapchainImagesKHR(device, pReleaseInfo);
|       |            ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:7761:11: error: unknown type name 'VkReleaseSwapchainImagesInfoKHR'; did you mean 'VkReleaseSwapchainImagesInfoEXT'?
|  7761 |     const VkReleaseSwapchainImagesInfoKHR*      pReleaseInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkReleaseSwapchainImagesInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: In function 'ReleaseSwapchainImagesEXT':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:7769:52: error: passing argument 2 of 'disp->ReleaseSwapchainImagesEXT' from incompatible pointer type [-Wincompatible-pointer-types]
|  7769 |     return disp->ReleaseSwapchainImagesEXT(device, pReleaseInfo);
|       |                                                    ^~~~~~~~~~~~
|       |                                                    |
|       |                                                    const int *
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:7769:52: note: expected 'const VkReleaseSwapchainImagesInfoEXT *' but argument is of type 'const int *'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: In function 'CmdDispatchTileQCOM':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:8119:5: error: too many arguments to function 'disp->CmdDispatchTileQCOM'; expected 1, have 2
|  8119 |     disp->CmdDispatchTileQCOM(commandBuffer, pDispatchTileInfo);
|       |     ^~~~                                     ~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_layer_dispatch_table.h:1010:31: note: declared here
|  1010 |     PFN_vkCmdDispatchTileQCOM CmdDispatchTileQCOM;
|       |                               ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:9626:11: error: unknown type name 'VkTensorCreateInfoARM'; did you mean 'VkFenceCreateInfo'?
|  9626 |     const VkTensorCreateInfoARM*                pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~
|       |           VkFenceCreateInfo
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:9628:5: error: unknown type name 'VkTensorARM'
|  9628 |     VkTensorARM*                                pTensor) {
|       |     ^~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:9641:5: error: unknown type name 'VkTensorARM'
|  9641 |     VkTensorARM                                 tensor,
|       |     ^~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:9655:11: error: unknown type name 'VkTensorViewCreateInfoARM'; did you mean 'VkBufferViewCreateInfo'?
|  9655 |     const VkTensorViewCreateInfoARM*            pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkBufferViewCreateInfo
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:9657:5: error: unknown type name 'VkTensorViewARM'
|  9657 |     VkTensorViewARM*                            pView) {
|       |     ^~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:9670:5: error: unknown type name 'VkTensorViewARM'
|  9670 |     VkTensorViewARM                             tensorView,
|       |     ^~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:9684:11: error: unknown type name 'VkTensorMemoryRequirementsInfoARM'; did you mean 'VkBufferMemoryRequirementsInfo2'?
|  9684 |     const VkTensorMemoryRequirementsInfoARM*    pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkBufferMemoryRequirementsInfo2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: In function 'GetTensorMemoryRequirementsARM':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:9693:5: error: called object is not a function or function pointer
|  9693 |     disp->GetTensorMemoryRequirementsARM(device, pInfo, pMemoryRequirements);
|       |     ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:9699:11: error: unknown type name 'VkBindTensorMemoryInfoARM'; did you mean 'VkBindBufferMemoryInfoKHR'?
|  9699 |     const VkBindTensorMemoryInfoARM*            pBindInfos) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkBindBufferMemoryInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: In function 'BindTensorMemoryARM':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:9707:12: error: called object is not a function or function pointer
|  9707 |     return disp->BindTensorMemoryARM(device, bindInfoCount, pBindInfos);
|       |            ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:9712:11: error: unknown type name 'VkDeviceTensorMemoryRequirementsARM'; did you mean 'VkDeviceBufferMemoryRequirementsKHR'?
|  9712 |     const VkDeviceTensorMemoryRequirementsARM*  pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkDeviceBufferMemoryRequirementsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: In function 'GetDeviceTensorMemoryRequirementsARM':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:9721:5: error: called object is not a function or function pointer
|  9721 |     disp->GetDeviceTensorMemoryRequirementsARM(device, pInfo, pMemoryRequirements);
|       |     ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:9726:12: error: unknown type name 'VkCopyTensorInfoARM'
|  9726 |      const VkCopyTensorInfoARM*                 pCopyTensorInfo) {
|       |            ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: In function 'CmdCopyTensorARM':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:9734:5: error: called object is not a function or function pointer
|  9734 |     disp->CmdCopyTensorARM(commandBuffer, pCopyTensorInfo);
|       |     ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:9739:11: error: unknown type name 'VkPhysicalDeviceExternalTensorInfoARM'; did you mean 'VkPhysicalDeviceExternalFenceInfoKHR'?
|  9739 |     const VkPhysicalDeviceExternalTensorInfoARM* pExternalTensorInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPhysicalDeviceExternalFenceInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:9740:5: error: unknown type name 'VkExternalTensorPropertiesARM'; did you mean 'VkExternalFencePropertiesKHR'?
|  9740 |     VkExternalTensorPropertiesARM*              pExternalTensorProperties) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:9755:11: error: unknown type name 'VkPhysicalDeviceExternalTensorInfoARM'; did you mean 'VkPhysicalDeviceExternalFenceInfoKHR'?
|  9755 |     const VkPhysicalDeviceExternalTensorInfoARM* pExternalTensorInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPhysicalDeviceExternalFenceInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:9756:5: error: unknown type name 'VkExternalTensorPropertiesARM'; did you mean 'VkExternalFencePropertiesKHR'?
|  9756 |     VkExternalTensorPropertiesARM*              pExternalTensorProperties) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:9769:11: error: unknown type name 'VkTensorCaptureDescriptorDataInfoARM'; did you mean 'VkBufferCaptureDescriptorDataInfoEXT'?
|  9769 |     const VkTensorCaptureDescriptorDataInfoARM* pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkBufferCaptureDescriptorDataInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: In function 'GetTensorOpaqueCaptureDescriptorDataARM':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:9778:12: error: called object is not a function or function pointer
|  9778 |     return disp->GetTensorOpaqueCaptureDescriptorDataARM(device, pInfo, pData);
|       |            ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:9783:11: error: unknown type name 'VkTensorViewCaptureDescriptorDataInfoARM'; did you mean 'VkImageViewCaptureDescriptorDataInfoEXT'?
|  9783 |     const VkTensorViewCaptureDescriptorDataInfoARM* pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkImageViewCaptureDescriptorDataInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: In function 'GetTensorViewOpaqueCaptureDescriptorDataARM':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:9792:12: error: called object is not a function or function pointer
|  9792 |     return disp->GetTensorViewOpaqueCaptureDescriptorDataARM(device, pInfo, pData);
|       |            ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:10185:11: error: unknown type name 'VkDataGraphPipelineCreateInfoARM'; did you mean 'VkGraphicsPipelineCreateInfo'?
| 10185 |     const VkDataGraphPipelineCreateInfoARM*     pCreateInfos,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkGraphicsPipelineCreateInfo
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: In function 'CreateDataGraphPipelinesARM':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:10195:12: error: called object is not a function or function pointer
| 10195 |     return disp->CreateDataGraphPipelinesARM(device, deferredOperation, pipelineCache, createInfoCount, pCreateInfos, pAllocator, pPipelines);
|       |            ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:10200:11: error: unknown type name 'VkDataGraphPipelineSessionCreateInfoARM'
| 10200 |     const VkDataGraphPipelineSessionCreateInfoARM* pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:10202:5: error: unknown type name 'VkDataGraphPipelineSessionARM'
| 10202 |     VkDataGraphPipelineSessionARM*              pSession) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:10215:11: error: unknown type name 'VkDataGraphPipelineSessionBindPointRequirementsInfoARM'
| 10215 |     const VkDataGraphPipelineSessionBindPointRequirementsInfoARM* pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:10217:5: error: unknown type name 'VkDataGraphPipelineSessionBindPointRequirementARM'
| 10217 |     VkDataGraphPipelineSessionBindPointRequirementARM* pBindPointRequirements) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:10230:11: error: unknown type name 'VkDataGraphPipelineSessionMemoryRequirementsInfoARM'
| 10230 |     const VkDataGraphPipelineSessionMemoryRequirementsInfoARM* pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: In function 'GetDataGraphPipelineSessionMemoryRequirementsARM':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:10239:5: error: called object is not a function or function pointer
| 10239 |     disp->GetDataGraphPipelineSessionMemoryRequirementsARM(device, pInfo, pMemoryRequirements);
|       |     ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:10245:11: error: unknown type name 'VkBindDataGraphPipelineSessionMemoryInfoARM'
| 10245 |     const VkBindDataGraphPipelineSessionMemoryInfoARM* pBindInfos) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: In function 'BindDataGraphPipelineSessionMemoryARM':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:10253:12: error: called object is not a function or function pointer
| 10253 |     return disp->BindDataGraphPipelineSessionMemoryARM(device, bindInfoCount, pBindInfos);
|       |            ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:10258:5: error: unknown type name 'VkDataGraphPipelineSessionARM'
| 10258 |     VkDataGraphPipelineSessionARM               session,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:10272:5: error: unknown type name 'VkDataGraphPipelineSessionARM'
| 10272 |     VkDataGraphPipelineSessionARM               session,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:10273:11: error: unknown type name 'VkDataGraphPipelineDispatchInfoARM'
| 10273 |     const VkDataGraphPipelineDispatchInfoARM*   pInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:10286:11: error: unknown type name 'VkDataGraphPipelineInfoARM'
| 10286 |     const VkDataGraphPipelineInfoARM*           pPipelineInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:10288:5: error: unknown type name 'VkDataGraphPipelinePropertyARM'
| 10288 |     VkDataGraphPipelinePropertyARM*             pProperties) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:10301:11: error: unknown type name 'VkDataGraphPipelineInfoARM'
| 10301 |     const VkDataGraphPipelineInfoARM*           pPipelineInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:10303:5: error: unknown type name 'VkDataGraphPipelinePropertyQueryResultARM'
| 10303 |     VkDataGraphPipelinePropertyQueryResultARM*  pProperties) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:10318:5: error: unknown type name 'VkQueueFamilyDataGraphPropertiesARM'; did you mean 'VkQueueFamilyVideoPropertiesKHR'?
| 10318 |     VkQueueFamilyDataGraphPropertiesARM*        pQueueFamilyDataGraphProperties) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkQueueFamilyVideoPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:10335:5: error: unknown type name 'VkQueueFamilyDataGraphPropertiesARM'; did you mean 'VkQueueFamilyVideoPropertiesKHR'?
| 10335 |     VkQueueFamilyDataGraphPropertiesARM*        pQueueFamilyDataGraphProperties) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkQueueFamilyVideoPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:10348:11: error: unknown type name 'VkPhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM'
| 10348 |     const VkPhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM* pQueueFamilyDataGraphProcessingEngineInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:10349:5: error: unknown type name 'VkQueueFamilyDataGraphProcessingEnginePropertiesARM'
| 10349 |     VkQueueFamilyDataGraphProcessingEnginePropertiesARM* pQueueFamilyDataGraphProcessingEngineProperties) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:10364:11: error: unknown type name 'VkPhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM'
| 10364 |     const VkPhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM* pQueueFamilyDataGraphProcessingEngineInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:10365:5: error: unknown type name 'VkQueueFamilyDataGraphProcessingEnginePropertiesARM'
| 10365 |     VkQueueFamilyDataGraphProcessingEnginePropertiesARM* pQueueFamilyDataGraphProcessingEngineProperties) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: In function 'extension_instance_gpa':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:13071:25: error: 'CreateTensorARM' undeclared (first use in this function)
| 13071 |         *addr = (void *)CreateTensorARM;
|       |                         ^~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:13075:25: error: 'DestroyTensorARM' undeclared (first use in this function)
| 13075 |         *addr = (void *)DestroyTensorARM;
|       |                         ^~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:13079:25: error: 'CreateTensorViewARM' undeclared (first use in this function)
| 13079 |         *addr = (void *)CreateTensorViewARM;
|       |                         ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:13083:25: error: 'DestroyTensorViewARM' undeclared (first use in this function)
| 13083 |         *addr = (void *)DestroyTensorViewARM;
|       |                         ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:13103:25: error: 'GetPhysicalDeviceExternalTensorPropertiesARM' undeclared (first use in this function); did you mean 'vkGetPhysicalDeviceExternalFencePropertiesKHR'?
| 13103 |         *addr = (void *)GetPhysicalDeviceExternalTensorPropertiesARM;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         vkGetPhysicalDeviceExternalFencePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:13227:25: error: 'CreateDataGraphPipelineSessionARM' undeclared (first use in this function); did you mean 'CreateDataGraphPipelinesARM'?
| 13227 |         *addr = (void *)CreateDataGraphPipelineSessionARM;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         CreateDataGraphPipelinesARM
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:13231:25: error: 'GetDataGraphPipelineSessionBindPointRequirementsARM' undeclared (first use in this function); did you mean 'GetDataGraphPipelineSessionMemoryRequirementsARM'?
| 13231 |         *addr = (void *)GetDataGraphPipelineSessionBindPointRequirementsARM;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         GetDataGraphPipelineSessionMemoryRequirementsARM
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:13243:25: error: 'DestroyDataGraphPipelineSessionARM' undeclared (first use in this function); did you mean 'CreateDataGraphPipelinesARM'?
| 13243 |         *addr = (void *)DestroyDataGraphPipelineSessionARM;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         CreateDataGraphPipelinesARM
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:13247:25: error: 'CmdDispatchDataGraphARM' undeclared (first use in this function); did you mean 'CmdDispatchGraphAMDX'?
| 13247 |         *addr = (void *)CmdDispatchDataGraphARM;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~
|       |                         CmdDispatchGraphAMDX
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:13251:25: error: 'GetDataGraphPipelineAvailablePropertiesARM' undeclared (first use in this function)
| 13251 |         *addr = (void *)GetDataGraphPipelineAvailablePropertiesARM;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:13255:25: error: 'GetDataGraphPipelinePropertiesARM' undeclared (first use in this function)
| 13255 |         *addr = (void *)GetDataGraphPipelinePropertiesARM;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:13259:25: error: 'GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM' undeclared (first use in this function); did you mean 'vkGetPhysicalDeviceQueueFamilyProperties2'?
| 13259 |         *addr = (void *)GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         vkGetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:13263:25: error: 'GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM' undeclared (first use in this function)
| 13263 |         *addr = (void *)GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: In function 'fill_out_enabled_instance_extensions':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:13566:49: error: 'VK_KHR_SURFACE_MAINTENANCE_1_EXTENSION_NAME' undeclared (first use in this function); did you mean 'VK_EXT_SURFACE_MAINTENANCE_1_EXTENSION_NAME'?
| 13566 |         else if (0 == strcmp(extension_list[i], VK_KHR_SURFACE_MAINTENANCE_1_EXTENSION_NAME)) { enables->khr_surface_maintenance1 = 1; }
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 VK_EXT_SURFACE_MAINTENANCE_1_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:14005:53: error: 'terminator_GetPhysicalDeviceExternalTensorPropertiesARM' undeclared here (not in a function); did you mean 'terminator_GetPhysicalDeviceExternalFenceProperties'?
| 14005 |     .GetPhysicalDeviceExternalTensorPropertiesARM = terminator_GetPhysicalDeviceExternalTensorPropertiesARM,
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     terminator_GetPhysicalDeviceExternalFenceProperties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:14014:59: error: 'terminator_GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM' undeclared here (not in a function); did you mean 'terminator_GetPhysicalDeviceQueueFamilyProperties2'?
| 14014 |     .GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM = terminator_GetPhysicalDeviceQueueFamilyDataGraphPropertiesARM,
|       |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                           terminator_GetPhysicalDeviceQueueFamilyProperties2
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:14015:75: error: 'terminator_GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM' undeclared here (not in a function)
| 14015 |     .GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM = terminator_GetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM,
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/sources/vulkan-loader-1.4.321.0/loader/generated/vk_loader_extensions.c:14057:51: error: 'VK_KHR_SURFACE_MAINTENANCE_1_EXTENSION_NAME' undeclared here (not in a function); did you mean 'VK_EXT_SURFACE_MAINTENANCE_1_EXTENSION_NAME'?
| 14057 |                                                   VK_KHR_SURFACE_MAINTENANCE_1_EXTENSION_NAME,
|       |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                   VK_EXT_SURFACE_MAINTENANCE_1_EXTENSION_NAME
| ninja: build stopped: subcommand failed.
| 
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/temp/run.do_compile.2893095:153 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/temp/run.do_compile.2893095, line 153
| 	#2: cmake_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/temp/run.do_compile.2893095, line 147
| 	#3: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/temp/run.do_compile.2893095, line 142
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/temp/run.do_compile.2893095, line 166
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2673 tasks of which 2657 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250801114914.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250801114914.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/temp/log.do_compile.2893095
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-loader-1.4.321.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/temp/run.do_compile.2893095' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.321.0/temp/log.do_compile.2893095
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_compile) failed with exit code '1'

--===============8040723973190504473==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-loader-upgrade-1.4.313.0-1.4.321.0.patch"

RnJvbSAwODA1YTdkMzkzNWUwOTAxMmE4ZjcwYWNkNjZjNzBkNDBmMzgyOWVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAxMTo0OTozMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi1sb2FkZXI6IHVwZ3JhZGUgMS40LjMxMy4wIC0+IDEuNC4zMjEuMAoKLS0tCiAuLi57dnVs
a2FuLWxvYWRlcl8xLjQuMzEzLjAuYmIgPT4gdnVsa2FuLWxvYWRlcl8xLjQuMzIxLjAuYmJ9IHwg
NCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi1sb2FkZXJfMS40LjMx
My4wLmJiID0+IHZ1bGthbi1sb2FkZXJfMS40LjMyMS4wLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLWxvYWRlcl8xLjQuMzEzLjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1sb2FkZXJfMS40LjMyMS4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92
dWxrYW4vdnVsa2FuLWxvYWRlcl8xLjQuMzEzLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1n
cmFwaGljcy92dWxrYW4vdnVsa2FuLWxvYWRlcl8xLjQuMzIxLjAuYmIKaW5kZXggYzczOWJhMTVk
Yy4uYTY1ZjdmYzMyYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92
dWxrYW4tbG9hZGVyXzEuNC4zMTMuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi1sb2FkZXJfMS40LjMyMS4wLmJiCkBAIC05LDggKzksOCBAQCBTRUNUSU9OID0g
ImxpYnMiCiAKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOU0UudHh0O21kNT03ZGJlZmVkMjMyNDI3NjBhYTM0NzVlZTQyODAxYzVhYyIKLVNS
Q19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLUxvYWRlci5naXQ7
YnJhbmNoPXZ1bGthbi1zZGstMS40LjMxMztwcm90b2NvbD1odHRwcyIKLVNSQ1JFViA9ICJmYjc4
NjA3NDE0ZTE1NGM3YTVjMDFiMjMxNzdiYTcxOWM4YTQ0OTA5IgorU1JDX1VSSSA9ICJnaXQ6Ly9n
aXRodWIuY29tL0tocm9ub3NHcm91cC9WdWxrYW4tTG9hZGVyLmdpdDticmFuY2g9bWFpbjtwcm90
b2NvbD1odHRwcyIKK1NSQ1JFViA9ICJkYThkMmNhYWQ5MzQxY2E4YzVhN2MzZGViYTIxN2Q3ZGE1
MGE3YzI0IgogCiBSRVFVSVJFRF9ESVNUUk9fRkVBVFVSRVMgPSAidnVsa2FuIgogCi0tIAoyLjQ3
LjEKCg==

--===============8040723973190504473==--

