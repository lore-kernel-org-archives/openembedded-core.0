Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B6AC52CDC
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:14 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.173807.1692224344412392437
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cn8TmvpL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HikoaNTP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018a006e6e61-e4242485-3850-4e1f-83a5-050a0bb9d61c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pp1Ud+yD14Ir27exIROq+gUBfVQJHnH40n1cxbTJq/I=;
	b=cn8TmvpLtT/voyySWWx9gQdPUGPuHMFXbUf06dThODVQvAnR+9IXSYMwEJNmePKg
	iV14y5wnTOZDbp6xVuSLYqRrUHSWijXbLa8N+SEn/9vCijlrzriG7YP2V1savk+xE5h
	gnvPzF1QXOuCjicIUVuXhWOYokM1qRnupVheWKhE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pp1Ud+yD14Ir27exIROq+gUBfVQJHnH40n1cxbTJq/I=;
	b=HikoaNTPoXbhI6UK3GO9e+LgkDsXvIpGqLo05Q2AOCvPqwfS82kKkQjymmig178a
	mSZ3aOVY7ptjD3CXjmpxgRQeDmYl2MrGnag0X/CBWX8UXSBICx2gT/WPzL/w2DCYyzJ
	SoAfsvliJoJgDGfuzjPNinqx6xtUhUpjCcFvBngk=
Content-Type: multipart/mixed; boundary="===============7841560249126860948=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-vaapi: upgrading to 1.22.5 SUCCEEDED
Message-ID: <0101018a006e6e61-e4242485-3850-4e1f-83a5-050a0bb9d61c-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186254

--===============7841560249126860948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-vaapi* to *1.22.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-vaapi-upgrade-1.22.4-1.22.5.patch
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
From b6287627aeb5ed285ad2bcd5b6d40a2ebf92df8e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 18:43:55 +0000
Subject: [PATCH] gstreamer1.0-vaapi: upgrade 1.22.4 -> 1.22.5

---
 ...streamer1.0-vaapi_1.22.4.bb => gstreamer1.0-vaapi_1.22.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.4.bb => gstreamer1.0-vaapi_1.22.5.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb
index 34c15bb377..231d252323 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "967b8e353d82d0081a68dc53639b25d9fb4ca89bfa1e061403e0cd7d23585ba6"
+SRC_URI[sha256sum] = "a9a550267c9584df0e8c70434d30476e8fd0018b733c1c1ee33deaf422bdb24b"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.39.2


