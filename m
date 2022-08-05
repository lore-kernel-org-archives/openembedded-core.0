Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0B6C48BE4
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:37 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web08.3860.1659679409046626788
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dE1//30N;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 010101826c99ffd5-6f435ff4-1c9a-4770-b491-535b8ecc4df5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rzA43ZA/Hm7jH6KGwDQoTDqs91rBwDFT3zhhlqMxEUU=;
	b=dE1//30NELVy3RgNIyqXLsF/hi18Trb3N8NrUvvBHlo69Utk8xt+bjZp64s726+n
	kHaIZn1GxyA8Fp9NI40wJPTcOla+XjPu+Zppl0uXDNoQu9capmu9Tk88J2FBJkzR5m6
	pA+7O5USWvw4cLVEAXNpUOJ6sZOHoSbtFAxBPVeM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rzA43ZA/Hm7jH6KGwDQoTDqs91rBwDFT3zhhlqMxEUU=;
	b=cALbeOXV1I0Pnt6Z9xgW7DDSXDPhgj5K62YYw8f/vzUnML0vJe6Uc2tj5dsgyqUU
	Lxz8nJgm5dUd9URqn84pIwowyLB1P7jYy/Hx8uohNSXoAXBSeAOlqeNNb7IwrJhpkHd
	ke67dcGII6rsxFY7bOCUfjsLZ//m1Rfgt8BThVw0=
Content-Type: multipart/mixed; boundary="===============7179129881915748675=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libnotify: upgrading to 0.8.1 SUCCEEDED
Message-ID: 
 <010101826c99ffd5-6f435ff4-1c9a-4770-b491-535b8ecc4df5-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:28 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168916

