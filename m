Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C25DC54EEF
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:21 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.36649.1709330718400741062
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UdsCBQle;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pN29CnF3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018dfc0cd972-a2d08187-b064-43d1-828a-69b05c2bcc21-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330718;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=d5uqsP7QMEa86LmM/gwicjezJ4KnR7Dzi+DDYyZ/b9I=;
	b=UdsCBQleBtjyjiU/6L4+ZsflVkxXyiHVLjAfPUQZlbYDHOQIl9ok4Q4UlptO5LS0
	UoFcoMXhYB17uuHx4QmJmuijYrEUH7Hczrg1a+GTO/nG/Oomsb8xpFC0zEMjML7qogg
	60PfWMO0DLhqcXEifoZ7vGbTDTqS4WLon8L/JvOY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330718;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=d5uqsP7QMEa86LmM/gwicjezJ4KnR7Dzi+DDYyZ/b9I=;
	b=pN29CnF3nFhG1vFqpsM1P64b1RT5758jLo41FsJwdWMbCGWhWCpFefALCu3sBbwA
	iRejbXKgbmL47//rHveF/phuYZXvLUZmooJ3qOqHOW5SeVtWpdyH18W1SGAY+MuTIox
	QD3iDlI5plVK6byyiJxOM09b2ip5qB2EDSnRN66g=
Content-Type: multipart/mixed; boundary="===============0663327681393512574=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-loader: upgrading to 1.3.275.0 FAILED
Message-ID: <0101018dfc0cd972-a2d08187-b064-43d1-828a-69b05c2bcc21-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196545

--===============0663327681393512574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-loader* to *1.3.275.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-loader-upgrade-1.3.268.0-1.3.275.0.patch
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
From 943d65e0f28aa14e90744f06d44ee29b893e7fa8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 17:05:39 +0000
Subject: [PATCH] vulkan-loader: upgrade 1.3.268.0 -> 1.3.275.0

---
 ...{vulkan-loader_1.3.268.0.bb => vulkan-loader_1.3.275.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.3.268.0.bb => vulkan-loader_1.3.275.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb
index 5a5749d40c..7caed67207 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.3.268;protocol=https"
-SRCREV = "f4c838e2e7358fc450f8112119bbdbb5b03e03fa"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.3.275;protocol=https"
+SRCREV = "00893b9a03e526aec2c5bf487521d16dfa435229"
 
 S = "${WORKDIR}/git"
 
-- 
2.42.0


--===============0663327681393512574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1863 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1863 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-fcd7145e8691befbc93dbfd9dc39d868eba732aa"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:fcd7145e8691befbc93dbfd9dc39d868eba732aa"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 261 Local 243 Mirrors 0 Missed 18 Current 440 (93% match, 97% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 4 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 453 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_create_spdx_setscene)
NOTE: Running setscene task 455 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 462 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 463 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 470 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb:do_create_spdx_setscene)
NOTE: Running setscene task 471 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 472 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 473 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 474 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 475 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 477 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 478 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 479 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.33-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-protocols-1.33-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 556 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 560 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_24.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 570 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 577 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 601 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 616 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 618 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 620 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 622 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 623 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 625 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 626 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_24.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 627 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_24.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1004 of 1988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb:do_recipe_qa)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 639 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1098 of 1988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.1.bb:do_fetch)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 641 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 642 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_recipe_qa: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1322 of 1988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.1.bb:do_write_config)
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.1-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb:do_recipe_qa unihash changed to 110929fe85725662473ec57c917127bc359c0fcbc5bbc10d05b175e046225047
NOTE: recipe mesa-2_24.0.1-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_24.0.1-r0: task do_write_config: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_24.0.1-r0: task do_write_config: Succeeded
NOTE: Running setscene task 647 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_create_spdx_setscene)
NOTE: Running task 1380 of 1988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb:do_fetch)
NOTE: Running task 1389 of 1988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.1.bb:do_unpack)
NOTE: recipe libxcb-1.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_fetch: Started
NOTE: recipe mesa-2_24.0.1-r0: task do_unpack: Started
NOTE: recipe libxcb-1.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 665 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_fetch: Succeeded
NOTE: Running task 1419 of 1988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb:do_unpack)
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_unpack: Started
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 673 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 679 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_unpack: Succeeded
NOTE: Running task 1427 of 1988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb:do_patch)
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 686 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 688 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_patch: Succeeded
NOTE: Running task 1434 of 1988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1435 of 1988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb:do_generate_toolchain_file)
NOTE: Running task 1436 of 1988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb:do_populate_lic)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb:do_populate_lic unihash changed to 9f1de1713eddade54203280f05d152c1da680d8378aad08376cb2e28f542b125
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb:do_deploy_source_date_epoch unihash changed to 6718dc0be1f58cb5696da29027f886cbc30343f0f673fcd472a26e49073d6d1a
NOTE: recipe mesa-2_24.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1532 of 1988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.1.bb:do_patch)
NOTE: recipe mesa-2_24.0.1-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 700 of 701 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe mesa-2_24.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1849 of 1988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1950 of 1988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1965 of 1988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_configure: Succeeded
NOTE: Running task 1966 of 1988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build --target all --
| Change Dir: '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build'
| 
| Run Build Command(s): ninja -v -j 16 all
| [1/19] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/bu
 ild/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.
 0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/allocation.c.o -MF loader/CMakeFiles/vulkan.dir/allocation.c.o.d -o loader/CMakeFiles/vulkan.dir/allocation.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/allocation.c
| FAILED: loader/CMakeFiles/vulkan.dir/allocation.c.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build/loa
 der -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/allocation.c.o -MF loader/CMakeFiles/vulkan.dir/allocation.c.o.d -o loader/CMakeFiles/vulkan.dir/allocation.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/allocation.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/allocation.h:31,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/allocation.c:27:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:179:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   179 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:679:5: error: unknown type name 'PFN_vkGetCalibratedTimestampsKHR'
|   679 |     PFN_vkGetCalibratedTimestampsKHR GetCalibratedTimestampsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:682:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2KHR'
|   682 |     PFN_vkCmdBindDescriptorSets2KHR CmdBindDescriptorSets2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:683:5: error: unknown type name 'PFN_vkCmdPushConstants2KHR'
|   683 |     PFN_vkCmdPushConstants2KHR CmdPushConstants2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:684:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2KHR'
|   684 |     PFN_vkCmdPushDescriptorSet2KHR CmdPushDescriptorSet2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:685:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'
|   685 |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR CmdPushDescriptorSetWithTemplate2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:686:5: error: unknown type name 'PFN_vkCmdSetDescriptorBufferOffsets2EXT'
|   686 |     PFN_vkCmdSetDescriptorBufferOffsets2EXT CmdSetDescriptorBufferOffsets2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:687:5: error: unknown type name 'PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT'
|   687 |     PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT CmdBindDescriptorBufferEmbeddedSamplers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:923:5: error: unknown type name 'PFN_vkCreateCudaModuleNV'
|   923 |     PFN_vkCreateCudaModuleNV CreateCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:924:5: error: unknown type name 'PFN_vkGetCudaModuleCacheNV'
|   924 |     PFN_vkGetCudaModuleCacheNV GetCudaModuleCacheNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:925:5: error: unknown type name 'PFN_vkCreateCudaFunctionNV'
|   925 |     PFN_vkCreateCudaFunctionNV CreateCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:926:5: error: unknown type name 'PFN_vkDestroyCudaModuleNV'
|   926 |     PFN_vkDestroyCudaModuleNV DestroyCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:927:5: error: unknown type name 'PFN_vkDestroyCudaFunctionNV'
|   927 |     PFN_vkDestroyCudaFunctionNV DestroyCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:928:5: error: unknown type name 'PFN_vkCmdCudaLaunchKernelNV'
|   928 |     PFN_vkCmdCudaLaunchKernelNV CmdCudaLaunchKernelNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.h:352:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   352 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [2/19] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/bu
 ild/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.
 0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/extension_manual.c
| FAILED: loader/CMakeFiles/vulkan.dir/extension_manual.c.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build/loa
 der -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/extension_manual.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/allocation.h:31,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/extension_manual.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:179:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   179 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:679:5: error: unknown type name 'PFN_vkGetCalibratedTimestampsKHR'
|   679 |     PFN_vkGetCalibratedTimestampsKHR GetCalibratedTimestampsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:682:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2KHR'
|   682 |     PFN_vkCmdBindDescriptorSets2KHR CmdBindDescriptorSets2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:683:5: error: unknown type name 'PFN_vkCmdPushConstants2KHR'
|   683 |     PFN_vkCmdPushConstants2KHR CmdPushConstants2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:684:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2KHR'
|   684 |     PFN_vkCmdPushDescriptorSet2KHR CmdPushDescriptorSet2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:685:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'
|   685 |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR CmdPushDescriptorSetWithTemplate2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:686:5: error: unknown type name 'PFN_vkCmdSetDescriptorBufferOffsets2EXT'
|   686 |     PFN_vkCmdSetDescriptorBufferOffsets2EXT CmdSetDescriptorBufferOffsets2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:687:5: error: unknown type name 'PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT'
|   687 |     PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT CmdBindDescriptorBufferEmbeddedSamplers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:923:5: error: unknown type name 'PFN_vkCreateCudaModuleNV'
|   923 |     PFN_vkCreateCudaModuleNV CreateCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:924:5: error: unknown type name 'PFN_vkGetCudaModuleCacheNV'
|   924 |     PFN_vkGetCudaModuleCacheNV GetCudaModuleCacheNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:925:5: error: unknown type name 'PFN_vkCreateCudaFunctionNV'
|   925 |     PFN_vkCreateCudaFunctionNV CreateCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:926:5: error: unknown type name 'PFN_vkDestroyCudaModuleNV'
|   926 |     PFN_vkDestroyCudaModuleNV DestroyCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:927:5: error: unknown type name 'PFN_vkDestroyCudaFunctionNV'
|   927 |     PFN_vkDestroyCudaFunctionNV DestroyCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:928:5: error: unknown type name 'PFN_vkCmdCudaLaunchKernelNV'
|   928 |     PFN_vkCmdCudaLaunchKernelNV CmdCudaLaunchKernelNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.h:352:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   352 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [3/19] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/bu
 ild/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.
 0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/log.c.o -MF loader/CMakeFiles/vulkan.dir/log.c.o.d -o loader/CMakeFiles/vulkan.dir/log.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/log.c
