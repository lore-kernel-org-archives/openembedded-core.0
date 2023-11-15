Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4A7C5ACB2
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:15 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.14620.1700059029803299176
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RTVy8yfj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SlAZQDV8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018bd36a2d69-425fc18e-a042-4a0e-9ed7-c66cbdd1aee1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059033;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CK4hd1wJe5MgHpAc8X6703X1U89MqK9P1A+RCrQBx+w=;
	b=RTVy8yfjvVVwK9tafMRQxi4smRgh/UV0b+OPqZSl01BM7bVQlN/I04nSkmB1KM8L
	oExkBt5vQpLX0QVt3/yZrPolCpSP7C5nDPwWpb5DKbr9ZTC4p3NTRP7L5tqzg/ngEPZ
	72QwDvbRbsVy/fwwE615izUPadw3hvNE3IjMn6zA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059033;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CK4hd1wJe5MgHpAc8X6703X1U89MqK9P1A+RCrQBx+w=;
	b=SlAZQDV8tEBH/L/QJ1AZYAMg7DdCEc4llAtMq4nWgpGf14nlKhiiqdiSXPbG9S5r
	vQNook6SbCU2QULERKBXbjuxGE2tk11SRGAlvFTWsykV3qh97tYTM/bb7vgx5dRr0jh
	63GwOySrdYM8Eg3iz3tks9M+BygXoFL5hnTEEXFs=
Content-Type: multipart/mixed; boundary="===============5792143188220035266=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-vaapi: upgrading to 1.22.7 SUCCEEDED
Message-ID: <0101018bd36a2d69-425fc18e-a042-4a0e-9ed7-c66cbdd1aee1-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190709

--===============5792143188220035266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-vaapi* to *1.22.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-vaapi-upgrade-1.22.6-1.22.7.patch
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
From 7def021459e278b068e6e1e11bc850341a4ce710 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 13:31:36 +0000
Subject: [PATCH] gstreamer1.0-vaapi: upgrade 1.22.6 -> 1.22.7

---
 ...streamer1.0-vaapi_1.22.6.bb => gstreamer1.0-vaapi_1.22.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.6.bb => gstreamer1.0-vaapi_1.22.7.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb
index bf4c105057..4cad50742d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "d9ba2fc26bef98c78e982c599f585d46bbb65fe122da89c2d7ab41f468a52c7b"
+SRC_URI[sha256sum] = "0e9fff768b89de6d318b34146e4e781d82b9a0f4025dc541b2c8349c7bcb7f67"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.39.2