--===============7841560249126860948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 50 skipped, 0 masked, 0 errors.
Removing 108 recipes from the core2-32 sysroot...done.
Removing 108 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c07df41cae6093c7639b6d25a74f5dc972bef08e"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 725 Local 709 Mirrors 0 Missed 16 Current 409 (97% match, 98% complete)
Removing 1 stale sstate objects for arch allarch...done.
Removing 5 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 410 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 411 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 415 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 427 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 474 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 482 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 498 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1256 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1272 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_recipe_qa)
NOTE: Running setscene task 509 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 518 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_create_spdx_setscene)
NOTE: Running task 1293 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_write_config)
NOTE: Running task 1306 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_write_config)
NOTE: recipe libva-2.19.0-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe libva-2.19.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_write_config: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1349 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 534 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_create_spdx_setscene)
NOTE: Running setscene task 537 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_create_spdx_setscene)
NOTE: Running setscene task 538 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 541 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 542 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1350 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_fetch)
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Started
NOTE: recipe libva-2.19.0-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libva-2.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 1351 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_fetch: Succeeded
NOTE: Running task 1352 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_unpack)
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 545 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 546 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libva-2.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 1353 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_patch)
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 564 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx_setscene)
NOTE: Running task 1354 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_patch)
NOTE: recipe libva-2.19.0-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_patch: Started
NOTE: recipe libva-2.19.0-r0: task do_patch: Succeeded
NOTE: Running task 1355 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_patch: Succeeded
NOTE: Running task 1356 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1357 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_populate_lic)
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 574 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libva-2.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_populate_lic: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/gstreamer1.0-plugins-bad/1.22.4/temp/log.do_packagedata_setscene.1988658
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 575 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_package_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_populate_lic: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_populate_lic unihash changed to 956676230d0ec5ab4172e606c0166c4861489cd98fa9a56031771a85a38c5b1b
NOTE: Running setscene task 577 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_package_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 581 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 587 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 589 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 593 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 596 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 597 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 599 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 601 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.68-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.68-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 608 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 610 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.68-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 613 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 614 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 619 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 621 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 623 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 624 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 628 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 632 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.68-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 634 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 635 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 636 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 639 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 643 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 645 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 648 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgudev-237-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 650 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 656 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 661 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 663 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 665 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 667 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 669 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 670 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 672 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 674 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 675 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata_setscene: Started
NOTE: Running setscene task 677 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 679 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 683 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 684 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 685 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 687 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 688 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 690 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 692 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 694 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 695 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 697 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 700 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 703 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 704 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 707 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 712 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 717 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 722 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 726 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 730 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 733 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 734 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 736 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 737 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 739 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 741 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 742 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-8.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 745 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 747 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 748 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.39-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 751 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 753 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 755 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 757 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 759 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 761 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 763 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 766 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 768 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 769 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 773 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 774 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-8.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 776 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 781 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 784 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 785 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 787 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 788 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 790 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r155: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 794 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 795 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 796 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 797 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 799 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 800 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 801 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 806 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 807 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 808 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 809 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 810 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 811 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 812 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 815 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 816 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 817 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 818 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 819 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 821 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 823 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 830 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 834 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 836 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 837 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 839 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 841 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 843 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 844 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 845 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 846 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 847 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 848 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 849 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 852 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 853 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 855 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 856 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 858 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 859 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 860 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 861 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 862 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 863 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 865 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 866 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 868 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 871 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 873 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 876 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 877 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 879 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 881 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 885 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 886 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 888 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 890 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 891 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 893 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 894 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 895 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 897 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 898 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 900 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 901 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 903 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 907 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 908 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 911 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 913 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 915 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 917 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 918 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 920 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 921 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 923 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 925 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 927 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 929 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 932 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 933 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 934 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 935 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 936 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 938 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 939 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 941 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 943 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 945 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 946 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 949 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 950 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 952 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 955 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 956 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 957 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 959 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 960 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 961 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 962 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 964 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 965 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 966 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 967 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 968 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 969 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 970 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 971 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 972 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 976 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 979 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 980 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 984 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 985 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 987 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 988 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 989 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 990 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 991 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 992 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 993 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 996 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 997 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 998 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1000 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1001 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1002 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1008 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1009 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1010 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1011 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1013 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1014 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1015 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1016 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1017 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1018 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1019 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1026 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1029 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1031 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1033 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1035 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1036 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1037 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1039 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1041 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1043 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1044 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1046 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1048 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1049 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1051 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1053 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1055 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1057 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1059 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1061 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1063 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1066 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1068 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1070 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1072 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1073 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1075 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1077 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1078 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1080 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1082 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 1083 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1088 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1090 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1092 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1093 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1095 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1097 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1098 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1100 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1101 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1103 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1105 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1106 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1107 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1108 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1109 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1111 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1119 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1120 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1122 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1125 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1127 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1128 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1130 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1134 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2930 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2972 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_packagedata)
NOTE: Running task 3058 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_packagedata: Started
NOTE: recipe libva-2.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libva-2.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3060 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_configure)
NOTE: recipe libva-2.19.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_configure: Succeeded
NOTE: Running task 3062 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_compile)
NOTE: recipe libva-2.19.0-r0: task do_compile: Started
NOTE: recipe libva-2.19.0-r0: task do_compile: Succeeded
NOTE: Running task 3063 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_install)
NOTE: recipe libva-2.19.0-r0: task do_install: Started
NOTE: recipe libva-2.19.0-r0: task do_install: Succeeded
NOTE: Running task 3064 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_package)
NOTE: Running task 3065 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_populate_sysroot)
NOTE: recipe libva-2.19.0-r0: task do_package: Started
NOTE: recipe libva-2.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3066 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3067 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_configure)
NOTE: recipe libva-2.19.0-r0: task do_package: Succeeded
NOTE: Running task 3068 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_configure: Started
NOTE: recipe libva-2.19.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.19.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3069 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_create_spdx)
NOTE: recipe libva-2.19.0-r0: task do_create_spdx: Started
NOTE: recipe libva-2.19.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3070 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3071 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3072 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3073 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_package)
NOTE: Running task 3074 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3075 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3076 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_create_spdx)
NOTE: Running task 3077 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_package_write_rpm)
NOTE: Running task 3078 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3079 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3080 of 3080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_build)
NOTE: Tasks Summary: Attempted 3080 tasks of which 3044 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There were 173 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcuda-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codectimestamper went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-cuda-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ka went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7841560249126860948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c07df41cae6093c7639b6d25a74f5dc972bef08e"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 114 Local 98 Mirrors 0 Missed 16 Current 1029 (85% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1077 of 1143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1089 of 1143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1140 of 1143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/gstreamer1.0-plugins-bad/1.22.4/temp/log.do_packagedata_setscene.1849786
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1141 of 1143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_package_setscene)
NOTE: Running task 2741 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_recipe_qa)
NOTE: Running task 2827 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_recipe_qa)
NOTE: Running task 2887 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_write_config)
NOTE: Running task 2966 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_write_config)
NOTE: recipe libva-2.19.0-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe libva-2.19.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_write_config: Started
NOTE: recipe libva-2.19.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_write_config: Succeeded
NOTE: Running task 3067 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3068 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_fetch)
NOTE: recipe libva-2.19.0-r0: task do_fetch: Started
NOTE: recipe libva-2.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 3069 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_unpack)
NOTE: Running task 3070 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_fetch: Succeeded
NOTE: Running task 3071 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_unpack)
NOTE: recipe libva-2.19.0-r0: task do_unpack: Started
NOTE: recipe libva-2.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_package_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_unpack: Started
NOTE: recipe libva-2.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 3072 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_patch)
NOTE: Running task 3073 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_unpack: Succeeded
NOTE: Running task 3074 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_patch)
NOTE: recipe libva-2.19.0-r0: task do_patch: Started
NOTE: recipe libva-2.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_patch: Succeeded
NOTE: Running task 3075 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3076 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_populate_lic unihash changed to 956676230d0ec5ab4172e606c0166c4861489cd98fa9a56031771a85a38c5b1b
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_patch: Succeeded
NOTE: Running task 3077 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libva-2.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libva-2.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3078 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_configure)
NOTE: recipe libva-2.19.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1143 of 1143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3090 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_configure: Succeeded
NOTE: Running task 3094 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_compile)
NOTE: recipe libva-2.19.0-r0: task do_compile: Started
NOTE: recipe libva-2.19.0-r0: task do_compile: Succeeded
NOTE: Running task 3095 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_install)
NOTE: recipe libva-2.19.0-r0: task do_install: Started
NOTE: recipe libva-2.19.0-r0: task do_install: Succeeded
NOTE: Running task 3096 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_package)
NOTE: Running task 3097 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_populate_sysroot)
NOTE: recipe libva-2.19.0-r0: task do_package: Started
NOTE: recipe libva-2.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3098 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3099 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_configure: Started
NOTE: recipe libva-2.19.0-r0: task do_package: Succeeded
NOTE: Running task 3100 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_packagedata)
NOTE: recipe libva-2.19.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.19.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3101 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_create_spdx)
NOTE: recipe libva-2.19.0-r0: task do_create_spdx: Started
NOTE: recipe libva-2.19.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3102 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3103 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3104 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3105 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_package)
NOTE: Running task 3106 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3107 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3108 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_create_spdx)
NOTE: Running task 3109 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_package_write_rpm)
NOTE: Running task 3110 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3111 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3112 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_build)
NOTE: Tasks Summary: Attempted 3112 tasks of which 3076 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 173 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcuda-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codectimestamper went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-cuda-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ka went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7841560249126860948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PKGSIZE changed from 3094752 to 3094236 (-0%)
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PKGSIZE changed from 2831558 to 2830999 (-0%)
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PKGSIZE changed from 945032 to 940936 (-0%)
packages/core2-32-poky-linux/gstreamer1.0-vaapi: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.22.4.tar.xz" to "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.22.5.tar.xz"
packages/core2-32-poky-linux/gstreamer1.0-vaapi: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-vaapi: PKGV changed from 1.22.4 [default] to 1.22.5 [default]