| FAILED: loader/CMakeFiles/vulkan.dir/log.c.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build/loa
 der -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/log.c.o -MF loader/CMakeFiles/vulkan.dir/log.c.o.d -o loader/CMakeFiles/vulkan.dir/log.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/log.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/debug_utils.h:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/log.c:34:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:179:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   179 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:679:5: error: unknown type name 'PFN_vkGetCalibratedTimestampsKHR'
|   679 |     PFN_vkGetCalibratedTimestampsKHR GetCalibratedTimestampsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:682:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2KHR'
|   682 |     PFN_vkCmdBindDescriptorSets2KHR CmdBindDescriptorSets2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:683:5: error: unknown type name 'PFN_vkCmdPushConstants2KHR'
|   683 |     PFN_vkCmdPushConstants2KHR CmdPushConstants2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:684:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2KHR'
|   684 |     PFN_vkCmdPushDescriptorSet2KHR CmdPushDescriptorSet2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:685:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'
|   685 |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR CmdPushDescriptorSetWithTemplate2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:686:5: error: unknown type name 'PFN_vkCmdSetDescriptorBufferOffsets2EXT'
|   686 |     PFN_vkCmdSetDescriptorBufferOffsets2EXT CmdSetDescriptorBufferOffsets2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:687:5: error: unknown type name 'PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT'
|   687 |     PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT CmdBindDescriptorBufferEmbeddedSamplers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:923:5: error: unknown type name 'PFN_vkCreateCudaModuleNV'
|   923 |     PFN_vkCreateCudaModuleNV CreateCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:924:5: error: unknown type name 'PFN_vkGetCudaModuleCacheNV'
|   924 |     PFN_vkGetCudaModuleCacheNV GetCudaModuleCacheNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:925:5: error: unknown type name 'PFN_vkCreateCudaFunctionNV'
|   925 |     PFN_vkCreateCudaFunctionNV CreateCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:926:5: error: unknown type name 'PFN_vkDestroyCudaModuleNV'
|   926 |     PFN_vkDestroyCudaModuleNV DestroyCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:927:5: error: unknown type name 'PFN_vkDestroyCudaFunctionNV'
|   927 |     PFN_vkDestroyCudaFunctionNV DestroyCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:928:5: error: unknown type name 'PFN_vkCmdCudaLaunchKernelNV'
|   928 |     PFN_vkCmdCudaLaunchKernelNV CmdCudaLaunchKernelNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.h:352:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   352 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [4/19] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/bu
 ild/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.
 0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/unknown_function_handling.c
| FAILED: loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build/loa
 der -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/unknown_function_handling.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/unknown_function_handling.h:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/unknown_function_handling.c:25:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:179:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   179 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:679:5: error: unknown type name 'PFN_vkGetCalibratedTimestampsKHR'
|   679 |     PFN_vkGetCalibratedTimestampsKHR GetCalibratedTimestampsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:682:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2KHR'
|   682 |     PFN_vkCmdBindDescriptorSets2KHR CmdBindDescriptorSets2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:683:5: error: unknown type name 'PFN_vkCmdPushConstants2KHR'
|   683 |     PFN_vkCmdPushConstants2KHR CmdPushConstants2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:684:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2KHR'
|   684 |     PFN_vkCmdPushDescriptorSet2KHR CmdPushDescriptorSet2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:685:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'
|   685 |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR CmdPushDescriptorSetWithTemplate2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:686:5: error: unknown type name 'PFN_vkCmdSetDescriptorBufferOffsets2EXT'
|   686 |     PFN_vkCmdSetDescriptorBufferOffsets2EXT CmdSetDescriptorBufferOffsets2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:687:5: error: unknown type name 'PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT'
|   687 |     PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT CmdBindDescriptorBufferEmbeddedSamplers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:923:5: error: unknown type name 'PFN_vkCreateCudaModuleNV'
|   923 |     PFN_vkCreateCudaModuleNV CreateCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:924:5: error: unknown type name 'PFN_vkGetCudaModuleCacheNV'
|   924 |     PFN_vkGetCudaModuleCacheNV GetCudaModuleCacheNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:925:5: error: unknown type name 'PFN_vkCreateCudaFunctionNV'
|   925 |     PFN_vkCreateCudaFunctionNV CreateCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:926:5: error: unknown type name 'PFN_vkDestroyCudaModuleNV'
|   926 |     PFN_vkDestroyCudaModuleNV DestroyCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:927:5: error: unknown type name 'PFN_vkDestroyCudaFunctionNV'
|   927 |     PFN_vkDestroyCudaFunctionNV DestroyCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:928:5: error: unknown type name 'PFN_vkCmdCudaLaunchKernelNV'
|   928 |     PFN_vkCmdCudaLaunchKernelNV CmdCudaLaunchKernelNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.h:352:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   352 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [5/19] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/bu
 ild/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.
 0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader_environment.c.o -MF loader/CMakeFiles/vulkan.dir/loader_environment.c.o.d -o loader/CMakeFiles/vulkan.dir/loader_environment.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_environment.c
| FAILED: loader/CMakeFiles/vulkan.dir/loader_environment.c.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build/loa
 der -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader_environment.c.o -MF loader/CMakeFiles/vulkan.dir/loader_environment.c.o.d -o loader/CMakeFiles/vulkan.dir/loader_environment.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_environment.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_environment.h:31,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_environment.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:179:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   179 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:679:5: error: unknown type name 'PFN_vkGetCalibratedTimestampsKHR'
|   679 |     PFN_vkGetCalibratedTimestampsKHR GetCalibratedTimestampsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:682:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2KHR'
|   682 |     PFN_vkCmdBindDescriptorSets2KHR CmdBindDescriptorSets2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:683:5: error: unknown type name 'PFN_vkCmdPushConstants2KHR'
|   683 |     PFN_vkCmdPushConstants2KHR CmdPushConstants2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:684:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2KHR'
|   684 |     PFN_vkCmdPushDescriptorSet2KHR CmdPushDescriptorSet2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:685:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'
|   685 |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR CmdPushDescriptorSetWithTemplate2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:686:5: error: unknown type name 'PFN_vkCmdSetDescriptorBufferOffsets2EXT'
|   686 |     PFN_vkCmdSetDescriptorBufferOffsets2EXT CmdSetDescriptorBufferOffsets2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:687:5: error: unknown type name 'PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT'
|   687 |     PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT CmdBindDescriptorBufferEmbeddedSamplers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:923:5: error: unknown type name 'PFN_vkCreateCudaModuleNV'
|   923 |     PFN_vkCreateCudaModuleNV CreateCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:924:5: error: unknown type name 'PFN_vkGetCudaModuleCacheNV'
|   924 |     PFN_vkGetCudaModuleCacheNV GetCudaModuleCacheNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:925:5: error: unknown type name 'PFN_vkCreateCudaFunctionNV'
|   925 |     PFN_vkCreateCudaFunctionNV CreateCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:926:5: error: unknown type name 'PFN_vkDestroyCudaModuleNV'
|   926 |     PFN_vkDestroyCudaModuleNV DestroyCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:927:5: error: unknown type name 'PFN_vkDestroyCudaFunctionNV'
|   927 |     PFN_vkDestroyCudaFunctionNV DestroyCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:928:5: error: unknown type name 'PFN_vkCmdCudaLaunchKernelNV'
|   928 |     PFN_vkCmdCudaLaunchKernelNV CmdCudaLaunchKernelNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.h:352:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   352 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [6/19] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/bu
 ild/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.
 0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader_linux.c.o -MF loader/CMakeFiles/vulkan.dir/loader_linux.c.o.d -o loader/CMakeFiles/vulkan.dir/loader_linux.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_linux.c
| FAILED: loader/CMakeFiles/vulkan.dir/loader_linux.c.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build/loa
 der -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader_linux.c.o -MF loader/CMakeFiles/vulkan.dir/loader_linux.c.o.d -o loader/CMakeFiles/vulkan.dir/loader_linux.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_linux.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_linux.h:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_linux.c:30:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:179:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   179 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:679:5: error: unknown type name 'PFN_vkGetCalibratedTimestampsKHR'