--===============7179129881915748675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libnotify* to *0.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libnotify-upgrade-0.8.0-0.8.1.patch
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
--===============7179129881915748675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1659 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-bff14b02c48e0b60034ba488cd18164c8bfe2325"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:bff14b02c48e0b60034ba488cd18164c8bfe2325"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 48 Local 18 Mirrors 0 Missed 30 Current 415 (37% match, 93% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 422 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 431 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_populate_sysroot_setscene)
NOTE: Running task 1140 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_fetch)
NOTE: Running task 1175 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_fetch)
NOTE: Running task 1204 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 1208 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1220 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_fetch)
NOTE: Running task 1293 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Succeeded
NOTE: Running task 1296 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1297 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_unpack)
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1310 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: Running task 1314 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1336 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_unpack)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1353 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_write_config)
NOTE: Running task 1444 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1445 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1453 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1484 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_write_config)
NOTE: Running task 1528 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Started
NOTE: Running task 1571 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_write_config)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.1-r0: task do_fetch: Started
NOTE: Running task 1574 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_patch)
NOTE: recipe libnotify-0.8.1-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.1-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: Running task 1575 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_write_config: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_write_config: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1576 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Started
NOTE: recipe libnotify-0.8.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Succeeded
NOTE: Running task 1577 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_patch)
NOTE: recipe libpng-1.6.37-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3/3.10.5-r0/temp/log.do_packagedata_setscene.973284
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 462 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_package_setscene)
NOTE: recipe libnotify-0.8.1-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1578 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_patch)
NOTE: recipe libpng-1.6.37-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Started
NOTE: Running task 1579 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1580 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_generate_toolchain_file)
NOTE: Running task 1581 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_patch: Started
NOTE: Running task 1582 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Succeeded
NOTE: Running task 1583 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_unpack: Succeeded
NOTE: Running task 1584 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_patch)
NOTE: recipe libnotify-0.8.1-r0: task do_patch: Succeeded
NOTE: Running task 1585 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1586 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_populate_lic)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_patch: Started
NOTE: recipe libnotify-0.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.8.1-r0: task do_populate_lic: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1587 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1588 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1589 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.37-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 1590 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.10.5-r0: task do_package_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_populate_lic unihash changed to 5a4f6daea36778167cd782e4bb31f31a02db5f10fb6cfe939f85582362e068a8
NOTE: recipe libnotify-0.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1591 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1592 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 31aeafc9bdefb849a0d9799a7a1cf5dd0a031fa6b225e0337804f44f7a3a2263
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_package_setscene: Succeeded
NOTE: Running task 1593 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Setscene tasks completed
NOTE: Running task 1621 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1629 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1639 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1644 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Started
NOTE: recipe python3-3.10.5-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b2218f556211d104deaba5f8560d1304b0f810691e2f5684aa350a9247ccff14
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1645 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1646 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 1657 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1658 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Succeeded
NOTE: Running task 1659 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot)
NOTE: Running task 1660 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 1661 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Succeeded
NOTE: Running task 1662 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 1663 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 1664 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Succeeded
NOTE: Running task 1665 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 1666 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_compile: Succeeded
NOTE: Running task 1667 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe libpng-1.6.37-r0: task do_install: Started
NOTE: recipe libpng-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 1668 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: Running task 1669 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 1670 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package: Succeeded
NOTE: Running task 1671 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Succeeded
NOTE: Running task 1672 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_install)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Succeeded
NOTE: Running task 1673 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot)
NOTE: Running task 1674 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_package)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1675 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1676 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Succeeded
NOTE: Running task 1677 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure: Succeeded
NOTE: Running task 1678 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1679 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile: Succeeded
NOTE: Running task 1680 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1681 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install: Succeeded
NOTE: Running task 1682 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1683 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_populate_sysroot)
NOTE: Running task 1684 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1685 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnotify-0.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnotify-0.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1686 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_configure)
NOTE: recipe libnotify-0.8.1-r0: task do_configure: Started
NOTE: recipe libnotify-0.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1687 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_compile)
NOTE: recipe libnotify-0.8.1-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_package: Succeeded
NOTE: Running task 1688 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1689 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_install)
NOTE: recipe libnotify-0.8.1-r0: task do_install: Started
NOTE: recipe libnotify-0.8.1-r0: task do_install: Succeeded
NOTE: Running task 1690 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_package)
NOTE: Running task 1691 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_populate_sysroot)
NOTE: recipe libnotify-0.8.1-r0: task do_package: Started
NOTE: recipe libnotify-0.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe libnotify-0.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_package: Succeeded
NOTE: Running task 1692 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_packagedata)
NOTE: recipe libnotify-0.8.1-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1693 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_package_write_rpm)
NOTE: Running task 1694 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_package_qa)
NOTE: recipe libnotify-0.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe libnotify-0.8.1-r0: task do_package_qa: Started
NOTE: recipe libnotify-0.8.1-r0: task do_package_qa: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1695 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1695 tasks of which 1612 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 70 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7179129881915748675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1659 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (887 cached, 1 parsed). 1659 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-bff14b02c48e0b60034ba488cd18164c8bfe2325"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:bff14b02c48e0b60034ba488cd18164c8bfe2325"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 48 Local 18 Mirrors 0 Missed 30 Current 419 (37% match, 93% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 426 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_populate_sysroot_setscene)
NOTE: Running task 1140 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_fetch)
NOTE: Running task 1175 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_fetch)
NOTE: Running task 1209 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 1210 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1223 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_fetch)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1294 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Started
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_fetch: Started
NOTE: Running task 1297 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1326 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_unpack)
NOTE: Running task 1351 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: Running task 1352 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1376 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_unpack)
NOTE: Running task 1392 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_write_config)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Started
NOTE: Running task 1469 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1470 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1471 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: Running task 1503 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_write_config)
NOTE: Running task 1546 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_fetch)
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Started
NOTE: Running task 1589 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_write_config)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1592 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.1-r0: task do_fetch: Started
NOTE: recipe libnotify-0.8.1-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.1-r0: task do_fetch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3/3.10.5-r0/temp/log.do_packagedata_setscene.905789
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 466 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_package_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Started
NOTE: Running task 1593 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_write_config: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_write_config: Succeeded
NOTE: Running task 1594 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_unpack: Started
NOTE: Running task 1595 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_patch)
NOTE: recipe libpng-1.6.37-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_patch: Succeeded
NOTE: Running task 1596 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: recipe libnotify-0.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1597 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1598 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1599 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_patch: Succeeded
NOTE: Running task 1600 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_generate_toolchain_file)
NOTE: Running task 1601 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1602 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_patch)
NOTE: Running task 1603 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1604 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_populate_lic)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.8.1-r0: task do_populate_lic: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_patch: Started
NOTE: Running task 1605 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: Running task 1606 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.10.5-r0: task do_package_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.8.1-r0: task do_populate_lic: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_populate_lic unihash changed to 5a4f6daea36778167cd782e4bb31f31a02db5f10fb6cfe939f85582362e068a8
NOTE: recipe libnotify-0.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1607 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_patch: Succeeded
NOTE: Running task 1608 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1609 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1610 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 0cb395d3538a9407268bc0b3afe0fcee44c439360721ee60d8257140abbfcb76
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1611 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Started
NOTE: recipe python3-3.10.5-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1639 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1647 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1657 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.10.5-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1662 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 363e0d1bb995f81bceb8d8e9d6d721c4c6eec23d0d2d5e0a2bbfe50c79d95211
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1663 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_configure)
NOTE: Running task 1664 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe python3-3.10.5-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 1675 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1676 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Succeeded
NOTE: Running task 1677 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot)
NOTE: Running task 1678 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1679 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Succeeded
NOTE: Running task 1680 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 1681 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 1682 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe libpng-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 1683 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_compile: Started
NOTE: Running task 1684 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_compile: Succeeded
NOTE: Running task 1685 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe libpng-1.6.37-r0: task do_install: Started
NOTE: recipe libpng-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 1686 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: Running task 1687 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 1688 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package: Succeeded
NOTE: Running task 1689 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Succeeded
NOTE: Running task 1690 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_install)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Succeeded
NOTE: Running task 1691 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot)
NOTE: Running task 1692 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_package)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1693 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1694 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Succeeded
NOTE: Running task 1695 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure: Succeeded
NOTE: Running task 1696 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1697 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile: Succeeded
NOTE: Running task 1698 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1699 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install: Succeeded
NOTE: Running task 1700 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1701 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_populate_sysroot)
NOTE: Running task 1702 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1703 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnotify-0.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnotify-0.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1704 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_configure)
NOTE: recipe libnotify-0.8.1-r0: task do_configure: Started
NOTE: recipe libnotify-0.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1705 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_compile)
NOTE: recipe libnotify-0.8.1-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_package: Succeeded
NOTE: Running task 1706 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1707 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_install)
NOTE: recipe libnotify-0.8.1-r0: task do_install: Started
NOTE: recipe libnotify-0.8.1-r0: task do_install: Succeeded
NOTE: Running task 1708 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_package)
NOTE: Running task 1709 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_populate_sysroot)
NOTE: recipe libnotify-0.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe libnotify-0.8.1-r0: task do_package: Started
NOTE: recipe libnotify-0.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_package: Succeeded
NOTE: Running task 1710 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_packagedata)
NOTE: recipe libnotify-0.8.1-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1711 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_package_write_rpm)
NOTE: Running task 1712 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_package_qa)
NOTE: recipe libnotify-0.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe libnotify-0.8.1-r0: task do_package_qa: Started
NOTE: recipe libnotify-0.8.1-r0: task do_package_qa: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1713 of 1713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1713 tasks of which 1630 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 70 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7179129881915748675==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libnotify-upgrade-0.8.0-0.8.1.patch"

