Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B513FC021AA
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:20 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.17867.1736936767952238247
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=SXi998rz;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=IRGL12p7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010194697fea9f-e40f6ae9-b99a-4e0a-9b0f-e4acf66f5932-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936778;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nR0At/qJvp3YLwBzmyApvU5LLwyBn64YHdwqUhhE0QQ=;
	b=SXi998rzLVAWd3L3Qyd6EqN9bmRavdAArn0jKgNxLxxDTZ/5ESEsloQ4urBhqLnf
	YJ76VyBLn0nRi+Zh2p1pvMk0LQ6LyKq+A3sVPwu28EHkbuqQ1jwNroW3r/Qw7yuVMn1
	o18Ujsmv+jjZ/Vc1S/+/Vlgq87VmbKdIzm4O26Rs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936778;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nR0At/qJvp3YLwBzmyApvU5LLwyBn64YHdwqUhhE0QQ=;
	b=IRGL12p7dEDNs3Lp8rYE50wCpUlIaADjF/2RBxKJY1VaRP4mx6mk+tpuiKRKpM75
	PRgwrIGrZRTWvAkty1W971cLQGXbuThb2BDiel2Qpa8LDsssLdQVub7CIsmEbJTbh37
	AGilqXKOzmyg86/I6le4h8OrXPWjCsbz73rKtwHI=
Content-Type: multipart/mixed; boundary="===============0904986845924827381=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-loader: upgrading to 1.4.304.0 FAILED
Message-ID: <01010194697fea9f-e40f6ae9-b99a-4e0a-9b0f-e4acf66f5932-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209876

--===============0904986845924827381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-loader* to *1.4.304.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-loader-upgrade-1.3.296.0-1.4.304.0.patch
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
From 2b021a8c0a24a9863b7a487e6bc6fdfb1d916ed0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 09:28:32 +0000
Subject: [PATCH] vulkan-loader: upgrade 1.3.296.0 -> 1.4.304.0