|   679 |     PFN_vkGetCalibratedTimestampsKHR GetCalibratedTimestampsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:682:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2KHR'
|   682 |     PFN_vkCmdBindDescriptorSets2KHR CmdBindDescriptorSets2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:683:5: error: unknown type name 'PFN_vkCmdPushConstants2KHR'
|   683 |     PFN_vkCmdPushConstants2KHR CmdPushConstants2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:684:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2KHR'
|   684 |     PFN_vkCmdPushDescriptorSet2KHR CmdPushDescriptorSet2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:685:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'
|   685 |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR CmdPushDescriptorSetWithTemplate2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:686:5: error: unknown type name 'PFN_vkCmdSetDescriptorBufferOffsets2EXT'
|   686 |     PFN_vkCmdSetDescriptorBufferOffsets2EXT CmdSetDescriptorBufferOffsets2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:687:5: error: unknown type name 'PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT'
|   687 |     PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT CmdBindDescriptorBufferEmbeddedSamplers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:923:5: error: unknown type name 'PFN_vkCreateCudaModuleNV'
|   923 |     PFN_vkCreateCudaModuleNV CreateCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:924:5: error: unknown type name 'PFN_vkGetCudaModuleCacheNV'
|   924 |     PFN_vkGetCudaModuleCacheNV GetCudaModuleCacheNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:925:5: error: unknown type name 'PFN_vkCreateCudaFunctionNV'
|   925 |     PFN_vkCreateCudaFunctionNV CreateCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:926:5: error: unknown type name 'PFN_vkDestroyCudaModuleNV'
|   926 |     PFN_vkDestroyCudaModuleNV DestroyCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:927:5: error: unknown type name 'PFN_vkDestroyCudaFunctionNV'
|   927 |     PFN_vkDestroyCudaFunctionNV DestroyCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:928:5: error: unknown type name 'PFN_vkCmdCudaLaunchKernelNV'
|   928 |     PFN_vkCmdCudaLaunchKernelNV CmdCudaLaunchKernelNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.h:352:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   352 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [7/19] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/bu
 ild/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.
 0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/terminator.c.o -MF loader/CMakeFiles/vulkan.dir/terminator.c.o.d -o loader/CMakeFiles/vulkan.dir/terminator.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/terminator.c
| FAILED: loader/CMakeFiles/vulkan.dir/terminator.c.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build/loa
 der -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/terminator.c.o -MF loader/CMakeFiles/vulkan.dir/terminator.c.o.d -o loader/CMakeFiles/vulkan.dir/terminator.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/terminator.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/allocation.h:31,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/terminator.c:34:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:179:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   179 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:679:5: error: unknown type name 'PFN_vkGetCalibratedTimestampsKHR'
|   679 |     PFN_vkGetCalibratedTimestampsKHR GetCalibratedTimestampsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:682:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2KHR'
|   682 |     PFN_vkCmdBindDescriptorSets2KHR CmdBindDescriptorSets2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:683:5: error: unknown type name 'PFN_vkCmdPushConstants2KHR'
|   683 |     PFN_vkCmdPushConstants2KHR CmdPushConstants2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:684:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2KHR'
|   684 |     PFN_vkCmdPushDescriptorSet2KHR CmdPushDescriptorSet2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:685:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'
|   685 |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR CmdPushDescriptorSetWithTemplate2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:686:5: error: unknown type name 'PFN_vkCmdSetDescriptorBufferOffsets2EXT'
|   686 |     PFN_vkCmdSetDescriptorBufferOffsets2EXT CmdSetDescriptorBufferOffsets2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:687:5: error: unknown type name 'PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT'
|   687 |     PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT CmdBindDescriptorBufferEmbeddedSamplers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:923:5: error: unknown type name 'PFN_vkCreateCudaModuleNV'
|   923 |     PFN_vkCreateCudaModuleNV CreateCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:924:5: error: unknown type name 'PFN_vkGetCudaModuleCacheNV'
|   924 |     PFN_vkGetCudaModuleCacheNV GetCudaModuleCacheNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:925:5: error: unknown type name 'PFN_vkCreateCudaFunctionNV'
|   925 |     PFN_vkCreateCudaFunctionNV CreateCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:926:5: error: unknown type name 'PFN_vkDestroyCudaModuleNV'
|   926 |     PFN_vkDestroyCudaModuleNV DestroyCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:927:5: error: unknown type name 'PFN_vkDestroyCudaFunctionNV'
|   927 |     PFN_vkDestroyCudaFunctionNV DestroyCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:928:5: error: unknown type name 'PFN_vkCmdCudaLaunchKernelNV'
|   928 |     PFN_vkCmdCudaLaunchKernelNV CmdCudaLaunchKernelNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.h:352:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   352 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [8/19] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/bu
 ild/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.
 0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/settings.c.o -MF loader/CMakeFiles/vulkan.dir/settings.c.o.d -o loader/CMakeFiles/vulkan.dir/settings.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/settings.c
| FAILED: loader/CMakeFiles/vulkan.dir/settings.c.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build/loa
 der -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/settings.c.o -MF loader/CMakeFiles/vulkan.dir/settings.c.o.d -o loader/CMakeFiles/vulkan.dir/settings.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/settings.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/allocation.h:31,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/settings.c:26:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:179:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   179 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:679:5: error: unknown type name 'PFN_vkGetCalibratedTimestampsKHR'
|   679 |     PFN_vkGetCalibratedTimestampsKHR GetCalibratedTimestampsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:682:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2KHR'
|   682 |     PFN_vkCmdBindDescriptorSets2KHR CmdBindDescriptorSets2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:683:5: error: unknown type name 'PFN_vkCmdPushConstants2KHR'
|   683 |     PFN_vkCmdPushConstants2KHR CmdPushConstants2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:684:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2KHR'
|   684 |     PFN_vkCmdPushDescriptorSet2KHR CmdPushDescriptorSet2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:685:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'
|   685 |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR CmdPushDescriptorSetWithTemplate2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:686:5: error: unknown type name 'PFN_vkCmdSetDescriptorBufferOffsets2EXT'
|   686 |     PFN_vkCmdSetDescriptorBufferOffsets2EXT CmdSetDescriptorBufferOffsets2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:687:5: error: unknown type name 'PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT'
|   687 |     PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT CmdBindDescriptorBufferEmbeddedSamplers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:923:5: error: unknown type name 'PFN_vkCreateCudaModuleNV'
|   923 |     PFN_vkCreateCudaModuleNV CreateCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:924:5: error: unknown type name 'PFN_vkGetCudaModuleCacheNV'
|   924 |     PFN_vkGetCudaModuleCacheNV GetCudaModuleCacheNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:925:5: error: unknown type name 'PFN_vkCreateCudaFunctionNV'
|   925 |     PFN_vkCreateCudaFunctionNV CreateCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:926:5: error: unknown type name 'PFN_vkDestroyCudaModuleNV'
|   926 |     PFN_vkDestroyCudaModuleNV DestroyCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:927:5: error: unknown type name 'PFN_vkDestroyCudaFunctionNV'
|   927 |     PFN_vkDestroyCudaFunctionNV DestroyCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:928:5: error: unknown type name 'PFN_vkCmdCudaLaunchKernelNV'
|   928 |     PFN_vkCmdCudaLaunchKernelNV CmdCudaLaunchKernelNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.h:352:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   352 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [9/19] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/bu
 ild/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.
 0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -O -MD -MT loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/dev_ext_trampoline.c
| FAILED: loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build/loa
 der -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -O -MD -MT loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/dev_ext_trampoline.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader.h:32,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/dev_ext_trampoline.c:22:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:179:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   179 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:679:5: error: unknown type name 'PFN_vkGetCalibratedTimestampsKHR'
|   679 |     PFN_vkGetCalibratedTimestampsKHR GetCalibratedTimestampsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:682:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2KHR'
|   682 |     PFN_vkCmdBindDescriptorSets2KHR CmdBindDescriptorSets2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:683:5: error: unknown type name 'PFN_vkCmdPushConstants2KHR'
|   683 |     PFN_vkCmdPushConstants2KHR CmdPushConstants2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:684:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2KHR'
|   684 |     PFN_vkCmdPushDescriptorSet2KHR CmdPushDescriptorSet2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:685:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'
|   685 |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR CmdPushDescriptorSetWithTemplate2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:686:5: error: unknown type name 'PFN_vkCmdSetDescriptorBufferOffsets2EXT'
|   686 |     PFN_vkCmdSetDescriptorBufferOffsets2EXT CmdSetDescriptorBufferOffsets2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:687:5: error: unknown type name 'PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT'
|   687 |     PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT CmdBindDescriptorBufferEmbeddedSamplers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:923:5: error: unknown type name 'PFN_vkCreateCudaModuleNV'
|   923 |     PFN_vkCreateCudaModuleNV CreateCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:924:5: error: unknown type name 'PFN_vkGetCudaModuleCacheNV'
|   924 |     PFN_vkGetCudaModuleCacheNV GetCudaModuleCacheNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:925:5: error: unknown type name 'PFN_vkCreateCudaFunctionNV'
|   925 |     PFN_vkCreateCudaFunctionNV CreateCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:926:5: error: unknown type name 'PFN_vkDestroyCudaModuleNV'
|   926 |     PFN_vkDestroyCudaModuleNV DestroyCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:927:5: error: unknown type name 'PFN_vkDestroyCudaFunctionNV'
|   927 |     PFN_vkDestroyCudaFunctionNV DestroyCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:928:5: error: unknown type name 'PFN_vkCmdCudaLaunchKernelNV'
|   928 |     PFN_vkCmdCudaLaunchKernelNV CmdCudaLaunchKernelNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.h:352:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   352 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [10/19] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/b
 uild/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275
 .0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/gpa_helper.c.o -MF loader/CMakeFiles/vulkan.dir/gpa_helper.c.o.d -o loader/CMakeFiles/vulkan.dir/gpa_helper.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/gpa_helper.c