RnJvbSAzNzg4ZDUyMzY3MzM2NGZiZGYzNmE2ZTk2MTdhMDgxN2ViODExYzU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNSBBdWcgMjAyMiAwMDo0NzoyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ym5vdGlmeTogdXBncmFkZSAwLjguMCAtPiAwLjguMQoKLS0tCiAuLi4vbGlibm90aWZ5L3tsaWJu
b3RpZnlfMC44LjAuYmIgPT4gbGlibm90aWZ5XzAuOC4xLmJifSAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ25vbWUvbGlibm90aWZ5L3tsaWJub3RpZnlfMC44LjAuYmIgPT4gbGlibm90aWZ5XzAu
OC4xLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJub3RpZnkv
bGlibm90aWZ5XzAuOC4wLmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYm5vdGlmeS9saWJub3Rp
ZnlfMC44LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWdub21lL2xpYm5vdGlmeS9saWJub3RpZnlfMC44LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1nbm9tZS9saWJub3RpZnkvbGlibm90aWZ5XzAuOC4xLmJiCmluZGV4IDljOWFmODdlMWEuLjNi
ZGM3MGQyMjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJub3RpZnkvbGlibm90
aWZ5XzAuOC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJub3RpZnkvbGlibm90aWZ5
XzAuOC4xLmJiCkBAIC0yMiw3ICsyMiw3IEBAIGluaGVyaXQgZ25vbWViYXNlIGd0ay1kb2MgZmVh
dHVyZXNfY2hlY2sgZ29iamVjdC1pbnRyb3NwZWN0aW9uCiAjIGRlcGVuZHMgb24gZ3RrKzMgaWYg
dGVzdHMgYXJlIGVuYWJsZWQKIEFOWV9PRl9ESVNUUk9fRkVBVFVSRVMgPSAiJHtAYmIudXRpbHMu
Y29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCAndGVzdHMnLCAnJHtHVEszRElTVFJPRkVBVFVSRVN9
JywgJycsIGQpfSIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNDZhMjZmMGRiNGU2
NGNmMjQwMTYyOTFlYjE1NzllZDlmMGJhNzYxMWZlNmNkOWUxYWZlYzhmNDI3ODBkMzkyNCIKK1NS
Q19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImQwMzNlNmQ0ZDZjY2JmNDZhNDM2YzMxNjI4YTRi
NjYxYjM2ZGNhMWY1ZDQxNzRmZTAxNzNlMjc0ZjRlNjI1NTciCiAKIEVYVFJBX09FTUVTT04gPSAi
LURtYW49ZmFsc2UiCiAKLS0gCjIuMzEuMQoK

