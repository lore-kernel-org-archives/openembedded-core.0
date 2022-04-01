Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A839BC47089
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:43 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.10557.1648819422009193513
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=uM2jrU1F;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 0101017fe54bc0ae-67d7577e-14d6-4167-9f51-1b19253f32ca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819421;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=i4l+QsXOJm1ZBmb4OSWa97sekIdlELYjVgx3K2j1gHo=;
	b=uM2jrU1F/TK0zBJ9uKWtJxUsRRYJpdxSE3+Pxc8PJjVsXQm1NfFJazhKZpduuuQF
	pgZDy4qZbsN46RBdttjRddX/mQEESOQ3mRQGU00SXQsU1seggVFztWLH9SsoLniur5E
	bNaYiZQzDI82Mtu/HAvSG6gPqgmNEAvFQTNdIWDo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819421;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=i4l+QsXOJm1ZBmb4OSWa97sekIdlELYjVgx3K2j1gHo=;
	b=TR0WcpR7omSm5Z9e9QkIb66AdLPXpC29mts83e+MS11ward1p2ZLRT4jwy0GJVs4
	jhyipVbQSId7mprku5n32idpRUuaBDhp5asQNvd6lkHZSXuDOKnjvrHG2ZgTw4zXd2s
	6q1ATw4SutZm9/iJhabNShwXz2Hfu5a6TUXMpH3Y=
Content-Type: multipart/mixed; boundary="===============8631165890146571538=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xwayland: upgrading to 22.1.1 SUCCEEDED
Message-ID: 
 <0101017fe54bc0ae-67d7577e-14d6-4167-9f51-1b19253f32ca-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163929

