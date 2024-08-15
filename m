Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1059C54756
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:04 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.131417.1723748333747496594
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=PI6DSMK/;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=RqIz3HJH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101915768352b-755732bd-aa8e-416b-ac8a-fcac423bc40e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=v0c52uG6qeqCLtxHwCYd+q48MKBGbRkUT7k5tczFXIE=;
	b=PI6DSMK/Jkzg2sesj3jqhOYB19yoJ7cE88LBBesS9Dc+WHpfPEP6M5liEsrsRnAb
	aWzRHgXKkKOHiqgb6TAZGx8zDFX/Tx/Rut6OXMTd3+JrZbfMESfsXX6fMRi5jJmZ3lp
	9hv9zEsq85BxGqS2P0f1YzX6U1oM/WcnIU89vFkc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=v0c52uG6qeqCLtxHwCYd+q48MKBGbRkUT7k5tczFXIE=;
	b=RqIz3HJHiISpQ3pfH3sI1QlxnATUO4NvFCZizq4P2OXxFOZUESWx5hIrIUa1+EWd
	d3yM1U2UXGxCG/XIMvAbnjvCI48rnkj6VCaesXAdt7+0TVtLjLDWNVWajyJx5W+SfJl
	Sp8AE4bdHQB2SEQICpnPgdfKGWORrzd609bReyCo=
Content-Type: multipart/mixed; boundary="===============3581381675561589524=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>, Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva,libva-initial: upgrading to 2.22.0,2.22.0 SUCCEEDED
Message-ID: <010101915768352b-755732bd-aa8e-416b-ac8a-fcac423bc40e-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203348

--===============3581381675561589524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libva,libva-initial* to *2.22.0,2.22.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libva-libva-initial-upgrade-2.20.0-2.22.0-2.20.0-2.2.patch
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
From 84179e8b8b47d60d7092925be606008e4fa02666 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 07:52:05 +0000
Subject: [PATCH] libva,libva-initial: upgrade 2.20.0 -> 2.22.0,2.20.0 ->
 2.22.0