--===============5792143188220035266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1844 targets, 50 skipped, 0 masked, 0 errors.
Removing 108 recipes from the core2-64 sysroot...done.
Removing 108 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-8ea15fdc56c596cde9d73fee69035ce96fff0dab"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8ea15fdc56c596cde9d73fee69035ce96fff0dab"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 787 Local 767 Mirrors 0 Missed 20 Current 358 (97% match, 98% complete)
Removing 1 stale sstate objects for arch allarch...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 359 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 363 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 368 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 380 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 381 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libva-2.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libva-2.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 463 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 471 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 479 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 495 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libva-2.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libva-2.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 967 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_fetch)
NOTE: Running task 979 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb:do_recipe_qa)
NOTE: Running task 991 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_write_config)
NOTE: Running task 992 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb:do_write_config)
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 507 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 516 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb:do_create_spdx_setscene)
NOTE: recipe libva-2.20.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_recipe_qa: Started
NOTE: recipe libva-2.20.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_write_config: Started
NOTE: recipe libva-2.20.0-r0: task do_fetch: Succeeded
NOTE: Running task 1047 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_unpack)
NOTE: recipe libva-2.20.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_23.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libva-2.20.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1048 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_23.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 533 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_create_spdx_setscene)
NOTE: Running setscene task 536 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_create_spdx_setscene)
NOTE: Running setscene task 537 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 540 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 541 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe libva-2.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 1060 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_fetch: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1061 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb:do_unpack)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libva-2.20.0-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 545 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 546 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_unpack: Started
NOTE: recipe libva-2.20.0-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_unpack: Succeeded
NOTE: Running task 1063 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb:do_patch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 564 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_patch: Succeeded
NOTE: Running task 1064 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1065 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb:do_populate_lic)
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 574 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_populate_lic: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/gstreamer1.0-plugins-bad/1.22.6/temp/log.do_packagedata_setscene.2760600
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 576 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb:do_package_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_populate_lic: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb:do_populate_lic unihash changed to 3248321050e12a84f9370f3340fa59a8e75bf43aa4525967a111bdf4c6d8be2a
NOTE: Running setscene task 578 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.6-r0: task do_package_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 582 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 588 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 590 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 597 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 598 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 600 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.70-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.70-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 605 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 607 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 613 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.70-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 615 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 619 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 621 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 622 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 623 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 625 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 627 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 628 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 633 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 636 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 642 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 645 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 648 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 651 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 654 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 656 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 659 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 660 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 662 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 666 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 667 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 668 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 669 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 670 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 671 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 672 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 673 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 676 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 677 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 679 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 681 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 685 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 687 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 690 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 692 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 693 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 697 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 699 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 700 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 701 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 703 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 707 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 708 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-8.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 709 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 710 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 712 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 713 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-8.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 714 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 718 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 719 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-8.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 721 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 724 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 725 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 727 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 729 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 734 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 737 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 740 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 742 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 744 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 745 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 747 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 749 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 751 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 752 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 754 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 755 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 756 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 759 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 761 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 763 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 764 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 765 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 767 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 768 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 770 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 771 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 772 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 774 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 775 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 776 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 778 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 781 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 783 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 786 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 787 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 788 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 790 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 793 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 794 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 795 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 797 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 800 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 801 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 802 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 803 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 807 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 810 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 812 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 817 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 818 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 819 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 821 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 823 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 830 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 832 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 833 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 836 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 837 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 838 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 840 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 841 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 843 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 845 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 846 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 847 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 850 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 851 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 853 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 854 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 855 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 858 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 861 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 863 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 864 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 866 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 867 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 868 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 870 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 871 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 872 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_73-2.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 874 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_73-2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 876 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 878 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 880 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 882 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 884 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 888 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 890 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 891 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 892 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 894 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 899 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 902 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 903 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 904 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 906 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 908 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 909 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 912 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 914 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 915 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 916 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 918 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 927 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_73-2.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Started
NOTE: Running task 1181 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 929 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 930 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 932 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 936 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 938 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 939 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: Running task 1364 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 941 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1365 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 943 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 944 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 945 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1490 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running setscene task 948 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 949 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 950 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 951 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 953 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 955 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 956 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 957 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 958 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1499 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 960 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 961 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 962 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 964 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 965 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 966 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 968 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: Running task 1505 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 973 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 974 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 976 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 977 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 980 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 981 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 983 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 984 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 985 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1516 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 987 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 991 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 993 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 996 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 997 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 998 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 999 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 1000 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1002 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1003 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1004 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1005 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1006 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1007 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 1008 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1009 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running setscene task 1010 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1011 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1012 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1014 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1015 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1016 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1017 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1019 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1022 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1024 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1025 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1028 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1031 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1037 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1039 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1041 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1042 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1044 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1046 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1048 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1866 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running setscene task 1052 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1054 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1056 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1058 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1060 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1061 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1062 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1063 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1065 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1066 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1067 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1068 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1069 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1070 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1071 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1076 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1078 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1080 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1083 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1084 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1085 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1088 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1090 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1091 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1093 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1095 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1096 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1101 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1103 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1105 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1106 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2003 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1108 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e644ec3722734ea60494db1182afab8d0334f493c3dc1fb845b731f7ca727b46
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash ec9a4cbe7778f619e040a5cbb607b7ec3c1e5c11478e60f95bf749f3f244ebc1 to hashserv.yocto.io:8686 ({'taskhash': 'a2b24cabf6a4fcd25e6c9961b5121a5f1fb5bc65e2ef43fa99f02bbd7af8a705', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'ec9a4cbe7778f619e040a5cbb607b7ec3c1e5c11478e60f95bf749f3f244ebc1'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed a2b24cabf6a4fcd25e6c9961b5121a5f1fb5bc65e2ef43fa99f02bbd7af8a705 -> ec9a4cbe7778f619e040a5cbb607b7ec3c1e5c11478e60f95bf749f3f244ebc1 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1110 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1111 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1113 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1115 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1116 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1117 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1118 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1120 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1124 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1125 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1127 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1132 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1133 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1135 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1138 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1140 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1141 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1143 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1145 of 1145 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2501 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 2935 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3059 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_collect_spdx_deps)
NOTE: recipe libva-2.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.20.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5009bfdce64be5968dd9927eeb08146bbc59582b45f2dbfd597d0d6515f565bd
NOTE: Running task 3085 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.6-r0: task do_packagedata: Started
NOTE: recipe libva-2.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libva-2.20.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3091 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_configure)
NOTE: recipe libva-2.20.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.6-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.20.0-r0: task do_configure: Succeeded
NOTE: Running task 3093 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_compile)
NOTE: recipe libva-2.20.0-r0: task do_compile: Started
NOTE: recipe libva-2.20.0-r0: task do_compile: Succeeded
NOTE: Running task 3094 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_install)
NOTE: recipe libva-2.20.0-r0: task do_install: Started
NOTE: recipe libva-2.20.0-r0: task do_install: Succeeded
NOTE: Running task 3095 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_package)
NOTE: Running task 3096 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_populate_sysroot)
NOTE: recipe libva-2.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.20.0-r0: task do_package: Started
NOTE: recipe libva-2.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3097 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3098 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_configure: Started
NOTE: recipe libva-2.20.0-r0: task do_package: Succeeded
NOTE: Running task 3099 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_packagedata)
NOTE: recipe libva-2.20.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.20.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_packagedata unihash changed to f039c37013a5300c0d4ff60e12ba91cda297934473f3556d2fe9e918b0ea622b
NOTE: Setscene tasks completed
NOTE: Running task 3100 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_create_spdx)
NOTE: recipe libva-2.20.0-r0: task do_create_spdx: Started
NOTE: recipe libva-2.20.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3101 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3102 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_compile: Succeeded
NOTE: Running task 3103 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_install: Succeeded
NOTE: Running task 3104 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb:do_package)
NOTE: Running task 3105 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_package: Succeeded
NOTE: Running task 3106 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3107 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb:do_create_spdx)
NOTE: Running task 3108 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb:do_package_write_ipk)
NOTE: Running task 3109 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb:do_package_write_deb)
NOTE: Running task 3110 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb:do_package_write_rpm)
NOTE: Running task 3111 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_package_write_ipk: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_package_write_deb: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 3112 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.7-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 3113 of 3113 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb:do_build)
NOTE: Tasks Summary: Attempted 3113 tasks of which 3067 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 173 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcuda-1.0 went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codectimestamper went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-cuda-typelib went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ka went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.22.7-r0 to 0:1.22.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5792143188220035266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PV changed from "1.22.6" to "1.22.7"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PKGV changed from 1.22.6 [default] to 1.22.7 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PV changed from "1.22.6" to "1.22.7"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PKGV changed from 1.22.6 [default] to 1.22.7 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PV changed from "1.22.6" to "1.22.7"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PKGV changed from 1.22.6 [default] to 1.22.7 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PV changed from "1.22.6" to "1.22.7"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PKGV changed from 1.22.6 [default] to 1.22.7 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PV changed from "1.22.6" to "1.22.7"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PKGV changed from 1.22.6 [default] to 1.22.7 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PV changed from "1.22.6" to "1.22.7"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PKGV changed from 1.22.6 [default] to 1.22.7 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PV changed from "1.22.6" to "1.22.7"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PKGV changed from 1.22.6 [default] to 1.22.7 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PV changed from "1.22.6" to "1.22.7"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PKGV changed from 1.22.6 [default] to 1.22.7 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi: PV changed from "1.22.6" to "1.22.7"
packages/core2-64-poky-linux/gstreamer1.0-vaapi: PKGV changed from 1.22.6 [default] to 1.22.7 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.22.6.tar.xz" to "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.22.7.tar.xz"