--===============7179129881915748675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libnotify/libnotify-dev: FILELIST: removed "/usr/share/gir-1.0/Notify-0.8.gir", added "/usr/share/gir-1.0/Notify-0.7.gir"
packages/core2-32-poky-linux/libnotify/libnotify: FILELIST: removed "/usr/lib/girepository-1.0/Notify-0.8.typelib", added "/usr/lib/girepository-1.0/Notify-0.7.typelib"
Changes to packages/core2-32-poky-linux/libnotify (sysroot):
  /usr/lib/girepository-1.0/Notify-0.8.typelib moved to /usr/lib/girepository-1.0/Notify-0.7.typelib
  /usr/share/gir-1.0/Notify-0.8.gir moved to /usr/share/gir-1.0/Notify-0.7.gir

--===============7179129881915748675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libnotify: PKGV changed from 0.8.0 [default] to 0.8.1 [default]
packages/core2-32-poky-linux/libnotify: PV changed from "0.8.0" to "0.8.1"
packages/core2-32-poky-linux/libnotify: SRC_URI changed from "https://download.gnome.org/sources//libnotify/0.8/libnotify-0.8.0.tar.xz;name=archive" to "https://download.gnome.org/sources//libnotify/0.8/libnotify-0.8.1.tar.xz;name=archive"
packages/core2-32-poky-linux/libnotify/libnotify-dbg: PKGV changed from 0.8.0 [default] to 0.8.1 [default]
packages/core2-32-poky-linux/libnotify/libnotify-dbg: PV changed from "0.8.0" to "0.8.1"
packages/core2-32-poky-linux/libnotify/libnotify-dev: PKGV changed from 0.8.0 [default] to 0.8.1 [default]
packages/core2-32-poky-linux/libnotify/libnotify-dev: FILELIST: removed "/usr/share/gir-1.0/Notify-0.8.gir", added "/usr/share/gir-1.0/Notify-0.7.gir"
packages/core2-32-poky-linux/libnotify/libnotify-dev: PV changed from "0.8.0" to "0.8.1"
packages/core2-32-poky-linux/libnotify/libnotify-doc: PKGV changed from 0.8.0 [default] to 0.8.1 [default]
packages/core2-32-poky-linux/libnotify/libnotify-doc: PV changed from "0.8.0" to "0.8.1"
packages/core2-32-poky-linux/libnotify/libnotify-locale: PKGV changed from 0.8.0 [default] to 0.8.1 [default]
packages/core2-32-poky-linux/libnotify/libnotify-locale: PV changed from "0.8.0" to "0.8.1"
packages/core2-32-poky-linux/libnotify/libnotify-src: PKGV changed from 0.8.0 [default] to 0.8.1 [default]
packages/core2-32-poky-linux/libnotify/libnotify-src: PV changed from "0.8.0" to "0.8.1"
packages/core2-32-poky-linux/libnotify/libnotify-staticdev: PKGV changed from 0.8.0 [default] to 0.8.1 [default]
packages/core2-32-poky-linux/libnotify/libnotify-staticdev: PV changed from "0.8.0" to "0.8.1"
packages/core2-32-poky-linux/libnotify/libnotify: PKGV changed from 0.8.0 [default] to 0.8.1 [default]
packages/core2-32-poky-linux/libnotify/libnotify: FILELIST: removed "/usr/lib/girepository-1.0/Notify-0.8.typelib", added "/usr/lib/girepository-1.0/Notify-0.7.typelib"
packages/core2-32-poky-linux/libnotify/libnotify: PV changed from "0.8.0" to "0.8.1"
Changes to packages/core2-32-poky-linux/libnotify (sysroot):
  /usr/lib/girepository-1.0/Notify-0.8.typelib moved to /usr/lib/girepository-1.0/Notify-0.7.typelib
  /usr/share/gir-1.0/Notify-0.8.gir moved to /usr/share/gir-1.0/Notify-0.7.gir