--===============7841560249126860948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c07df41cae6093c7639b6d25a74f5dc972bef08e"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 114 Local 98 Mirrors 0 Missed 16 Current 1013 (85% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1061 of 1127 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1073 of 1127 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1124 of 1127 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 2704 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_recipe_qa)
NOTE: Running task 2788 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_recipe_qa)
NOTE: Running task 2848 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_write_config)
NOTE: Running task 2925 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_write_config)
NOTE: recipe libva-2.19.0-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe libva-2.19.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_write_config: Started
NOTE: recipe libva-2.19.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_write_config: Succeeded
NOTE: Running task 3022 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3023 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_fetch)
NOTE: recipe libva-2.19.0-r0: task do_fetch: Started
NOTE: recipe libva-2.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 3024 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_unpack)
NOTE: Running task 3025 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_fetch: Succeeded
NOTE: Running task 3026 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_unpack)
NOTE: recipe libva-2.19.0-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/gstreamer1.0-plugins-bad/1.22.4/temp/log.do_packagedata_setscene.1825562
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1125 of 1127 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_package_setscene)
NOTE: recipe libva-2.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_unpack: Started
NOTE: recipe libva-2.19.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_unpack: Succeeded
NOTE: Running task 3027 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_patch)
NOTE: Running task 3028 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_patch)
NOTE: Running task 3029 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_collect_spdx_deps)
NOTE: recipe libva-2.19.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_patch: Started
NOTE: recipe libva-2.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_patch: Succeeded
NOTE: Running task 3030 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3031 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_populate_lic: Started
NOTE: recipe libva-2.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_populate_lic: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_populate_lic unihash changed to 956676230d0ec5ab4172e606c0166c4861489cd98fa9a56031771a85a38c5b1b
NOTE: Running task 3032 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_package_setscene: Started
NOTE: recipe libva-2.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3033 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_configure)
NOTE: recipe libva-2.19.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1127 of 1127 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3045 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_packagedata: Started
NOTE: recipe libva-2.19.0-r0: task do_configure: Succeeded
NOTE: Running task 3048 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_compile)
NOTE: recipe libva-2.19.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_compile: Succeeded
NOTE: Running task 3050 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_install)
NOTE: recipe libva-2.19.0-r0: task do_install: Started
NOTE: recipe libva-2.19.0-r0: task do_install: Succeeded
NOTE: Running task 3051 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_package)
NOTE: Running task 3052 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_populate_sysroot)
NOTE: recipe libva-2.19.0-r0: task do_package: Started
NOTE: recipe libva-2.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3053 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3054 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_configure: Started
NOTE: recipe libva-2.19.0-r0: task do_package: Succeeded
NOTE: Running task 3055 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_packagedata)
NOTE: recipe libva-2.19.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.19.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3056 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_create_spdx)
NOTE: recipe libva-2.19.0-r0: task do_create_spdx: Started
NOTE: recipe libva-2.19.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3057 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3058 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3059 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3060 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_package)
NOTE: Running task 3061 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3062 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3063 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_create_spdx)
NOTE: Running task 3064 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_package_write_rpm)
NOTE: Running task 3065 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3066 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3067 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_build)
NOTE: Tasks Summary: Attempted 3067 tasks of which 3031 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 173 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcuda-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codectimestamper went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-cuda-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ka went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7841560249126860948==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-vaapi-upgrade-1.22.4-1.22.5.patch"