---
 .../libva/{libva-initial_2.20.0.bb => libva-initial_2.22.0.bb}  | 0
 meta/recipes-graphics/libva/libva.inc                           | 2 +-
 .../recipes-graphics/libva/{libva_2.20.0.bb => libva_2.22.0.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libva/{libva-initial_2.20.0.bb => libva-initial_2.22.0.bb} (100%)
 rename meta/recipes-graphics/libva/{libva_2.20.0.bb => libva_2.22.0.bb} (100%)

diff --git a/meta/recipes-graphics/libva/libva-initial_2.20.0.bb b/meta/recipes-graphics/libva/libva-initial_2.22.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva-initial_2.20.0.bb
rename to meta/recipes-graphics/libva/libva-initial_2.22.0.bb
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index 486291bced..784ab8b79f 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -18,7 +18,7 @@ LICENSE = "MIT"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libva-${PV}.tar.bz2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "f72bdb4f48dfe71ad01f1cbefe069672a2c949a6abd51cf3c4d4784210badc49"
+SRC_URI[sha256sum] = "e3da2250654c8d52b3f59f8cb3f3d8e7fb1a2ee64378dbc400fbc5663de7edb8"
 
 S = "${WORKDIR}/libva-${PV}"
 
diff --git a/meta/recipes-graphics/libva/libva_2.20.0.bb b/meta/recipes-graphics/libva/libva_2.22.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva_2.20.0.bb
rename to meta/recipes-graphics/libva/libva_2.22.0.bb
-- 
2.44.0


--===============3581381675561589524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1868 targets, 51 skipped, 0 masked, 0 errors.
Removing 77 recipes from the core2-64 sysroot...done.
Removing 78 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-77b938f89d6a9bfdd692a4b4aa9d967948f420ad"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:77b938f89d6a9bfdd692a4b4aa9d967948f420ad"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 413 Local 391 Mirrors 0 Missed 22 Current 280 (94% match, 96% complete)
Removing 2 stale sstate objects for arch allarch...done.
Removing 5 stale sstate objects for arch x86_64...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 296 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 298 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 307 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.22.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 309 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 311 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_create_spdx_setscene)
NOTE: Running setscene task 315 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 316 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 317 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_create_spdx_setscene)
NOTE: Running setscene task 318 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 319 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 320 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 321 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_create_spdx_setscene)
NOTE: recipe libva-initial-2.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libva-2.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Started
NOTE: recipe libva-initial-2.22.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libva-2.22.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_create_spdx_setscene: Started
NOTE: recipe libva-2.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libva-initial-2.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 409 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 410 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 412 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libva-initial-2.22.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libva-2.22.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 416 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 417 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.22.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 418 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 419 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 421 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 422 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 424 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 425 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 426 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libva-initial-2.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libva-2.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 427 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_packagedata_setscene: Started
NOTE: recipe libva-initial-2.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 431 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libva-2.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 434 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 440 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 442 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 451 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 456 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 458 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 460 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 464 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 465 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 467 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 470 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 471 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 472 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 473 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 474 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.122-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 476 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 480 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 482 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.122-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 486 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 997 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: Running task 1051 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_fetch)
NOTE: Running task 1052 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.22.0.bb:do_fetch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 489 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1154 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_write_config)
NOTE: Running task 1157 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_write_config)
NOTE: Running task 1158 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.22.0.bb:do_write_config)
NOTE: recipe libxml2-2.12.8-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 490 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 492 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 499 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe libva-initial-2.22.0-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 506 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe libva-initial-2.22.0-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 507 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 509 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libva-2.22.0-r0: task do_fetch: Started
NOTE: Running setscene task 511 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 512 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_fetch: Started
NOTE: Running setscene task 514 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_write_config: Started
NOTE: recipe libva-2.22.0-r0: task do_fetch: Succeeded
NOTE: recipe libva-initial-2.22.0-r0: task do_write_config: Started
NOTE: recipe libva-2.22.0-r0: task do_write_config: Started
NOTE: Running task 1186 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_unpack)
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_fetch: Succeeded
NOTE: Running task 1187 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_unpack)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_write_config: Succeeded
NOTE: Running task 1188 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.22.0.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libva-initial-2.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 516 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libva-initial-2.22.0-r0: task do_unpack: Started
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 517 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libva-2.22.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libva-initial-2.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 1261 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_patch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 519 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 520 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 522 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 527 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 528 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libva-2.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 1262 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.22.0.bb:do_patch)
NOTE: recipe libva-initial-2.22.0-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 530 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libva-2.22.0-r0: task do_patch: Started
NOTE: recipe libva-initial-2.22.0-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libva-2.22.0-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 535 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 537 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 538 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 541 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 553 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 554 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 555 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 556 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 557 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 558 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 559 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 562 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 566 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/util-linux-libuuid/2.40.1/temp/log.do_packagedata_setscene.3153140
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 567 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_package_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 571 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 572 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 574 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 576 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 579 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 581 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 589 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 591 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 593 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 595 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 598 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 600 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 602 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 603 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 607 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 611 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 613 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 615 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 616 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 618 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 621 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 622 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 623 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 624 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 626 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 628 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 633 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_package_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 636 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 638 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 1358 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_patch)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 640 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 643 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 645 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 649 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 650 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 658 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 659 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 670 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 672 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 680 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 681 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 686 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 688 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 689 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 691 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 693 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1777 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_packagedata)
NOTE: Running task 1837 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1850 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1894 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_collect_spdx_deps)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata: Started
NOTE: recipe libva-initial-2.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-initial-2.22.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1912 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_collect_spdx_deps)
NOTE: recipe libva-initial-2.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libva-initial-2.22.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1913 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_configure)
NOTE: recipe libva-initial-2.22.0-r0: task do_configure: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1914 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_configure)
NOTE: recipe mesa-2_24.0.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_configure: Started
NOTE: recipe libva-initial-2.22.0-r0: task do_configure: Succeeded
NOTE: Running task 1915 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_compile)
NOTE: recipe libva-initial-2.22.0-r0: task do_compile: Started
NOTE: recipe libva-initial-2.22.0-r0: task do_compile: Succeeded
NOTE: Running task 1916 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_install)
NOTE: recipe libva-initial-2.22.0-r0: task do_install: Started
NOTE: recipe libva-initial-2.22.0-r0: task do_install: Succeeded
NOTE: Running task 1917 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_package)
NOTE: Running task 1918 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_populate_sysroot)
NOTE: recipe libva-initial-2.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-initial-2.22.0-r0: task do_package: Started
NOTE: recipe libva-initial-2.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libva-initial-2.22.0-r0: task do_package: Succeeded
NOTE: Running task 1919 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_packagedata)
NOTE: recipe libva-initial-2.22.0-r0: task do_packagedata: Started
NOTE: recipe libva-initial-2.22.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_packagedata unihash changed to 9bf8c4f6241658cf9655edb803805f199fc0016701d3019662198c788ef06425
NOTE: Setscene tasks completed
NOTE: Running task 1920 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_create_spdx)
NOTE: Running task 1921 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_package_write_ipk)
NOTE: Running task 1922 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_package_write_deb)
NOTE: Running task 1923 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_package_write_rpm)
NOTE: Running task 1924 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_package_qa)
NOTE: recipe libva-initial-2.22.0-r0: task do_create_spdx: Started
NOTE: recipe libva-initial-2.22.0-r0: task do_package_write_ipk: Started
NOTE: recipe libva-initial-2.22.0-r0: task do_package_write_deb: Started
NOTE: recipe libva-initial-2.22.0-r0: task do_package_write_rpm: Started
NOTE: recipe libva-initial-2.22.0-r0: task do_package_qa: Started
NOTE: recipe libva-initial-2.22.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1925 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_create_package_spdx)
NOTE: recipe mesa-2_24.0.7-r0: task do_configure: Succeeded
NOTE: Running task 1926 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_compile)
NOTE: recipe libva-initial-2.22.0-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_package_qa unihash changed to 754d698e58d74d4be2446c0b3bf19436d37e8b4bd2a5bd0dbaf1fea6b6ea8b81
NOTE: recipe libva-initial-2.22.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe libva-initial-2.22.0-r0: task do_create_package_spdx: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_package_write_ipk unihash changed to 481531655c3c9b761b1c41431ec8648037037da49f43268303e6480b19d63fff
NOTE: recipe mesa-2_24.0.7-r0: task do_compile: Started
NOTE: recipe libva-initial-2.22.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_package_write_deb unihash changed to b0d290e38f67383be73ca5e9a435eb655f6b86aaef1fa19fdfd3b3af799cff5b
NOTE: recipe libva-initial-2.22.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe libva-initial-2.22.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_package_write_rpm unihash changed to c40615e9806366d93da80c0507bc75fc8db9be3cc495d96100e81b2cb21122a3
NOTE: Running noexec task 1927 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva-initial_2.22.0.bb:do_build)
NOTE: recipe mesa-2_24.0.7-r0: task do_compile: Succeeded
NOTE: Running task 1928 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_install)
NOTE: recipe mesa-2_24.0.7-r0: task do_install: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_install: Succeeded
NOTE: Running task 1929 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_package)
NOTE: Running task 1930 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_populate_sysroot)
NOTE: recipe mesa-2_24.0.7-r0: task do_package: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1931 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libva-2.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1932 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.22.0.bb:do_configure)
NOTE: recipe libva-2.22.0-r0: task do_configure: Started
NOTE: recipe libva-2.22.0-r0: task do_configure: Succeeded
NOTE: Running task 1933 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.22.0.bb:do_compile)
NOTE: recipe libva-2.22.0-r0: task do_compile: Started
NOTE: recipe libva-2.22.0-r0: task do_compile: Succeeded
NOTE: Running task 1934 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.22.0.bb:do_install)
NOTE: recipe libva-2.22.0-r0: task do_install: Started
NOTE: recipe libva-2.22.0-r0: task do_install: Succeeded
NOTE: Running task 1935 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.22.0.bb:do_populate_sysroot)
NOTE: recipe libva-2.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_package: Succeeded
NOTE: Running task 1936 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_packagedata)
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 1937 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.22.0.bb:do_package)
NOTE: Running task 1938 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_create_spdx)
NOTE: recipe libva-2.22.0-r0: task do_package: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx: Started
NOTE: recipe libva-2.22.0-r0: task do_package: Succeeded
NOTE: Running task 1939 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.22.0.bb:do_packagedata)
NOTE: recipe libva-2.22.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.22.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1940 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.22.0.bb:do_package_write_ipk)
NOTE: Running task 1941 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.22.0.bb:do_package_write_deb)
NOTE: Running task 1942 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.22.0.bb:do_package_write_rpm)
NOTE: Running task 1943 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.22.0.bb:do_package_qa)
NOTE: recipe libva-2.22.0-r0: task do_package_write_ipk: Started
NOTE: recipe libva-2.22.0-r0: task do_package_write_deb: Started
NOTE: recipe libva-2.22.0-r0: task do_package_write_rpm: Started
NOTE: recipe libva-2.22.0-r0: task do_package_qa: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 1944 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.22.0.bb:do_collect_spdx_deps)
NOTE: recipe libva-2.22.0-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.22.0.bb:do_package_qa unihash changed to e347c3e0c3c8aa415e75d89c097695d7fa4c143d57907c8ad8364bdf9d02372d
NOTE: recipe libva-2.22.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libva-2.22.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe libva-2.22.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1945 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.22.0.bb:do_create_spdx)
NOTE: recipe libva-2.22.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe libva-2.22.0-r0: task do_create_spdx: Started
NOTE: recipe libva-2.22.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libva-2.22.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1946 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.22.0.bb:do_create_package_spdx)
NOTE: recipe libva-2.22.0-r0: task do_create_package_spdx: Started
NOTE: recipe libva-2.22.0-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 1947 of 1947 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.22.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1947 tasks of which 1895 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-libuuid-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-src went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-dbg went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-staticdev went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-dev went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-doc went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-locale went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3581381675561589524==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libva-libva-initial-upgrade-2.20.0-2.22.0-2.20.0-2.2.patch"