--===============8631165890146571538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xwayland* to *22.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xwayland-upgrade-22.1.0-22.1.1.patch
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
--===============8631165890146571538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1640 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (881 cached, 1 parsed). 1640 targets, 34 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:acb56a820f8f9eb611de9deb088159d604e8fc99"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 19 Mirrors 0 Missed 32 Current 363 (37% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 369 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 387 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1149 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_fetch)
NOTE: Running task 1174 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: Running task 1189 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: Running task 1209 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_fetch)
NOTE: Running task 1210 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_fetch)
NOTE: Running task 1302 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_fetch)
NOTE: Running task 1309 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
NOTE: Running task 1314 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_write_config)
NOTE: Running task 1325 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_write_config)
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_write_config: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_write_config: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 1329 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_unpack)
NOTE: Running task 1330 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1331 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
NOTE: Running task 1332 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_unpack)
NOTE: Running task 1333 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_unpack)
NOTE: Running task 1334 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: Running task 1335 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: recipe mesa-2_22.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xwayland-22.1.1-r0: task do_write_config: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_write_config: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1336 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_unpack)
NOTE: Running task 1337 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libx11/1_1.7.3.1-r0/temp/log.do_packagedata_setscene.867007
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 413 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_package_setscene)
NOTE: recipe libxcvt-0.1.1-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1343 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_patch)
NOTE: recipe libxcvt-0.1.1-r0: task do_unpack: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1344 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: Running task 1345 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: Running task 1346 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_patch)
NOTE: Running task 1347 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_patch)
NOTE: Running task 1348 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_patch)
NOTE: Running task 1349 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe font-util-1.3.2-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_patch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1350 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1351 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1352 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1353 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_lic)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: Running task 1354 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1355 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1356 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1357 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_lic: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_lic unihash changed to 4a3a8d00bc6400162fca506068bb677fa0d3f3be7fd1bcbf9e6b300e45ae58d8
NOTE: recipe xwayland-22.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1358 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_configure)
NOTE: Running task 1359 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_configure)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_package_setscene: Started
NOTE: recipe font-util-1.3.2-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_configure: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1370 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata)
NOTE: Running task 1415 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1442 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1443 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_configure: Succeeded
NOTE: recipe mesa-2_22.0.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1444 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_compile)
NOTE: recipe libxcvt-0.1.1-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1445 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_install)
NOTE: recipe libxcvt-0.1.1-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_install: Succeeded
NOTE: Running task 1446 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_populate_sysroot)
NOTE: Running task 1447 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_package)
NOTE: recipe libxcvt-0.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_package: Succeeded
NOTE: Running task 1448 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.1-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1449 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1450 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_install)
NOTE: recipe font-util-1.3.2-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1451 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 1452 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package)
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1453 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1454 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 1455 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_packagedata)
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1456 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1457 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1458 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: Running task 1459 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1460 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1461 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1462 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1463 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1464 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 1465 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 1466 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1467 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1468 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_configure)
NOTE: recipe libxfont2-2.0.5-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 1469 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: Running task 1470 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 1471 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 1472 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Succeeded
NOTE: Running task 1473 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1474 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_configure: Succeeded
NOTE: Running task 1475 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_compile)
NOTE: recipe libxfont2-2.0.5-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_compile: Succeeded
NOTE: Running task 1476 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_install)
NOTE: recipe libxfont2-2.0.5-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_install: Succeeded
NOTE: Running task 1477 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_populate_sysroot)
NOTE: Running task 1478 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_package)
NOTE: recipe libxfont2-2.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1479 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-22.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1480 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_configure)
NOTE: recipe xwayland-22.1.1-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_package: Succeeded
NOTE: Running task 1481 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.5-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_packagedata: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1482 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_compile)
NOTE: recipe xwayland-22.1.1-r0: task do_compile: Started
NOTE: recipe xwayland-22.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1483 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_install)
NOTE: recipe xwayland-22.1.1-r0: task do_install: Started
NOTE: recipe xwayland-22.1.1-r0: task do_install: Succeeded
NOTE: Running task 1484 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package)
NOTE: Running task 1485 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_sysroot)
NOTE: recipe xwayland-22.1.1-r0: task do_package: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_package: Succeeded
NOTE: Running task 1486 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_packagedata)
NOTE: recipe xwayland-22.1.1-r0: task do_packagedata: Started
NOTE: recipe xwayland-22.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1487 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package_write_rpm)
NOTE: Running task 1488 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package_qa)
NOTE: recipe xwayland-22.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-22.1.1-r0: task do_package_qa: Started
NOTE: recipe xwayland-22.1.1-r0: task do_package_qa: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1489 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1489 tasks of which 1404 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8631165890146571538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xwayland: PV changed from "22.1.0" to "22.1.1"
packages/core2-32-poky-linux/xwayland: SRC_URI changed from "https://www.x.org/archive/individual/xserver/xwayland-22.1.0.tar.xz" to "https://www.x.org/archive/individual/xserver/xwayland-22.1.1.tar.xz"
packages/core2-32-poky-linux/xwayland: PKGV changed from 22.1.0 [default] to 22.1.1 [default]
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PV changed from "22.1.0" to "22.1.1"
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PKGV changed from 22.1.0 [default] to 22.1.1 [default]
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PKGSIZE changed from 10254596 to 10255360 (+0%)
packages/core2-32-poky-linux/xwayland/xwayland-dev: PV changed from "22.1.0" to "22.1.1"
packages/core2-32-poky-linux/xwayland/xwayland-dev: PKGV changed from 22.1.0 [default] to 22.1.1 [default]
packages/core2-32-poky-linux/xwayland/xwayland-doc: PV changed from "22.1.0" to "22.1.1"
packages/core2-32-poky-linux/xwayland/xwayland-doc: PKGV changed from 22.1.0 [default] to 22.1.1 [default]
packages/core2-32-poky-linux/xwayland/xwayland-locale: PV changed from "22.1.0" to "22.1.1"
packages/core2-32-poky-linux/xwayland/xwayland-locale: PKGV changed from 22.1.0 [default] to 22.1.1 [default]
packages/core2-32-poky-linux/xwayland/xwayland-src: PV changed from "22.1.0" to "22.1.1"
packages/core2-32-poky-linux/xwayland/xwayland-src: PKGV changed from 22.1.0 [default] to 22.1.1 [default]
packages/core2-32-poky-linux/xwayland/xwayland-src: PKGSIZE changed from 8588100 to 8589131 (+0%)
packages/core2-32-poky-linux/xwayland/xwayland-staticdev: PV changed from "22.1.0" to "22.1.1"
packages/core2-32-poky-linux/xwayland/xwayland-staticdev: PKGV changed from 22.1.0 [default] to 22.1.1 [default]
packages/core2-32-poky-linux/xwayland/xwayland: PV changed from "22.1.0" to "22.1.1"
packages/core2-32-poky-linux/xwayland/xwayland: PKGV changed from 22.1.0 [default] to 22.1.1 [default]