--===============7179129881915748675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1659 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-bff14b02c48e0b60034ba488cd18164c8bfe2325"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:bff14b02c48e0b60034ba488cd18164c8bfe2325"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 48 Local 18 Mirrors 0 Missed 30 Current 411 (37% match, 93% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 418 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 427 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_populate_sysroot_setscene)
NOTE: Running task 1132 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_fetch)
NOTE: Running task 1167 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_fetch)
NOTE: Running task 1196 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 1200 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1212 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_fetch)
NOTE: Running task 1281 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_fetch: Started
NOTE: Running task 1286 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1287 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_unpack)
NOTE: Running task 1300 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: Running task 1304 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1326 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_unpack)
NOTE: Running task 1343 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_write_config)
NOTE: Running task 1394 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1395 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1403 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1434 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_write_config)
NOTE: Running task 1472 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_fetch)
NOTE: Running task 1509 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_write_config)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.1-r0: task do_fetch: Started
NOTE: recipe libnotify-0.8.1-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 1560 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_unpack)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_write_config: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_write_config: Succeeded
NOTE: Running task 1561 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_patch)
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_unpack: Started
NOTE: Running task 1562 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Started
NOTE: Running task 1563 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_patch)
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_patch: Started
NOTE: recipe libnotify-0.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1564 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3/3.10.5-r0/temp/log.do_packagedata_setscene.1063700
NOTE: recipe libpng-1.6.37-r0: task do_patch: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 458 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_package_setscene)
NOTE: Running task 1565 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: recipe libnotify-0.8.1-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_unpack: Succeeded
NOTE: Running task 1566 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_patch)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.8.1-r0: task do_patch: Succeeded
NOTE: Running task 1567 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1568 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1569 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_populate_lic)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Succeeded
NOTE: Running task 1570 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_generate_toolchain_file)
NOTE: Running task 1571 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1572 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libnotify-0.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.8.1-r0: task do_populate_lic: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_package_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: Running task 1573 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1574 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.8.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_populate_lic unihash changed to 5a4f6daea36778167cd782e4bb31f31a02db5f10fb6cfe939f85582362e068a8
NOTE: recipe libnotify-0.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_configure: Started
NOTE: Running task 1575 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_configure)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_patch: Succeeded
NOTE: Running task 1576 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1577 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1578 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to e2665d5f03cb6fc520c75cd2518639a763c662566b293b9f3dcb58f2c6be1e08
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1579 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Started
NOTE: recipe python3-3.10.5-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1607 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1615 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1625 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_packagedata: Started
NOTE: Running task 1630 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Running task 1631 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 309b648185e6cc4f5620a0968a1a475507070ebf20b3816503c836a3a5695faf
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Started
NOTE: Running task 1632 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe python3-3.10.5-r0: task do_packagedata: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1643 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 1644 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Succeeded
NOTE: Running task 1645 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: Running task 1646 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 1647 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Succeeded
NOTE: Running task 1648 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Succeeded
NOTE: Running task 1649 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 1650 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 1651 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 1652 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_compile: Succeeded
NOTE: Running task 1653 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe libpng-1.6.37-r0: task do_install: Started
NOTE: recipe libpng-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 1654 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: Running task 1655 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 1656 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package: Succeeded
NOTE: Running task 1657 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Succeeded
NOTE: Running task 1658 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_install)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Succeeded
NOTE: Running task 1659 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot)
NOTE: Running task 1660 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_package)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1661 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1662 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Succeeded
NOTE: Running task 1663 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure: Succeeded
NOTE: Running task 1664 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1665 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile: Succeeded
NOTE: Running task 1666 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1667 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install: Succeeded
NOTE: Running task 1668 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1669 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_populate_sysroot)
NOTE: Running task 1670 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1671 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnotify-0.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnotify-0.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1672 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_configure)
NOTE: recipe libnotify-0.8.1-r0: task do_configure: Started
NOTE: recipe libnotify-0.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1673 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_compile)
NOTE: recipe libnotify-0.8.1-r0: task do_compile: Started
NOTE: recipe libnotify-0.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1674 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_install)
NOTE: recipe libnotify-0.8.1-r0: task do_install: Started
NOTE: recipe libnotify-0.8.1-r0: task do_install: Succeeded
NOTE: Running task 1675 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_populate_sysroot)
NOTE: recipe libnotify-0.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe libnotify-0.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_package: Succeeded
NOTE: Running task 1676 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata: Succeeded
NOTE: Running task 1677 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_package)
NOTE: recipe libnotify-0.8.1-r0: task do_package: Started
NOTE: recipe libnotify-0.8.1-r0: task do_package: Succeeded
NOTE: Running task 1678 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_packagedata)
NOTE: recipe libnotify-0.8.1-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1679 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_package_write_rpm)
NOTE: Running task 1680 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_package_qa)
NOTE: recipe libnotify-0.8.1-r0: task do_package_qa: Started
NOTE: recipe libnotify-0.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe libnotify-0.8.1-r0: task do_package_qa: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1681 of 1681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1681 tasks of which 1598 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There was 1 WARNING message.
Summary: There were 70 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7179129881915748675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1660 targets, 49 skipped, 0 masked, 0 errors.
Removing 61 recipes from the core2-32 sysroot...done.
Removing 61 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-bff14b02c48e0b60034ba488cd18164c8bfe2325"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:bff14b02c48e0b60034ba488cd18164c8bfe2325"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 234 Local 200 Mirrors 0 Missed 34 Current 182 (85% match, 91% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 183 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 186 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 191 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 215 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 219 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_populate_sysroot_setscene)
NOTE: Running task 678 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_fetch)
NOTE: Running task 711 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_fetch)
NOTE: Running task 743 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_fetch)
NOTE: Running task 762 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 763 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 776 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_fetch)
NOTE: Running task 793 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_write_config)
NOTE: Running task 821 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 852 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_write_config)
NOTE: Running task 855 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_fetch)
NOTE: Running task 857 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_write_config)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Started
NOTE: recipe libxml2-2.9.14-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_fetch: Started
NOTE: recipe libnotify-0.8.1-r0: task do_fetch: Started
NOTE: recipe libnotify-0.8.1-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_write_config: Started
NOTE: Running task 859 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_unpack)
NOTE: Running task 860 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: recipe libxml2-2.9.14-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 861 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_unpack)
NOTE: Running task 862 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_unpack)
NOTE: Running task 863 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_unpack)
NOTE: Running task 864 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: Running task 865 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnotify-0.8.1-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_write_config: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Started
NOTE: Running setscene task 228 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 232 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_packagedata_setscene)
NOTE: Running setscene task 233 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 234 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 235 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 236 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 237 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 238 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.9.14-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Started
NOTE: recipe libnotify-0.8.1-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: Running task 870 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_patch)
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnotify-0.8.1-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Succeeded
NOTE: Running task 871 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_patch)
NOTE: Running task 872 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 241 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.5.52-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_patch: Started
NOTE: Running setscene task 246 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running task 877 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_patch)
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 248 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 250 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 251 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 252 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 253 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 254 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 255 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Succeeded
NOTE: Running task 882 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: Running task 883 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 884 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_populate_lic)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: Running task 885 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_generate_toolchain_file)
NOTE: Running task 886 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3/3.10.5-r0/temp/log.do_packagedata_setscene.1269549
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 256 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_package_setscene)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe libnotify-0.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_populate_lic: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_populate_lic: Succeeded
NOTE: Running setscene task 262 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 266 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 269 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 892 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 905 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: Running task 906 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_patch)
NOTE: Running task 907 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_populate_lic unihash changed to 5a4f6daea36778167cd782e4bb31f31a02db5f10fb6cfe939f85582362e068a8
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 918 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_patch)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 919 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 920 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 276 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 277 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 280 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 282 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 285 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 287 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 289 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 290 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: Running task 938 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 939 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.10.5-r0: task do_package_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 947 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 303 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 304 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 966 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libxml2-2.9.14-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 974 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 977 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libxml2-2.9.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 978 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxml2-2.9.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 311 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 315 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 987 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 322 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 324 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 325 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 327 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 331 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 334 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 336 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 338 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 340 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 342 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 344 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.1.bb:do_populate_sysroot_setscene)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 349 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 350 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 353 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 355 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 359 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 362 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 381 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1056 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 384 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 386 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5a89c44da463ec41c5f401958d01582fe28bb9a0d7b3e33c212f155080793543
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 389 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 391 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 393 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 394 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 397 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 400 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 401 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 410 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 413 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 414 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1308 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1357 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1377 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1378 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1394 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1445 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata)
NOTE: recipe libxml2-2.9.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.10.5-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1470 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: recipe libpng-1.6.37-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1471 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_configure)
NOTE: recipe libxml2-2.9.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 1472 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 2104397955e4af8dee6de52beaac2cb17ebfc96735377f3f545c0b373f3382b2
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_configure: Started
NOTE: Running task 1483 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Started
NOTE: recipe python3-3.10.5-r0: task do_packagedata: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1484 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1485 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_install)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Succeeded
NOTE: Running task 1486 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Succeeded
NOTE: Running task 1487 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot)
NOTE: Running task 1488 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Succeeded
NOTE: Running task 1489 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 1490 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Started
NOTE: recipe libpng-1.6.37-r0: task do_compile: Succeeded
NOTE: Running task 1491 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe libpng-1.6.37-r0: task do_install: Started
NOTE: recipe libpng-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 1492 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: Running task 1493 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Started
NOTE: recipe libxml2-2.9.14-r0: task do_configure: Succeeded
NOTE: Running task 1494 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_configure_ptest_base)
NOTE: recipe libxml2-2.9.14-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.9.14-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1495 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_compile)
NOTE: recipe libxml2-2.9.14-r0: task do_compile: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package: Succeeded
NOTE: Running task 1496 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Succeeded
NOTE: Running task 1497 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_install)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Started
NOTE: recipe libxml2-2.9.14-r0: task do_compile: Succeeded
NOTE: Running task 1498 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.9.14-r0: task do_compile_ptest_base: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Succeeded
NOTE: Running task 1499 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot)
NOTE: Running task 1500 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_package)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Succeeded
NOTE: Running task 1501 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1502 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_install)
NOTE: recipe libxml2-2.9.14-r0: task do_install: Started
NOTE: recipe libxml2-2.9.14-r0: task do_install: Succeeded
NOTE: Running task 1503 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_install_ptest_base)
NOTE: recipe libxml2-2.9.14-r0: task do_install_ptest_base: Started
NOTE: recipe libxml2-2.9.14-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1504 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot)
NOTE: Running task 1505 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_package)
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.9.14-r0: task do_package: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1506 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1507 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 1508 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 1509 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 1510 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1511 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1512 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure: Succeeded
NOTE: Running task 1513 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1514 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile: Succeeded
NOTE: Running task 1515 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1516 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install: Succeeded
NOTE: Running task 1517 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1518 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_populate_sysroot)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.9.14-r0: task do_package: Succeeded
NOTE: Running task 1519 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata)
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata: Succeeded
NOTE: Running task 1520 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1521 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe libnotify-0.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnotify-0.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1522 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_configure)
NOTE: recipe libnotify-0.8.1-r0: task do_configure: Started
NOTE: recipe libnotify-0.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1523 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_compile)
NOTE: recipe libnotify-0.8.1-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 1524 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1525 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_package: Started
NOTE: recipe libnotify-0.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1526 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_install)
NOTE: recipe libnotify-0.8.1-r0: task do_install: Started
NOTE: recipe libnotify-0.8.1-r0: task do_install: Succeeded
NOTE: Running task 1527 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_populate_sysroot)
NOTE: recipe libnotify-0.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe libnotify-0.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_package: Succeeded
NOTE: Running task 1528 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata: Succeeded
NOTE: Running task 1529 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_package)
NOTE: recipe libnotify-0.8.1-r0: task do_package: Started
NOTE: recipe libnotify-0.8.1-r0: task do_package: Succeeded
NOTE: Running task 1530 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_packagedata)
NOTE: recipe libnotify-0.8.1-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1531 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_package_write_rpm)
NOTE: Running task 1532 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_package_qa)
NOTE: recipe libnotify-0.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe libnotify-0.8.1-r0: task do_package_qa: Started
NOTE: recipe libnotify-0.8.1-r0: task do_package_qa: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1533 of 1533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1533 tasks of which 1430 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds

Summary: There was 1 WARNING message.
Summary: There were 70 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7179129881915748675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1659 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-bff14b02c48e0b60034ba488cd18164c8bfe2325"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:bff14b02c48e0b60034ba488cd18164c8bfe2325"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 48 Local 18 Mirrors 0 Missed 30 Current 415 (37% match, 93% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 422 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 431 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_populate_sysroot_setscene)
NOTE: Running task 1140 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_fetch)
NOTE: Running task 1175 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_fetch)
NOTE: Running task 1207 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 1208 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1221 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_fetch)
NOTE: Running task 1293 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1298 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_unpack)
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1327 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_unpack)
NOTE: Running task 1345 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: Running task 1346 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1370 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_unpack)
NOTE: Running task 1386 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_write_config)
NOTE: Running task 1451 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1452 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1453 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1485 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_write_config)
NOTE: Running task 1528 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_fetch)
NOTE: Running task 1571 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_write_config)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnotify-0.8.1-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.1-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_write_config: Started
NOTE: Running task 1574 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_patch)
NOTE: recipe libnotify-0.8.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Succeeded
NOTE: Running task 1575 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_write_config: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_write_config: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Succeeded
NOTE: Running task 1576 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Started
NOTE: recipe libnotify-0.8.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Succeeded
NOTE: Running task 1577 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_patch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3/3.10.5-r0/temp/log.do_packagedata_setscene.1190241
NOTE: recipe libpng-1.6.37-r0: task do_patch: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 462 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_package_setscene)
NOTE: recipe libnotify-0.8.1-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1578 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_patch)
NOTE: recipe libpng-1.6.37-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Started
NOTE: Running task 1579 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Succeeded
NOTE: Running task 1580 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_generate_toolchain_file)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1581 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1582 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1583 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe libnotify-0.8.1-r0: task do_patch: Succeeded
NOTE: Running task 1584 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1585 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_populate_lic)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_unpack: Succeeded
NOTE: Running task 1586 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe libnotify-0.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_patch: Started
NOTE: Running task 1587 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: Running task 1588 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_package_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_populate_lic unihash changed to 5a4f6daea36778167cd782e4bb31f31a02db5f10fb6cfe939f85582362e068a8
NOTE: Running task 1589 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_configure)
NOTE: recipe libpng-1.6.37-r0: task do_configure: Started
NOTE: recipe libnotify-0.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_patch: Succeeded
NOTE: Running task 1590 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1591 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1592 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to cc1926fa9d57f281491422a9bd2d4f6e330abfd3c21cd9108fee7200caeb4829
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1593 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Started
NOTE: recipe python3-3.10.5-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1621 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1629 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1639 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_packagedata: Started
NOTE: Running task 1644 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 1006c1302494e77886f06831cbd7fe5cb6aa2f4bc4e883ca4ef9716f85e10d63
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1645 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: Running task 1646 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1657 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Succeeded
NOTE: Running task 1658 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot)
NOTE: Running task 1659 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 1660 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 1661 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Succeeded
NOTE: Running task 1662 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_compile)
NOTE: Running task 1663 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 1664 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 1665 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 1666 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_compile: Succeeded
NOTE: Running task 1667 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe libpng-1.6.37-r0: task do_install: Started
NOTE: recipe libpng-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 1668 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: Running task 1669 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 1670 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_package: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: Running task 1671 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Succeeded
NOTE: Running task 1672 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_install)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Succeeded
NOTE: Running task 1673 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot)
NOTE: Running task 1674 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_package)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1675 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1676 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Succeeded
NOTE: Running task 1677 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure: Succeeded
NOTE: Running task 1678 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1679 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile: Succeeded
NOTE: Running task 1680 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1681 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install: Succeeded
NOTE: Running task 1682 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1683 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_populate_sysroot)
NOTE: Running task 1684 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1685 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnotify-0.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnotify-0.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1686 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_configure)
NOTE: recipe libnotify-0.8.1-r0: task do_configure: Started
NOTE: recipe libnotify-0.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1687 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_compile)
NOTE: recipe libnotify-0.8.1-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_package: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1688 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_install)
NOTE: Running task 1689 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.8.1-r0: task do_install: Started
NOTE: recipe libnotify-0.8.1-r0: task do_install: Succeeded
NOTE: Running task 1690 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_populate_sysroot)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata: Succeeded
NOTE: Running task 1691 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_package)
NOTE: recipe libnotify-0.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe libnotify-0.8.1-r0: task do_package: Started
NOTE: recipe libnotify-0.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_package: Succeeded
NOTE: Running task 1692 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_packagedata)
NOTE: recipe libnotify-0.8.1-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1693 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_package_write_rpm)
NOTE: Running task 1694 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_package_qa)
NOTE: recipe libnotify-0.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe libnotify-0.8.1-r0: task do_package_qa: Started
NOTE: recipe libnotify-0.8.1-r0: task do_package_qa: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1695 of 1695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1695 tasks of which 1612 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 70 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.10.6-r0 to 0:3.10.5-r0) [version-going-backwards]
ERROR: python3-3.10.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7179129881915748675==--