| FAILED: loader/CMakeFiles/vulkan.dir/gpa_helper.c.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build/loa
 der -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/gpa_helper.c.o -MF loader/CMakeFiles/vulkan.dir/gpa_helper.c.o.d -o loader/CMakeFiles/vulkan.dir/gpa_helper.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/gpa_helper.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/gpa_helper.h:25,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/gpa_helper.c:23:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:179:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   179 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:679:5: error: unknown type name 'PFN_vkGetCalibratedTimestampsKHR'
|   679 |     PFN_vkGetCalibratedTimestampsKHR GetCalibratedTimestampsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:682:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2KHR'
|   682 |     PFN_vkCmdBindDescriptorSets2KHR CmdBindDescriptorSets2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:683:5: error: unknown type name 'PFN_vkCmdPushConstants2KHR'
|   683 |     PFN_vkCmdPushConstants2KHR CmdPushConstants2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:684:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2KHR'
|   684 |     PFN_vkCmdPushDescriptorSet2KHR CmdPushDescriptorSet2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:685:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'
|   685 |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR CmdPushDescriptorSetWithTemplate2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:686:5: error: unknown type name 'PFN_vkCmdSetDescriptorBufferOffsets2EXT'
|   686 |     PFN_vkCmdSetDescriptorBufferOffsets2EXT CmdSetDescriptorBufferOffsets2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:687:5: error: unknown type name 'PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT'
|   687 |     PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT CmdBindDescriptorBufferEmbeddedSamplers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:923:5: error: unknown type name 'PFN_vkCreateCudaModuleNV'
|   923 |     PFN_vkCreateCudaModuleNV CreateCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:924:5: error: unknown type name 'PFN_vkGetCudaModuleCacheNV'
|   924 |     PFN_vkGetCudaModuleCacheNV GetCudaModuleCacheNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:925:5: error: unknown type name 'PFN_vkCreateCudaFunctionNV'
|   925 |     PFN_vkCreateCudaFunctionNV CreateCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:926:5: error: unknown type name 'PFN_vkDestroyCudaModuleNV'
|   926 |     PFN_vkDestroyCudaModuleNV DestroyCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:927:5: error: unknown type name 'PFN_vkDestroyCudaFunctionNV'
|   927 |     PFN_vkDestroyCudaFunctionNV DestroyCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:928:5: error: unknown type name 'PFN_vkCmdCudaLaunchKernelNV'
|   928 |     PFN_vkCmdCudaLaunchKernelNV CmdCudaLaunchKernelNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.h:352:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   352 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [11/19] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/b
 uild/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275
 .0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -O -MD -MT loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -MF loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o.d -o loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/phys_dev_ext.c
| FAILED: loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build/loa
 der -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -O -MD -MT loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -MF loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o.d -o loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/phys_dev_ext.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader.h:32,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/phys_dev_ext.c:31:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:179:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   179 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:679:5: error: unknown type name 'PFN_vkGetCalibratedTimestampsKHR'
|   679 |     PFN_vkGetCalibratedTimestampsKHR GetCalibratedTimestampsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:682:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2KHR'
|   682 |     PFN_vkCmdBindDescriptorSets2KHR CmdBindDescriptorSets2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:683:5: error: unknown type name 'PFN_vkCmdPushConstants2KHR'
|   683 |     PFN_vkCmdPushConstants2KHR CmdPushConstants2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:684:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2KHR'
|   684 |     PFN_vkCmdPushDescriptorSet2KHR CmdPushDescriptorSet2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:685:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'
|   685 |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR CmdPushDescriptorSetWithTemplate2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:686:5: error: unknown type name 'PFN_vkCmdSetDescriptorBufferOffsets2EXT'
|   686 |     PFN_vkCmdSetDescriptorBufferOffsets2EXT CmdSetDescriptorBufferOffsets2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:687:5: error: unknown type name 'PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT'
|   687 |     PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT CmdBindDescriptorBufferEmbeddedSamplers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:923:5: error: unknown type name 'PFN_vkCreateCudaModuleNV'
|   923 |     PFN_vkCreateCudaModuleNV CreateCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:924:5: error: unknown type name 'PFN_vkGetCudaModuleCacheNV'
|   924 |     PFN_vkGetCudaModuleCacheNV GetCudaModuleCacheNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:925:5: error: unknown type name 'PFN_vkCreateCudaFunctionNV'
|   925 |     PFN_vkCreateCudaFunctionNV CreateCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:926:5: error: unknown type name 'PFN_vkDestroyCudaModuleNV'
|   926 |     PFN_vkDestroyCudaModuleNV DestroyCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:927:5: error: unknown type name 'PFN_vkDestroyCudaFunctionNV'
|   927 |     PFN_vkDestroyCudaFunctionNV DestroyCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:928:5: error: unknown type name 'PFN_vkCmdCudaLaunchKernelNV'
|   928 |     PFN_vkCmdCudaLaunchKernelNV CmdCudaLaunchKernelNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.h:352:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   352 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [12/19] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/b
 uild/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275
 .0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/wsi.c
| FAILED: loader/CMakeFiles/vulkan.dir/wsi.c.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build/loa
 der -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/wsi.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/allocation.h:31,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/wsi.c:31:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:179:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   179 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:679:5: error: unknown type name 'PFN_vkGetCalibratedTimestampsKHR'
|   679 |     PFN_vkGetCalibratedTimestampsKHR GetCalibratedTimestampsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:682:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2KHR'
|   682 |     PFN_vkCmdBindDescriptorSets2KHR CmdBindDescriptorSets2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:683:5: error: unknown type name 'PFN_vkCmdPushConstants2KHR'
|   683 |     PFN_vkCmdPushConstants2KHR CmdPushConstants2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:684:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2KHR'
|   684 |     PFN_vkCmdPushDescriptorSet2KHR CmdPushDescriptorSet2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:685:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'
|   685 |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR CmdPushDescriptorSetWithTemplate2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:686:5: error: unknown type name 'PFN_vkCmdSetDescriptorBufferOffsets2EXT'
|   686 |     PFN_vkCmdSetDescriptorBufferOffsets2EXT CmdSetDescriptorBufferOffsets2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:687:5: error: unknown type name 'PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT'
|   687 |     PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT CmdBindDescriptorBufferEmbeddedSamplers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:923:5: error: unknown type name 'PFN_vkCreateCudaModuleNV'
|   923 |     PFN_vkCreateCudaModuleNV CreateCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:924:5: error: unknown type name 'PFN_vkGetCudaModuleCacheNV'
|   924 |     PFN_vkGetCudaModuleCacheNV GetCudaModuleCacheNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:925:5: error: unknown type name 'PFN_vkCreateCudaFunctionNV'
|   925 |     PFN_vkCreateCudaFunctionNV CreateCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:926:5: error: unknown type name 'PFN_vkDestroyCudaModuleNV'
|   926 |     PFN_vkDestroyCudaModuleNV DestroyCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:927:5: error: unknown type name 'PFN_vkDestroyCudaFunctionNV'
|   927 |     PFN_vkDestroyCudaFunctionNV DestroyCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:928:5: error: unknown type name 'PFN_vkCmdCudaLaunchKernelNV'
|   928 |     PFN_vkCmdCudaLaunchKernelNV CmdCudaLaunchKernelNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.h:352:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   352 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [13/19] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/b
 uild/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275
 .0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/trampoline.c
| FAILED: loader/CMakeFiles/vulkan.dir/trampoline.c.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build/loa
 der -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/trampoline.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/allocation.h:31,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/trampoline.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:179:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   179 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:679:5: error: unknown type name 'PFN_vkGetCalibratedTimestampsKHR'
|   679 |     PFN_vkGetCalibratedTimestampsKHR GetCalibratedTimestampsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:682:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2KHR'
|   682 |     PFN_vkCmdBindDescriptorSets2KHR CmdBindDescriptorSets2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:683:5: error: unknown type name 'PFN_vkCmdPushConstants2KHR'
|   683 |     PFN_vkCmdPushConstants2KHR CmdPushConstants2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:684:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2KHR'
|   684 |     PFN_vkCmdPushDescriptorSet2KHR CmdPushDescriptorSet2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:685:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'
|   685 |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR CmdPushDescriptorSetWithTemplate2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:686:5: error: unknown type name 'PFN_vkCmdSetDescriptorBufferOffsets2EXT'
|   686 |     PFN_vkCmdSetDescriptorBufferOffsets2EXT CmdSetDescriptorBufferOffsets2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:687:5: error: unknown type name 'PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT'
|   687 |     PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT CmdBindDescriptorBufferEmbeddedSamplers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:923:5: error: unknown type name 'PFN_vkCreateCudaModuleNV'
|   923 |     PFN_vkCreateCudaModuleNV CreateCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:924:5: error: unknown type name 'PFN_vkGetCudaModuleCacheNV'
|   924 |     PFN_vkGetCudaModuleCacheNV GetCudaModuleCacheNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:925:5: error: unknown type name 'PFN_vkCreateCudaFunctionNV'
|   925 |     PFN_vkCreateCudaFunctionNV CreateCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:926:5: error: unknown type name 'PFN_vkDestroyCudaModuleNV'
|   926 |     PFN_vkDestroyCudaModuleNV DestroyCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:927:5: error: unknown type name 'PFN_vkDestroyCudaFunctionNV'
|   927 |     PFN_vkDestroyCudaFunctionNV DestroyCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:928:5: error: unknown type name 'PFN_vkCmdCudaLaunchKernelNV'
|   928 |     PFN_vkCmdCudaLaunchKernelNV CmdCudaLaunchKernelNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.h:352:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   352 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [14/19] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/b
 uild/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275
 .0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/cJSON.c.o -MF loader/CMakeFiles/vulkan.dir/cJSON.c.o.d -o loader/CMakeFiles/vulkan.dir/cJSON.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/cJSON.c