RnJvbSBiNjI4NzYyN2FlYjVlZDI4NWFkMmJjZDViNmQ0MGEyZWJmOTJkZjhlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMTg6NDM6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtdmFhcGk6IHVwZ3JhZGUgMS4yMi40IC0+IDEuMjIuNQoKLS0tCiAuLi5zdHJl
YW1lcjEuMC12YWFwaV8xLjIyLjQuYmIgPT4gZ3N0cmVhbWVyMS4wLXZhYXBpXzEuMjIuNS5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC12YWFw
aV8xLjIyLjQuYmIgPT4gZ3N0cmVhbWVyMS4wLXZhYXBpXzEuMjIuNS5iYn0gKDk1JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXZh
YXBpXzEuMjIuNC5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtdmFhcGlfMS4yMi41LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtdmFhcGlfMS4yMi40
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXZhYXBpXzEuMjIuNS5iYgppbmRleCAzNGMxNWJiMzc3Li4yMzFkMjUyMzIzIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXZhYXBp
XzEuMjIuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLXZhYXBpXzEuMjIuNS5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HLkxJQjttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUx
NmMiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy8k
e1JFQUxQTn0vJHtSRUFMUE59LSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
Ijk2N2I4ZTM1M2Q4MmQwMDgxYTY4ZGM1MzYzOWIyNWQ5ZmI0Y2E4OWJmYTFlMDYxNDAzZTBjZDdk
MjM1ODViYTYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTlhNTUwMjY3Yzk1ODRkZjBlOGM3MDQz
NGQzMDQ3NmU4ZmQwMDE4YjczM2MxYzFlZTMzZGVhZjQyMmJkYjI0YiIKIAogUyA9ICIke1dPUktE
SVJ9LyR7UkVBTFBOfS0ke1BWfSIKIERFUEVORFMgPSAibGlidmEgZ3N0cmVhbWVyMS4wIGdzdHJl
YW1lcjEuMC1wbHVnaW5zLWJhc2UgZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkIgotLSAKMi4zOS4y
Cgo=