RnJvbSA4NDE3OWU4YjhiNDdkNjBkNzA5MjkyNWJlNjA2MDA4ZTRmYTAyNjY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMDc6NTI6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ2YSxsaWJ2YS1pbml0aWFsOiB1cGdyYWRlIDIuMjAuMCAtPiAyLjIyLjAsMi4yMC4wIC0+CiAy
LjIyLjAKCi0tLQogLi4uL2xpYnZhL3tsaWJ2YS1pbml0aWFsXzIuMjAuMC5iYiA9PiBsaWJ2YS1p
bml0aWFsXzIuMjIuMC5iYn0gIHwgMAogbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZh
LmluYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogLi4uL3JlY2lwZXMtZ3JhcGhp
Y3MvbGlidmEve2xpYnZhXzIuMjAuMC5iYiA9PiBsaWJ2YV8yLjIyLjAuYmJ9IHwgMAogMyBmaWxl
cyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy9saWJ2YS97bGlidmEtaW5pdGlhbF8yLjIwLjAuYmIgPT4gbGlidmEtaW5p
dGlhbF8yLjIyLjAuYmJ9ICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2
YS97bGlidmFfMi4yMC4wLmJiID0+IGxpYnZhXzIuMjIuMC5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhLWluaXRpYWxfMi4yMC4wLmJiIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhLWluaXRpYWxfMi4yMi4wLmJiCnNpbWls
YXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEv
bGlidmEtaW5pdGlhbF8yLjIwLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9s
aWJ2YS9saWJ2YS1pbml0aWFsXzIuMjIuMC5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL2xpYnZhL2xpYnZhLmluYyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS9saWJ2
YS5pbmMKaW5kZXggNDg2MjkxYmNlZC4uNzg0YWI4Yjc5ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhLmluYworKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
bGlidmEvbGlidmEuaW5jCkBAIC0xOCw3ICsxOCw3IEBAIExJQ0VOU0UgPSAiTUlUIgogCiBTUkNf
VVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS9saWJ2YS0ke1BWfS50YXIu
YnoyIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MmU0ODk0MGY5NGFj
YjBhZjU4MmU1ZWYwMzUzNzgwMGYiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjcyYmRiNGY0OGRm
ZTcxYWQwMWYxY2JlZmUwNjk2NzJhMmM5NDlhNmFiZDUxY2YzYzRkNDc4NDIxMGJhZGM0OSIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICJlM2RhMjI1MDY1NGM4ZDUyYjNmNTlmOGNiM2YzZDhlN2ZiMWEy
ZWU2NDM3OGRiYzQwMGZiYzU2NjNkZTdlZGI4IgogCiBTID0gIiR7V09SS0RJUn0vbGlidmEtJHtQ
Vn0iCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS9saWJ2YV8yLjIw
LjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmFfMi4yMi4wLmJiCnNpbWls
YXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEv
bGlidmFfMi4yMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGli
dmFfMi4yMi4wLmJiCi0tIAoyLjQ0LjAKCg==