| FAILED: loader/CMakeFiles/vulkan.dir/cJSON.c.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build/loa
 der -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/cJSON.c.o -MF loader/CMakeFiles/vulkan.dir/cJSON.c.o.d -o loader/CMakeFiles/vulkan.dir/cJSON.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/cJSON.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/allocation.h:31,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/cJSON.c:39:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:179:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   179 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:679:5: error: unknown type name 'PFN_vkGetCalibratedTimestampsKHR'
|   679 |     PFN_vkGetCalibratedTimestampsKHR GetCalibratedTimestampsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:682:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2KHR'
|   682 |     PFN_vkCmdBindDescriptorSets2KHR CmdBindDescriptorSets2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:683:5: error: unknown type name 'PFN_vkCmdPushConstants2KHR'
|   683 |     PFN_vkCmdPushConstants2KHR CmdPushConstants2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:684:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2KHR'
|   684 |     PFN_vkCmdPushDescriptorSet2KHR CmdPushDescriptorSet2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:685:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'
|   685 |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR CmdPushDescriptorSetWithTemplate2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:686:5: error: unknown type name 'PFN_vkCmdSetDescriptorBufferOffsets2EXT'
|   686 |     PFN_vkCmdSetDescriptorBufferOffsets2EXT CmdSetDescriptorBufferOffsets2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:687:5: error: unknown type name 'PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT'
|   687 |     PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT CmdBindDescriptorBufferEmbeddedSamplers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:923:5: error: unknown type name 'PFN_vkCreateCudaModuleNV'
|   923 |     PFN_vkCreateCudaModuleNV CreateCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:924:5: error: unknown type name 'PFN_vkGetCudaModuleCacheNV'
|   924 |     PFN_vkGetCudaModuleCacheNV GetCudaModuleCacheNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:925:5: error: unknown type name 'PFN_vkCreateCudaFunctionNV'
|   925 |     PFN_vkCreateCudaFunctionNV CreateCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:926:5: error: unknown type name 'PFN_vkDestroyCudaModuleNV'
|   926 |     PFN_vkDestroyCudaModuleNV DestroyCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:927:5: error: unknown type name 'PFN_vkDestroyCudaFunctionNV'
|   927 |     PFN_vkDestroyCudaFunctionNV DestroyCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:928:5: error: unknown type name 'PFN_vkCmdCudaLaunchKernelNV'
|   928 |     PFN_vkCmdCudaLaunchKernelNV CmdCudaLaunchKernelNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.h:352:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   352 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [15/19] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/b
 uild/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275
 .0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/debug_utils.c
| FAILED: loader/CMakeFiles/vulkan.dir/debug_utils.c.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build/loa
 der -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/debug_utils.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/debug_utils.c:35:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_object_types.h:199:5: error: 'VK_DEBUG_REPORT_OBJECT_TYPE_CUDA_MODULE_NV_EXT' undeclared here (not in a function); did you mean 'VK_DEBUG_REPORT_OBJECT_TYPE_CU_MODULE_NVX_EXT'?
|   199 |     VK_DEBUG_REPORT_OBJECT_TYPE_CUDA_MODULE_NV_EXT,   // kVulkanObjectTypeCudaModuleNV
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VK_DEBUG_REPORT_OBJECT_TYPE_CU_MODULE_NVX_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_object_types.h:200:5: error: 'VK_DEBUG_REPORT_OBJECT_TYPE_CUDA_FUNCTION_NV_EXT' undeclared here (not in a function); did you mean 'VK_DEBUG_REPORT_OBJECT_TYPE_CU_FUNCTION_NVX_EXT'?
|   200 |     VK_DEBUG_REPORT_OBJECT_TYPE_CUDA_FUNCTION_NV_EXT,   // kVulkanObjectTypeCudaFunctionNV
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VK_DEBUG_REPORT_OBJECT_TYPE_CU_FUNCTION_NVX_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_object_types.h:254:5: error: 'VK_OBJECT_TYPE_CUDA_MODULE_NV' undeclared here (not in a function); did you mean 'VK_OBJECT_TYPE_CU_MODULE_NVX'?
|   254 |     VK_OBJECT_TYPE_CUDA_MODULE_NV,   // kVulkanObjectTypeCudaModuleNV
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VK_OBJECT_TYPE_CU_MODULE_NVX
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_object_types.h:255:5: error: 'VK_OBJECT_TYPE_CUDA_FUNCTION_NV' undeclared here (not in a function); did you mean 'VK_OBJECT_TYPE_CU_FUNCTION_NVX'?
|   255 |     VK_OBJECT_TYPE_CUDA_FUNCTION_NV,   // kVulkanObjectTypeCudaFunctionNV
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VK_OBJECT_TYPE_CU_FUNCTION_NVX
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/allocation.h:31,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/debug_utils.c:37:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:179:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   179 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:679:5: error: unknown type name 'PFN_vkGetCalibratedTimestampsKHR'
|   679 |     PFN_vkGetCalibratedTimestampsKHR GetCalibratedTimestampsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:682:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2KHR'
|   682 |     PFN_vkCmdBindDescriptorSets2KHR CmdBindDescriptorSets2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:683:5: error: unknown type name 'PFN_vkCmdPushConstants2KHR'
|   683 |     PFN_vkCmdPushConstants2KHR CmdPushConstants2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:684:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2KHR'
|   684 |     PFN_vkCmdPushDescriptorSet2KHR CmdPushDescriptorSet2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:685:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'
|   685 |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR CmdPushDescriptorSetWithTemplate2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:686:5: error: unknown type name 'PFN_vkCmdSetDescriptorBufferOffsets2EXT'
|   686 |     PFN_vkCmdSetDescriptorBufferOffsets2EXT CmdSetDescriptorBufferOffsets2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:687:5: error: unknown type name 'PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT'
|   687 |     PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT CmdBindDescriptorBufferEmbeddedSamplers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:923:5: error: unknown type name 'PFN_vkCreateCudaModuleNV'
|   923 |     PFN_vkCreateCudaModuleNV CreateCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:924:5: error: unknown type name 'PFN_vkGetCudaModuleCacheNV'
|   924 |     PFN_vkGetCudaModuleCacheNV GetCudaModuleCacheNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:925:5: error: unknown type name 'PFN_vkCreateCudaFunctionNV'
|   925 |     PFN_vkCreateCudaFunctionNV CreateCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:926:5: error: unknown type name 'PFN_vkDestroyCudaModuleNV'
|   926 |     PFN_vkDestroyCudaModuleNV DestroyCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:927:5: error: unknown type name 'PFN_vkDestroyCudaFunctionNV'
|   927 |     PFN_vkDestroyCudaFunctionNV DestroyCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:928:5: error: unknown type name 'PFN_vkCmdCudaLaunchKernelNV'
|   928 |     PFN_vkCmdCudaLaunchKernelNV CmdCudaLaunchKernelNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.h:352:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   352 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [16/19] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/b
 uild/loader -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275
 .0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader.c
| FAILED: loader/CMakeFiles/vulkan.dir/loader.c.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build/loa
 der -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git=/usr/src/debug/vulkan-loader/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build=/usr/src/debug/vulkan-loader/1.3.275.0  -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/recipe-sysroot-native=  -std=c99 -fPIC -fvisibility=hidden -Wall -Wextra -Wno-missing-field-initializers -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader.h:32,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader.c:31:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:179:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   179 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:679:5: error: unknown type name 'PFN_vkGetCalibratedTimestampsKHR'