--===============7841560249126860948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c07df41cae6093c7639b6d25a74f5dc972bef08e"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 114 Local 98 Mirrors 0 Missed 16 Current 1029 (85% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1077 of 1143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1089 of 1143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1140 of 1143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 2741 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_recipe_qa)
NOTE: Running task 2827 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_recipe_qa)
NOTE: Running task 2887 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_write_config)
NOTE: Running task 2966 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_write_config)
NOTE: recipe libva-2.19.0-r0: task do_recipe_qa: Started
NOTE: recipe libva-2.19.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_write_config: Started
NOTE: recipe libva-2.19.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3067 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3068 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_fetch)
NOTE: recipe libva-2.19.0-r0: task do_fetch: Started
NOTE: recipe libva-2.19.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_fetch: Started
NOTE: Running task 3069 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_unpack)
NOTE: Running task 3070 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_fetch: Succeeded
NOTE: Running task 3071 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_unpack)
NOTE: recipe libva-2.19.0-r0: task do_unpack: Started
NOTE: recipe libva-2.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_unpack: Started
NOTE: recipe libva-2.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 3072 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_patch)
NOTE: Running task 3073 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_collect_spdx_deps)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gstreamer1.0-plugins-bad/1.22.4/temp/log.do_packagedata_setscene.1758394
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1141 of 1143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_package_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_patch: Started
NOTE: recipe libva-2.19.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3074 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_patch: Started
NOTE: recipe libva-2.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_patch: Succeeded
NOTE: Running task 3075 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3076 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_populate_lic)
NOTE: recipe libva-2.19.0-r0: task do_patch: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3077 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libva-2.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_populate_lic unihash changed to 956676230d0ec5ab4172e606c0166c4861489cd98fa9a56031771a85a38c5b1b
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3078 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_package_setscene: Started
NOTE: recipe libva-2.19.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1143 of 1143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3090 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_packagedata)
NOTE: recipe libva-2.19.0-r0: task do_configure: Succeeded
NOTE: Running task 3093 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_packagedata: Started
NOTE: recipe libva-2.19.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_compile: Succeeded
NOTE: Running task 3095 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_install)
NOTE: recipe libva-2.19.0-r0: task do_install: Started
NOTE: recipe libva-2.19.0-r0: task do_install: Succeeded
NOTE: Running task 3096 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_package)
NOTE: Running task 3097 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_populate_sysroot)
NOTE: recipe libva-2.19.0-r0: task do_package: Started
NOTE: recipe libva-2.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3098 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3099 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_configure: Started
NOTE: recipe libva-2.19.0-r0: task do_package: Succeeded
NOTE: Running task 3100 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_packagedata)
NOTE: recipe libva-2.19.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.19.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3101 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_create_spdx)
NOTE: recipe libva-2.19.0-r0: task do_create_spdx: Started
NOTE: recipe libva-2.19.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3102 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3103 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3104 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3105 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_package)
NOTE: Running task 3106 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3107 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3108 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_create_spdx)
NOTE: Running task 3109 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_package_write_rpm)
NOTE: Running task 3110 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3111 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3112 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_build)
NOTE: Tasks Summary: Attempted 3112 tasks of which 3076 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 173 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcuda-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codectimestamper went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-cuda-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ka went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7841560249126860948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1805 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1805 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c07df41cae6093c7639b6d25a74f5dc972bef08e"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 112 Local 96 Mirrors 0 Missed 16 Current 1039 (85% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1086 of 1151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1098 of 1151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1148 of 1151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 2761 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_recipe_qa)
NOTE: Running task 2847 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_recipe_qa)
NOTE: Running task 2907 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_write_config)
NOTE: Running task 2986 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_write_config)
NOTE: recipe libva-2.19.0-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe libva-2.19.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_write_config: Started
NOTE: recipe libva-2.19.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_write_config: Succeeded
NOTE: Running task 3091 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3092 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_fetch)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_write_config: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-bad/1.22.4/temp/log.do_packagedata_setscene.1664265
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1149 of 1151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_package_setscene)
NOTE: recipe libva-2.19.0-r0: task do_fetch: Started
NOTE: recipe libva-2.19.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_fetch: Succeeded
NOTE: Running task 3093 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_unpack)
NOTE: Running task 3094 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_unpack)
NOTE: Running task 3095 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libva-2.19.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_unpack: Started
NOTE: recipe libva-2.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 3096 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_patch)
NOTE: Running task 3097 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_unpack: Succeeded
NOTE: Running task 3098 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_patch)
NOTE: recipe libva-2.19.0-r0: task do_patch: Started
NOTE: recipe libva-2.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_patch: Succeeded
NOTE: Running task 3099 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3100 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_package_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_populate_lic unihash changed to 956676230d0ec5ab4172e606c0166c4861489cd98fa9a56031771a85a38c5b1b
NOTE: recipe libva-2.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_patch: Succeeded
NOTE: Running task 3101 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libva-2.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libva-2.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3102 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_configure)
NOTE: recipe libva-2.19.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1151 of 1151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3114 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_packagedata: Started
NOTE: recipe libva-2.19.0-r0: task do_configure: Succeeded
NOTE: Running task 3117 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_compile)
NOTE: recipe libva-2.19.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_compile: Succeeded
NOTE: Running task 3119 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_install)
NOTE: recipe libva-2.19.0-r0: task do_install: Started
NOTE: recipe libva-2.19.0-r0: task do_install: Succeeded
NOTE: Running task 3120 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_package)
NOTE: Running task 3121 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_populate_sysroot)
NOTE: recipe libva-2.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.19.0-r0: task do_package: Started
NOTE: recipe libva-2.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3122 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3123 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_configure: Started
NOTE: recipe libva-2.19.0-r0: task do_package: Succeeded
NOTE: Running task 3124 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_packagedata)
NOTE: recipe libva-2.19.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.19.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3125 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_create_spdx)
NOTE: recipe libva-2.19.0-r0: task do_create_spdx: Started
NOTE: recipe libva-2.19.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3126 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3127 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3128 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3129 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_package)
NOTE: Running task 3130 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3131 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3132 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_create_spdx)
NOTE: Running task 3133 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_package_write_rpm)
NOTE: Running task 3134 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3135 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3136 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb:do_build)
NOTE: Tasks Summary: Attempted 3136 tasks of which 3100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 173 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcuda-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codectimestamper went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-cuda-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ka went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7841560249126860948==--