--===============8631165890146571538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 69 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:acb56a820f8f9eb611de9deb088159d604e8fc99"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 19 Mirrors 0 Missed 32 Current 363 (37% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 369 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 387 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1150 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_fetch)
NOTE: Running task 1174 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: Running task 1190 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: Running task 1209 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_fetch)
NOTE: Running task 1210 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_fetch)
NOTE: Running task 1302 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_fetch)
NOTE: Running task 1309 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
NOTE: Running task 1314 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_write_config)
NOTE: Running task 1325 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_write_config)
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_write_config: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_fetch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_write_config: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1329 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_unpack)
NOTE: recipe xwayland-22.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1330 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1331 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: Running task 1332 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
NOTE: Running task 1333 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_unpack)
NOTE: Running task 1334 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_unpack)
NOTE: Running task 1335 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: recipe mesa-2_22.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1336 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_unpack)
NOTE: Running task 1337 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.1-r0: task do_write_config: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_write_config: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_prepare_recipe_sysroot: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libx11/1_1.7.3.1-r0/temp/log.do_packagedata_setscene.945436
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 413 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_package_setscene)
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 1343 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_patch)
NOTE: recipe libxcvt-0.1.1-r0: task do_unpack: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1344 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: Running task 1345 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: Running task 1346 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_patch)
NOTE: Running task 1347 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_patch)
NOTE: Running task 1348 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_patch)
NOTE: Running task 1349 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: recipe font-util-1.3.2-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1350 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xwayland-22.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1351 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1352 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1353 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_lic)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_patch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: Running task 1354 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1355 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1356 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1357 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_lic: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_lic unihash changed to 4a3a8d00bc6400162fca506068bb677fa0d3f3be7fd1bcbf9e6b300e45ae58d8
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1358 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_configure)
NOTE: Running task 1359 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_configure)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_package_setscene: Started
NOTE: recipe font-util-1.3.2-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_configure: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1370 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata)
NOTE: Running task 1415 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1442 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1443 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1444 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_compile)
NOTE: recipe libxcvt-0.1.1-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1445 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_install)
NOTE: recipe libxcvt-0.1.1-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_install: Succeeded
NOTE: Running task 1446 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_populate_sysroot)
NOTE: Running task 1447 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_package)
NOTE: recipe libxcvt-0.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_package: Succeeded
NOTE: Running task 1448 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.1-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1449 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1450 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_install)
NOTE: recipe font-util-1.3.2-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1451 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 1452 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package)
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1453 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1454 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 1455 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_packagedata)
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1456 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1457 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1458 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: Running task 1459 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1460 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1461 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1462 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe mesa-2_22.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1463 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1464 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 1465 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 1466 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1467 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1468 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_configure)
NOTE: recipe libxfont2-2.0.5-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 1469 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: Running task 1470 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 1471 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 1472 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Succeeded
NOTE: Running task 1473 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1474 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_configure: Succeeded
NOTE: Running task 1475 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_compile)
NOTE: recipe libxfont2-2.0.5-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_compile: Succeeded
NOTE: Running task 1476 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_install)
NOTE: recipe libxfont2-2.0.5-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_install: Succeeded
NOTE: Running task 1477 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_populate_sysroot)
NOTE: Running task 1478 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_package)
NOTE: recipe libxfont2-2.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1479 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-22.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1480 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_configure)
NOTE: recipe xwayland-22.1.1-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_package: Succeeded
NOTE: Running task 1481 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.5-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_packagedata: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1482 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_compile)
NOTE: recipe xwayland-22.1.1-r0: task do_compile: Started
NOTE: recipe xwayland-22.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1483 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_install)
NOTE: recipe xwayland-22.1.1-r0: task do_install: Started
NOTE: recipe xwayland-22.1.1-r0: task do_install: Succeeded
NOTE: Running task 1484 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package)
NOTE: Running task 1485 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_sysroot)
NOTE: recipe xwayland-22.1.1-r0: task do_package: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_package: Succeeded
NOTE: Running task 1486 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_packagedata)
NOTE: recipe xwayland-22.1.1-r0: task do_packagedata: Started
NOTE: recipe xwayland-22.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1487 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package_write_rpm)
NOTE: Running task 1488 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package_qa)
NOTE: recipe xwayland-22.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-22.1.1-r0: task do_package_qa: Started
NOTE: recipe xwayland-22.1.1-r0: task do_package_qa: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1489 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1489 tasks of which 1404 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8631165890146571538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 52 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:acb56a820f8f9eb611de9deb088159d604e8fc99"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 19 Mirrors 0 Missed 32 Current 363 (37% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 369 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 387 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1149 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_fetch)
NOTE: Running task 1174 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: Running task 1189 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: Running task 1208 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_fetch)
NOTE: Running task 1211 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_fetch)
NOTE: Running task 1302 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_fetch)
NOTE: Running task 1309 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
NOTE: Running task 1311 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_write_config)
NOTE: Running task 1325 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_write_config)
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_fetch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_write_config: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_write_config: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 1329 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: recipe xwayland-22.1.1-r0: task do_write_config: Succeeded
NOTE: Running task 1330 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_unpack)
NOTE: Running task 1331 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1332 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
NOTE: Running task 1333 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_unpack)
NOTE: Running task 1334 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_unpack)
NOTE: Running task 1335 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: recipe libxcvt-0.1.1-r0: task do_write_config: Succeeded
NOTE: Running task 1336 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_unpack)
NOTE: Running task 1337 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_22.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libx11/1_1.7.3.1-r0/temp/log.do_packagedata_setscene.893226
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 413 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_package_setscene)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
NOTE: recipe xwayland-22.1.1-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1343 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_patch)
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_unpack: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_unpack: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1344 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: Running task 1345 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: Running task 1346 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_patch)
NOTE: Running task 1347 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_patch)
NOTE: Running task 1348 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_patch)
NOTE: Running task 1349 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: recipe font-util-1.3.2-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_patch: Started
NOTE: recipe font-util-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_patch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1350 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1351 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1352 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1353 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_lic)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_patch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: Running task 1354 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1355 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1356 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1357 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_lic: Started
NOTE: recipe xwayland-22.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_lic unihash changed to 4a3a8d00bc6400162fca506068bb677fa0d3f3be7fd1bcbf9e6b300e45ae58d8
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1358 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_configure)
NOTE: Running task 1359 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_configure)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_package_setscene: Started
NOTE: recipe font-util-1.3.2-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_configure: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1370 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata)
NOTE: Running task 1415 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1442 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_package_write_rpm)
NOTE: Running task 1443 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1444 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_compile)
NOTE: recipe libxcvt-0.1.1-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1445 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_install)
NOTE: recipe libxcvt-0.1.1-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_install: Succeeded
NOTE: Running task 1446 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_populate_sysroot)
NOTE: Running task 1447 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_package)
NOTE: recipe libxcvt-0.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_package: Succeeded
NOTE: Running task 1448 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.1-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1449 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1450 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_install)
NOTE: recipe font-util-1.3.2-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1451 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 1452 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package)
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1453 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1454 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 1455 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_packagedata)
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1456 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1457 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1458 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: Running task 1459 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1460 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1461 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1462 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1463 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1464 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 1465 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 1466 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1467 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1468 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_configure)
NOTE: recipe libxfont2-2.0.5-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 1469 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: Running task 1470 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 1471 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 1472 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Succeeded
NOTE: Running task 1473 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1474 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_configure: Succeeded
NOTE: Running task 1475 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_compile)
NOTE: recipe libxfont2-2.0.5-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_compile: Succeeded
NOTE: Running task 1476 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_install)
NOTE: recipe libxfont2-2.0.5-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_install: Succeeded
NOTE: Running task 1477 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_populate_sysroot)
NOTE: Running task 1478 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_package)
NOTE: recipe libxfont2-2.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1479 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-22.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1480 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_configure)
NOTE: recipe xwayland-22.1.1-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_package: Succeeded
NOTE: Running task 1481 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.5-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_packagedata: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1482 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_compile)
NOTE: recipe xwayland-22.1.1-r0: task do_compile: Started
NOTE: recipe xwayland-22.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1483 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_install)
NOTE: recipe xwayland-22.1.1-r0: task do_install: Started
NOTE: recipe xwayland-22.1.1-r0: task do_install: Succeeded
NOTE: Running task 1484 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package)
NOTE: Running task 1485 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_sysroot)
NOTE: recipe xwayland-22.1.1-r0: task do_package: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_package: Succeeded
NOTE: Running task 1486 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_packagedata)
NOTE: recipe xwayland-22.1.1-r0: task do_packagedata: Started
NOTE: recipe xwayland-22.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1487 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package_write_rpm)
NOTE: Running task 1488 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package_qa)
NOTE: recipe xwayland-22.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-22.1.1-r0: task do_package_qa: Started
NOTE: recipe xwayland-22.1.1-r0: task do_package_qa: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1489 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1489 tasks of which 1404 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8631165890146571538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1641 targets, 50 skipped, 0 masked, 0 errors.
Removing 56 recipes from the core2-32 sysroot...done.
Removing 55 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:acb56a820f8f9eb611de9deb088159d604e8fc99"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 240 Local 208 Mirrors 0 Missed 32 Current 173 (86% match, 92% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 186 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 191 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 201 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 205 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 213 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 732 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_fetch)
NOTE: Running task 755 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: Running task 762 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: Running task 764 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_fetch)
NOTE: Running task 765 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_fetch)
NOTE: Running task 816 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_fetch)
NOTE: Running task 817 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
NOTE: Running task 818 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_write_config)
NOTE: Running task 821 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_write_config)
NOTE: recipe freetype-2.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_write_config: Started
NOTE: recipe xwayland-22.1.1-r0: task do_write_config: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 822 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_unpack)
NOTE: Running task 823 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: Running task 824 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
NOTE: recipe xwayland-22.1.1-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 825 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_unpack)
NOTE: Running task 826 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: Running task 827 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_unpack)
NOTE: recipe libxcvt-0.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_write_config: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_write_config: Succeeded
NOTE: Running task 828 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_unpack)
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
NOTE: recipe xwayland-22.1.1-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 225 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_unpack: Started
NOTE: Running task 829 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_patch)
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: Running setscene task 227 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 230 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 231 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 839 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: Running task 840 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: Running task 841 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 847 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_patch)
NOTE: recipe font-util-1.3.2-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_unpack: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: Running task 848 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_patch)
NOTE: recipe xwayland-22.1.1-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_patch: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 849 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_patch)
NOTE: recipe mesa-2_22.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_patch: Started
NOTE: recipe font-util-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 850 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xwayland-22.1.1-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: Running task 851 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_patch: Succeeded
NOTE: Running task 852 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 853 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 854 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_patch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_patch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_22.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 859 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 235 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_package_setscene)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 860 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 861 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_lic)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_lic: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_lic unihash changed to 4a3a8d00bc6400162fca506068bb677fa0d3f3be7fd1bcbf9e6b300e45ae58d8
NOTE: recipe xwayland-22.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_22.0.0-r0: task do_package_setscene: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 236 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_packagedata_setscene)
NOTE: Running setscene task 237 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 238 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 239 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 240 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 241 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 242 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 243 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 244 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 245 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 246 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 247 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 248 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 250 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 253 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 256 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 258 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 261 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 264 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 266 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 269 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 273 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 277 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 282 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 284 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 289 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 291 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libx11/1_1.7.3.1-r0/temp/log.do_packagedata_setscene.975248
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 293 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_package_setscene)
NOTE: recipe python3-3.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 295 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 303 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 304 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 305 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 307 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 308 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 309 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 310 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 312 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_package_setscene: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 318 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 325 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 331 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 344 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_package_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 347 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 349 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 356 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 358 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 361 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 363 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 368 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 374 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 376 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 380 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 383 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 386 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 388 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+6d8a515796-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 390 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+6d8a515796-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 392 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 395 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+6d8a515796-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+6d8a515796-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 400 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 401 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 407 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 410 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 411 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1285 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata)
NOTE: Running task 1358 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1383 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1395 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1432 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_package_write_rpm)
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1433 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1434 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe libxcvt-0.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1435 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_configure)
NOTE: recipe font-util-1.3.2-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1436 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_compile)
NOTE: recipe libxcvt-0.1.1-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1437 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_install)
NOTE: recipe libxcvt-0.1.1-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_install: Succeeded
NOTE: Running task 1438 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_populate_sysroot)
NOTE: Running task 1439 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_package)
NOTE: recipe libxcvt-0.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_package: Succeeded
NOTE: Running task 1440 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.1-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1441 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1442 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_install)
NOTE: recipe font-util-1.3.2-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1443 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 1444 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package)
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1445 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1446 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 1447 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_packagedata)
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1448 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1449 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1450 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: Running task 1451 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1452 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1453 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1454 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1455 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1456 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 1457 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 1458 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1459 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1460 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_configure)
NOTE: recipe libxfont2-2.0.5-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 1461 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: Running task 1462 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 1463 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 1464 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Succeeded
NOTE: Running task 1465 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1466 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_configure: Succeeded
NOTE: Running task 1467 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_compile)
NOTE: recipe libxfont2-2.0.5-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_compile: Succeeded
NOTE: Running task 1468 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_install)
NOTE: recipe libxfont2-2.0.5-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_install: Succeeded
NOTE: Running task 1469 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_populate_sysroot)
NOTE: Running task 1470 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_package)
NOTE: recipe libxfont2-2.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1471 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-22.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1472 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_configure)
NOTE: recipe xwayland-22.1.1-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_package: Succeeded
NOTE: Running task 1473 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.5-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_packagedata: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1474 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_compile)
NOTE: recipe xwayland-22.1.1-r0: task do_compile: Started
NOTE: recipe xwayland-22.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1475 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_install)
NOTE: recipe xwayland-22.1.1-r0: task do_install: Started
NOTE: recipe xwayland-22.1.1-r0: task do_install: Succeeded
NOTE: Running task 1476 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package)
NOTE: Running task 1477 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_sysroot)
NOTE: recipe xwayland-22.1.1-r0: task do_package: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_package: Succeeded
NOTE: Running task 1478 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_packagedata)
NOTE: recipe xwayland-22.1.1-r0: task do_packagedata: Started
NOTE: recipe xwayland-22.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1479 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package_write_rpm)
NOTE: Running task 1480 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package_qa)
NOTE: recipe xwayland-22.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-22.1.1-r0: task do_package_qa: Started
NOTE: recipe xwayland-22.1.1-r0: task do_package_qa: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1481 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1481 tasks of which 1396 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8631165890146571538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 62 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:acb56a820f8f9eb611de9deb088159d604e8fc99"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 19 Mirrors 0 Missed 32 Current 363 (37% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 369 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 387 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1150 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_fetch)
NOTE: Running task 1174 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: Running task 1190 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: Running task 1208 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_fetch)
NOTE: Running task 1210 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_fetch)
NOTE: Running task 1302 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_fetch)
NOTE: Running task 1309 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
NOTE: Running task 1313 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_write_config)
NOTE: Running task 1325 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_write_config)
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_write_config: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_write_config: Started
NOTE: Running task 1329 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_unpack)
NOTE: Running task 1330 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1331 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: Running task 1332 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
NOTE: Running task 1333 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_unpack)
NOTE: recipe libxcvt-0.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1334 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_unpack)
NOTE: Running task 1335 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: Running task 1336 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_unpack)
NOTE: Running task 1337 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_22.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_write_config: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_write_config: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
NOTE: recipe xwayland-22.1.1-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_unpack: Started
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libx11/1_1.7.3.1-r0/temp/log.do_packagedata_setscene.919320
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 413 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_package_setscene)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1343 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_patch)
NOTE: recipe libxcvt-0.1.1-r0: task do_unpack: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1344 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: Running task 1345 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: Running task 1346 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_patch)
NOTE: Running task 1347 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_patch)
NOTE: Running task 1348 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_patch)
NOTE: Running task 1349 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: recipe font-util-1.3.2-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_patch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1350 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1351 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1352 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1353 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_lic)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_patch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: Running task 1354 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1355 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1356 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1357 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_lic: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_lic: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_lic unihash changed to 4a3a8d00bc6400162fca506068bb677fa0d3f3be7fd1bcbf9e6b300e45ae58d8
NOTE: recipe libxcvt-0.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1358 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_configure)
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1359 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_configure)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_package_setscene: Started
NOTE: recipe font-util-1.3.2-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_configure: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1370 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata)
NOTE: Running task 1415 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1442 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1443 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe libxcvt-0.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1444 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1445 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_install)
NOTE: recipe libxcvt-0.1.1-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_install: Succeeded
NOTE: Running task 1446 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_populate_sysroot)
NOTE: Running task 1447 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_package)
NOTE: recipe libxcvt-0.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_package: Succeeded
NOTE: Running task 1448 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.1-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1449 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1450 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_install)
NOTE: recipe font-util-1.3.2-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1451 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 1452 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package)
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1453 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1454 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 1455 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_packagedata)
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1456 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1457 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1458 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: Running task 1459 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1460 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1461 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1462 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1463 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1464 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 1465 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 1466 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1467 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1468 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_configure)
NOTE: recipe libxfont2-2.0.5-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 1469 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: Running task 1470 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 1471 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 1472 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Succeeded
NOTE: Running task 1473 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1474 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_configure: Succeeded
NOTE: Running task 1475 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_compile)
NOTE: recipe libxfont2-2.0.5-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_compile: Succeeded
NOTE: Running task 1476 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_install)
NOTE: recipe libxfont2-2.0.5-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_install: Succeeded
NOTE: Running task 1477 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_populate_sysroot)
NOTE: Running task 1478 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_package)
NOTE: recipe libxfont2-2.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1479 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-22.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1480 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_configure)
NOTE: recipe xwayland-22.1.1-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_package: Succeeded
NOTE: Running task 1481 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.5-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_packagedata: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1482 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_compile)
NOTE: recipe xwayland-22.1.1-r0: task do_compile: Started
NOTE: recipe xwayland-22.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1483 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_install)
NOTE: recipe xwayland-22.1.1-r0: task do_install: Started
NOTE: recipe xwayland-22.1.1-r0: task do_install: Succeeded
NOTE: Running task 1484 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package)
NOTE: Running task 1485 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_sysroot)
NOTE: recipe xwayland-22.1.1-r0: task do_package: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_package: Succeeded
NOTE: Running task 1486 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_packagedata)
NOTE: recipe xwayland-22.1.1-r0: task do_packagedata: Started
NOTE: recipe xwayland-22.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1487 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package_write_rpm)
NOTE: Running task 1488 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package_qa)
NOTE: recipe xwayland-22.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-22.1.1-r0: task do_package_qa: Started
NOTE: recipe xwayland-22.1.1-r0: task do_package_qa: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1489 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1489 tasks of which 1404 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.7.4-r0 to 1:1.7.3.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.3.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8631165890146571538==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-22.1.0-22.1.1.patch"

From 3256a6e969cd5ed3b290e3d45d751d8fe5bcec60 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Apr 2022 12:09:40 +0000
Subject: [PATCH] xwayland: upgrade 22.1.0 -> 22.1.1

---
 .../xwayland/{xwayland_22.1.0.bb => xwayland_22.1.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.0.bb => xwayland_22.1.1.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.0.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_22.1.0.bb
rename to meta/recipes-graphics/xwayland/xwayland_22.1.1.bb
index 9769235ce6..b512b9932d 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.0.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "1752d6d0a930e71292b5a308d3811ebd54d8cc68cacff44de654265b8617a2bf"
+SRC_URI[sha256sum] = "f5d0e0ba37e19bb87c62f61da5970bd204939f2120620964bed4cc8495baa657"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.27.0


--===============8631165890146571538==--