--===============5792143188220035266==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-vaapi-upgrade-1.22.6-1.22.7.patch"

RnJvbSA3ZGVmMDIxNDU5ZTI3OGIwNjhlNmUxZTExYmM4NTAzNDFhNGNlNzEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMTM6MzE6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtdmFhcGk6IHVwZ3JhZGUgMS4yMi42IC0+IDEuMjIuNwoKLS0tCiAuLi5zdHJl
YW1lcjEuMC12YWFwaV8xLjIyLjYuYmIgPT4gZ3N0cmVhbWVyMS4wLXZhYXBpXzEuMjIuNy5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC12YWFw
aV8xLjIyLjYuYmIgPT4gZ3N0cmVhbWVyMS4wLXZhYXBpXzEuMjIuNy5iYn0gKDk1JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXZh
YXBpXzEuMjIuNi5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtdmFhcGlfMS4yMi43LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtdmFhcGlfMS4yMi42
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXZhYXBpXzEuMjIuNy5iYgppbmRleCBiZjRjMTA1MDU3Li40Y2FkNTA3NDJkIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXZhYXBp
XzEuMjIuNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLXZhYXBpXzEuMjIuNy5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HLkxJQjttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUx
NmMiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy8k
e1JFQUxQTn0vJHtSRUFMUE59LSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImQ5YmEyZmMyNmJlZjk4Yzc4ZTk4MmM1OTlmNTg1ZDQ2YmJiNjVmZTEyMmRhODljMmQ3YWI0MWY0
NjhhNTJjN2IiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGU5ZmZmNzY4Yjg5ZGU2ZDMxOGIzNDE0
NmU0ZTc4MWQ4MmI5YTBmNDAyNWRjNTQxYjJjODM0OWM3YmNiN2Y2NyIKIAogUyA9ICIke1dPUktE
SVJ9LyR7UkVBTFBOfS0ke1BWfSIKIERFUEVORFMgPSAibGlidmEgZ3N0cmVhbWVyMS4wIGdzdHJl
YW1lcjEuMC1wbHVnaW5zLWJhc2UgZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkIgotLSAKMi4zOS4y
Cgo=

--===============5792143188220035266==--