--===============3581381675561589524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libva-initial/libva-initial-dev: FILELIST: added "/usr/include/va/va_dec_vvc.h"
Changes to packages/core2-64-poky-linux/libva-initial (sysroot):
  /usr/include/va/va_dec_vvc.h was added
packages/core2-64-poky-linux/libva/libva-dev: FILELIST: added "/usr/include/va/va_trace.h /usr/include/va/va_dri3.h /usr/include/va/va_dec_vvc.h"
packages/core2-64-poky-linux/libva/libva-glx: FILELIST: removed "/usr/lib/libva-glx.so.2.2000.0", added "/usr/lib/libva-glx.so.2.2200.0"
packages/core2-64-poky-linux/libva/libva-src: PKGSIZE changed from 1106445 to 1254668 (+13%)
packages/core2-64-poky-linux/libva/libva-wayland: FILELIST: removed "/usr/lib/libva-wayland.so.2.2000.0", added "/usr/lib/libva-wayland.so.2.2200.0"
packages/core2-64-poky-linux/libva/libva-wayland: PKGSIZE changed from 18689 to 27033 (+45%)
packages/core2-64-poky-linux/libva/libva-x11: FILELIST: removed "/usr/lib/libva-x11.so.2.2000.0", added "/usr/lib/libva-x11.so.2.2200.0"
packages/core2-64-poky-linux/libva/libva-x11: PKGSIZE changed from 26741 to 30837 (+15%)
packages/core2-64-poky-linux/libva/libva: FILELIST: removed "/usr/lib/libva-drm.so.2.2000.0 /usr/lib/libva.so.2.2000.0", added "/usr/lib/libva-drm.so.2.2200.0 /usr/lib/libva.so.2.2200.0"
Changes to packages/core2-64-poky-linux/libva (sysroot):
  /usr/lib/libva-drm.so.2 changed symlink target from libva-drm.so.2.2000.0 to libva-drm.so.2.2200.0
  /usr/lib/libva-glx.so.2 changed symlink target from libva-glx.so.2.2000.0 to libva-glx.so.2.2200.0
  /usr/lib/libva.so.2 changed symlink target from libva.so.2.2000.0 to libva.so.2.2200.0
  /usr/lib/libva-wayland.so.2 changed symlink target from libva-wayland.so.2.2000.0 to libva-wayland.so.2.2200.0
  /usr/lib/libva-x11.so.2 changed symlink target from libva-x11.so.2.2000.0 to libva-x11.so.2.2200.0
  /usr/lib/libva-drm.so.2.2000.0 moved to /usr/lib/libva-drm.so.2.2200.0
  /usr/lib/libva-glx.so.2.2000.0 moved to /usr/lib/libva-glx.so.2.2200.0
  /usr/lib/libva.so.2.2000.0 moved to /usr/lib/libva.so.2.2200.0
  /usr/lib/libva-wayland.so.2.2000.0 moved to /usr/lib/libva-wayland.so.2.2200.0
  /usr/lib/libva-x11.so.2.2000.0 moved to /usr/lib/libva-x11.so.2.2200.0
  /usr/include/va/va_dec_vvc.h was added
  /usr/include/va/va_dri3.h was added
  /usr/include/va/va_trace.h was added