---
 ...{vulkan-loader_1.3.296.0.bb => vulkan-loader_1.4.304.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.3.296.0.bb => vulkan-loader_1.4.304.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.304.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.4.304.0.bb
index 92ed18c299..bfee4b9f65 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.304.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.3.296;protocol=https"
-SRCREV = "7aeb5e4324957b6f60dac5c8cedb955df4fecbfb"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=main;protocol=https"
+SRCREV = "6a6878c614c8c6dbe81ee7a9f1176bdb52dc7dd7"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.1


--===============0904986845924827381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1874 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (918 cached, 1 parsed). 1874 targets, 41 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:40e17e3e4923a5a49eb5ae4cff48b21c295b2cf7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 276 Local 256 Mirrors 0 Missed 20 Current 406 (92% match, 97% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 499 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 500 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_create_spdx_setscene)
NOTE: Running setscene task 502 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 503 of 682 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.296.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 506 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 507 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 509 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 511 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 512 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.39.bb:do_create_spdx_setscene)
NOTE: Running setscene task 515 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe glslang-native-1_1.3.296.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 517 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 519 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 520 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 526 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 529 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 531 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 533 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe glslang-native-1_1.3.296.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 537 of 682 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.296.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 556 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 569 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe glslang-native-1_1.3.296.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 589 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 601 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1044 of 1926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.304.0.bb:do_recipe_qa)
NOTE: Running setscene task 603 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 604 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 606 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 608 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 609 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1101 of 1926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: recipe glslang-native-1_1.3.296.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 611 of 682 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.296.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 612 of 682 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.296.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1225 of 1926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: recipe vulkan-loader-1.4.304.0-r0: task do_recipe_qa: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 614 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_fetch: Succeeded
NOTE: recipe glslang-native-1_1.3.296.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-native-1_1.3.296.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1292 of 1926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_write_config: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 617 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe glslang-native-1_1.3.296.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 619 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-loader-1.4.304.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libx11-1_1.8.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1305 of 1926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.304.0.bb:do_fetch)
NOTE: recipe mesa-2_24.0.7-r0: task do_unpack: Started
NOTE: Running setscene task 623 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-native-1_1.3.296.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 629 of 682 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.3.296.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 630 of 682 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.296.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.304.0-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-native-1_1.3.296.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe spirv-tools-native-1_1.3.296.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 639 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe spirv-tools-native-1_1.3.296.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.304.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1377 of 1926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.304.0.bb:do_unpack)
NOTE: recipe spirv-headers-native-1_1.3.296.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 654 of 682 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.3.296.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 655 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.304.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-native-1_1.3.296.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-headers-native-1_1.3.296.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 659 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.304.0-r0: task do_unpack: Succeeded
NOTE: Running task 1412 of 1926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.304.0.bb:do_patch)
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 668 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.304.0-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 674 of 682 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.304.0-r0: task do_patch: Succeeded
NOTE: Running task 1462 of 1926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.304.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1463 of 1926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.304.0.bb:do_generate_toolchain_file)
NOTE: Running task 1464 of 1926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.304.0.bb:do_populate_lic)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.304.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.4.304.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.4.304.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-loader-1.4.304.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 1465 of 1926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe mesa-2_24.0.7-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.4.304.0-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-loader-1.4.304.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1787 of 1926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.304.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1886 of 1926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.304.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-loader-1.4.304.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.4.304.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-loader-1.4.304.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.4.304.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1901 of 1926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.304.0.bb:do_configure)
NOTE: recipe vulkan-loader-1.4.304.0-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.4.304.0-r0: task do_configure: Succeeded
NOTE: Running task 1902 of 1926 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.304.0.bb:do_compile)
NOTE: recipe vulkan-loader-1.4.304.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build --target all --
| Change Dir: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build'
| 
| Run Build Command(s): ninja -v -j 16 all
| [1/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/l
 oader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-work
 er/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/allocation.c.o -MF loader/CMakeFiles/vulkan.dir/allocation.c.o.d -o loader/CMakeFiles/vulkan.dir/allocation.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/allocation.c
| FAILED: loader/CMakeFiles/vulkan.dir/allocation.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/loader -
 m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/allocation.c.o -MF loader/CMakeFiles/vulkan.dir/allocation.c.o.d -o loader/CMakeFiles/vulkan.dir/allocation.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/allocation.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/allocation.h:31,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/allocation.c:27:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:295:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   295 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:498:5: error: unknown type name 'PFN_vkCmdSetLineStipple'; did you mean 'PFN_vkCmdSetLineStippleEXT'?
|   498 |     PFN_vkCmdSetLineStipple CmdSetLineStipple;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetLineStippleEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:499:5: error: unknown type name 'PFN_vkMapMemory2'; did you mean 'PFN_vkMapMemory'?
|   499 |     PFN_vkMapMemory2 MapMemory2;
|       |     ^~~~~~~~~~~~~~~~
|       |     PFN_vkMapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:500:5: error: unknown type name 'PFN_vkUnmapMemory2'; did you mean 'PFN_vkUnmapMemory'?
|   500 |     PFN_vkUnmapMemory2 UnmapMemory2;
|       |     ^~~~~~~~~~~~~~~~~~
|       |     PFN_vkUnmapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:501:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2'; did you mean 'PFN_vkCmdBindIndexBuffer'?
|   501 |     PFN_vkCmdBindIndexBuffer2 CmdBindIndexBuffer2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindIndexBuffer
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:502:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularity'; did you mean 'PFN_vkGetRenderingAreaGranularityKHR'?
|   502 |     PFN_vkGetRenderingAreaGranularity GetRenderingAreaGranularity;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetRenderingAreaGranularityKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:503:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayout'; did you mean 'PFN_vkGetDeviceImageSubresourceLayoutKHR'?
|   503 |     PFN_vkGetDeviceImageSubresourceLayout GetDeviceImageSubresourceLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceImageSubresourceLayoutKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:504:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2'; did you mean 'PFN_vkGetImageSubresourceLayout'?
|   504 |     PFN_vkGetImageSubresourceLayout2 GetImageSubresourceLayout2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageSubresourceLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:505:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet'; did you mean 'PFN_vkCmdPushDescriptorSetKHR'?
|   505 |     PFN_vkCmdPushDescriptorSet CmdPushDescriptorSet;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:506:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplateKHR'?
|   506 |     PFN_vkCmdPushDescriptorSetWithTemplate CmdPushDescriptorSetWithTemplate;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplateKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:507:5: error: unknown type name 'PFN_vkCmdSetRenderingAttachmentLocations'; did you mean 'PFN_vkCmdSetRenderingAttachmentLocationsKHR'?
|   507 |     PFN_vkCmdSetRenderingAttachmentLocations CmdSetRenderingAttachmentLocations;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingAttachmentLocationsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:508:5: error: unknown type name 'PFN_vkCmdSetRenderingInputAttachmentIndices'; did you mean 'PFN_vkCmdSetRenderingInputAttachmentIndicesKHR'?
|   508 |     PFN_vkCmdSetRenderingInputAttachmentIndices CmdSetRenderingInputAttachmentIndices;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingInputAttachmentIndicesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:509:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2'; did you mean 'PFN_vkCmdBindDescriptorSets'?
|   509 |     PFN_vkCmdBindDescriptorSets2 CmdBindDescriptorSets2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindDescriptorSets
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:510:5: error: unknown type name 'PFN_vkCmdPushConstants2'; did you mean 'PFN_vkCmdPushConstants'?
|   510 |     PFN_vkCmdPushConstants2 CmdPushConstants2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushConstants
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:511:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2'; did you mean 'PFN_vkCmdPushDescriptorSet2KHR'?
|   511 |     PFN_vkCmdPushDescriptorSet2 CmdPushDescriptorSet2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSet2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:512:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'?
|   512 |     PFN_vkCmdPushDescriptorSetWithTemplate2 CmdPushDescriptorSetWithTemplate2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:513:5: error: unknown type name 'PFN_vkCopyMemoryToImage'; did you mean 'PFN_vkCopyMemoryToImageEXT'?
|   513 |     PFN_vkCopyMemoryToImage CopyMemoryToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyMemoryToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:514:5: error: unknown type name 'PFN_vkCopyImageToMemory'; did you mean 'PFN_vkCopyImageToMemoryEXT'?
|   514 |     PFN_vkCopyImageToMemory CopyImageToMemory;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToMemoryEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:515:5: error: unknown type name 'PFN_vkCopyImageToImage'; did you mean 'PFN_vkCopyImageToImageEXT'?
|   515 |     PFN_vkCopyImageToImage CopyImageToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:516:5: error: unknown type name 'PFN_vkTransitionImageLayout'; did you mean 'PFN_vkTransitionImageLayoutEXT'?
|   516 |     PFN_vkTransitionImageLayout TransitionImageLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkTransitionImageLayoutEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:751:5: error: unknown type name 'PFN_vkGetImageViewHandle64NVX'; did you mean 'PFN_vkGetImageViewHandleNVX'?
|   751 |     PFN_vkGetImageViewHandle64NVX GetImageViewHandle64NVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewHandleNVX
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   481 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| [2/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/l
 oader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-work
 er/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/unk
 nown_function_handling.c
| FAILED: loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/loader -
 m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/unknown_fu
 nction_handling.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/unknown_function_handling.h:27,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/unknown_function_handling.c:25:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:295:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   295 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:498:5: error: unknown type name 'PFN_vkCmdSetLineStipple'; did you mean 'PFN_vkCmdSetLineStippleEXT'?
|   498 |     PFN_vkCmdSetLineStipple CmdSetLineStipple;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetLineStippleEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:499:5: error: unknown type name 'PFN_vkMapMemory2'; did you mean 'PFN_vkMapMemory'?
|   499 |     PFN_vkMapMemory2 MapMemory2;
|       |     ^~~~~~~~~~~~~~~~
|       |     PFN_vkMapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:500:5: error: unknown type name 'PFN_vkUnmapMemory2'; did you mean 'PFN_vkUnmapMemory'?
|   500 |     PFN_vkUnmapMemory2 UnmapMemory2;
|       |     ^~~~~~~~~~~~~~~~~~
|       |     PFN_vkUnmapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:501:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2'; did you mean 'PFN_vkCmdBindIndexBuffer'?
|   501 |     PFN_vkCmdBindIndexBuffer2 CmdBindIndexBuffer2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindIndexBuffer
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:502:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularity'; did you mean 'PFN_vkGetRenderingAreaGranularityKHR'?
|   502 |     PFN_vkGetRenderingAreaGranularity GetRenderingAreaGranularity;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetRenderingAreaGranularityKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:503:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayout'; did you mean 'PFN_vkGetDeviceImageSubresourceLayoutKHR'?
|   503 |     PFN_vkGetDeviceImageSubresourceLayout GetDeviceImageSubresourceLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceImageSubresourceLayoutKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:504:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2'; did you mean 'PFN_vkGetImageSubresourceLayout'?
|   504 |     PFN_vkGetImageSubresourceLayout2 GetImageSubresourceLayout2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageSubresourceLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:505:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet'; did you mean 'PFN_vkCmdPushDescriptorSetKHR'?
|   505 |     PFN_vkCmdPushDescriptorSet CmdPushDescriptorSet;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:506:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplateKHR'?
|   506 |     PFN_vkCmdPushDescriptorSetWithTemplate CmdPushDescriptorSetWithTemplate;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplateKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:507:5: error: unknown type name 'PFN_vkCmdSetRenderingAttachmentLocations'; did you mean 'PFN_vkCmdSetRenderingAttachmentLocationsKHR'?
|   507 |     PFN_vkCmdSetRenderingAttachmentLocations CmdSetRenderingAttachmentLocations;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingAttachmentLocationsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:508:5: error: unknown type name 'PFN_vkCmdSetRenderingInputAttachmentIndices'; did you mean 'PFN_vkCmdSetRenderingInputAttachmentIndicesKHR'?
|   508 |     PFN_vkCmdSetRenderingInputAttachmentIndices CmdSetRenderingInputAttachmentIndices;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingInputAttachmentIndicesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:509:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2'; did you mean 'PFN_vkCmdBindDescriptorSets'?
|   509 |     PFN_vkCmdBindDescriptorSets2 CmdBindDescriptorSets2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindDescriptorSets
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:510:5: error: unknown type name 'PFN_vkCmdPushConstants2'; did you mean 'PFN_vkCmdPushConstants'?
|   510 |     PFN_vkCmdPushConstants2 CmdPushConstants2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushConstants
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:511:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2'; did you mean 'PFN_vkCmdPushDescriptorSet2KHR'?
|   511 |     PFN_vkCmdPushDescriptorSet2 CmdPushDescriptorSet2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSet2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:512:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'?
|   512 |     PFN_vkCmdPushDescriptorSetWithTemplate2 CmdPushDescriptorSetWithTemplate2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:513:5: error: unknown type name 'PFN_vkCopyMemoryToImage'; did you mean 'PFN_vkCopyMemoryToImageEXT'?
|   513 |     PFN_vkCopyMemoryToImage CopyMemoryToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyMemoryToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:514:5: error: unknown type name 'PFN_vkCopyImageToMemory'; did you mean 'PFN_vkCopyImageToMemoryEXT'?
|   514 |     PFN_vkCopyImageToMemory CopyImageToMemory;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToMemoryEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:515:5: error: unknown type name 'PFN_vkCopyImageToImage'; did you mean 'PFN_vkCopyImageToImageEXT'?
|   515 |     PFN_vkCopyImageToImage CopyImageToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:516:5: error: unknown type name 'PFN_vkTransitionImageLayout'; did you mean 'PFN_vkTransitionImageLayoutEXT'?
|   516 |     PFN_vkTransitionImageLayout TransitionImageLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkTransitionImageLayoutEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:751:5: error: unknown type name 'PFN_vkGetImageViewHandle64NVX'; did you mean 'PFN_vkGetImageViewHandleNVX'?
|   751 |     PFN_vkGetImageViewHandle64NVX GetImageViewHandle64NVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewHandleNVX
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   481 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| [3/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/l
 oader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-work
 er/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/log.c.o -MF loader/CMakeFiles/vulkan.dir/log.c.o.d -o loader/CMakeFiles/vulkan.dir/log.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/log.c
| FAILED: loader/CMakeFiles/vulkan.dir/log.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/loader -
 m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/log.c.o -MF loader/CMakeFiles/vulkan.dir/log.c.o.d -o loader/CMakeFiles/vulkan.dir/log.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/log.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/debug_utils.h:27,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/log.c:34:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:295:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   295 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:498:5: error: unknown type name 'PFN_vkCmdSetLineStipple'; did you mean 'PFN_vkCmdSetLineStippleEXT'?
|   498 |     PFN_vkCmdSetLineStipple CmdSetLineStipple;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetLineStippleEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:499:5: error: unknown type name 'PFN_vkMapMemory2'; did you mean 'PFN_vkMapMemory'?
|   499 |     PFN_vkMapMemory2 MapMemory2;
|       |     ^~~~~~~~~~~~~~~~
|       |     PFN_vkMapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:500:5: error: unknown type name 'PFN_vkUnmapMemory2'; did you mean 'PFN_vkUnmapMemory'?
|   500 |     PFN_vkUnmapMemory2 UnmapMemory2;
|       |     ^~~~~~~~~~~~~~~~~~
|       |     PFN_vkUnmapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:501:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2'; did you mean 'PFN_vkCmdBindIndexBuffer'?
|   501 |     PFN_vkCmdBindIndexBuffer2 CmdBindIndexBuffer2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindIndexBuffer
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:502:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularity'; did you mean 'PFN_vkGetRenderingAreaGranularityKHR'?
|   502 |     PFN_vkGetRenderingAreaGranularity GetRenderingAreaGranularity;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetRenderingAreaGranularityKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:503:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayout'; did you mean 'PFN_vkGetDeviceImageSubresourceLayoutKHR'?
|   503 |     PFN_vkGetDeviceImageSubresourceLayout GetDeviceImageSubresourceLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceImageSubresourceLayoutKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:504:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2'; did you mean 'PFN_vkGetImageSubresourceLayout'?
|   504 |     PFN_vkGetImageSubresourceLayout2 GetImageSubresourceLayout2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageSubresourceLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:505:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet'; did you mean 'PFN_vkCmdPushDescriptorSetKHR'?
|   505 |     PFN_vkCmdPushDescriptorSet CmdPushDescriptorSet;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:506:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplateKHR'?
|   506 |     PFN_vkCmdPushDescriptorSetWithTemplate CmdPushDescriptorSetWithTemplate;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplateKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:507:5: error: unknown type name 'PFN_vkCmdSetRenderingAttachmentLocations'; did you mean 'PFN_vkCmdSetRenderingAttachmentLocationsKHR'?
|   507 |     PFN_vkCmdSetRenderingAttachmentLocations CmdSetRenderingAttachmentLocations;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingAttachmentLocationsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:508:5: error: unknown type name 'PFN_vkCmdSetRenderingInputAttachmentIndices'; did you mean 'PFN_vkCmdSetRenderingInputAttachmentIndicesKHR'?
|   508 |     PFN_vkCmdSetRenderingInputAttachmentIndices CmdSetRenderingInputAttachmentIndices;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingInputAttachmentIndicesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:509:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2'; did you mean 'PFN_vkCmdBindDescriptorSets'?
|   509 |     PFN_vkCmdBindDescriptorSets2 CmdBindDescriptorSets2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindDescriptorSets
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:510:5: error: unknown type name 'PFN_vkCmdPushConstants2'; did you mean 'PFN_vkCmdPushConstants'?
|   510 |     PFN_vkCmdPushConstants2 CmdPushConstants2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushConstants
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:511:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2'; did you mean 'PFN_vkCmdPushDescriptorSet2KHR'?
|   511 |     PFN_vkCmdPushDescriptorSet2 CmdPushDescriptorSet2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSet2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:512:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'?
|   512 |     PFN_vkCmdPushDescriptorSetWithTemplate2 CmdPushDescriptorSetWithTemplate2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:513:5: error: unknown type name 'PFN_vkCopyMemoryToImage'; did you mean 'PFN_vkCopyMemoryToImageEXT'?
|   513 |     PFN_vkCopyMemoryToImage CopyMemoryToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyMemoryToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:514:5: error: unknown type name 'PFN_vkCopyImageToMemory'; did you mean 'PFN_vkCopyImageToMemoryEXT'?
|   514 |     PFN_vkCopyImageToMemory CopyImageToMemory;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToMemoryEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:515:5: error: unknown type name 'PFN_vkCopyImageToImage'; did you mean 'PFN_vkCopyImageToImageEXT'?
|   515 |     PFN_vkCopyImageToImage CopyImageToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:516:5: error: unknown type name 'PFN_vkTransitionImageLayout'; did you mean 'PFN_vkTransitionImageLayoutEXT'?
|   516 |     PFN_vkTransitionImageLayout TransitionImageLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkTransitionImageLayoutEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:751:5: error: unknown type name 'PFN_vkGetImageViewHandle64NVX'; did you mean 'PFN_vkGetImageViewHandleNVX'?
|   751 |     PFN_vkGetImageViewHandle64NVX GetImageViewHandle64NVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewHandleNVX
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   481 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| [4/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/l
 oader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-work
 er/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/extension_manual.c
| FAILED: loader/CMakeFiles/vulkan.dir/extension_manual.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/loader -
 m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/extension_manual.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/allocation.h:31,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/extension_manual.c:29:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:295:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   295 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:498:5: error: unknown type name 'PFN_vkCmdSetLineStipple'; did you mean 'PFN_vkCmdSetLineStippleEXT'?
|   498 |     PFN_vkCmdSetLineStipple CmdSetLineStipple;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetLineStippleEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:499:5: error: unknown type name 'PFN_vkMapMemory2'; did you mean 'PFN_vkMapMemory'?
|   499 |     PFN_vkMapMemory2 MapMemory2;
|       |     ^~~~~~~~~~~~~~~~
|       |     PFN_vkMapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:500:5: error: unknown type name 'PFN_vkUnmapMemory2'; did you mean 'PFN_vkUnmapMemory'?
|   500 |     PFN_vkUnmapMemory2 UnmapMemory2;
|       |     ^~~~~~~~~~~~~~~~~~
|       |     PFN_vkUnmapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:501:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2'; did you mean 'PFN_vkCmdBindIndexBuffer'?
|   501 |     PFN_vkCmdBindIndexBuffer2 CmdBindIndexBuffer2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindIndexBuffer
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:502:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularity'; did you mean 'PFN_vkGetRenderingAreaGranularityKHR'?
|   502 |     PFN_vkGetRenderingAreaGranularity GetRenderingAreaGranularity;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetRenderingAreaGranularityKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:503:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayout'; did you mean 'PFN_vkGetDeviceImageSubresourceLayoutKHR'?
|   503 |     PFN_vkGetDeviceImageSubresourceLayout GetDeviceImageSubresourceLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceImageSubresourceLayoutKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:504:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2'; did you mean 'PFN_vkGetImageSubresourceLayout'?
|   504 |     PFN_vkGetImageSubresourceLayout2 GetImageSubresourceLayout2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageSubresourceLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:505:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet'; did you mean 'PFN_vkCmdPushDescriptorSetKHR'?
|   505 |     PFN_vkCmdPushDescriptorSet CmdPushDescriptorSet;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:506:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplateKHR'?
|   506 |     PFN_vkCmdPushDescriptorSetWithTemplate CmdPushDescriptorSetWithTemplate;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplateKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:507:5: error: unknown type name 'PFN_vkCmdSetRenderingAttachmentLocations'; did you mean 'PFN_vkCmdSetRenderingAttachmentLocationsKHR'?
|   507 |     PFN_vkCmdSetRenderingAttachmentLocations CmdSetRenderingAttachmentLocations;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingAttachmentLocationsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:508:5: error: unknown type name 'PFN_vkCmdSetRenderingInputAttachmentIndices'; did you mean 'PFN_vkCmdSetRenderingInputAttachmentIndicesKHR'?
|   508 |     PFN_vkCmdSetRenderingInputAttachmentIndices CmdSetRenderingInputAttachmentIndices;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingInputAttachmentIndicesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:509:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2'; did you mean 'PFN_vkCmdBindDescriptorSets'?
|   509 |     PFN_vkCmdBindDescriptorSets2 CmdBindDescriptorSets2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindDescriptorSets
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:510:5: error: unknown type name 'PFN_vkCmdPushConstants2'; did you mean 'PFN_vkCmdPushConstants'?
|   510 |     PFN_vkCmdPushConstants2 CmdPushConstants2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushConstants
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:511:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2'; did you mean 'PFN_vkCmdPushDescriptorSet2KHR'?
|   511 |     PFN_vkCmdPushDescriptorSet2 CmdPushDescriptorSet2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSet2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:512:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'?
|   512 |     PFN_vkCmdPushDescriptorSetWithTemplate2 CmdPushDescriptorSetWithTemplate2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:513:5: error: unknown type name 'PFN_vkCopyMemoryToImage'; did you mean 'PFN_vkCopyMemoryToImageEXT'?
|   513 |     PFN_vkCopyMemoryToImage CopyMemoryToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyMemoryToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:514:5: error: unknown type name 'PFN_vkCopyImageToMemory'; did you mean 'PFN_vkCopyImageToMemoryEXT'?
|   514 |     PFN_vkCopyImageToMemory CopyImageToMemory;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToMemoryEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:515:5: error: unknown type name 'PFN_vkCopyImageToImage'; did you mean 'PFN_vkCopyImageToImageEXT'?
|   515 |     PFN_vkCopyImageToImage CopyImageToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:516:5: error: unknown type name 'PFN_vkTransitionImageLayout'; did you mean 'PFN_vkTransitionImageLayoutEXT'?
|   516 |     PFN_vkTransitionImageLayout TransitionImageLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkTransitionImageLayoutEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:751:5: error: unknown type name 'PFN_vkGetImageViewHandle64NVX'; did you mean 'PFN_vkGetImageViewHandleNVX'?
|   751 |     PFN_vkGetImageViewHandle64NVX GetImageViewHandle64NVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewHandleNVX
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   481 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| [5/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/l
 oader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-work
 er/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/terminator.c.o -MF loader/CMakeFiles/vulkan.dir/terminator.c.o.d -o loader/CMakeFiles/vulkan.dir/terminator.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/terminator.c
| FAILED: loader/CMakeFiles/vulkan.dir/terminator.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/loader -
 m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/terminator.c.o -MF loader/CMakeFiles/vulkan.dir/terminator.c.o.d -o loader/CMakeFiles/vulkan.dir/terminator.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/terminator.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/terminator.c:34:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:295:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   295 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:498:5: error: unknown type name 'PFN_vkCmdSetLineStipple'; did you mean 'PFN_vkCmdSetLineStippleEXT'?
|   498 |     PFN_vkCmdSetLineStipple CmdSetLineStipple;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetLineStippleEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:499:5: error: unknown type name 'PFN_vkMapMemory2'; did you mean 'PFN_vkMapMemory'?
|   499 |     PFN_vkMapMemory2 MapMemory2;
|       |     ^~~~~~~~~~~~~~~~
|       |     PFN_vkMapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:500:5: error: unknown type name 'PFN_vkUnmapMemory2'; did you mean 'PFN_vkUnmapMemory'?
|   500 |     PFN_vkUnmapMemory2 UnmapMemory2;
|       |     ^~~~~~~~~~~~~~~~~~
|       |     PFN_vkUnmapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:501:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2'; did you mean 'PFN_vkCmdBindIndexBuffer'?
|   501 |     PFN_vkCmdBindIndexBuffer2 CmdBindIndexBuffer2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindIndexBuffer
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:502:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularity'; did you mean 'PFN_vkGetRenderingAreaGranularityKHR'?
|   502 |     PFN_vkGetRenderingAreaGranularity GetRenderingAreaGranularity;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetRenderingAreaGranularityKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:503:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayout'; did you mean 'PFN_vkGetDeviceImageSubresourceLayoutKHR'?
|   503 |     PFN_vkGetDeviceImageSubresourceLayout GetDeviceImageSubresourceLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceImageSubresourceLayoutKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:504:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2'; did you mean 'PFN_vkGetImageSubresourceLayout'?
|   504 |     PFN_vkGetImageSubresourceLayout2 GetImageSubresourceLayout2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageSubresourceLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:505:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet'; did you mean 'PFN_vkCmdPushDescriptorSetKHR'?
|   505 |     PFN_vkCmdPushDescriptorSet CmdPushDescriptorSet;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:506:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplateKHR'?
|   506 |     PFN_vkCmdPushDescriptorSetWithTemplate CmdPushDescriptorSetWithTemplate;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplateKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:507:5: error: unknown type name 'PFN_vkCmdSetRenderingAttachmentLocations'; did you mean 'PFN_vkCmdSetRenderingAttachmentLocationsKHR'?
|   507 |     PFN_vkCmdSetRenderingAttachmentLocations CmdSetRenderingAttachmentLocations;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingAttachmentLocationsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:508:5: error: unknown type name 'PFN_vkCmdSetRenderingInputAttachmentIndices'; did you mean 'PFN_vkCmdSetRenderingInputAttachmentIndicesKHR'?
|   508 |     PFN_vkCmdSetRenderingInputAttachmentIndices CmdSetRenderingInputAttachmentIndices;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingInputAttachmentIndicesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:509:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2'; did you mean 'PFN_vkCmdBindDescriptorSets'?
|   509 |     PFN_vkCmdBindDescriptorSets2 CmdBindDescriptorSets2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindDescriptorSets
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:510:5: error: unknown type name 'PFN_vkCmdPushConstants2'; did you mean 'PFN_vkCmdPushConstants'?
|   510 |     PFN_vkCmdPushConstants2 CmdPushConstants2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushConstants
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:511:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2'; did you mean 'PFN_vkCmdPushDescriptorSet2KHR'?
|   511 |     PFN_vkCmdPushDescriptorSet2 CmdPushDescriptorSet2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSet2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:512:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'?
|   512 |     PFN_vkCmdPushDescriptorSetWithTemplate2 CmdPushDescriptorSetWithTemplate2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:513:5: error: unknown type name 'PFN_vkCopyMemoryToImage'; did you mean 'PFN_vkCopyMemoryToImageEXT'?
|   513 |     PFN_vkCopyMemoryToImage CopyMemoryToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyMemoryToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:514:5: error: unknown type name 'PFN_vkCopyImageToMemory'; did you mean 'PFN_vkCopyImageToMemoryEXT'?
|   514 |     PFN_vkCopyImageToMemory CopyImageToMemory;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToMemoryEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:515:5: error: unknown type name 'PFN_vkCopyImageToImage'; did you mean 'PFN_vkCopyImageToImageEXT'?
|   515 |     PFN_vkCopyImageToImage CopyImageToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:516:5: error: unknown type name 'PFN_vkTransitionImageLayout'; did you mean 'PFN_vkTransitionImageLayoutEXT'?
|   516 |     PFN_vkTransitionImageLayout TransitionImageLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkTransitionImageLayoutEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:751:5: error: unknown type name 'PFN_vkGetImageViewHandle64NVX'; did you mean 'PFN_vkGetImageViewHandleNVX'?
|   751 |     PFN_vkGetImageViewHandle64NVX GetImageViewHandle64NVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewHandleNVX
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   481 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| [6/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/l
 oader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-work
 er/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader_linux.c.o -MF loader/CMakeFiles/vulkan.dir/loader_linux.c.o.d -o loader/CMakeFiles/vulkan.dir/loader_linux.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_linux.c
| FAILED: loader/CMakeFiles/vulkan.dir/loader_linux.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/loader -
 m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader_linux.c.o -MF loader/CMakeFiles/vulkan.dir/loader_linux.c.o.d -o loader/CMakeFiles/vulkan.dir/loader_linux.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_linux.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_linux.h:27,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_linux.c:30:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:295:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   295 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:498:5: error: unknown type name 'PFN_vkCmdSetLineStipple'; did you mean 'PFN_vkCmdSetLineStippleEXT'?
|   498 |     PFN_vkCmdSetLineStipple CmdSetLineStipple;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetLineStippleEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:499:5: error: unknown type name 'PFN_vkMapMemory2'; did you mean 'PFN_vkMapMemory'?
|   499 |     PFN_vkMapMemory2 MapMemory2;
|       |     ^~~~~~~~~~~~~~~~
|       |     PFN_vkMapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:500:5: error: unknown type name 'PFN_vkUnmapMemory2'; did you mean 'PFN_vkUnmapMemory'?
|   500 |     PFN_vkUnmapMemory2 UnmapMemory2;
|       |     ^~~~~~~~~~~~~~~~~~
|       |     PFN_vkUnmapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:501:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2'; did you mean 'PFN_vkCmdBindIndexBuffer'?
|   501 |     PFN_vkCmdBindIndexBuffer2 CmdBindIndexBuffer2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindIndexBuffer
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:502:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularity'; did you mean 'PFN_vkGetRenderingAreaGranularityKHR'?
|   502 |     PFN_vkGetRenderingAreaGranularity GetRenderingAreaGranularity;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetRenderingAreaGranularityKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:503:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayout'; did you mean 'PFN_vkGetDeviceImageSubresourceLayoutKHR'?
|   503 |     PFN_vkGetDeviceImageSubresourceLayout GetDeviceImageSubresourceLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceImageSubresourceLayoutKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:504:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2'; did you mean 'PFN_vkGetImageSubresourceLayout'?
|   504 |     PFN_vkGetImageSubresourceLayout2 GetImageSubresourceLayout2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageSubresourceLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:505:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet'; did you mean 'PFN_vkCmdPushDescriptorSetKHR'?
|   505 |     PFN_vkCmdPushDescriptorSet CmdPushDescriptorSet;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:506:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplateKHR'?
|   506 |     PFN_vkCmdPushDescriptorSetWithTemplate CmdPushDescriptorSetWithTemplate;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplateKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:507:5: error: unknown type name 'PFN_vkCmdSetRenderingAttachmentLocations'; did you mean 'PFN_vkCmdSetRenderingAttachmentLocationsKHR'?
|   507 |     PFN_vkCmdSetRenderingAttachmentLocations CmdSetRenderingAttachmentLocations;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingAttachmentLocationsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:508:5: error: unknown type name 'PFN_vkCmdSetRenderingInputAttachmentIndices'; did you mean 'PFN_vkCmdSetRenderingInputAttachmentIndicesKHR'?
|   508 |     PFN_vkCmdSetRenderingInputAttachmentIndices CmdSetRenderingInputAttachmentIndices;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingInputAttachmentIndicesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:509:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2'; did you mean 'PFN_vkCmdBindDescriptorSets'?
|   509 |     PFN_vkCmdBindDescriptorSets2 CmdBindDescriptorSets2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindDescriptorSets
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:510:5: error: unknown type name 'PFN_vkCmdPushConstants2'; did you mean 'PFN_vkCmdPushConstants'?
|   510 |     PFN_vkCmdPushConstants2 CmdPushConstants2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushConstants
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:511:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2'; did you mean 'PFN_vkCmdPushDescriptorSet2KHR'?
|   511 |     PFN_vkCmdPushDescriptorSet2 CmdPushDescriptorSet2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSet2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:512:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'?
|   512 |     PFN_vkCmdPushDescriptorSetWithTemplate2 CmdPushDescriptorSetWithTemplate2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:513:5: error: unknown type name 'PFN_vkCopyMemoryToImage'; did you mean 'PFN_vkCopyMemoryToImageEXT'?
|   513 |     PFN_vkCopyMemoryToImage CopyMemoryToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyMemoryToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:514:5: error: unknown type name 'PFN_vkCopyImageToMemory'; did you mean 'PFN_vkCopyImageToMemoryEXT'?
|   514 |     PFN_vkCopyImageToMemory CopyImageToMemory;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToMemoryEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:515:5: error: unknown type name 'PFN_vkCopyImageToImage'; did you mean 'PFN_vkCopyImageToImageEXT'?
|   515 |     PFN_vkCopyImageToImage CopyImageToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:516:5: error: unknown type name 'PFN_vkTransitionImageLayout'; did you mean 'PFN_vkTransitionImageLayoutEXT'?
|   516 |     PFN_vkTransitionImageLayout TransitionImageLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkTransitionImageLayoutEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:751:5: error: unknown type name 'PFN_vkGetImageViewHandle64NVX'; did you mean 'PFN_vkGetImageViewHandleNVX'?
|   751 |     PFN_vkGetImageViewHandle64NVX GetImageViewHandle64NVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewHandleNVX
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   481 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| [7/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/l
 oader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-work
 er/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader_environment.c.o -MF loader/CMakeFiles/vulkan.dir/loader_environment.c.o.d -o loader/CMakeFiles/vulkan.dir/loader_environment.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_environment.c
| FAILED: loader/CMakeFiles/vulkan.dir/loader_environment.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/loader -
 m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader_environment.c.o -MF loader/CMakeFiles/vulkan.dir/loader_environment.c.o.d -o loader/CMakeFiles/vulkan.dir/loader_environment.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_environment.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_environment.h:31,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_environment.c:29:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:295:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   295 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:498:5: error: unknown type name 'PFN_vkCmdSetLineStipple'; did you mean 'PFN_vkCmdSetLineStippleEXT'?
|   498 |     PFN_vkCmdSetLineStipple CmdSetLineStipple;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetLineStippleEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:499:5: error: unknown type name 'PFN_vkMapMemory2'; did you mean 'PFN_vkMapMemory'?
|   499 |     PFN_vkMapMemory2 MapMemory2;
|       |     ^~~~~~~~~~~~~~~~
|       |     PFN_vkMapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:500:5: error: unknown type name 'PFN_vkUnmapMemory2'; did you mean 'PFN_vkUnmapMemory'?
|   500 |     PFN_vkUnmapMemory2 UnmapMemory2;
|       |     ^~~~~~~~~~~~~~~~~~
|       |     PFN_vkUnmapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:501:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2'; did you mean 'PFN_vkCmdBindIndexBuffer'?
|   501 |     PFN_vkCmdBindIndexBuffer2 CmdBindIndexBuffer2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindIndexBuffer
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:502:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularity'; did you mean 'PFN_vkGetRenderingAreaGranularityKHR'?
|   502 |     PFN_vkGetRenderingAreaGranularity GetRenderingAreaGranularity;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetRenderingAreaGranularityKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:503:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayout'; did you mean 'PFN_vkGetDeviceImageSubresourceLayoutKHR'?
|   503 |     PFN_vkGetDeviceImageSubresourceLayout GetDeviceImageSubresourceLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceImageSubresourceLayoutKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:504:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2'; did you mean 'PFN_vkGetImageSubresourceLayout'?
|   504 |     PFN_vkGetImageSubresourceLayout2 GetImageSubresourceLayout2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageSubresourceLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:505:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet'; did you mean 'PFN_vkCmdPushDescriptorSetKHR'?
|   505 |     PFN_vkCmdPushDescriptorSet CmdPushDescriptorSet;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:506:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplateKHR'?
|   506 |     PFN_vkCmdPushDescriptorSetWithTemplate CmdPushDescriptorSetWithTemplate;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplateKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:507:5: error: unknown type name 'PFN_vkCmdSetRenderingAttachmentLocations'; did you mean 'PFN_vkCmdSetRenderingAttachmentLocationsKHR'?
|   507 |     PFN_vkCmdSetRenderingAttachmentLocations CmdSetRenderingAttachmentLocations;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingAttachmentLocationsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:508:5: error: unknown type name 'PFN_vkCmdSetRenderingInputAttachmentIndices'; did you mean 'PFN_vkCmdSetRenderingInputAttachmentIndicesKHR'?
|   508 |     PFN_vkCmdSetRenderingInputAttachmentIndices CmdSetRenderingInputAttachmentIndices;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingInputAttachmentIndicesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:509:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2'; did you mean 'PFN_vkCmdBindDescriptorSets'?
|   509 |     PFN_vkCmdBindDescriptorSets2 CmdBindDescriptorSets2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindDescriptorSets
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:510:5: error: unknown type name 'PFN_vkCmdPushConstants2'; did you mean 'PFN_vkCmdPushConstants'?
|   510 |     PFN_vkCmdPushConstants2 CmdPushConstants2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushConstants
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:511:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2'; did you mean 'PFN_vkCmdPushDescriptorSet2KHR'?
|   511 |     PFN_vkCmdPushDescriptorSet2 CmdPushDescriptorSet2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSet2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:512:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'?
|   512 |     PFN_vkCmdPushDescriptorSetWithTemplate2 CmdPushDescriptorSetWithTemplate2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:513:5: error: unknown type name 'PFN_vkCopyMemoryToImage'; did you mean 'PFN_vkCopyMemoryToImageEXT'?
|   513 |     PFN_vkCopyMemoryToImage CopyMemoryToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyMemoryToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:514:5: error: unknown type name 'PFN_vkCopyImageToMemory'; did you mean 'PFN_vkCopyImageToMemoryEXT'?
|   514 |     PFN_vkCopyImageToMemory CopyImageToMemory;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToMemoryEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:515:5: error: unknown type name 'PFN_vkCopyImageToImage'; did you mean 'PFN_vkCopyImageToImageEXT'?
|   515 |     PFN_vkCopyImageToImage CopyImageToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:516:5: error: unknown type name 'PFN_vkTransitionImageLayout'; did you mean 'PFN_vkTransitionImageLayoutEXT'?
|   516 |     PFN_vkTransitionImageLayout TransitionImageLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkTransitionImageLayoutEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:751:5: error: unknown type name 'PFN_vkGetImageViewHandle64NVX'; did you mean 'PFN_vkGetImageViewHandleNVX'?
|   751 |     PFN_vkGetImageViewHandle64NVX GetImageViewHandle64NVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewHandleNVX
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   481 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| [8/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/l
 oader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-work
 er/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/debug_utils.c
| FAILED: loader/CMakeFiles/vulkan.dir/debug_utils.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/loader -
 m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/debug_utils.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/allocation.h:31,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/debug_utils.c:33:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:295:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   295 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:498:5: error: unknown type name 'PFN_vkCmdSetLineStipple'; did you mean 'PFN_vkCmdSetLineStippleEXT'?
|   498 |     PFN_vkCmdSetLineStipple CmdSetLineStipple;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetLineStippleEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:499:5: error: unknown type name 'PFN_vkMapMemory2'; did you mean 'PFN_vkMapMemory'?
|   499 |     PFN_vkMapMemory2 MapMemory2;
|       |     ^~~~~~~~~~~~~~~~
|       |     PFN_vkMapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:500:5: error: unknown type name 'PFN_vkUnmapMemory2'; did you mean 'PFN_vkUnmapMemory'?
|   500 |     PFN_vkUnmapMemory2 UnmapMemory2;
|       |     ^~~~~~~~~~~~~~~~~~
|       |     PFN_vkUnmapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:501:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2'; did you mean 'PFN_vkCmdBindIndexBuffer'?
|   501 |     PFN_vkCmdBindIndexBuffer2 CmdBindIndexBuffer2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindIndexBuffer
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:502:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularity'; did you mean 'PFN_vkGetRenderingAreaGranularityKHR'?
|   502 |     PFN_vkGetRenderingAreaGranularity GetRenderingAreaGranularity;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetRenderingAreaGranularityKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:503:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayout'; did you mean 'PFN_vkGetDeviceImageSubresourceLayoutKHR'?
|   503 |     PFN_vkGetDeviceImageSubresourceLayout GetDeviceImageSubresourceLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceImageSubresourceLayoutKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:504:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2'; did you mean 'PFN_vkGetImageSubresourceLayout'?
|   504 |     PFN_vkGetImageSubresourceLayout2 GetImageSubresourceLayout2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageSubresourceLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:505:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet'; did you mean 'PFN_vkCmdPushDescriptorSetKHR'?
|   505 |     PFN_vkCmdPushDescriptorSet CmdPushDescriptorSet;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:506:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplateKHR'?
|   506 |     PFN_vkCmdPushDescriptorSetWithTemplate CmdPushDescriptorSetWithTemplate;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplateKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:507:5: error: unknown type name 'PFN_vkCmdSetRenderingAttachmentLocations'; did you mean 'PFN_vkCmdSetRenderingAttachmentLocationsKHR'?
|   507 |     PFN_vkCmdSetRenderingAttachmentLocations CmdSetRenderingAttachmentLocations;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingAttachmentLocationsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:508:5: error: unknown type name 'PFN_vkCmdSetRenderingInputAttachmentIndices'; did you mean 'PFN_vkCmdSetRenderingInputAttachmentIndicesKHR'?
|   508 |     PFN_vkCmdSetRenderingInputAttachmentIndices CmdSetRenderingInputAttachmentIndices;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingInputAttachmentIndicesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:509:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2'; did you mean 'PFN_vkCmdBindDescriptorSets'?
|   509 |     PFN_vkCmdBindDescriptorSets2 CmdBindDescriptorSets2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindDescriptorSets
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:510:5: error: unknown type name 'PFN_vkCmdPushConstants2'; did you mean 'PFN_vkCmdPushConstants'?
|   510 |     PFN_vkCmdPushConstants2 CmdPushConstants2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushConstants
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:511:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2'; did you mean 'PFN_vkCmdPushDescriptorSet2KHR'?
|   511 |     PFN_vkCmdPushDescriptorSet2 CmdPushDescriptorSet2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSet2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:512:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'?
|   512 |     PFN_vkCmdPushDescriptorSetWithTemplate2 CmdPushDescriptorSetWithTemplate2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:513:5: error: unknown type name 'PFN_vkCopyMemoryToImage'; did you mean 'PFN_vkCopyMemoryToImageEXT'?
|   513 |     PFN_vkCopyMemoryToImage CopyMemoryToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyMemoryToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:514:5: error: unknown type name 'PFN_vkCopyImageToMemory'; did you mean 'PFN_vkCopyImageToMemoryEXT'?
|   514 |     PFN_vkCopyImageToMemory CopyImageToMemory;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToMemoryEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:515:5: error: unknown type name 'PFN_vkCopyImageToImage'; did you mean 'PFN_vkCopyImageToImageEXT'?
|   515 |     PFN_vkCopyImageToImage CopyImageToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:516:5: error: unknown type name 'PFN_vkTransitionImageLayout'; did you mean 'PFN_vkTransitionImageLayoutEXT'?
|   516 |     PFN_vkTransitionImageLayout TransitionImageLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkTransitionImageLayoutEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:751:5: error: unknown type name 'PFN_vkGetImageViewHandle64NVX'; did you mean 'PFN_vkGetImageViewHandleNVX'?
|   751 |     PFN_vkGetImageViewHandle64NVX GetImageViewHandle64NVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewHandleNVX
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   481 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| [9/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/l
 oader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-work
 er/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/settings.c.o -MF loader/CMakeFiles/vulkan.dir/settings.c.o.d -o loader/CMakeFiles/vulkan.dir/settings.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/settings.c
| FAILED: loader/CMakeFiles/vulkan.dir/settings.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/loader -
 m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/settings.c.o -MF loader/CMakeFiles/vulkan.dir/settings.c.o.d -o loader/CMakeFiles/vulkan.dir/settings.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/settings.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/allocation.h:31,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/settings.c:26:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:295:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   295 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:498:5: error: unknown type name 'PFN_vkCmdSetLineStipple'; did you mean 'PFN_vkCmdSetLineStippleEXT'?
|   498 |     PFN_vkCmdSetLineStipple CmdSetLineStipple;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetLineStippleEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:499:5: error: unknown type name 'PFN_vkMapMemory2'; did you mean 'PFN_vkMapMemory'?
|   499 |     PFN_vkMapMemory2 MapMemory2;
|       |     ^~~~~~~~~~~~~~~~
|       |     PFN_vkMapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:500:5: error: unknown type name 'PFN_vkUnmapMemory2'; did you mean 'PFN_vkUnmapMemory'?
|   500 |     PFN_vkUnmapMemory2 UnmapMemory2;
|       |     ^~~~~~~~~~~~~~~~~~
|       |     PFN_vkUnmapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:501:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2'; did you mean 'PFN_vkCmdBindIndexBuffer'?
|   501 |     PFN_vkCmdBindIndexBuffer2 CmdBindIndexBuffer2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindIndexBuffer
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:502:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularity'; did you mean 'PFN_vkGetRenderingAreaGranularityKHR'?
|   502 |     PFN_vkGetRenderingAreaGranularity GetRenderingAreaGranularity;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetRenderingAreaGranularityKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:503:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayout'; did you mean 'PFN_vkGetDeviceImageSubresourceLayoutKHR'?
|   503 |     PFN_vkGetDeviceImageSubresourceLayout GetDeviceImageSubresourceLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceImageSubresourceLayoutKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:504:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2'; did you mean 'PFN_vkGetImageSubresourceLayout'?
|   504 |     PFN_vkGetImageSubresourceLayout2 GetImageSubresourceLayout2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageSubresourceLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:505:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet'; did you mean 'PFN_vkCmdPushDescriptorSetKHR'?
|   505 |     PFN_vkCmdPushDescriptorSet CmdPushDescriptorSet;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:506:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplateKHR'?
|   506 |     PFN_vkCmdPushDescriptorSetWithTemplate CmdPushDescriptorSetWithTemplate;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplateKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:507:5: error: unknown type name 'PFN_vkCmdSetRenderingAttachmentLocations'; did you mean 'PFN_vkCmdSetRenderingAttachmentLocationsKHR'?
|   507 |     PFN_vkCmdSetRenderingAttachmentLocations CmdSetRenderingAttachmentLocations;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingAttachmentLocationsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:508:5: error: unknown type name 'PFN_vkCmdSetRenderingInputAttachmentIndices'; did you mean 'PFN_vkCmdSetRenderingInputAttachmentIndicesKHR'?
|   508 |     PFN_vkCmdSetRenderingInputAttachmentIndices CmdSetRenderingInputAttachmentIndices;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingInputAttachmentIndicesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:509:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2'; did you mean 'PFN_vkCmdBindDescriptorSets'?
|   509 |     PFN_vkCmdBindDescriptorSets2 CmdBindDescriptorSets2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindDescriptorSets
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:510:5: error: unknown type name 'PFN_vkCmdPushConstants2'; did you mean 'PFN_vkCmdPushConstants'?
|   510 |     PFN_vkCmdPushConstants2 CmdPushConstants2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushConstants
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:511:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2'; did you mean 'PFN_vkCmdPushDescriptorSet2KHR'?
|   511 |     PFN_vkCmdPushDescriptorSet2 CmdPushDescriptorSet2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSet2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:512:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'?
|   512 |     PFN_vkCmdPushDescriptorSetWithTemplate2 CmdPushDescriptorSetWithTemplate2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:513:5: error: unknown type name 'PFN_vkCopyMemoryToImage'; did you mean 'PFN_vkCopyMemoryToImageEXT'?
|   513 |     PFN_vkCopyMemoryToImage CopyMemoryToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyMemoryToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:514:5: error: unknown type name 'PFN_vkCopyImageToMemory'; did you mean 'PFN_vkCopyImageToMemoryEXT'?
|   514 |     PFN_vkCopyImageToMemory CopyImageToMemory;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToMemoryEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:515:5: error: unknown type name 'PFN_vkCopyImageToImage'; did you mean 'PFN_vkCopyImageToImageEXT'?
|   515 |     PFN_vkCopyImageToImage CopyImageToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:516:5: error: unknown type name 'PFN_vkTransitionImageLayout'; did you mean 'PFN_vkTransitionImageLayoutEXT'?
|   516 |     PFN_vkTransitionImageLayout TransitionImageLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkTransitionImageLayoutEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:751:5: error: unknown type name 'PFN_vkGetImageViewHandle64NVX'; did you mean 'PFN_vkGetImageViewHandleNVX'?
|   751 |     PFN_vkGetImageViewHandle64NVX GetImageViewHandle64NVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewHandleNVX
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   481 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| [10/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/
 loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/wsi.c
| FAILED: loader/CMakeFiles/vulkan.dir/wsi.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/loader -
 m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/wsi.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/allocation.h:31,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/wsi.c:31:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:295:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   295 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:498:5: error: unknown type name 'PFN_vkCmdSetLineStipple'; did you mean 'PFN_vkCmdSetLineStippleEXT'?
|   498 |     PFN_vkCmdSetLineStipple CmdSetLineStipple;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetLineStippleEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:499:5: error: unknown type name 'PFN_vkMapMemory2'; did you mean 'PFN_vkMapMemory'?
|   499 |     PFN_vkMapMemory2 MapMemory2;
|       |     ^~~~~~~~~~~~~~~~
|       |     PFN_vkMapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:500:5: error: unknown type name 'PFN_vkUnmapMemory2'; did you mean 'PFN_vkUnmapMemory'?
|   500 |     PFN_vkUnmapMemory2 UnmapMemory2;
|       |     ^~~~~~~~~~~~~~~~~~
|       |     PFN_vkUnmapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:501:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2'; did you mean 'PFN_vkCmdBindIndexBuffer'?
|   501 |     PFN_vkCmdBindIndexBuffer2 CmdBindIndexBuffer2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindIndexBuffer
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:502:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularity'; did you mean 'PFN_vkGetRenderingAreaGranularityKHR'?
|   502 |     PFN_vkGetRenderingAreaGranularity GetRenderingAreaGranularity;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetRenderingAreaGranularityKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:503:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayout'; did you mean 'PFN_vkGetDeviceImageSubresourceLayoutKHR'?
|   503 |     PFN_vkGetDeviceImageSubresourceLayout GetDeviceImageSubresourceLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceImageSubresourceLayoutKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:504:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2'; did you mean 'PFN_vkGetImageSubresourceLayout'?
|   504 |     PFN_vkGetImageSubresourceLayout2 GetImageSubresourceLayout2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageSubresourceLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:505:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet'; did you mean 'PFN_vkCmdPushDescriptorSetKHR'?
|   505 |     PFN_vkCmdPushDescriptorSet CmdPushDescriptorSet;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:506:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplateKHR'?
|   506 |     PFN_vkCmdPushDescriptorSetWithTemplate CmdPushDescriptorSetWithTemplate;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplateKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:507:5: error: unknown type name 'PFN_vkCmdSetRenderingAttachmentLocations'; did you mean 'PFN_vkCmdSetRenderingAttachmentLocationsKHR'?
|   507 |     PFN_vkCmdSetRenderingAttachmentLocations CmdSetRenderingAttachmentLocations;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingAttachmentLocationsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:508:5: error: unknown type name 'PFN_vkCmdSetRenderingInputAttachmentIndices'; did you mean 'PFN_vkCmdSetRenderingInputAttachmentIndicesKHR'?
|   508 |     PFN_vkCmdSetRenderingInputAttachmentIndices CmdSetRenderingInputAttachmentIndices;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingInputAttachmentIndicesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:509:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2'; did you mean 'PFN_vkCmdBindDescriptorSets'?
|   509 |     PFN_vkCmdBindDescriptorSets2 CmdBindDescriptorSets2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindDescriptorSets
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:510:5: error: unknown type name 'PFN_vkCmdPushConstants2'; did you mean 'PFN_vkCmdPushConstants'?
|   510 |     PFN_vkCmdPushConstants2 CmdPushConstants2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushConstants
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:511:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2'; did you mean 'PFN_vkCmdPushDescriptorSet2KHR'?
|   511 |     PFN_vkCmdPushDescriptorSet2 CmdPushDescriptorSet2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSet2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:512:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'?
|   512 |     PFN_vkCmdPushDescriptorSetWithTemplate2 CmdPushDescriptorSetWithTemplate2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:513:5: error: unknown type name 'PFN_vkCopyMemoryToImage'; did you mean 'PFN_vkCopyMemoryToImageEXT'?
|   513 |     PFN_vkCopyMemoryToImage CopyMemoryToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyMemoryToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:514:5: error: unknown type name 'PFN_vkCopyImageToMemory'; did you mean 'PFN_vkCopyImageToMemoryEXT'?
|   514 |     PFN_vkCopyImageToMemory CopyImageToMemory;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToMemoryEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:515:5: error: unknown type name 'PFN_vkCopyImageToImage'; did you mean 'PFN_vkCopyImageToImageEXT'?
|   515 |     PFN_vkCopyImageToImage CopyImageToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:516:5: error: unknown type name 'PFN_vkTransitionImageLayout'; did you mean 'PFN_vkTransitionImageLayoutEXT'?
|   516 |     PFN_vkTransitionImageLayout TransitionImageLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkTransitionImageLayoutEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:751:5: error: unknown type name 'PFN_vkGetImageViewHandle64NVX'; did you mean 'PFN_vkGetImageViewHandleNVX'?
|   751 |     PFN_vkGetImageViewHandle64NVX GetImageViewHandle64NVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewHandleNVX
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   481 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| [11/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/
 loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/cJSON.c.o -MF loader/CMakeFiles/vulkan.dir/cJSON.c.o.d -o loader/CMakeFiles/vulkan.dir/cJSON.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/cJSON.c
| FAILED: loader/CMakeFiles/vulkan.dir/cJSON.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/loader -
 m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/cJSON.c.o -MF loader/CMakeFiles/vulkan.dir/cJSON.c.o.d -o loader/CMakeFiles/vulkan.dir/cJSON.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/cJSON.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/allocation.h:31,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/cJSON.c:63:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:295:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   295 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:498:5: error: unknown type name 'PFN_vkCmdSetLineStipple'; did you mean 'PFN_vkCmdSetLineStippleEXT'?
|   498 |     PFN_vkCmdSetLineStipple CmdSetLineStipple;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetLineStippleEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:499:5: error: unknown type name 'PFN_vkMapMemory2'; did you mean 'PFN_vkMapMemory'?
|   499 |     PFN_vkMapMemory2 MapMemory2;
|       |     ^~~~~~~~~~~~~~~~
|       |     PFN_vkMapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:500:5: error: unknown type name 'PFN_vkUnmapMemory2'; did you mean 'PFN_vkUnmapMemory'?
|   500 |     PFN_vkUnmapMemory2 UnmapMemory2;
|       |     ^~~~~~~~~~~~~~~~~~
|       |     PFN_vkUnmapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:501:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2'; did you mean 'PFN_vkCmdBindIndexBuffer'?
|   501 |     PFN_vkCmdBindIndexBuffer2 CmdBindIndexBuffer2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindIndexBuffer
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:502:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularity'; did you mean 'PFN_vkGetRenderingAreaGranularityKHR'?
|   502 |     PFN_vkGetRenderingAreaGranularity GetRenderingAreaGranularity;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetRenderingAreaGranularityKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:503:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayout'; did you mean 'PFN_vkGetDeviceImageSubresourceLayoutKHR'?
|   503 |     PFN_vkGetDeviceImageSubresourceLayout GetDeviceImageSubresourceLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceImageSubresourceLayoutKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:504:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2'; did you mean 'PFN_vkGetImageSubresourceLayout'?
|   504 |     PFN_vkGetImageSubresourceLayout2 GetImageSubresourceLayout2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageSubresourceLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:505:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet'; did you mean 'PFN_vkCmdPushDescriptorSetKHR'?
|   505 |     PFN_vkCmdPushDescriptorSet CmdPushDescriptorSet;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:506:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplateKHR'?
|   506 |     PFN_vkCmdPushDescriptorSetWithTemplate CmdPushDescriptorSetWithTemplate;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplateKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:507:5: error: unknown type name 'PFN_vkCmdSetRenderingAttachmentLocations'; did you mean 'PFN_vkCmdSetRenderingAttachmentLocationsKHR'?
|   507 |     PFN_vkCmdSetRenderingAttachmentLocations CmdSetRenderingAttachmentLocations;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingAttachmentLocationsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:508:5: error: unknown type name 'PFN_vkCmdSetRenderingInputAttachmentIndices'; did you mean 'PFN_vkCmdSetRenderingInputAttachmentIndicesKHR'?
|   508 |     PFN_vkCmdSetRenderingInputAttachmentIndices CmdSetRenderingInputAttachmentIndices;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingInputAttachmentIndicesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:509:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2'; did you mean 'PFN_vkCmdBindDescriptorSets'?
|   509 |     PFN_vkCmdBindDescriptorSets2 CmdBindDescriptorSets2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindDescriptorSets
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:510:5: error: unknown type name 'PFN_vkCmdPushConstants2'; did you mean 'PFN_vkCmdPushConstants'?
|   510 |     PFN_vkCmdPushConstants2 CmdPushConstants2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushConstants
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:511:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2'; did you mean 'PFN_vkCmdPushDescriptorSet2KHR'?
|   511 |     PFN_vkCmdPushDescriptorSet2 CmdPushDescriptorSet2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSet2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:512:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'?
|   512 |     PFN_vkCmdPushDescriptorSetWithTemplate2 CmdPushDescriptorSetWithTemplate2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:513:5: error: unknown type name 'PFN_vkCopyMemoryToImage'; did you mean 'PFN_vkCopyMemoryToImageEXT'?
|   513 |     PFN_vkCopyMemoryToImage CopyMemoryToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyMemoryToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:514:5: error: unknown type name 'PFN_vkCopyImageToMemory'; did you mean 'PFN_vkCopyImageToMemoryEXT'?
|   514 |     PFN_vkCopyImageToMemory CopyImageToMemory;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToMemoryEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:515:5: error: unknown type name 'PFN_vkCopyImageToImage'; did you mean 'PFN_vkCopyImageToImageEXT'?
|   515 |     PFN_vkCopyImageToImage CopyImageToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:516:5: error: unknown type name 'PFN_vkTransitionImageLayout'; did you mean 'PFN_vkTransitionImageLayoutEXT'?
|   516 |     PFN_vkTransitionImageLayout TransitionImageLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkTransitionImageLayoutEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:751:5: error: unknown type name 'PFN_vkGetImageViewHandle64NVX'; did you mean 'PFN_vkGetImageViewHandleNVX'?
|   751 |     PFN_vkGetImageViewHandle64NVX GetImageViewHandle64NVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewHandleNVX
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   481 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| [12/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/
 loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader_json.c.o -MF loader/CMakeFiles/vulkan.dir/loader_json.c.o.d -o loader/CMakeFiles/vulkan.dir/loader_json.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_json.c
| FAILED: loader/CMakeFiles/vulkan.dir/loader_json.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/loader -
 m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader_json.c.o -MF loader/CMakeFiles/vulkan.dir/loader_json.c.o.d -o loader/CMakeFiles/vulkan.dir/loader_json.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_json.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/allocation.h:31,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_json.c:37:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:295:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   295 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:498:5: error: unknown type name 'PFN_vkCmdSetLineStipple'; did you mean 'PFN_vkCmdSetLineStippleEXT'?
|   498 |     PFN_vkCmdSetLineStipple CmdSetLineStipple;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetLineStippleEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:499:5: error: unknown type name 'PFN_vkMapMemory2'; did you mean 'PFN_vkMapMemory'?
|   499 |     PFN_vkMapMemory2 MapMemory2;
|       |     ^~~~~~~~~~~~~~~~
|       |     PFN_vkMapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:500:5: error: unknown type name 'PFN_vkUnmapMemory2'; did you mean 'PFN_vkUnmapMemory'?
|   500 |     PFN_vkUnmapMemory2 UnmapMemory2;
|       |     ^~~~~~~~~~~~~~~~~~
|       |     PFN_vkUnmapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:501:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2'; did you mean 'PFN_vkCmdBindIndexBuffer'?
|   501 |     PFN_vkCmdBindIndexBuffer2 CmdBindIndexBuffer2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindIndexBuffer
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:502:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularity'; did you mean 'PFN_vkGetRenderingAreaGranularityKHR'?
|   502 |     PFN_vkGetRenderingAreaGranularity GetRenderingAreaGranularity;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetRenderingAreaGranularityKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:503:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayout'; did you mean 'PFN_vkGetDeviceImageSubresourceLayoutKHR'?
|   503 |     PFN_vkGetDeviceImageSubresourceLayout GetDeviceImageSubresourceLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceImageSubresourceLayoutKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:504:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2'; did you mean 'PFN_vkGetImageSubresourceLayout'?
|   504 |     PFN_vkGetImageSubresourceLayout2 GetImageSubresourceLayout2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageSubresourceLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:505:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet'; did you mean 'PFN_vkCmdPushDescriptorSetKHR'?
|   505 |     PFN_vkCmdPushDescriptorSet CmdPushDescriptorSet;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:506:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplateKHR'?
|   506 |     PFN_vkCmdPushDescriptorSetWithTemplate CmdPushDescriptorSetWithTemplate;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplateKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:507:5: error: unknown type name 'PFN_vkCmdSetRenderingAttachmentLocations'; did you mean 'PFN_vkCmdSetRenderingAttachmentLocationsKHR'?
|   507 |     PFN_vkCmdSetRenderingAttachmentLocations CmdSetRenderingAttachmentLocations;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingAttachmentLocationsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:508:5: error: unknown type name 'PFN_vkCmdSetRenderingInputAttachmentIndices'; did you mean 'PFN_vkCmdSetRenderingInputAttachmentIndicesKHR'?
|   508 |     PFN_vkCmdSetRenderingInputAttachmentIndices CmdSetRenderingInputAttachmentIndices;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingInputAttachmentIndicesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:509:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2'; did you mean 'PFN_vkCmdBindDescriptorSets'?
|   509 |     PFN_vkCmdBindDescriptorSets2 CmdBindDescriptorSets2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindDescriptorSets
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:510:5: error: unknown type name 'PFN_vkCmdPushConstants2'; did you mean 'PFN_vkCmdPushConstants'?
|   510 |     PFN_vkCmdPushConstants2 CmdPushConstants2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushConstants
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:511:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2'; did you mean 'PFN_vkCmdPushDescriptorSet2KHR'?
|   511 |     PFN_vkCmdPushDescriptorSet2 CmdPushDescriptorSet2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSet2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:512:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'?
|   512 |     PFN_vkCmdPushDescriptorSetWithTemplate2 CmdPushDescriptorSetWithTemplate2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:513:5: error: unknown type name 'PFN_vkCopyMemoryToImage'; did you mean 'PFN_vkCopyMemoryToImageEXT'?
|   513 |     PFN_vkCopyMemoryToImage CopyMemoryToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyMemoryToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:514:5: error: unknown type name 'PFN_vkCopyImageToMemory'; did you mean 'PFN_vkCopyImageToMemoryEXT'?
|   514 |     PFN_vkCopyImageToMemory CopyImageToMemory;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToMemoryEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:515:5: error: unknown type name 'PFN_vkCopyImageToImage'; did you mean 'PFN_vkCopyImageToImageEXT'?
|   515 |     PFN_vkCopyImageToImage CopyImageToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:516:5: error: unknown type name 'PFN_vkTransitionImageLayout'; did you mean 'PFN_vkTransitionImageLayoutEXT'?
|   516 |     PFN_vkTransitionImageLayout TransitionImageLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkTransitionImageLayoutEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:751:5: error: unknown type name 'PFN_vkGetImageViewHandle64NVX'; did you mean 'PFN_vkGetImageViewHandleNVX'?
|   751 |     PFN_vkGetImageViewHandle64NVX GetImageViewHandle64NVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewHandleNVX
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   481 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| [13/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/
 loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c
| FAILED: loader/CMakeFiles/vulkan.dir/trampoline.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/loader -
 m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/allocation.h:31,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:32:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:295:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   295 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:498:5: error: unknown type name 'PFN_vkCmdSetLineStipple'; did you mean 'PFN_vkCmdSetLineStippleEXT'?
|   498 |     PFN_vkCmdSetLineStipple CmdSetLineStipple;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetLineStippleEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:499:5: error: unknown type name 'PFN_vkMapMemory2'; did you mean 'PFN_vkMapMemory'?
|   499 |     PFN_vkMapMemory2 MapMemory2;
|       |     ^~~~~~~~~~~~~~~~
|       |     PFN_vkMapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:500:5: error: unknown type name 'PFN_vkUnmapMemory2'; did you mean 'PFN_vkUnmapMemory'?
|   500 |     PFN_vkUnmapMemory2 UnmapMemory2;
|       |     ^~~~~~~~~~~~~~~~~~
|       |     PFN_vkUnmapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:501:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2'; did you mean 'PFN_vkCmdBindIndexBuffer'?
|   501 |     PFN_vkCmdBindIndexBuffer2 CmdBindIndexBuffer2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindIndexBuffer
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:502:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularity'; did you mean 'PFN_vkGetRenderingAreaGranularityKHR'?
|   502 |     PFN_vkGetRenderingAreaGranularity GetRenderingAreaGranularity;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetRenderingAreaGranularityKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:503:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayout'; did you mean 'PFN_vkGetDeviceImageSubresourceLayoutKHR'?
|   503 |     PFN_vkGetDeviceImageSubresourceLayout GetDeviceImageSubresourceLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceImageSubresourceLayoutKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:504:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2'; did you mean 'PFN_vkGetImageSubresourceLayout'?
|   504 |     PFN_vkGetImageSubresourceLayout2 GetImageSubresourceLayout2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageSubresourceLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:505:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet'; did you mean 'PFN_vkCmdPushDescriptorSetKHR'?
|   505 |     PFN_vkCmdPushDescriptorSet CmdPushDescriptorSet;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:506:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplateKHR'?
|   506 |     PFN_vkCmdPushDescriptorSetWithTemplate CmdPushDescriptorSetWithTemplate;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplateKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:507:5: error: unknown type name 'PFN_vkCmdSetRenderingAttachmentLocations'; did you mean 'PFN_vkCmdSetRenderingAttachmentLocationsKHR'?
|   507 |     PFN_vkCmdSetRenderingAttachmentLocations CmdSetRenderingAttachmentLocations;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingAttachmentLocationsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:508:5: error: unknown type name 'PFN_vkCmdSetRenderingInputAttachmentIndices'; did you mean 'PFN_vkCmdSetRenderingInputAttachmentIndicesKHR'?
|   508 |     PFN_vkCmdSetRenderingInputAttachmentIndices CmdSetRenderingInputAttachmentIndices;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingInputAttachmentIndicesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:509:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2'; did you mean 'PFN_vkCmdBindDescriptorSets'?
|   509 |     PFN_vkCmdBindDescriptorSets2 CmdBindDescriptorSets2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindDescriptorSets
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:510:5: error: unknown type name 'PFN_vkCmdPushConstants2'; did you mean 'PFN_vkCmdPushConstants'?
|   510 |     PFN_vkCmdPushConstants2 CmdPushConstants2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushConstants
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:511:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2'; did you mean 'PFN_vkCmdPushDescriptorSet2KHR'?
|   511 |     PFN_vkCmdPushDescriptorSet2 CmdPushDescriptorSet2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSet2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:512:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'?
|   512 |     PFN_vkCmdPushDescriptorSetWithTemplate2 CmdPushDescriptorSetWithTemplate2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:513:5: error: unknown type name 'PFN_vkCopyMemoryToImage'; did you mean 'PFN_vkCopyMemoryToImageEXT'?
|   513 |     PFN_vkCopyMemoryToImage CopyMemoryToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyMemoryToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:514:5: error: unknown type name 'PFN_vkCopyImageToMemory'; did you mean 'PFN_vkCopyImageToMemoryEXT'?
|   514 |     PFN_vkCopyImageToMemory CopyImageToMemory;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToMemoryEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:515:5: error: unknown type name 'PFN_vkCopyImageToImage'; did you mean 'PFN_vkCopyImageToImageEXT'?
|   515 |     PFN_vkCopyImageToImage CopyImageToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:516:5: error: unknown type name 'PFN_vkTransitionImageLayout'; did you mean 'PFN_vkTransitionImageLayoutEXT'?
|   516 |     PFN_vkTransitionImageLayout TransitionImageLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkTransitionImageLayoutEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:751:5: error: unknown type name 'PFN_vkGetImageViewHandle64NVX'; did you mean 'PFN_vkGetImageViewHandleNVX'?
|   751 |     PFN_vkGetImageViewHandle64NVX GetImageViewHandle64NVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewHandleNVX
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   481 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3597:78: error: unknown type name 'VkRenderingAreaInfo'; did you mean 'VkRenderingAreaInfoKHR'?
|  3597 |                                                                        const VkRenderingAreaInfo *pRenderingAreaInfo,
|       |                                                                              ^~~~~~~~~~~~~~~~~~~
|       |                                                                              VkRenderingAreaInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: In function 'vkGetRenderingAreaGranularity':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3606:5: error: called object is not a function or function pointer
|  3606 |     disp->GetRenderingAreaGranularity(device, pRenderingAreaInfo, pGranularity);
|       |     ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: In function 'vkCmdPushDescriptorSet':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3620:5: error: called object is not a function or function pointer
|  3620 |     disp->CmdPushDescriptorSet(commandBuffer, pipelineBindPoint, layout, set, descriptorWriteCount, pDescriptorWrites);
|       |     ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: In function 'vkCmdPushDescriptorSetWithTemplate':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3634:5: error: called object is not a function or function pointer
|  3634 |     disp->CmdPushDescriptorSetWithTemplate(commandBuffer, descriptorUpdateTemplate, layout, set, pData);
|       |     ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: In function 'vkCmdSetLineStipple':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3646:5: error: called object is not a function or function pointer
|  3646 |     disp->CmdSetLineStipple(commandBuffer, lineStippleFactor, lineStipplePattern);
|       |     ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: In function 'vkCmdBindIndexBuffer2':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3658:5: error: called object is not a function or function pointer
|  3658 |     disp->CmdBindIndexBuffer2(commandBuffer, buffer, offset, size, indexType);
|       |     ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3662:72: error: unknown type name 'VkCopyMemoryToImageInfo'; did you mean 'VkCopyMemoryToImageInfoEXT'?
|  3662 |                                                                  const VkCopyMemoryToImageInfo *pCopyMemoryToImageInfo) {
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                        VkCopyMemoryToImageInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: In function 'vkCopyMemoryToImage':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3670:12: error: called object is not a function or function pointer
|  3670 |     return disp->CopyMemoryToImage(device, pCopyMemoryToImageInfo);
|       |            ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3674:72: error: unknown type name 'VkCopyImageToMemoryInfo'; did you mean 'VkCopyImageToMemoryInfoEXT'?
|  3674 |                                                                  const VkCopyImageToMemoryInfo *pCopyImageToMemoryInfo) {
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                        VkCopyImageToMemoryInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: In function 'vkCopyImageToMemory':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3682:12: error: called object is not a function or function pointer
|  3682 |     return disp->CopyImageToMemory(device, pCopyImageToMemoryInfo);
|       |            ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3686:71: error: unknown type name 'VkCopyImageToImageInfo'; did you mean 'VkCopyImageToImageInfoEXT'?
|  3686 |                                                                 const VkCopyImageToImageInfo *pCopyImageToImageInfo) {
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~
|       |                                                                       VkCopyImageToImageInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: In function 'vkCopyImageToImage':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3694:12: error: called object is not a function or function pointer
|  3694 |     return disp->CopyImageToImage(device, pCopyImageToImageInfo);
|       |            ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3698:76: error: unknown type name 'VkHostImageLayoutTransitionInfo'; did you mean 'VkHostImageLayoutTransitionInfoEXT'?
|  3698 |                                                                      const VkHostImageLayoutTransitionInfo *pTransitions) {
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                            VkHostImageLayoutTransitionInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: In function 'vkTransitionImageLayout':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3706:12: error: called object is not a function or function pointer
|  3706 |     return disp->TransitionImageLayout(device, transitionCount, pTransitions);
|       |            ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3710:82: error: unknown type name 'VkDeviceImageSubresourceInfo'; did you mean 'VkDeviceImageSubresourceInfoKHR'?
|  3710 |                                                                            const VkDeviceImageSubresourceInfo *pInfo,
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                  VkDeviceImageSubresourceInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3711:76: error: unknown type name 'VkSubresourceLayout2'; did you mean 'VkSubresourceLayout'?
|  3711 |                                                                            VkSubresourceLayout2 *pLayout) {
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~
|       |                                                                            VkSubresourceLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3723:77: error: unknown type name 'VkImageSubresource2'; did you mean 'VkImageSubresource'?
|  3723 |                                                                       const VkImageSubresource2 *pSubresource,
|       |                                                                             ^~~~~~~~~~~~~~~~~~~
|       |                                                                             VkImageSubresource
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3724:71: error: unknown type name 'VkSubresourceLayout2'; did you mean 'VkSubresourceLayout'?
|  3724 |                                                                       VkSubresourceLayout2 *pLayout) {
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~
|       |                                                                       VkSubresourceLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3735:82: error: unknown type name 'VkMemoryMapInfo'; did you mean 'VkMemoryMapInfoKHR'?
|  3735 | LOADER_EXPORT VKAPI_ATTR VkResult VKAPI_CALL vkMapMemory2(VkDevice device, const VkMemoryMapInfo *pMemoryMapInfo, void **ppData) {
|       |                                                                                  ^~~~~~~~~~~~~~~
|       |                                                                                  VkMemoryMapInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: In function 'vkMapMemory2':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3743:12: error: called object is not a function or function pointer
|  3743 |     return disp->MapMemory2(device, pMemoryMapInfo, ppData);
|       |            ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3746:84: error: unknown type name 'VkMemoryUnmapInfo'; did you mean 'VkMemoryUnmapInfoKHR'?
|  3746 | LOADER_EXPORT VKAPI_ATTR VkResult VKAPI_CALL vkUnmapMemory2(VkDevice device, const VkMemoryUnmapInfo *pMemoryUnmapInfo) {
|       |                                                                                    ^~~~~~~~~~~~~~~~~
|       |                                                                                    VkMemoryUnmapInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: In function 'vkUnmapMemory2':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3754:12: error: called object is not a function or function pointer
|  3754 |     return disp->UnmapMemory2(device, pMemoryUnmapInfo);
|       |            ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3758:73: error: unknown type name 'VkBindDescriptorSetsInfo'; did you mean 'VkBindDescriptorSetsInfoKHR'?
|  3758 |                                                                   const VkBindDescriptorSetsInfo *pBindDescriptorSetsInfo) {
|       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                         VkBindDescriptorSetsInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: In function 'vkCmdBindDescriptorSets2':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3766:5: error: called object is not a function or function pointer
|  3766 |     disp->CmdBindDescriptorSets2(commandBuffer, pBindDescriptorSetsInfo);
|       |     ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3770:68: error: unknown type name 'VkPushConstantsInfo'; did you mean 'VkPushConstantsInfoKHR'?
|  3770 |                                                              const VkPushConstantsInfo *pPushConstantsInfo) {
|       |                                                                    ^~~~~~~~~~~~~~~~~~~
|       |                                                                    VkPushConstantsInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: In function 'vkCmdPushConstants2':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3778:5: error: called object is not a function or function pointer
|  3778 |     disp->CmdPushConstants2(commandBuffer, pPushConstantsInfo);
|       |     ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3782:72: error: unknown type name 'VkPushDescriptorSetInfo'; did you mean 'VkPushDescriptorSetInfoKHR'?
|  3782 |                                                                  const VkPushDescriptorSetInfo *pPushDescriptorSetInfo) {
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                        VkPushDescriptorSetInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: In function 'vkCmdPushDescriptorSet2':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3790:5: error: called object is not a function or function pointer
|  3790 |     disp->CmdPushDescriptorSet2(commandBuffer, pPushDescriptorSetInfo);
|       |     ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3794:42: error: unknown type name 'VkPushDescriptorSetWithTemplateInfo'; did you mean 'VkPushDescriptorSetWithTemplateInfoKHR'?
|  3794 |     VkCommandBuffer commandBuffer, const VkPushDescriptorSetWithTemplateInfo *pPushDescriptorSetWithTemplateInfo) {
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                          VkPushDescriptorSetWithTemplateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: In function 'vkCmdPushDescriptorSetWithTemplate2':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3802:5: error: called object is not a function or function pointer
|  3802 |     disp->CmdPushDescriptorSetWithTemplate2(commandBuffer, pPushDescriptorSetWithTemplateInfo);
|       |     ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3806:75: error: unknown type name 'VkRenderingAttachmentLocationInfo'; did you mean 'VkRenderingAttachmentLocationInfoKHR'?
|  3806 | vkCmdSetRenderingAttachmentLocations(VkCommandBuffer commandBuffer, const VkRenderingAttachmentLocationInfo *pLocationInfo) {
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                           VkRenderingAttachmentLocationInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: In function 'vkCmdSetRenderingAttachmentLocations':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3814:5: error: called object is not a function or function pointer
|  3814 |     disp->CmdSetRenderingAttachmentLocations(commandBuffer, pLocationInfo);
|       |     ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3818:42: error: unknown type name 'VkRenderingInputAttachmentIndexInfo'; did you mean 'VkRenderingInputAttachmentIndexInfoKHR'?
|  3818 |     VkCommandBuffer commandBuffer, const VkRenderingInputAttachmentIndexInfo *pInputAttachmentIndexInfo) {
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                          VkRenderingInputAttachmentIndexInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: In function 'vkCmdSetRenderingInputAttachmentIndices':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3826:5: error: called object is not a function or function pointer
|  3826 |     disp->CmdSetRenderingInputAttachmentIndices(commandBuffer, pInputAttachmentIndexInfo);
|       |     ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: In function 'vkCopyMemoryToImage':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3671:1: warning: control reaches end of non-void function [-Wreturn-type]
|  3671 | }
|       | ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: In function 'vkCopyImageToMemory':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3683:1: warning: control reaches end of non-void function [-Wreturn-type]
|  3683 | }
|       | ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: In function 'vkCopyImageToImage':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3695:1: warning: control reaches end of non-void function [-Wreturn-type]
|  3695 | }
|       | ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: In function 'vkTransitionImageLayout':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3707:1: warning: control reaches end of non-void function [-Wreturn-type]
|  3707 | }
|       | ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: In function 'vkMapMemory2':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3744:1: warning: control reaches end of non-void function [-Wreturn-type]
|  3744 | }
|       | ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c: In function 'vkUnmapMemory2':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/trampoline.c:3755:1: warning: control reaches end of non-void function [-Wreturn-type]
|  3755 | }
|       | ^
| [14/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/
 loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/gpa_helper.c.o -MF loader/CMakeFiles/vulkan.dir/gpa_helper.c.o.d -o loader/CMakeFiles/vulkan.dir/gpa_helper.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/gpa_helper.c
| FAILED: loader/CMakeFiles/vulkan.dir/gpa_helper.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/loader -
 m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/gpa_helper.c.o -MF loader/CMakeFiles/vulkan.dir/gpa_helper.c.o.d -o loader/CMakeFiles/vulkan.dir/gpa_helper.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/gpa_helper.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/gpa_helper.h:25,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/gpa_helper.c:23:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:295:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   295 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:498:5: error: unknown type name 'PFN_vkCmdSetLineStipple'; did you mean 'PFN_vkCmdSetLineStippleEXT'?
|   498 |     PFN_vkCmdSetLineStipple CmdSetLineStipple;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetLineStippleEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:499:5: error: unknown type name 'PFN_vkMapMemory2'; did you mean 'PFN_vkMapMemory'?
|   499 |     PFN_vkMapMemory2 MapMemory2;
|       |     ^~~~~~~~~~~~~~~~
|       |     PFN_vkMapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:500:5: error: unknown type name 'PFN_vkUnmapMemory2'; did you mean 'PFN_vkUnmapMemory'?
|   500 |     PFN_vkUnmapMemory2 UnmapMemory2;
|       |     ^~~~~~~~~~~~~~~~~~
|       |     PFN_vkUnmapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:501:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2'; did you mean 'PFN_vkCmdBindIndexBuffer'?
|   501 |     PFN_vkCmdBindIndexBuffer2 CmdBindIndexBuffer2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindIndexBuffer
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:502:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularity'; did you mean 'PFN_vkGetRenderingAreaGranularityKHR'?
|   502 |     PFN_vkGetRenderingAreaGranularity GetRenderingAreaGranularity;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetRenderingAreaGranularityKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:503:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayout'; did you mean 'PFN_vkGetDeviceImageSubresourceLayoutKHR'?
|   503 |     PFN_vkGetDeviceImageSubresourceLayout GetDeviceImageSubresourceLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceImageSubresourceLayoutKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:504:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2'; did you mean 'PFN_vkGetImageSubresourceLayout'?
|   504 |     PFN_vkGetImageSubresourceLayout2 GetImageSubresourceLayout2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageSubresourceLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:505:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet'; did you mean 'PFN_vkCmdPushDescriptorSetKHR'?
|   505 |     PFN_vkCmdPushDescriptorSet CmdPushDescriptorSet;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:506:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplateKHR'?
|   506 |     PFN_vkCmdPushDescriptorSetWithTemplate CmdPushDescriptorSetWithTemplate;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplateKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:507:5: error: unknown type name 'PFN_vkCmdSetRenderingAttachmentLocations'; did you mean 'PFN_vkCmdSetRenderingAttachmentLocationsKHR'?
|   507 |     PFN_vkCmdSetRenderingAttachmentLocations CmdSetRenderingAttachmentLocations;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingAttachmentLocationsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:508:5: error: unknown type name 'PFN_vkCmdSetRenderingInputAttachmentIndices'; did you mean 'PFN_vkCmdSetRenderingInputAttachmentIndicesKHR'?
|   508 |     PFN_vkCmdSetRenderingInputAttachmentIndices CmdSetRenderingInputAttachmentIndices;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingInputAttachmentIndicesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:509:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2'; did you mean 'PFN_vkCmdBindDescriptorSets'?
|   509 |     PFN_vkCmdBindDescriptorSets2 CmdBindDescriptorSets2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindDescriptorSets
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:510:5: error: unknown type name 'PFN_vkCmdPushConstants2'; did you mean 'PFN_vkCmdPushConstants'?
|   510 |     PFN_vkCmdPushConstants2 CmdPushConstants2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushConstants
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:511:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2'; did you mean 'PFN_vkCmdPushDescriptorSet2KHR'?
|   511 |     PFN_vkCmdPushDescriptorSet2 CmdPushDescriptorSet2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSet2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:512:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'?
|   512 |     PFN_vkCmdPushDescriptorSetWithTemplate2 CmdPushDescriptorSetWithTemplate2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:513:5: error: unknown type name 'PFN_vkCopyMemoryToImage'; did you mean 'PFN_vkCopyMemoryToImageEXT'?
|   513 |     PFN_vkCopyMemoryToImage CopyMemoryToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyMemoryToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:514:5: error: unknown type name 'PFN_vkCopyImageToMemory'; did you mean 'PFN_vkCopyImageToMemoryEXT'?
|   514 |     PFN_vkCopyImageToMemory CopyImageToMemory;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToMemoryEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:515:5: error: unknown type name 'PFN_vkCopyImageToImage'; did you mean 'PFN_vkCopyImageToImageEXT'?
|   515 |     PFN_vkCopyImageToImage CopyImageToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:516:5: error: unknown type name 'PFN_vkTransitionImageLayout'; did you mean 'PFN_vkTransitionImageLayoutEXT'?
|   516 |     PFN_vkTransitionImageLayout TransitionImageLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkTransitionImageLayoutEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:751:5: error: unknown type name 'PFN_vkGetImageViewHandle64NVX'; did you mean 'PFN_vkGetImageViewHandleNVX'?
|   751 |     PFN_vkGetImageViewHandle64NVX GetImageViewHandle64NVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewHandleNVX
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   481 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/gpa_helper.c: In function 'trampoline_get_proc_addr':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/gpa_helper.c:253:58: error: 'vkCmdSetLineStipple' undeclared (first use in this function); did you mean 'vkCmdSetLineStippleEXT'?
|   253 |     if (!strcmp(funcName, "vkCmdSetLineStipple")) return vkCmdSetLineStipple;
|       |                                                          ^~~~~~~~~~~~~~~~~~~
|       |                                                          vkCmdSetLineStippleEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/gpa_helper.c:253:58: note: each undeclared identifier is reported only once for each function it appears in
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/gpa_helper.c:254:51: error: 'vkMapMemory2' undeclared (first use in this function); did you mean 'vkMapMemory'?
|   254 |     if (!strcmp(funcName, "vkMapMemory2")) return vkMapMemory2;
|       |                                                   ^~~~~~~~~~~~
|       |                                                   vkMapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/gpa_helper.c:255:53: error: 'vkUnmapMemory2' undeclared (first use in this function); did you mean 'vkUnmapMemory'?
|   255 |     if (!strcmp(funcName, "vkUnmapMemory2")) return vkUnmapMemory2;
|       |                                                     ^~~~~~~~~~~~~~
|       |                                                     vkUnmapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/gpa_helper.c:256:60: error: 'vkCmdBindIndexBuffer2' undeclared (first use in this function); did you mean 'vkCmdBindIndexBuffer'?
|   256 |     if (!strcmp(funcName, "vkCmdBindIndexBuffer2")) return vkCmdBindIndexBuffer2;
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~
|       |                                                            vkCmdBindIndexBuffer
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/gpa_helper.c:257:68: error: 'vkGetRenderingAreaGranularity' undeclared (first use in this function); did you mean 'vkGetRenderingAreaGranularityKHR'?
|   257 |     if (!strcmp(funcName, "vkGetRenderingAreaGranularity")) return vkGetRenderingAreaGranularity;
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                    vkGetRenderingAreaGranularityKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/gpa_helper.c:258:72: error: 'vkGetDeviceImageSubresourceLayout' undeclared (first use in this function); did you mean 'vkGetDeviceImageSubresourceLayoutKHR'?
|   258 |     if (!strcmp(funcName, "vkGetDeviceImageSubresourceLayout")) return vkGetDeviceImageSubresourceLayout;
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                        vkGetDeviceImageSubresourceLayoutKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/gpa_helper.c:259:67: error: 'vkGetImageSubresourceLayout2' undeclared (first use in this function); did you mean 'vkGetImageSubresourceLayout'?
|   259 |     if (!strcmp(funcName, "vkGetImageSubresourceLayout2")) return vkGetImageSubresourceLayout2;
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                   vkGetImageSubresourceLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/gpa_helper.c:260:61: error: 'vkCmdPushDescriptorSet' undeclared (first use in this function); did you mean 'vkCmdPushDescriptorSetKHR'?
|   260 |     if (!strcmp(funcName, "vkCmdPushDescriptorSet")) return vkCmdPushDescriptorSet;
|       |                                                             ^~~~~~~~~~~~~~~~~~~~~~
|       |                                                             vkCmdPushDescriptorSetKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/gpa_helper.c:261:73: error: 'vkCmdPushDescriptorSetWithTemplate' undeclared (first use in this function); did you mean 'vkCmdPushDescriptorSetWithTemplateKHR'?
|   261 |     if (!strcmp(funcName, "vkCmdPushDescriptorSetWithTemplate")) return vkCmdPushDescriptorSetWithTemplate;
|       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                         vkCmdPushDescriptorSetWithTemplateKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/gpa_helper.c:262:75: error: 'vkCmdSetRenderingAttachmentLocations' undeclared (first use in this function); did you mean 'vkCmdSetRenderingAttachmentLocationsKHR'?
|   262 |     if (!strcmp(funcName, "vkCmdSetRenderingAttachmentLocations")) return vkCmdSetRenderingAttachmentLocations;
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                           vkCmdSetRenderingAttachmentLocationsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/gpa_helper.c:263:78: error: 'vkCmdSetRenderingInputAttachmentIndices' undeclared (first use in this function); did you mean 'vkCmdSetRenderingInputAttachmentIndicesKHR'?
|   263 |     if (!strcmp(funcName, "vkCmdSetRenderingInputAttachmentIndices")) return vkCmdSetRenderingInputAttachmentIndices;
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                              vkCmdSetRenderingInputAttachmentIndicesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/gpa_helper.c:264:63: error: 'vkCmdBindDescriptorSets2' undeclared (first use in this function); did you mean 'vkCmdBindDescriptorSets'?
|   264 |     if (!strcmp(funcName, "vkCmdBindDescriptorSets2")) return vkCmdBindDescriptorSets2;
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                               vkCmdBindDescriptorSets
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/gpa_helper.c:265:58: error: 'vkCmdPushConstants2' undeclared (first use in this function); did you mean 'vkCmdPushConstants'?
|   265 |     if (!strcmp(funcName, "vkCmdPushConstants2")) return vkCmdPushConstants2;
|       |                                                          ^~~~~~~~~~~~~~~~~~~
|       |                                                          vkCmdPushConstants
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/gpa_helper.c:266:62: error: 'vkCmdPushDescriptorSet2' undeclared (first use in this function); did you mean 'vkCmdPushDescriptorSet2KHR'?
|   266 |     if (!strcmp(funcName, "vkCmdPushDescriptorSet2")) return vkCmdPushDescriptorSet2;
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                                              vkCmdPushDescriptorSet2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/gpa_helper.c:267:74: error: 'vkCmdPushDescriptorSetWithTemplate2' undeclared (first use in this function); did you mean 'vkCmdPushDescriptorSetWithTemplate2KHR'?
|   267 |     if (!strcmp(funcName, "vkCmdPushDescriptorSetWithTemplate2")) return vkCmdPushDescriptorSetWithTemplate2;
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                          vkCmdPushDescriptorSetWithTemplate2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/gpa_helper.c:268:58: error: 'vkCopyMemoryToImage' undeclared (first use in this function); did you mean 'vkCopyMemoryToImageEXT'?
|   268 |     if (!strcmp(funcName, "vkCopyMemoryToImage")) return vkCopyMemoryToImage;
|       |                                                          ^~~~~~~~~~~~~~~~~~~
|       |                                                          vkCopyMemoryToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/gpa_helper.c:269:58: error: 'vkCopyImageToMemory' undeclared (first use in this function); did you mean 'vkCopyImageToMemoryEXT'?
|   269 |     if (!strcmp(funcName, "vkCopyImageToMemory")) return vkCopyImageToMemory;
|       |                                                          ^~~~~~~~~~~~~~~~~~~
|       |                                                          vkCopyImageToMemoryEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/gpa_helper.c:270:57: error: 'vkCopyImageToImage' undeclared (first use in this function); did you mean 'vkCopyImageToImageEXT'?
|   270 |     if (!strcmp(funcName, "vkCopyImageToImage")) return vkCopyImageToImage;
|       |                                                         ^~~~~~~~~~~~~~~~~~
|       |                                                         vkCopyImageToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/gpa_helper.c:271:62: error: 'vkTransitionImageLayout' undeclared (first use in this function); did you mean 'vkTransitionImageLayoutEXT'?
|   271 |     if (!strcmp(funcName, "vkTransitionImageLayout")) return vkTransitionImageLayout;
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                                              vkTransitionImageLayoutEXT
| [15/17] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/
 loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader.c
| FAILED: loader/CMakeFiles/vulkan.dir/loader.c.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build/loader -
 m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git=/usr/src/debug/vulkan-loader/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build=/usr/src/debug/vulkan-loader/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/recipe-sysroot-native=  -pipe -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader.c
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:39,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader.h:32,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader.c:31:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:295:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   295 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:498:5: error: unknown type name 'PFN_vkCmdSetLineStipple'; did you mean 'PFN_vkCmdSetLineStippleEXT'?
|   498 |     PFN_vkCmdSetLineStipple CmdSetLineStipple;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetLineStippleEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:499:5: error: unknown type name 'PFN_vkMapMemory2'; did you mean 'PFN_vkMapMemory'?
|   499 |     PFN_vkMapMemory2 MapMemory2;
|       |     ^~~~~~~~~~~~~~~~
|       |     PFN_vkMapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:500:5: error: unknown type name 'PFN_vkUnmapMemory2'; did you mean 'PFN_vkUnmapMemory'?
|   500 |     PFN_vkUnmapMemory2 UnmapMemory2;
|       |     ^~~~~~~~~~~~~~~~~~
|       |     PFN_vkUnmapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:501:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2'; did you mean 'PFN_vkCmdBindIndexBuffer'?
|   501 |     PFN_vkCmdBindIndexBuffer2 CmdBindIndexBuffer2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindIndexBuffer
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:502:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularity'; did you mean 'PFN_vkGetRenderingAreaGranularityKHR'?
|   502 |     PFN_vkGetRenderingAreaGranularity GetRenderingAreaGranularity;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetRenderingAreaGranularityKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:503:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayout'; did you mean 'PFN_vkGetDeviceImageSubresourceLayoutKHR'?
|   503 |     PFN_vkGetDeviceImageSubresourceLayout GetDeviceImageSubresourceLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetDeviceImageSubresourceLayoutKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:504:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2'; did you mean 'PFN_vkGetImageSubresourceLayout'?
|   504 |     PFN_vkGetImageSubresourceLayout2 GetImageSubresourceLayout2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageSubresourceLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:505:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet'; did you mean 'PFN_vkCmdPushDescriptorSetKHR'?
|   505 |     PFN_vkCmdPushDescriptorSet CmdPushDescriptorSet;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:506:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplateKHR'?
|   506 |     PFN_vkCmdPushDescriptorSetWithTemplate CmdPushDescriptorSetWithTemplate;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplateKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:507:5: error: unknown type name 'PFN_vkCmdSetRenderingAttachmentLocations'; did you mean 'PFN_vkCmdSetRenderingAttachmentLocationsKHR'?
|   507 |     PFN_vkCmdSetRenderingAttachmentLocations CmdSetRenderingAttachmentLocations;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingAttachmentLocationsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:508:5: error: unknown type name 'PFN_vkCmdSetRenderingInputAttachmentIndices'; did you mean 'PFN_vkCmdSetRenderingInputAttachmentIndicesKHR'?
|   508 |     PFN_vkCmdSetRenderingInputAttachmentIndices CmdSetRenderingInputAttachmentIndices;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetRenderingInputAttachmentIndicesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:509:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2'; did you mean 'PFN_vkCmdBindDescriptorSets'?
|   509 |     PFN_vkCmdBindDescriptorSets2 CmdBindDescriptorSets2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdBindDescriptorSets
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:510:5: error: unknown type name 'PFN_vkCmdPushConstants2'; did you mean 'PFN_vkCmdPushConstants'?
|   510 |     PFN_vkCmdPushConstants2 CmdPushConstants2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushConstants
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:511:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2'; did you mean 'PFN_vkCmdPushDescriptorSet2KHR'?
|   511 |     PFN_vkCmdPushDescriptorSet2 CmdPushDescriptorSet2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSet2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:512:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2'; did you mean 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'?
|   512 |     PFN_vkCmdPushDescriptorSetWithTemplate2 CmdPushDescriptorSetWithTemplate2;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:513:5: error: unknown type name 'PFN_vkCopyMemoryToImage'; did you mean 'PFN_vkCopyMemoryToImageEXT'?
|   513 |     PFN_vkCopyMemoryToImage CopyMemoryToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyMemoryToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:514:5: error: unknown type name 'PFN_vkCopyImageToMemory'; did you mean 'PFN_vkCopyImageToMemoryEXT'?
|   514 |     PFN_vkCopyImageToMemory CopyImageToMemory;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToMemoryEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:515:5: error: unknown type name 'PFN_vkCopyImageToImage'; did you mean 'PFN_vkCopyImageToImageEXT'?
|   515 |     PFN_vkCopyImageToImage CopyImageToImage;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCopyImageToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:516:5: error: unknown type name 'PFN_vkTransitionImageLayout'; did you mean 'PFN_vkTransitionImageLayoutEXT'?
|   516 |     PFN_vkTransitionImageLayout TransitionImageLayout;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkTransitionImageLayoutEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_layer_dispatch_table.h:751:5: error: unknown type name 'PFN_vkGetImageViewHandle64NVX'; did you mean 'PFN_vkGetImageViewHandleNVX'?
|   751 |     PFN_vkGetImageViewHandle64NVX GetImageViewHandle64NVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetImageViewHandleNVX
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader_common.h:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.h:481:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV'; did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|   481 |     PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/loader.c:76:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'loader_icd_init_entries':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:54:54: error: 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV' undeclared (first use in this function); did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|    54 | #define LOOKUP_GIPA(func) icd_term->dispatch.func = (PFN_vk##func)fp_gipa(icd_term->instance, "vk" #func);
|       |                                                      ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:316:5: note: in expansion of macro 'LOOKUP_GIPA'
|   316 |     LOOKUP_GIPA(GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV);
|       |     ^~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:54:54: note: each undeclared identifier is reported only once for each function it appears in
|    54 | #define LOOKUP_GIPA(func) icd_term->dispatch.func = (PFN_vk##func)fp_gipa(icd_term->instance, "vk" #func);
|       |                                                      ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:316:5: note: in expansion of macro 'LOOKUP_GIPA'
|   316 |     LOOKUP_GIPA(GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV);
|       |     ^~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:54:67: error: expected ';' before 'fp_gipa'
|    54 | #define LOOKUP_GIPA(func) icd_term->dispatch.func = (PFN_vk##func)fp_gipa(icd_term->instance, "vk" #func);
|       |                                                                   ^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:316:5: note: in expansion of macro 'LOOKUP_GIPA'
|   316 |     LOOKUP_GIPA(GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV);
|       |     ^~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'loader_init_device_dispatch_table':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:526:33: error: 'PFN_vkCmdSetLineStipple' undeclared (first use in this function); did you mean 'PFN_vkCmdSetLineStippleEXT'?
|   526 |     table->CmdSetLineStipple = (PFN_vkCmdSetLineStipple)gpa(dev, "vkCmdSetLineStipple");
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                 PFN_vkCmdSetLineStippleEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:526:57: error: expected ';' before 'gpa'
|   526 |     table->CmdSetLineStipple = (PFN_vkCmdSetLineStipple)gpa(dev, "vkCmdSetLineStipple");
|       |                                                         ^~~
|       |                                                         ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:527:26: error: 'PFN_vkMapMemory2' undeclared (first use in this function); did you mean 'PFN_vkMapMemory'?
|   527 |     table->MapMemory2 = (PFN_vkMapMemory2)gpa(dev, "vkMapMemory2");
|       |                          ^~~~~~~~~~~~~~~~
|       |                          PFN_vkMapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:527:43: error: expected ';' before 'gpa'
|   527 |     table->MapMemory2 = (PFN_vkMapMemory2)gpa(dev, "vkMapMemory2");
|       |                                           ^~~
|       |                                           ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:528:28: error: 'PFN_vkUnmapMemory2' undeclared (first use in this function); did you mean 'PFN_vkUnmapMemory'?
|   528 |     table->UnmapMemory2 = (PFN_vkUnmapMemory2)gpa(dev, "vkUnmapMemory2");
|       |                            ^~~~~~~~~~~~~~~~~~
|       |                            PFN_vkUnmapMemory
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:528:47: error: expected ';' before 'gpa'
|   528 |     table->UnmapMemory2 = (PFN_vkUnmapMemory2)gpa(dev, "vkUnmapMemory2");
|       |                                               ^~~
|       |                                               ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:529:35: error: 'PFN_vkCmdBindIndexBuffer2' undeclared (first use in this function); did you mean 'PFN_vkCmdBindIndexBuffer'?
|   529 |     table->CmdBindIndexBuffer2 = (PFN_vkCmdBindIndexBuffer2)gpa(dev, "vkCmdBindIndexBuffer2");
|       |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                   PFN_vkCmdBindIndexBuffer
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:529:61: error: expected ';' before 'gpa'
|   529 |     table->CmdBindIndexBuffer2 = (PFN_vkCmdBindIndexBuffer2)gpa(dev, "vkCmdBindIndexBuffer2");
|       |                                                             ^~~
|       |                                                             ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:530:43: error: 'PFN_vkGetRenderingAreaGranularity' undeclared (first use in this function); did you mean 'PFN_vkGetRenderingAreaGranularityKHR'?
|   530 |     table->GetRenderingAreaGranularity = (PFN_vkGetRenderingAreaGranularity)gpa(dev, "vkGetRenderingAreaGranularity");
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           PFN_vkGetRenderingAreaGranularityKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:530:77: error: expected ';' before 'gpa'
|   530 |     table->GetRenderingAreaGranularity = (PFN_vkGetRenderingAreaGranularity)gpa(dev, "vkGetRenderingAreaGranularity");
|       |                                                                             ^~~
|       |                                                                             ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:531:47: error: 'PFN_vkGetDeviceImageSubresourceLayout' undeclared (first use in this function); did you mean 'PFN_vkGetDeviceImageSubresourceLayoutKHR'?
|   531 |     table->GetDeviceImageSubresourceLayout = (PFN_vkGetDeviceImageSubresourceLayout)gpa(dev, "vkGetDeviceImageSubresourceLayout");
|       |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                               PFN_vkGetDeviceImageSubresourceLayoutKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:531:85: error: expected ';' before 'gpa'
|   531 |     table->GetDeviceImageSubresourceLayout = (PFN_vkGetDeviceImageSubresourceLayout)gpa(dev, "vkGetDeviceImageSubresourceLayout");
|       |                                                                                     ^~~
|       |                                                                                     ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:532:42: error: 'PFN_vkGetImageSubresourceLayout2' undeclared (first use in this function); did you mean 'PFN_vkGetImageSubresourceLayout'?
|   532 |     table->GetImageSubresourceLayout2 = (PFN_vkGetImageSubresourceLayout2)gpa(dev, "vkGetImageSubresourceLayout2");
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                          PFN_vkGetImageSubresourceLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:532:75: error: expected ';' before 'gpa'
|   532 |     table->GetImageSubresourceLayout2 = (PFN_vkGetImageSubresourceLayout2)gpa(dev, "vkGetImageSubresourceLayout2");
|       |                                                                           ^~~
|       |                                                                           ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:533:36: error: 'PFN_vkCmdPushDescriptorSet' undeclared (first use in this function); did you mean 'PFN_vkCmdPushDescriptorSetKHR'?
|   533 |     table->CmdPushDescriptorSet = (PFN_vkCmdPushDescriptorSet)gpa(dev, "vkCmdPushDescriptorSet");
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    PFN_vkCmdPushDescriptorSetKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:533:63: error: expected ';' before 'gpa'
|   533 |     table->CmdPushDescriptorSet = (PFN_vkCmdPushDescriptorSet)gpa(dev, "vkCmdPushDescriptorSet");
|       |                                                               ^~~
|       |                                                               ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:534:48: error: 'PFN_vkCmdPushDescriptorSetWithTemplate' undeclared (first use in this function); did you mean 'PFN_vkCmdPushDescriptorSetWithTemplateKHR'?
|   534 |     table->CmdPushDescriptorSetWithTemplate = (PFN_vkCmdPushDescriptorSetWithTemplate)gpa(dev, "vkCmdPushDescriptorSetWithTemplate");
|       |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                PFN_vkCmdPushDescriptorSetWithTemplateKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:534:87: error: expected ';' before 'gpa'
|   534 |     table->CmdPushDescriptorSetWithTemplate = (PFN_vkCmdPushDescriptorSetWithTemplate)gpa(dev, "vkCmdPushDescriptorSetWithTemplate");
|       |                                                                                       ^~~
|       |                                                                                       ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:535:50: error: 'PFN_vkCmdSetRenderingAttachmentLocations' undeclared (first use in this function); did you mean 'PFN_vkCmdSetRenderingAttachmentLocationsKHR'?
|   535 |     table->CmdSetRenderingAttachmentLocations = (PFN_vkCmdSetRenderingAttachmentLocations)gpa(dev, "vkCmdSetRenderingAttachmentLocations");
|       |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                  PFN_vkCmdSetRenderingAttachmentLocationsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:535:91: error: expected ';' before 'gpa'
|   535 |     table->CmdSetRenderingAttachmentLocations = (PFN_vkCmdSetRenderingAttachmentLocations)gpa(dev, "vkCmdSetRenderingAttachmentLocations");
|       |                                                                                           ^~~
|       |                                                                                           ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:536:53: error: 'PFN_vkCmdSetRenderingInputAttachmentIndices' undeclared (first use in this function); did you mean 'PFN_vkCmdSetRenderingInputAttachmentIndicesKHR'?
|   536 |     table->CmdSetRenderingInputAttachmentIndices = (PFN_vkCmdSetRenderingInputAttachmentIndices)gpa(dev, "vkCmdSetRenderingInputAttachmentIndices");
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     PFN_vkCmdSetRenderingInputAttachmentIndicesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:536:97: error: expected ';' before 'gpa'
|   536 |     table->CmdSetRenderingInputAttachmentIndices = (PFN_vkCmdSetRenderingInputAttachmentIndices)gpa(dev, "vkCmdSetRenderingInputAttachmentIndices");
|       |                                                                                                 ^~~
|       |                                                                                                 ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:537:38: error: 'PFN_vkCmdBindDescriptorSets2' undeclared (first use in this function); did you mean 'PFN_vkCmdBindDescriptorSets'?
|   537 |     table->CmdBindDescriptorSets2 = (PFN_vkCmdBindDescriptorSets2)gpa(dev, "vkCmdBindDescriptorSets2");
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      PFN_vkCmdBindDescriptorSets
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:537:67: error: expected ';' before 'gpa'
|   537 |     table->CmdBindDescriptorSets2 = (PFN_vkCmdBindDescriptorSets2)gpa(dev, "vkCmdBindDescriptorSets2");
|       |                                                                   ^~~
|       |                                                                   ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:538:33: error: 'PFN_vkCmdPushConstants2' undeclared (first use in this function); did you mean 'PFN_vkCmdPushConstants'?
|   538 |     table->CmdPushConstants2 = (PFN_vkCmdPushConstants2)gpa(dev, "vkCmdPushConstants2");
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                 PFN_vkCmdPushConstants
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:538:57: error: expected ';' before 'gpa'
|   538 |     table->CmdPushConstants2 = (PFN_vkCmdPushConstants2)gpa(dev, "vkCmdPushConstants2");
|       |                                                         ^~~
|       |                                                         ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:539:37: error: 'PFN_vkCmdPushDescriptorSet2' undeclared (first use in this function); did you mean 'PFN_vkCmdPushDescriptorSet2KHR'?
|   539 |     table->CmdPushDescriptorSet2 = (PFN_vkCmdPushDescriptorSet2)gpa(dev, "vkCmdPushDescriptorSet2");
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     PFN_vkCmdPushDescriptorSet2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:539:65: error: expected ';' before 'gpa'
|   539 |     table->CmdPushDescriptorSet2 = (PFN_vkCmdPushDescriptorSet2)gpa(dev, "vkCmdPushDescriptorSet2");
|       |                                                                 ^~~
|       |                                                                 ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:540:49: error: 'PFN_vkCmdPushDescriptorSetWithTemplate2' undeclared (first use in this function); did you mean 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'?
|   540 |     table->CmdPushDescriptorSetWithTemplate2 = (PFN_vkCmdPushDescriptorSetWithTemplate2)gpa(dev, "vkCmdPushDescriptorSetWithTemplate2");
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 PFN_vkCmdPushDescriptorSetWithTemplate2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:540:89: error: expected ';' before 'gpa'
|   540 |     table->CmdPushDescriptorSetWithTemplate2 = (PFN_vkCmdPushDescriptorSetWithTemplate2)gpa(dev, "vkCmdPushDescriptorSetWithTemplate2");
|       |                                                                                         ^~~
|       |                                                                                         ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:541:33: error: 'PFN_vkCopyMemoryToImage' undeclared (first use in this function); did you mean 'PFN_vkCopyMemoryToImageEXT'?
|   541 |     table->CopyMemoryToImage = (PFN_vkCopyMemoryToImage)gpa(dev, "vkCopyMemoryToImage");
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                 PFN_vkCopyMemoryToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:541:57: error: expected ';' before 'gpa'
|   541 |     table->CopyMemoryToImage = (PFN_vkCopyMemoryToImage)gpa(dev, "vkCopyMemoryToImage");
|       |                                                         ^~~
|       |                                                         ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:542:33: error: 'PFN_vkCopyImageToMemory' undeclared (first use in this function); did you mean 'PFN_vkCopyImageToMemoryEXT'?
|   542 |     table->CopyImageToMemory = (PFN_vkCopyImageToMemory)gpa(dev, "vkCopyImageToMemory");
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                 PFN_vkCopyImageToMemoryEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:542:57: error: expected ';' before 'gpa'
|   542 |     table->CopyImageToMemory = (PFN_vkCopyImageToMemory)gpa(dev, "vkCopyImageToMemory");
|       |                                                         ^~~
|       |                                                         ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:543:32: error: 'PFN_vkCopyImageToImage' undeclared (first use in this function); did you mean 'PFN_vkCopyImageToImageEXT'?
|   543 |     table->CopyImageToImage = (PFN_vkCopyImageToImage)gpa(dev, "vkCopyImageToImage");
|       |                                ^~~~~~~~~~~~~~~~~~~~~~
|       |                                PFN_vkCopyImageToImageEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:543:55: error: expected ';' before 'gpa'
|   543 |     table->CopyImageToImage = (PFN_vkCopyImageToImage)gpa(dev, "vkCopyImageToImage");
|       |                                                       ^~~
|       |                                                       ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:544:37: error: 'PFN_vkTransitionImageLayout' undeclared (first use in this function); did you mean 'PFN_vkTransitionImageLayoutEXT'?
|   544 |     table->TransitionImageLayout = (PFN_vkTransitionImageLayout)gpa(dev, "vkTransitionImageLayout");
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     PFN_vkTransitionImageLayoutEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:544:65: error: expected ';' before 'gpa'
|   544 |     table->TransitionImageLayout = (PFN_vkTransitionImageLayout)gpa(dev, "vkTransitionImageLayout");
|       |                                                                 ^~~
|       |                                                                 ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'loader_init_device_extension_dispatch_table':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:789:39: error: 'PFN_vkGetImageViewHandle64NVX' undeclared (first use in this function); did you mean 'PFN_vkGetImageViewHandleNVX'?
|   789 |     table->GetImageViewHandle64NVX = (PFN_vkGetImageViewHandle64NVX)gdpa(dev, "vkGetImageViewHandle64NVX");
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                       PFN_vkGetImageViewHandleNVX
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:789:69: error: expected ';' before 'gdpa'
|   789 |     table->GetImageViewHandle64NVX = (PFN_vkGetImageViewHandle64NVX)gdpa(dev, "vkGetImageViewHandle64NVX");
|       |                                                                     ^~~~
|       |                                                                     ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'loader_init_instance_extension_dispatch_table':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:1509:80: error: 'PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV' undeclared (first use in this function); did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|  1509 |     table->GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV = (PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV)gpa(inst, "vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV");
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:1509:151: error: expected ';' before 'gpa'
|  1509 |     table->GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV = (PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV)gpa(inst, "vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV");
|       |                                                                                                                                                       ^~~
|       |                                                                                                                                                       ;
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'loader_lookup_device_dispatch_table':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:2339:84: error: 'VK_API_VERSION_1_4' undeclared (first use in this function); did you mean 'VK_API_VERSION_1_0'?
|  2339 |         if (dev->should_ignore_device_commands_from_newer_version && api_version < VK_API_VERSION_1_4) return NULL;
|       |                                                                                    ^~~~~~~~~~~~~~~~~~
|       |                                                                                    VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:2340:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2340 |         return (void *)table->CmdSetLineStipple;
|       |                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:2344:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2344 |         return (void *)table->MapMemory2;
|       |                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:2348:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2348 |         return (void *)table->UnmapMemory2;
|       |                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:2352:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2352 |         return (void *)table->CmdBindIndexBuffer2;
|       |                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:2356:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2356 |         return (void *)table->GetRenderingAreaGranularity;
|       |                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:2360:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2360 |         return (void *)table->GetDeviceImageSubresourceLayout;
|       |                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:2364:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2364 |         return (void *)table->GetImageSubresourceLayout2;
|       |                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:2368:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2368 |         return (void *)table->CmdPushDescriptorSet;
|       |                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:2372:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2372 |         return (void *)table->CmdPushDescriptorSetWithTemplate;
|       |                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:2376:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2376 |         return (void *)table->CmdSetRenderingAttachmentLocations;
|       |                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:2380:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2380 |         return (void *)table->CmdSetRenderingInputAttachmentIndices;
|       |                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:2384:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2384 |         return (void *)table->CmdBindDescriptorSets2;
|       |                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:2388:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2388 |         return (void *)table->CmdPushConstants2;
|       |                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:2392:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2392 |         return (void *)table->CmdPushDescriptorSet2;
|       |                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:2396:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2396 |         return (void *)table->CmdPushDescriptorSetWithTemplate2;
|       |                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:2400:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2400 |         return (void *)table->CopyMemoryToImage;
|       |                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:2404:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2404 |         return (void *)table->CopyImageToMemory;
|       |                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:2408:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2408 |         return (void *)table->CopyImageToImage;
|       |                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:2412:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2412 |         return (void *)table->TransitionImageLayout;
|       |                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:2648:58: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2648 |     if (!strcmp(name, "GetImageViewHandle64NVX")) return (void *)table->GetImageViewHandle64NVX;
|       |                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'loader_lookup_instance_dispatch_table':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:3373:99: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  3373 |     if (!strcmp(name, "GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV")) return (void *)table->GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |                                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:4403:11: error: unknown type name 'VkRenderingAttachmentLocationInfo'; did you mean 'VkRenderingAttachmentLocationInfoKHR'?
|  4403 |     const VkRenderingAttachmentLocationInfo*    pLocationInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkRenderingAttachmentLocationInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetRenderingAttachmentLocationsKHR':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:4411:64: error: passing argument 2 of 'disp->CmdSetRenderingAttachmentLocationsKHR' from incompatible pointer type [-Wincompatible-pointer-types]
|  4411 |     disp->CmdSetRenderingAttachmentLocationsKHR(commandBuffer, pLocationInfo);
|       |                                                                ^~~~~~~~~~~~~
|       |                                                                |
|       |                                                                const int *
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:4411:64: note: expected 'const VkRenderingAttachmentLocationInfoKHR *' but argument is of type 'const int *'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:4416:11: error: unknown type name 'VkRenderingInputAttachmentIndexInfo'; did you mean 'VkRenderingInputAttachmentIndexInfoKHR'?
|  4416 |     const VkRenderingInputAttachmentIndexInfo*  pInputAttachmentIndexInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkRenderingInputAttachmentIndexInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetRenderingInputAttachmentIndicesKHR':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:4424:67: error: passing argument 2 of 'disp->CmdSetRenderingInputAttachmentIndicesKHR' from incompatible pointer type [-Wincompatible-pointer-types]
|  4424 |     disp->CmdSetRenderingInputAttachmentIndicesKHR(commandBuffer, pInputAttachmentIndexInfo);
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                   |
|       |                                                                   const int *
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:4424:67: note: expected 'const VkRenderingInputAttachmentIndexInfoKHR *' but argument is of type 'const int *'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:4610:11: error: unknown type name 'VkMemoryMapInfo'; did you mean 'VkMemoryMapInfoKHR'?
|  4610 |     const VkMemoryMapInfo*                      pMemoryMapInfo,
|       |           ^~~~~~~~~~~~~~~
|       |           VkMemoryMapInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'MapMemory2KHR':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:4619:40: error: passing argument 2 of 'disp->MapMemory2KHR' from incompatible pointer type [-Wincompatible-pointer-types]
|  4619 |     return disp->MapMemory2KHR(device, pMemoryMapInfo, ppData);
|       |                                        ^~~~~~~~~~~~~~
|       |                                        |
|       |                                        const int *
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:4619:40: note: expected 'const VkMemoryMapInfoKHR *' but argument is of type 'const int *'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:4624:11: error: unknown type name 'VkMemoryUnmapInfo'; did you mean 'VkMemoryUnmapInfoKHR'?
|  4624 |     const VkMemoryUnmapInfo*                    pMemoryUnmapInfo) {
|       |           ^~~~~~~~~~~~~~~~~
|       |           VkMemoryUnmapInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'UnmapMemory2KHR':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:4632:42: error: passing argument 2 of 'disp->UnmapMemory2KHR' from incompatible pointer type [-Wincompatible-pointer-types]
|  4632 |     return disp->UnmapMemory2KHR(device, pMemoryUnmapInfo);
|       |                                          ^~~~~~~~~~~~~~~~
|       |                                          |
|       |                                          const int *
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:4632:42: note: expected 'const VkMemoryUnmapInfoKHR *' but argument is of type 'const int *'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:4950:11: error: unknown type name 'VkRenderingAreaInfo'; did you mean 'VkRenderingAreaInfoKHR'?
|  4950 |     const VkRenderingAreaInfo*                  pRenderingAreaInfo,
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkRenderingAreaInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'GetRenderingAreaGranularityKHR':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:4959:50: error: passing argument 2 of 'disp->GetRenderingAreaGranularityKHR' from incompatible pointer type [-Wincompatible-pointer-types]
|  4959 |     disp->GetRenderingAreaGranularityKHR(device, pRenderingAreaInfo, pGranularity);
|       |                                                  ^~~~~~~~~~~~~~~~~~
|       |                                                  |
|       |                                                  const int *
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:4959:50: note: expected 'const VkRenderingAreaInfoKHR *' but argument is of type 'const int *'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:4964:11: error: unknown type name 'VkDeviceImageSubresourceInfo'; did you mean 'VkDeviceImageSubresourceInfoKHR'?
|  4964 |     const VkDeviceImageSubresourceInfo*         pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkDeviceImageSubresourceInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:4965:5: error: unknown type name 'VkSubresourceLayout2'; did you mean 'VkSubresourceLayout'?
|  4965 |     VkSubresourceLayout2*                       pLayout) {
|       |     ^~~~~~~~~~~~~~~~~~~~
|       |     VkSubresourceLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:4979:11: error: unknown type name 'VkImageSubresource2'; did you mean 'VkImageSubresource'?
|  4979 |     const VkImageSubresource2*                  pSubresource,
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkImageSubresource
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:4980:5: error: unknown type name 'VkSubresourceLayout2'; did you mean 'VkSubresourceLayout'?
|  4980 |     VkSubresourceLayout2*                       pLayout) {
|       |     ^~~~~~~~~~~~~~~~~~~~
|       |     VkSubresourceLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:5171:11: error: unknown type name 'VkBindDescriptorSetsInfo'; did you mean 'VkBindDescriptorSetsInfoKHR'?
|  5171 |     const VkBindDescriptorSetsInfo*             pBindDescriptorSetsInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkBindDescriptorSetsInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'CmdBindDescriptorSets2KHR':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:5179:52: error: passing argument 2 of 'disp->CmdBindDescriptorSets2KHR' from incompatible pointer type [-Wincompatible-pointer-types]
|  5179 |     disp->CmdBindDescriptorSets2KHR(commandBuffer, pBindDescriptorSetsInfo);
|       |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                                    |
|       |                                                    const int *
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:5179:52: note: expected 'const VkBindDescriptorSetsInfoKHR *' but argument is of type 'const int *'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:5184:11: error: unknown type name 'VkPushConstantsInfo'; did you mean 'VkPushConstantsInfoKHR'?
|  5184 |     const VkPushConstantsInfo*                  pPushConstantsInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkPushConstantsInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'CmdPushConstants2KHR':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:5192:47: error: passing argument 2 of 'disp->CmdPushConstants2KHR' from incompatible pointer type [-Wincompatible-pointer-types]
|  5192 |     disp->CmdPushConstants2KHR(commandBuffer, pPushConstantsInfo);
|       |                                               ^~~~~~~~~~~~~~~~~~
|       |                                               |
|       |                                               const int *
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:5192:47: note: expected 'const VkPushConstantsInfoKHR *' but argument is of type 'const int *'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:5197:11: error: unknown type name 'VkPushDescriptorSetInfo'; did you mean 'VkPushDescriptorSetInfoKHR'?
|  5197 |     const VkPushDescriptorSetInfo*              pPushDescriptorSetInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPushDescriptorSetInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'CmdPushDescriptorSet2KHR':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:5205:51: error: passing argument 2 of 'disp->CmdPushDescriptorSet2KHR' from incompatible pointer type [-Wincompatible-pointer-types]
|  5205 |     disp->CmdPushDescriptorSet2KHR(commandBuffer, pPushDescriptorSetInfo);
|       |                                                   ^~~~~~~~~~~~~~~~~~~~~~
|       |                                                   |
|       |                                                   const int *
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:5205:51: note: expected 'const VkPushDescriptorSetInfoKHR *' but argument is of type 'const int *'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:5210:11: error: unknown type name 'VkPushDescriptorSetWithTemplateInfo'; did you mean 'VkPushDescriptorSetWithTemplateInfoKHR'?
|  5210 |     const VkPushDescriptorSetWithTemplateInfo*  pPushDescriptorSetWithTemplateInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPushDescriptorSetWithTemplateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'CmdPushDescriptorSetWithTemplate2KHR':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:5218:63: error: passing argument 2 of 'disp->CmdPushDescriptorSetWithTemplate2KHR' from incompatible pointer type [-Wincompatible-pointer-types]
|  5218 |     disp->CmdPushDescriptorSetWithTemplate2KHR(commandBuffer, pPushDescriptorSetWithTemplateInfo);
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                               |
|       |                                                               const int *
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:5218:63: note: expected 'const VkPushDescriptorSetWithTemplateInfoKHR *' but argument is of type 'const int *'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'GetImageViewHandle64NVX':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:5607:12: error: called object is not a function or function pointer
|  5607 |     return disp->GetImageViewHandle64NVX(device, pInfo);
|       |            ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'CmdInitializeGraphScratchMemoryAMDX':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:6302:62: error: passing argument 2 of 'disp->CmdInitializeGraphScratchMemoryAMDX' makes integer from pointer without a cast [-Wint-conversion]
|  6302 |     disp->CmdInitializeGraphScratchMemoryAMDX(commandBuffer, executionGraph, scratch, scratchSize);
|       |                                                              ^~~~~~~~~~~~~~
|       |                                                              |
|       |                                                              VkPipeline {aka struct VkPipeline_T *}
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:6302:62: note: expected 'VkDeviceAddress' {aka 'long unsigned int'} but argument is of type 'VkPipeline' {aka 'struct VkPipeline_T *'}
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:6302:5: error: too many arguments to function 'disp->CmdInitializeGraphScratchMemoryAMDX'
|  6302 |     disp->CmdInitializeGraphScratchMemoryAMDX(commandBuffer, executionGraph, scratch, scratchSize);
|       |     ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'CmdDispatchGraphAMDX':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:6319:56: error: passing argument 3 of 'disp->CmdDispatchGraphAMDX' makes pointer from integer without a cast [-Wint-conversion]
|  6319 |     disp->CmdDispatchGraphAMDX(commandBuffer, scratch, scratchSize, pCountInfo);
|       |                                                        ^~~~~~~~~~~
|       |                                                        |
|       |                                                        VkDeviceSize {aka long unsigned int}
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:6319:56: note: expected 'const VkDispatchGraphCountInfoAMDX *' but argument is of type 'VkDeviceSize' {aka 'long unsigned int'}
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:6319:5: error: too many arguments to function 'disp->CmdDispatchGraphAMDX'
|  6319 |     disp->CmdDispatchGraphAMDX(commandBuffer, scratch, scratchSize, pCountInfo);
|       |     ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'CmdDispatchGraphIndirectAMDX':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:6336:64: error: passing argument 3 of 'disp->CmdDispatchGraphIndirectAMDX' makes pointer from integer without a cast [-Wint-conversion]
|  6336 |     disp->CmdDispatchGraphIndirectAMDX(commandBuffer, scratch, scratchSize, pCountInfo);
|       |                                                                ^~~~~~~~~~~
|       |                                                                |
|       |                                                                VkDeviceSize {aka long unsigned int}
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:6336:64: note: expected 'const VkDispatchGraphCountInfoAMDX *' but argument is of type 'VkDeviceSize' {aka 'long unsigned int'}
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:6336:5: error: too many arguments to function 'disp->CmdDispatchGraphIndirectAMDX'
|  6336 |     disp->CmdDispatchGraphIndirectAMDX(commandBuffer, scratch, scratchSize, pCountInfo);
|       |     ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'CmdDispatchGraphIndirectCountAMDX':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:6353:5: error: too many arguments to function 'disp->CmdDispatchGraphIndirectCountAMDX'
|  6353 |     disp->CmdDispatchGraphIndirectCountAMDX(commandBuffer, scratch, scratchSize, countInfo);
|       |     ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:7440:11: error: unknown type name 'VkCopyMemoryToImageInfo'; did you mean 'VkCopyMemoryToImageInfoEXT'?
|  7440 |     const VkCopyMemoryToImageInfo*              pCopyMemoryToImageInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyMemoryToImageInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'CopyMemoryToImageEXT':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:7448:47: error: passing argument 2 of 'disp->CopyMemoryToImageEXT' from incompatible pointer type [-Wincompatible-pointer-types]
|  7448 |     return disp->CopyMemoryToImageEXT(device, pCopyMemoryToImageInfo);
|       |                                               ^~~~~~~~~~~~~~~~~~~~~~
|       |                                               |
|       |                                               const int *
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:7448:47: note: expected 'const VkCopyMemoryToImageInfoEXT *' but argument is of type 'const int *'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:7453:11: error: unknown type name 'VkCopyImageToMemoryInfo'; did you mean 'VkCopyImageToMemoryInfoEXT'?
|  7453 |     const VkCopyImageToMemoryInfo*              pCopyImageToMemoryInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyImageToMemoryInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'CopyImageToMemoryEXT':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:7461:47: error: passing argument 2 of 'disp->CopyImageToMemoryEXT' from incompatible pointer type [-Wincompatible-pointer-types]
|  7461 |     return disp->CopyImageToMemoryEXT(device, pCopyImageToMemoryInfo);
|       |                                               ^~~~~~~~~~~~~~~~~~~~~~
|       |                                               |
|       |                                               const int *
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:7461:47: note: expected 'const VkCopyImageToMemoryInfoEXT *' but argument is of type 'const int *'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:7466:11: error: unknown type name 'VkCopyImageToImageInfo'; did you mean 'VkCopyImageToImageInfoEXT'?
|  7466 |     const VkCopyImageToImageInfo*               pCopyImageToImageInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyImageToImageInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'CopyImageToImageEXT':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:7474:46: error: passing argument 2 of 'disp->CopyImageToImageEXT' from incompatible pointer type [-Wincompatible-pointer-types]
|  7474 |     return disp->CopyImageToImageEXT(device, pCopyImageToImageInfo);
|       |                                              ^~~~~~~~~~~~~~~~~~~~~
|       |                                              |
|       |                                              const int *
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:7474:46: note: expected 'const VkCopyImageToImageInfoEXT *' but argument is of type 'const int *'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:7480:11: error: unknown type name 'VkHostImageLayoutTransitionInfo'; did you mean 'VkHostImageLayoutTransitionInfoEXT'?
|  7480 |     const VkHostImageLayoutTransitionInfo*      pTransitions) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkHostImageLayoutTransitionInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'TransitionImageLayoutEXT':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:7488:68: error: passing argument 3 of 'disp->TransitionImageLayoutEXT' from incompatible pointer type [-Wincompatible-pointer-types]
|  7488 |     return disp->TransitionImageLayoutEXT(device, transitionCount, pTransitions);
|       |                                                                    ^~~~~~~~~~~~
|       |                                                                    |
|       |                                                                    const int *
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:7488:68: note: expected 'const VkHostImageLayoutTransitionInfoEXT *' but argument is of type 'const int *'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:7494:11: error: unknown type name 'VkImageSubresource2'; did you mean 'VkImageSubresource'?
|  7494 |     const VkImageSubresource2*                  pSubresource,
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkImageSubresource
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:7495:5: error: unknown type name 'VkSubresourceLayout2'; did you mean 'VkSubresourceLayout'?
|  7495 |     VkSubresourceLayout2*                       pLayout) {
|       |     ^~~~~~~~~~~~~~~~~~~~
|       |     VkSubresourceLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:9813:5: error: unknown type name 'VkCooperativeMatrixFlexibleDimensionsPropertiesNV'
|  9813 |     VkCooperativeMatrixFlexibleDimensionsPropertiesNV* pProperties) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:9829:5: error: unknown type name 'VkCooperativeMatrixFlexibleDimensionsPropertiesNV'
|  9829 |     VkCooperativeMatrixFlexibleDimensionsPropertiesNV* pProperties) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'extension_instance_gpa':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:10784:25: error: 'GetDeviceImageSubresourceLayoutKHR' undeclared (first use in this function); did you mean 'vkGetDeviceImageSubresourceLayoutKHR'?
| 10784 |         *addr = (void *)GetDeviceImageSubresourceLayoutKHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         vkGetDeviceImageSubresourceLayoutKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:10788:25: error: 'GetImageSubresourceLayout2KHR' undeclared (first use in this function); did you mean 'vkGetImageSubresourceLayout2KHR'?
| 10788 |         *addr = (void *)GetImageSubresourceLayout2KHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         vkGetImageSubresourceLayout2KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:11524:25: error: 'GetImageSubresourceLayout2EXT' undeclared (first use in this function); did you mean 'vkGetImageSubresourceLayout2EXT'?
| 11524 |         *addr = (void *)GetImageSubresourceLayout2EXT;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         vkGetImageSubresourceLayout2EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:12226:25: error: 'GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV' undeclared (first use in this function); did you mean 'GetPhysicalDeviceCooperativeMatrixPropertiesNV'?
| 12226 |         *addr = (void *)GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         GetPhysicalDeviceCooperativeMatrixPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:12734:73: error: 'terminator_GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV' undeclared here (not in a function); did you mean 'terminator_GetPhysicalDeviceCooperativeMatrixPropertiesNV'?
| 12734 |     .GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV = terminator_GetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV,
|       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                         terminator_GetPhysicalDeviceCooperativeMatrixPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:12806:51: error: 'VK_NV_DISPLAY_STEREO_EXTENSION_NAME' undeclared here (not in a function); did you mean 'VK_EXT_DISPLAY_CONTROL_EXTENSION_NAME'?
| 12806 |                                                   VK_NV_DISPLAY_STEREO_EXTENSION_NAME,
|       |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                   VK_EXT_DISPLAY_CONTROL_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c: In function 'GetImageViewHandle64NVX':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/git/loader/generated/vk_loader_extensions.c:5608:1: warning: control reaches end of non-void function [-Wreturn-type]
|  5608 | }
|       | ^
| ninja: build stopped: subcommand failed.
| 
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/temp/run.do_compile.2052600:153 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/temp/run.do_compile.2052600, line 153
| 	#2: cmake_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/temp/run.do_compile.2052600, line 147
| 	#3: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/temp/run.do_compile.2052600, line 142
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/temp/run.do_compile.2052600, line 166
NOTE: recipe vulkan-loader-1.4.304.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1902 tasks of which 1887 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250115092815.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250115092815.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.304.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/temp/log.do_compile.2052600
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-loader-1.4.304.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/temp/run.do_compile.2052600' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.4.304.0/temp/log.do_compile.2052600
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.304.0.bb:do_compile) failed with exit code '1'

--===============0904986845924827381==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-loader-upgrade-1.3.296.0-1.4.304.0.patch"

RnJvbSAyYjAyMWE4YzBhMjRhOTg2M2I3YTQ4N2U2YmM2ZmRmYjFkOTE2ZWQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDk6Mjg6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tbG9hZGVyOiB1cGdyYWRlIDEuMy4yOTYuMCAtPiAxLjQuMzA0LjAKCi0tLQogLi4ue3Z1
bGthbi1sb2FkZXJfMS4zLjI5Ni4wLmJiID0+IHZ1bGthbi1sb2FkZXJfMS40LjMwNC4wLmJifSB8
IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3t2dWxrYW4tbG9hZGVyXzEuMy4y
OTYuMC5iYiA9PiB2dWxrYW4tbG9hZGVyXzEuNC4zMDQuMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1sb2FkZXJfMS4zLjI5Ni4wLmJi
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tbG9hZGVyXzEuNC4zMDQuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
dnVsa2FuL3Z1bGthbi1sb2FkZXJfMS4zLjI5Ni4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1sb2FkZXJfMS40LjMwNC4wLmJiCmluZGV4IDkyZWQxOGMy
OTkuLmJmZWU0YjlmNjUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4v
dnVsa2FuLWxvYWRlcl8xLjMuMjk2LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1
bGthbi92dWxrYW4tbG9hZGVyXzEuNC4zMDQuMC5iYgpAQCAtOSw4ICs5LDggQEAgU0VDVElPTiA9
ICJsaWJzIgogCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9MSUNFTlNFLnR4dDttZDU9N2RiZWZlZDIzMjQyNzYwYWEzNDc1ZWU0MjgwMWM1YWMiCi1T
UkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1Mb2FkZXIuZ2l0
O2JyYW5jaD12dWxrYW4tc2RrLTEuMy4yOTY7cHJvdG9jb2w9aHR0cHMiCi1TUkNSRVYgPSAiN2Fl
YjVlNDMyNDk1N2I2ZjYwZGFjNWM4Y2VkYjk1NWRmNGZlY2JmYiIKK1NSQ19VUkkgPSAiZ2l0Oi8v
Z2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLUxvYWRlci5naXQ7YnJhbmNoPW1haW47cHJv
dG9jb2w9aHR0cHMiCitTUkNSRVYgPSAiNmE2ODc4YzYxNGM4YzZkYmU4MWVlN2E5ZjExNzZiZGI1
MmRjN2RkNyIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi40NC4xCgo=

--===============0904986845924827381==--