|   679 |     PFN_vkGetCalibratedTimestampsKHR GetCalibratedTimestampsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:682:5: error: unknown type name 'PFN_vkCmdBindDescriptorSets2KHR'
|   682 |     PFN_vkCmdBindDescriptorSets2KHR CmdBindDescriptorSets2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:683:5: error: unknown type name 'PFN_vkCmdPushConstants2KHR'
|   683 |     PFN_vkCmdPushConstants2KHR CmdPushConstants2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:684:5: error: unknown type name 'PFN_vkCmdPushDescriptorSet2KHR'
|   684 |     PFN_vkCmdPushDescriptorSet2KHR CmdPushDescriptorSet2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:685:5: error: unknown type name 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR'
|   685 |     PFN_vkCmdPushDescriptorSetWithTemplate2KHR CmdPushDescriptorSetWithTemplate2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:686:5: error: unknown type name 'PFN_vkCmdSetDescriptorBufferOffsets2EXT'
|   686 |     PFN_vkCmdSetDescriptorBufferOffsets2EXT CmdSetDescriptorBufferOffsets2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:687:5: error: unknown type name 'PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT'
|   687 |     PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT CmdBindDescriptorBufferEmbeddedSamplers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:923:5: error: unknown type name 'PFN_vkCreateCudaModuleNV'
|   923 |     PFN_vkCreateCudaModuleNV CreateCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:924:5: error: unknown type name 'PFN_vkGetCudaModuleCacheNV'
|   924 |     PFN_vkGetCudaModuleCacheNV GetCudaModuleCacheNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:925:5: error: unknown type name 'PFN_vkCreateCudaFunctionNV'
|   925 |     PFN_vkCreateCudaFunctionNV CreateCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:926:5: error: unknown type name 'PFN_vkDestroyCudaModuleNV'
|   926 |     PFN_vkDestroyCudaModuleNV DestroyCudaModuleNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:927:5: error: unknown type name 'PFN_vkDestroyCudaFunctionNV'
|   927 |     PFN_vkDestroyCudaFunctionNV DestroyCudaFunctionNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_layer_dispatch_table.h:928:5: error: unknown type name 'PFN_vkCmdCudaLaunchKernelNV'
|   928 |     PFN_vkCmdCudaLaunchKernelNV CmdCudaLaunchKernelNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.h:352:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR'
|   352 |     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/loader.c:75:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: In function 'loader_icd_init_entries':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:55:54: error: 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR' undeclared (first use in this function); did you mean 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsEXT'?
|    55 | #define LOOKUP_GIPA(func) icd_term->dispatch.func = (PFN_vk##func)fp_gipa(icd_term->instance, "vk" #func);
|       |                                                      ^~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:203:5: note: in expansion of macro 'LOOKUP_GIPA'
|   203 |     LOOKUP_GIPA(GetPhysicalDeviceCalibrateableTimeDomainsKHR);
|       |     ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:55:54: note: each undeclared identifier is reported only once for each function it appears in
|    55 | #define LOOKUP_GIPA(func) icd_term->dispatch.func = (PFN_vk##func)fp_gipa(icd_term->instance, "vk" #func);
|       |                                                      ^~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:203:5: note: in expansion of macro 'LOOKUP_GIPA'
|   203 |     LOOKUP_GIPA(GetPhysicalDeviceCalibrateableTimeDomainsKHR);
|       |     ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:55:67: error: expected ';' before 'fp_gipa'
|    55 | #define LOOKUP_GIPA(func) icd_term->dispatch.func = (PFN_vk##func)fp_gipa(icd_term->instance, "vk" #func);
|       |                                                                   ^~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:203:5: note: in expansion of macro 'LOOKUP_GIPA'
|   203 |     LOOKUP_GIPA(GetPhysicalDeviceCalibrateableTimeDomainsKHR);
|       |     ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: In function 'loader_init_device_extension_dispatch_table':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:720:42: error: 'PFN_vkGetCalibratedTimestampsKHR' undeclared (first use in this function); did you mean 'PFN_vkGetCalibratedTimestampsEXT'?
|   720 |     table->GetCalibratedTimestampsKHR = (PFN_vkGetCalibratedTimestampsKHR)gdpa(dev, "vkGetCalibratedTimestampsKHR");
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                          PFN_vkGetCalibratedTimestampsEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:720:75: error: expected ';' before 'gdpa'
|   720 |     table->GetCalibratedTimestampsKHR = (PFN_vkGetCalibratedTimestampsKHR)gdpa(dev, "vkGetCalibratedTimestampsKHR");
|       |                                                                           ^~~~
|       |                                                                           ;
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:723:41: error: 'PFN_vkCmdBindDescriptorSets2KHR' undeclared (first use in this function); did you mean 'PFN_vkCmdBindDescriptorSets'?
|   723 |     table->CmdBindDescriptorSets2KHR = (PFN_vkCmdBindDescriptorSets2KHR)gdpa(dev, "vkCmdBindDescriptorSets2KHR");
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                         PFN_vkCmdBindDescriptorSets
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:723:73: error: expected ';' before 'gdpa'
|   723 |     table->CmdBindDescriptorSets2KHR = (PFN_vkCmdBindDescriptorSets2KHR)gdpa(dev, "vkCmdBindDescriptorSets2KHR");
|       |                                                                         ^~~~
|       |                                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:724:36: error: 'PFN_vkCmdPushConstants2KHR' undeclared (first use in this function); did you mean 'PFN_vkCmdPushConstants'?
|   724 |     table->CmdPushConstants2KHR = (PFN_vkCmdPushConstants2KHR)gdpa(dev, "vkCmdPushConstants2KHR");
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    PFN_vkCmdPushConstants
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:724:63: error: expected ';' before 'gdpa'
|   724 |     table->CmdPushConstants2KHR = (PFN_vkCmdPushConstants2KHR)gdpa(dev, "vkCmdPushConstants2KHR");
|       |                                                               ^~~~
|       |                                                               ;
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:725:40: error: 'PFN_vkCmdPushDescriptorSet2KHR' undeclared (first use in this function); did you mean 'PFN_vkCmdPushDescriptorSetKHR'?
|   725 |     table->CmdPushDescriptorSet2KHR = (PFN_vkCmdPushDescriptorSet2KHR)gdpa(dev, "vkCmdPushDescriptorSet2KHR");
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                        PFN_vkCmdPushDescriptorSetKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:725:71: error: expected ';' before 'gdpa'
|   725 |     table->CmdPushDescriptorSet2KHR = (PFN_vkCmdPushDescriptorSet2KHR)gdpa(dev, "vkCmdPushDescriptorSet2KHR");
|       |                                                                       ^~~~
|       |                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:726:52: error: 'PFN_vkCmdPushDescriptorSetWithTemplate2KHR' undeclared (first use in this function); did you mean 'PFN_vkCmdPushDescriptorSetWithTemplateKHR'?
|   726 |     table->CmdPushDescriptorSetWithTemplate2KHR = (PFN_vkCmdPushDescriptorSetWithTemplate2KHR)gdpa(dev, "vkCmdPushDescriptorSetWithTemplate2KHR");
|       |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                    PFN_vkCmdPushDescriptorSetWithTemplateKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:726:95: error: expected ';' before 'gdpa'
|   726 |     table->CmdPushDescriptorSetWithTemplate2KHR = (PFN_vkCmdPushDescriptorSetWithTemplate2KHR)gdpa(dev, "vkCmdPushDescriptorSetWithTemplate2KHR");
|       |                                                                                               ^~~~
|       |                                                                                               ;
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:727:49: error: 'PFN_vkCmdSetDescriptorBufferOffsets2EXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetDescriptorBufferOffsetsEXT'?
|   727 |     table->CmdSetDescriptorBufferOffsets2EXT = (PFN_vkCmdSetDescriptorBufferOffsets2EXT)gdpa(dev, "vkCmdSetDescriptorBufferOffsets2EXT");
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 PFN_vkCmdSetDescriptorBufferOffsetsEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:727:89: error: expected ';' before 'gdpa'
|   727 |     table->CmdSetDescriptorBufferOffsets2EXT = (PFN_vkCmdSetDescriptorBufferOffsets2EXT)gdpa(dev, "vkCmdSetDescriptorBufferOffsets2EXT");
|       |                                                                                         ^~~~
|       |                                                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:728:59: error: 'PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT' undeclared (first use in this function); did you mean 'PFN_vkCmdBindDescriptorBufferEmbeddedSamplersEXT'?
|   728 |     table->CmdBindDescriptorBufferEmbeddedSamplers2EXT = (PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT)gdpa(dev, "vkCmdBindDescriptorBufferEmbeddedSamplers2EXT");
|       |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                           PFN_vkCmdBindDescriptorBufferEmbeddedSamplersEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:728:109: error: expected ';' before 'gdpa'
|   728 |     table->CmdBindDescriptorBufferEmbeddedSamplers2EXT = (PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT)gdpa(dev, "vkCmdBindDescriptorBufferEmbeddedSamplers2EXT");
|       |                                                                                                             ^~~~
|       |                                                                                                             ;
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:964:34: error: 'PFN_vkCreateCudaModuleNV' undeclared (first use in this function); did you mean 'PFN_vkCreateCuModuleNVX'?
|   964 |     table->CreateCudaModuleNV = (PFN_vkCreateCudaModuleNV)gdpa(dev, "vkCreateCudaModuleNV");
|       |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                                  PFN_vkCreateCuModuleNVX
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:964:59: error: expected ';' before 'gdpa'
|   964 |     table->CreateCudaModuleNV = (PFN_vkCreateCudaModuleNV)gdpa(dev, "vkCreateCudaModuleNV");
|       |                                                           ^~~~
|       |                                                           ;
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:965:36: error: 'PFN_vkGetCudaModuleCacheNV' undeclared (first use in this function)
|   965 |     table->GetCudaModuleCacheNV = (PFN_vkGetCudaModuleCacheNV)gdpa(dev, "vkGetCudaModuleCacheNV");
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:965:63: error: expected ';' before 'gdpa'
|   965 |     table->GetCudaModuleCacheNV = (PFN_vkGetCudaModuleCacheNV)gdpa(dev, "vkGetCudaModuleCacheNV");
|       |                                                               ^~~~
|       |                                                               ;
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:966:36: error: 'PFN_vkCreateCudaFunctionNV' undeclared (first use in this function); did you mean 'PFN_vkCreateCuFunctionNVX'?
|   966 |     table->CreateCudaFunctionNV = (PFN_vkCreateCudaFunctionNV)gdpa(dev, "vkCreateCudaFunctionNV");
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    PFN_vkCreateCuFunctionNVX
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:966:63: error: expected ';' before 'gdpa'
|   966 |     table->CreateCudaFunctionNV = (PFN_vkCreateCudaFunctionNV)gdpa(dev, "vkCreateCudaFunctionNV");
|       |                                                               ^~~~
|       |                                                               ;
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:967:35: error: 'PFN_vkDestroyCudaModuleNV' undeclared (first use in this function); did you mean 'PFN_vkDestroyCuModuleNVX'?
|   967 |     table->DestroyCudaModuleNV = (PFN_vkDestroyCudaModuleNV)gdpa(dev, "vkDestroyCudaModuleNV");
|       |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                   PFN_vkDestroyCuModuleNVX
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:967:61: error: expected ';' before 'gdpa'
|   967 |     table->DestroyCudaModuleNV = (PFN_vkDestroyCudaModuleNV)gdpa(dev, "vkDestroyCudaModuleNV");
|       |                                                             ^~~~
|       |                                                             ;
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:968:37: error: 'PFN_vkDestroyCudaFunctionNV' undeclared (first use in this function); did you mean 'PFN_vkDestroyCuFunctionNVX'?
|   968 |     table->DestroyCudaFunctionNV = (PFN_vkDestroyCudaFunctionNV)gdpa(dev, "vkDestroyCudaFunctionNV");
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     PFN_vkDestroyCuFunctionNVX
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:968:65: error: expected ';' before 'gdpa'
|   968 |     table->DestroyCudaFunctionNV = (PFN_vkDestroyCudaFunctionNV)gdpa(dev, "vkDestroyCudaFunctionNV");
|       |                                                                 ^~~~
|       |                                                                 ;
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:969:37: error: 'PFN_vkCmdCudaLaunchKernelNV' undeclared (first use in this function); did you mean 'PFN_vkCmdCuLaunchKernelNVX'?
|   969 |     table->CmdCudaLaunchKernelNV = (PFN_vkCmdCudaLaunchKernelNV)gdpa(dev, "vkCmdCudaLaunchKernelNV");
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     PFN_vkCmdCuLaunchKernelNVX
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:969:65: error: expected ';' before 'gdpa'
|   969 |     table->CmdCudaLaunchKernelNV = (PFN_vkCmdCudaLaunchKernelNV)gdpa(dev, "vkCmdCudaLaunchKernelNV");
|       |                                                                 ^~~~
|       |                                                                 ;
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: In function 'loader_init_instance_extension_dispatch_table':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:1342:60: error: 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR' undeclared (first use in this function); did you mean 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsEXT'?
|  1342 |     table->GetPhysicalDeviceCalibrateableTimeDomainsKHR = (PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR)gpa(inst, "vkGetPhysicalDeviceCalibrateableTimeDomainsKHR");
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:1342:111: error: expected ';' before 'gpa'
|  1342 |     table->GetPhysicalDeviceCalibrateableTimeDomainsKHR = (PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR)gpa(inst, "vkGetPhysicalDeviceCalibrateableTimeDomainsKHR");
|       |                                                                                                               ^~~
|       |                                                                                                               ;
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: In function 'loader_lookup_device_dispatch_table':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:2468:61: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2468 |     if (!strcmp(name, "GetCalibratedTimestampsKHR")) return (void *)table->GetCalibratedTimestampsKHR;
|       |                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:2471:60: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2471 |     if (!strcmp(name, "CmdBindDescriptorSets2KHR")) return (void *)table->CmdBindDescriptorSets2KHR;
|       |                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:2472:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2472 |     if (!strcmp(name, "CmdPushConstants2KHR")) return (void *)table->CmdPushConstants2KHR;
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:2473:59: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2473 |     if (!strcmp(name, "CmdPushDescriptorSet2KHR")) return (void *)table->CmdPushDescriptorSet2KHR;
|       |                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:2474:71: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2474 |     if (!strcmp(name, "CmdPushDescriptorSetWithTemplate2KHR")) return (void *)table->CmdPushDescriptorSetWithTemplate2KHR;
|       |                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:2475:68: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2475 |     if (!strcmp(name, "CmdSetDescriptorBufferOffsets2EXT")) return (void *)table->CmdSetDescriptorBufferOffsets2EXT;
|       |                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:2476:78: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2476 |     if (!strcmp(name, "CmdBindDescriptorBufferEmbeddedSamplers2EXT")) return (void *)table->CmdBindDescriptorBufferEmbeddedSamplers2EXT;
|       |                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:2712:53: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2712 |     if (!strcmp(name, "CreateCudaModuleNV")) return (void *)table->CreateCudaModuleNV;
|       |                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:2713:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2713 |     if (!strcmp(name, "GetCudaModuleCacheNV")) return (void *)table->GetCudaModuleCacheNV;
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:2714:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2714 |     if (!strcmp(name, "CreateCudaFunctionNV")) return (void *)table->CreateCudaFunctionNV;
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:2715:54: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2715 |     if (!strcmp(name, "DestroyCudaModuleNV")) return (void *)table->DestroyCudaModuleNV;
|       |                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:2716:56: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2716 |     if (!strcmp(name, "DestroyCudaFunctionNV")) return (void *)table->DestroyCudaFunctionNV;
|       |                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:2717:56: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2717 |     if (!strcmp(name, "CmdCudaLaunchKernelNV")) return (void *)table->CmdCudaLaunchKernelNV;
|       |                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: In function 'loader_lookup_instance_dispatch_table':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:3095:79: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  3095 |     if (!strcmp(name, "GetPhysicalDeviceCalibrateableTimeDomainsKHR")) return (void *)table->GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:4864:5: error: unknown type name 'VkTimeDomainKHR'; did you mean 'VkTimeDomainEXT'?
|  4864 |     VkTimeDomainKHR*                            pTimeDomains) {
|       |     ^~~~~~~~~~~~~~~
|       |     VkTimeDomainEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:4880:5: error: unknown type name 'VkTimeDomainKHR'; did you mean 'VkTimeDomainEXT'?
|  4880 |     VkTimeDomainKHR*                            pTimeDomains) {
|       |     ^~~~~~~~~~~~~~~
|       |     VkTimeDomainEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:4894:11: error: unknown type name 'VkCalibratedTimestampInfoKHR'
|  4894 |     const VkCalibratedTimestampInfoKHR*         pTimestampInfos,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: In function 'GetCalibratedTimestampsKHR':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:4904:12: error: called object is not a function or function pointer
|  4904 |     return disp->GetCalibratedTimestampsKHR(device, timestampCount, pTimestampInfos, pTimestamps, pMaxDeviation);
|       |            ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:4912:11: error: unknown type name 'VkBindDescriptorSetsInfoKHR'
|  4912 |     const VkBindDescriptorSetsInfoKHR*          pBindDescriptorSetsInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: In function 'CmdBindDescriptorSets2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:4920:5: error: called object is not a function or function pointer
|  4920 |     disp->CmdBindDescriptorSets2KHR(commandBuffer, pBindDescriptorSetsInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:4925:11: error: unknown type name 'VkPushConstantsInfoKHR'
|  4925 |     const VkPushConstantsInfoKHR*               pPushConstantsInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: In function 'CmdPushConstants2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:4933:5: error: called object is not a function or function pointer
|  4933 |     disp->CmdPushConstants2KHR(commandBuffer, pPushConstantsInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:4938:11: error: unknown type name 'VkPushDescriptorSetInfoKHR'
|  4938 |     const VkPushDescriptorSetInfoKHR*           pPushDescriptorSetInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: In function 'CmdPushDescriptorSet2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:4946:5: error: called object is not a function or function pointer
|  4946 |     disp->CmdPushDescriptorSet2KHR(commandBuffer, pPushDescriptorSetInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:4951:11: error: unknown type name 'VkPushDescriptorSetWithTemplateInfoKHR'
|  4951 |     const VkPushDescriptorSetWithTemplateInfoKHR* pPushDescriptorSetWithTemplateInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: In function 'CmdPushDescriptorSetWithTemplate2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:4959:5: error: called object is not a function or function pointer
|  4959 |     disp->CmdPushDescriptorSetWithTemplate2KHR(commandBuffer, pPushDescriptorSetWithTemplateInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:4964:11: error: unknown type name 'VkSetDescriptorBufferOffsetsInfoEXT'
|  4964 |     const VkSetDescriptorBufferOffsetsInfoEXT*  pSetDescriptorBufferOffsetsInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDescriptorBufferOffsets2EXT':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:4972:5: error: called object is not a function or function pointer
|  4972 |     disp->CmdSetDescriptorBufferOffsets2EXT(commandBuffer, pSetDescriptorBufferOffsetsInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:4977:11: error: unknown type name 'VkBindDescriptorBufferEmbeddedSamplersInfoEXT'
|  4977 |     const VkBindDescriptorBufferEmbeddedSamplersInfoEXT* pBindDescriptorBufferEmbeddedSamplersInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: In function 'CmdBindDescriptorBufferEmbeddedSamplers2EXT':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:4985:5: error: called object is not a function or function pointer
|  4985 |     disp->CmdBindDescriptorBufferEmbeddedSamplers2EXT(commandBuffer, pBindDescriptorBufferEmbeddedSamplersInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:6513:5: error: unknown type name 'VkTimeDomainKHR'; did you mean 'VkTimeDomainEXT'?
|  6513 |     VkTimeDomainKHR*                            pTimeDomains) {
|       |     ^~~~~~~~~~~~~~~
|       |     VkTimeDomainEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:6529:5: error: unknown type name 'VkTimeDomainKHR'; did you mean 'VkTimeDomainEXT'?
|  6529 |     VkTimeDomainKHR*                            pTimeDomains) {
|       |     ^~~~~~~~~~~~~~~
|       |     VkTimeDomainEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:6543:11: error: unknown type name 'VkCalibratedTimestampInfoKHR'
|  6543 |     const VkCalibratedTimestampInfoKHR*         pTimestampInfos,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: In function 'GetCalibratedTimestampsEXT':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:6553:69: warning: passing argument 3 of 'disp->GetCalibratedTimestampsEXT' from incompatible pointer type [-Wincompatible-pointer-types]
|  6553 |     return disp->GetCalibratedTimestampsEXT(device, timestampCount, pTimestampInfos, pTimestamps, pMaxDeviation);
|       |                                                                     ^~~~~~~~~~~~~~~
|       |                                                                     |
|       |                                                                     const int *
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:6553:69: note: expected 'const VkCalibratedTimestampInfoEXT *' but argument is of type 'const int *'
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:7453:11: error: unknown type name 'VkCudaModuleCreateInfoNV'
|  7453 |     const VkCudaModuleCreateInfoNV*             pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:7455:5: error: unknown type name 'VkCudaModuleNV'; did you mean 'VkCuModuleNVX'?
|  7455 |     VkCudaModuleNV*                             pModule) {
|       |     ^~~~~~~~~~~~~~
|       |     VkCuModuleNVX
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:7468:5: error: unknown type name 'VkCudaModuleNV'; did you mean 'VkCuModuleNVX'?
|  7468 |     VkCudaModuleNV                              module,
|       |     ^~~~~~~~~~~~~~
|       |     VkCuModuleNVX
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:7483:11: error: unknown type name 'VkCudaFunctionCreateInfoNV'
|  7483 |     const VkCudaFunctionCreateInfoNV*           pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:7485:5: error: unknown type name 'VkCudaFunctionNV'; did you mean 'VkCuFunctionNVX'?
|  7485 |     VkCudaFunctionNV*                           pFunction) {
|       |     ^~~~~~~~~~~~~~~~
|       |     VkCuFunctionNVX
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:7498:5: error: unknown type name 'VkCudaModuleNV'; did you mean 'VkCuModuleNVX'?
|  7498 |     VkCudaModuleNV                              module,
|       |     ^~~~~~~~~~~~~~
|       |     VkCuModuleNVX
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:7512:5: error: unknown type name 'VkCudaFunctionNV'; did you mean 'VkCuFunctionNVX'?
|  7512 |     VkCudaFunctionNV                            function,
|       |     ^~~~~~~~~~~~~~~~
|       |     VkCuFunctionNVX
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:7526:11: error: unknown type name 'VkCudaLaunchInfoNV'
|  7526 |     const VkCudaLaunchInfoNV*                   pLaunchInfo) {
|       |           ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: In function 'CmdCudaLaunchKernelNV':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:7534:5: error: called object is not a function or function pointer
|  7534 |     disp->CmdCudaLaunchKernelNV(commandBuffer, pLaunchInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: In function 'GetLatencyTimingsNV':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:9286:50: warning: passing argument 3 of 'disp->GetLatencyTimingsNV' from incompatible pointer type [-Wincompatible-pointer-types]
|  9286 |     disp->GetLatencyTimingsNV(device, swapchain, pLatencyMarkerInfo);
|       |                                                  ^~~~~~~~~~~~~~~~~~
|       |                                                  |
|       |                                                  VkGetLatencyMarkerInfoNV *
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:9286:50: note: expected 'uint32_t *' {aka 'unsigned int *'} but argument is of type 'VkGetLatencyMarkerInfoNV *'
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:9286:5: error: too few arguments to function 'disp->GetLatencyTimingsNV'
|  9286 |     disp->GetLatencyTimingsNV(device, swapchain, pLatencyMarkerInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: In function 'extension_instance_gpa':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:10295:25: error: 'GetPhysicalDeviceCalibrateableTimeDomainsKHR' undeclared (first use in this function); did you mean 'vkGetPhysicalDeviceCalibrateableTimeDomainsEXT'?
| 10295 |         *addr = (void *)GetPhysicalDeviceCalibrateableTimeDomainsKHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         vkGetPhysicalDeviceCalibrateableTimeDomainsEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:10763:25: error: 'GetPhysicalDeviceCalibrateableTimeDomainsEXT' undeclared (first use in this function); did you mean 'vkGetPhysicalDeviceCalibrateableTimeDomainsEXT'?
| 10763 |         *addr = (void *)GetPhysicalDeviceCalibrateableTimeDomainsEXT;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         vkGetPhysicalDeviceCalibrateableTimeDomainsEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:11055:25: error: 'CreateCudaModuleNV' undeclared (first use in this function); did you mean 'CreateCuModuleNVX'?
| 11055 |         *addr = (void *)CreateCudaModuleNV;
|       |                         ^~~~~~~~~~~~~~~~~~
|       |                         CreateCuModuleNVX
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:11059:25: error: 'GetCudaModuleCacheNV' undeclared (first use in this function)
| 11059 |         *addr = (void *)GetCudaModuleCacheNV;
|       |                         ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:11063:25: error: 'CreateCudaFunctionNV' undeclared (first use in this function); did you mean 'CreateCuFunctionNVX'?
| 11063 |         *addr = (void *)CreateCudaFunctionNV;
|       |                         ^~~~~~~~~~~~~~~~~~~~
|       |                         CreateCuFunctionNVX
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:11067:25: error: 'DestroyCudaModuleNV' undeclared (first use in this function); did you mean 'DestroyCuModuleNVX'?
| 11067 |         *addr = (void *)DestroyCudaModuleNV;
|       |                         ^~~~~~~~~~~~~~~~~~~
|       |                         DestroyCuModuleNVX
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:11071:25: error: 'DestroyCudaFunctionNV' undeclared (first use in this function); did you mean 'DestroyCuFunctionNVX'?
| 11071 |         *addr = (void *)DestroyCudaFunctionNV;
|       |                         ^~~~~~~~~~~~~~~~~~~~~
|       |                         DestroyCuFunctionNVX
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:12021:53: error: 'terminator_GetPhysicalDeviceCalibrateableTimeDomainsKHR' undeclared here (not in a function); did you mean 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsEXT'?
| 12021 |     .GetPhysicalDeviceCalibrateableTimeDomainsKHR = terminator_GetPhysicalDeviceCalibrateableTimeDomainsKHR,
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:12074:53: error: 'terminator_GetPhysicalDeviceCalibrateableTimeDomainsEXT' undeclared here (not in a function); did you mean 'PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsEXT'?
| 12074 |     .GetPhysicalDeviceCalibrateableTimeDomainsEXT = terminator_GetPhysicalDeviceCalibrateableTimeDomainsEXT,
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:12203:51: error: 'VK_EXT_LAYER_SETTINGS_EXTENSION_NAME' undeclared here (not in a function); did you mean 'VK_EXT_DEBUG_UTILS_EXTENSION_NAME'?
| 12203 |                                                   VK_EXT_LAYER_SETTINGS_EXTENSION_NAME,
|       |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                   VK_EXT_DEBUG_UTILS_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c: In function 'GetCalibratedTimestampsKHR':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/git/loader/generated/vk_loader_extensions.c:4905:1: warning: control reaches end of non-void function [-Wreturn-type]
|  4905 | }
|       | ^
| ninja: build stopped: subcommand failed.
| 
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/temp/run.do_compile.3089438:153 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/temp/run.do_compile.3089438, line 153
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/temp/run.do_compile.3089438, line 147
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/temp/run.do_compile.3089438, line 142
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/temp/run.do_compile.3089438, line 166
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1966 tasks of which 1951 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240301170513.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240301170513.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-loader-1.3.275.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/temp/run.do_compile.3089438', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-loader/1.3.275.0/temp/log.do_compile.3089438
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb:do_compile) failed with exit code '1'

--===============0663327681393512574==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-loader-upgrade-1.3.268.0-1.3.275.0.patch"

RnJvbSA5NDNkNjVlMGYyOGFhMTRlOTA3NDRmMDZkNDRlZTI5Yjg5M2U3ZmE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAxNzowNTozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi1sb2FkZXI6IHVwZ3JhZGUgMS4zLjI2OC4wIC0+IDEuMy4yNzUuMAoKLS0tCiAuLi57dnVs
a2FuLWxvYWRlcl8xLjMuMjY4LjAuYmIgPT4gdnVsa2FuLWxvYWRlcl8xLjMuMjc1LjAuYmJ9IHwg
NCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi1sb2FkZXJfMS4zLjI2
OC4wLmJiID0+IHZ1bGthbi1sb2FkZXJfMS4zLjI3NS4wLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLWxvYWRlcl8xLjMuMjY4LjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1sb2FkZXJfMS4zLjI3NS4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92
dWxrYW4vdnVsa2FuLWxvYWRlcl8xLjMuMjY4LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1n
cmFwaGljcy92dWxrYW4vdnVsa2FuLWxvYWRlcl8xLjMuMjc1LjAuYmIKaW5kZXggNWE1NzQ5ZDQw
Yy4uN2NhZWQ2NzIwNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92
dWxrYW4tbG9hZGVyXzEuMy4yNjguMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi1sb2FkZXJfMS4zLjI3NS4wLmJiCkBAIC05LDggKzksOCBAQCBTRUNUSU9OID0g
ImxpYnMiCiAKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOU0UudHh0O21kNT03ZGJlZmVkMjMyNDI3NjBhYTM0NzVlZTQyODAxYzVhYyIKLVNS
Q19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLUxvYWRlci5naXQ7
YnJhbmNoPXZ1bGthbi1zZGstMS4zLjI2ODtwcm90b2NvbD1odHRwcyIKLVNSQ1JFViA9ICJmNGM4
MzhlMmU3MzU4ZmM0NTBmODExMjExOWJiZGJiNWIwM2UwM2ZhIgorU1JDX1VSSSA9ICJnaXQ6Ly9n
aXRodWIuY29tL0tocm9ub3NHcm91cC9WdWxrYW4tTG9hZGVyLmdpdDticmFuY2g9dnVsa2FuLXNk
ay0xLjMuMjc1O3Byb3RvY29sPWh0dHBzIgorU1JDUkVWID0gIjAwODkzYjlhMDNlNTI2YWVjMmM1
YmY0ODc1MjFkMTZkZmE0MzUyMjkiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuNDIu
MAoK

--===============0663327681393512574==--