--===============3581381675561589524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libva-initial: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva-initial: SRC_URI changed from "https://github.com/intel/libva/releases/download/2.20.0/libva-2.20.0.tar.bz2" to "https://github.com/intel/libva/releases/download/2.22.0/libva-2.22.0.tar.bz2"
packages/core2-64-poky-linux/libva-initial: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva-initial/libva-initial-dbg: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva-initial/libva-initial-dbg: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva-initial/libva-initial-dev: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva-initial/libva-initial-dev: FILELIST: added "/usr/include/va/va_dec_vvc.h"
packages/core2-64-poky-linux/libva-initial/libva-initial-dev: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva-initial/libva-initial-dev: PKGSIZE changed from 630594 to 673071 (+7%)
packages/core2-64-poky-linux/libva-initial/libva-initial-doc: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva-initial/libva-initial-doc: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva-initial/libva-initial-locale: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva-initial/libva-initial-locale: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva-initial/libva-initial-src: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva-initial/libva-initial-src: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva-initial/libva-initial-staticdev: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva-initial/libva-initial-staticdev: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva-initial/libva-initial: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva-initial/libva-initial: PV changed from "2.20.0" to "2.22.0"
Changes to packages/core2-64-poky-linux/libva-initial (sysroot):
  /usr/include/va/va_dec_vvc.h was added
packages/core2-64-poky-linux/libva: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva: SRC_URI changed from "https://github.com/intel/libva/releases/download/2.20.0/libva-2.20.0.tar.bz2" to "https://github.com/intel/libva/releases/download/2.22.0/libva-2.22.0.tar.bz2"
packages/core2-64-poky-linux/libva: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-dbg: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-dbg: FILELIST: removed "/usr/lib/.debug/libva-x11.so.2.2000.0 /usr/lib/.debug/libva-drm.so.2.2000.0 /usr/lib/.debug/libva.so.2.2000.0 /usr/lib/.debug/libva-wayland.so.2.2000.0 /usr/lib/.debug/libva-glx.so.2.2000.0", added "/usr/lib/.debug/libva-x11.so.2.2200.0 /usr/lib/.debug/libva-drm.so.2.2200.0 /usr/lib/.debug/libva.so.2.2200.0 /usr/lib/.debug/libva-wayland.so.2.2200.0 /usr/lib/.debug/libva-glx.so.2.2200.0"
packages/core2-64-poky-linux/libva/libva-dbg: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-dbg: PKGSIZE changed from 850880 to 935696 (+10%)
packages/core2-64-poky-linux/libva/libva-dev: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-dev: FILELIST: added "/usr/include/va/va_dri3.h /usr/include/va/va_trace.h /usr/include/va/va_dec_vvc.h"
packages/core2-64-poky-linux/libva/libva-dev: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-dev: PKGSIZE changed from 652185 to 713337 (+9%)
packages/core2-64-poky-linux/libva/libva-doc: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-doc: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-glx: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-glx: FILELIST: removed "/usr/lib/libva-glx.so.2.2000.0", added "/usr/lib/libva-glx.so.2.2200.0"
packages/core2-64-poky-linux/libva/libva-glx: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-locale: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-locale: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-src: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-src: FILELIST: directory renamed /usr/src/debug/libva/2.20.0/va/drm -> /usr/src/debug/libva/2.22.0/va/drm, directory renamed /usr/src/debug/libva/2.20.0/va/glx -> /usr/src/debug/libva/2.22.0/va/glx, directory renamed /usr/src/debug/libva/2.20.0/va/x11 -> /usr/src/debug/libva/2.22.0/va/x11, removed "/usr/src/debug/libva/2.20.0/va/va.c /usr/src/debug/libva/2.20.0/va/va_compat.c /usr/src/debug/libva/2.20.0/va/va.h /usr/src/debug/libva/2.20.0/va/va_prot.h /usr/src/debug/libva/2.20.0/va/va_backend_vpp.h /usr/src/debug/libva/2.20.0/va/va_backend.h /usr/src/debug/libva/2.20.0/va/va_str.h /usr/src/debug/libva/2.20.0/va/va_str.c /usr/src/debug/libva/2.20.0/va/va_dec_jpeg.h /usr/src/debug/libva/2.20.0/va/va_enc_jpeg.h /usr/src/debug/libva/2.20.0/va/va_trace.c /usr/src/debug/libva/2.20.0/va/va_vpp.h /usr/src/debug/libva/2.20.0/va/va_trace.h /usr/src/debug/libva/2.20.0/va/va_dec_vp9.h /usr/src/debug/libva/2.20.0/va/va_enc_vp9.h /usr/src/debug/libva/2.20.0
 /va/va_dec_vp8.h /usr/src/debug/libva/2.20.0/va/va_enc_vp8.h /usr/src/debug/libva/2.20.0/va/va_enc_mpeg2.h /usr/src/debug/libva/2.20.0/va/wayland/va_wayland_drm.c /usr/src/debug/libva/2.20.0/va/va_internal.h /usr/src/debug/libva/2.20.0/va/wayland-drm-client-protocol.h /usr/src/debug/libva/2.20.0/va/va_enc_hevc.h /usr/src/debug/libva/2.20.0/va/va_dec_hevc.h /usr/src/debug/libva/2.20.0/va/wayland-drm-client-protocol.c /usr/src/debug/libva/2.20.0/va/va_enc_av1.h /usr/src/debug/libva/2.20.0/va/va_dec_av1.h /usr/src/debug/libva/2.20.0/va/wayland/va_wayland_drm.h /usr/src/debug/libva/2.20.0/va/va_x11.h /usr/src/debug/libva/2.20.0/va/wayland/va_backend_wayland.h /usr/src/debug/libva/2.20.0/va/wayland/va_wayland_private.h /usr/src/debug/libva/2.20.0/va/va_backend_prot.h /usr/src/debug/libva/2.20.0/va/va_drmcommon.h /usr/src/debug/libva/2.20.0/va/va_enc_h264.h /usr/src/debug/libva/2.20.0/va/wayland/va_wayland.c", added "/usr/src/debug/libva/2.22.0/va/va_dec_hevc.h /usr/src/debug/libva/2.22.0
 /va/va_enc_hevc.h /usr/src/debug/libva/2.22.0/va/va_enc_av1.h /usr/src/debug/libva/2.22.0/va/va_dec_av1.h /usr/src/debug/libva/2.22.0/va/wayland/va_wayland_private.h /usr/src/debug/libva/2.22.0/va/va_internal.h /usr/src/debug/libva/2.22.0/va/va_dec_vp8.h /usr/src/debug/libva/2.22.0/va/va_enc_vp8.h /usr/src/debug/libva/2.22.0/va/wayland/va_wayland_linux_dmabuf.h /usr/src/debug/libva/2.22.0/va/wayland/va_wayland_linux_dmabuf.c /usr/src/debug/libva/2.22.0/va/va_enc_vp9.h /usr/src/debug/libva/2.22.0/va/va_dec_vp9.h /usr/src/debug/libva/2.22.0/va/va_trace.h /usr/src/debug/libva/2.22.0/va/wayland/va_wayland_drm.h /usr/src/debug/libva/2.22.0/va/va_dec_jpeg.h /usr/src/debug/libva/2.22.0/va/va_dec_vvc.h /usr/src/debug/libva/2.22.0/va/va_enc_jpeg.h /usr/src/debug/libva/2.22.0/va/wayland/va_wayland_drm.c /usr/src/debug/libva/2.22.0/va/va_trace.c /usr/src/debug/libva/2.22.0/va/va_x11.h /usr/src/debug/libva/2.22.0/va/va_backend.h /usr/src/debug/libva/2.22.0/va/va_backend_prot.h /usr/src/debug/li
 bva/2.22.0/va/va_drmcommon.h /usr/src/debug/libva/2.22.0/va/va_enc_h264.h /usr/src/debug/libva/2.22.0/va/va_enc_mpeg2.h /usr/src/debug/libva/2.22.0/va/va.h /usr/src/debug/libva/2.22.0/va/va_compat.c /usr/src/debug/libva/2.22.0/va/wayland-drm-client-protocol.h /usr/src/debug/libva/2.22.0/va/va_prot.h /usr/src/debug/libva/2.22.0/va/va_str.c /usr/src/debug/libva/2.22.0/va/va.c /usr/src/debug/libva/2.22.0/va/va_str.h /usr/src/debug/libva/2.22.0/va/wayland-drm-client-protocol.c /usr/src/debug/libva/2.22.0/va/wayland/va_wayland.c /usr/src/debug/libva/2.22.0/va/linux-dmabuf-v1-client-protocol.h /usr/src/debug/libva/2.22.0/va/va_vpp.h /usr/src/debug/libva/2.22.0/va/linux-dmabuf-v1-client-protocol.c /usr/src/debug/libva/2.22.0/va/wayland/va_backend_wayland.h /usr/src/debug/libva/2.22.0/va/va_backend_vpp.h"
packages/core2-64-poky-linux/libva/libva-src: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-src: PKGSIZE changed from 1106445 to 1254668 (+13%)
packages/core2-64-poky-linux/libva/libva-staticdev: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-staticdev: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-wayland: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-wayland: FILELIST: removed "/usr/lib/libva-wayland.so.2.2000.0", added "/usr/lib/libva-wayland.so.2.2200.0"
packages/core2-64-poky-linux/libva/libva-wayland: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-wayland: PKGSIZE changed from 18689 to 27033 (+45%)
packages/core2-64-poky-linux/libva/libva-x11: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-x11: FILELIST: removed "/usr/lib/libva-x11.so.2.2000.0", added "/usr/lib/libva-x11.so.2.2200.0"
packages/core2-64-poky-linux/libva/libva-x11: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-x11: PKGSIZE changed from 26741 to 30837 (+15%)
packages/core2-64-poky-linux/libva/libva: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva: FILELIST: removed "/usr/lib/libva.so.2.2000.0 /usr/lib/libva-drm.so.2.2000.0", added "/usr/lib/libva.so.2.2200.0 /usr/lib/libva-drm.so.2.2200.0"
packages/core2-64-poky-linux/libva/libva: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva: PKGSIZE changed from 213062 to 233542 (+10%)
Changes to packages/core2-64-poky-linux/libva (sysroot):
  /usr/lib/libva-drm.so.2 changed symlink target from libva-drm.so.2.2000.0 to libva-drm.so.2.2200.0
  /usr/lib/libva-glx.so.2 changed symlink target from libva-glx.so.2.2000.0 to libva-glx.so.2.2200.0
  /usr/lib/libva.so.2 changed symlink target from libva.so.2.2000.0 to libva.so.2.2200.0
  /usr/lib/libva-wayland.so.2 changed symlink target from libva-wayland.so.2.2000.0 to libva-wayland.so.2.2200.0
  /usr/lib/libva-x11.so.2 changed symlink target from libva-x11.so.2.2000.0 to libva-x11.so.2.2200.0
  /usr/lib/libva-drm.so.2.2000.0 moved to /usr/lib/libva-drm.so.2.2200.0
  /usr/lib/libva-glx.so.2.2000.0 moved to /usr/lib/libva-glx.so.2.2200.0
  /usr/lib/libva.so.2.2000.0 moved to /usr/lib/libva.so.2.2200.0
  /usr/lib/libva-wayland.so.2.2000.0 moved to /usr/lib/libva-wayland.so.2.2200.0
  /usr/lib/libva-x11.so.2.2000.0 moved to /usr/lib/libva-x11.so.2.2200.0
  /usr/include/va/va_dec_vvc.h was added
  /usr/include/va/va_dri3.h was added
  /usr/include/va/va_trace.h was added

--===============3581381675561589524==--

