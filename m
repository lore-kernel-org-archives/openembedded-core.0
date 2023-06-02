Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E17C7EE39
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:46 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.7522.1685693431123642157
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fuSj//Rn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101887b2879db-b33264e3-009e-4b8c-b0f5-07be95bd5d49-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693430;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MXBhP2sdO8gOBmQ5zg1fhONeeClBb5EWlZDInMtOd8o=;
	b=fuSj//RnBndhfDKXaP/Jx1xf65bgkzKoxmZBD+dx0w8jF6bRoqeZ2F1fOhKaq5Rm
	aLgNuJslIiqnht8h7IpPJZ5e2+DV3z/o7hWb0AUQLN+yFOZ4FdcZpDh1EyWMQz1uDmT
	wP0XL6Sybw6/KgRnXs7hRJizZqrP9uwozQaYf3nU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693430;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MXBhP2sdO8gOBmQ5zg1fhONeeClBb5EWlZDInMtOd8o=;
	b=bunsS4pVwAHgjyiD5b0J+3cMq3i8/Z8tAVjzgbCCICy3WvvUclRVo5gxmPBem6PT
	dyJElZBJ4ls0oMXSxW+VKxhWVjJhaD+kHcEoBCBMfETA14C6gVEnuQjjG7zC5xMxt6D
	HbNgJPEQoD1hR0Jd1xam3m/nbrPAGAvD3hEqsxKw=
Content-Type: multipart/mixed; boundary="===============5328588626286533161=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-networking: upgrading to 2.76.0 SUCCEEDED
Message-ID: <010101887b2879db-b33264e3-009e-4b8c-b0f5-07be95bd5d49-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:30 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182158

--===============5328588626286533161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-networking* to *2.76.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-networking-upgrade-2.74.0-2.76.0.patch
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
--===============5328588626286533161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1803 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (896 cached, 1 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:099031d60f3d960586ddcc716fc7f6292a46e3a8"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 23 Local 4 Mirrors 0 Missed 19 Current 417 (17% match, 95% complete)
Removing 1 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 430 of 440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.31.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-protocols-1.31-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1021 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_fetch)
NOTE: recipe wayland-protocols-1.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1060 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_write_config)
NOTE: Setscene tasks completed
NOTE: Running task 1099 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_fetch)
NOTE: Running task 1166 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_write_config)
NOTE: Running task 1219 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: Running task 1387 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_fetch: Succeeded
NOTE: Running task 1562 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_unpack)
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: Running task 1563 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: Running task 1564 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_unpack)
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: Running task 1565 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: Running task 1566 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_write_config: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_write_config: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 1567 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_unpack: Succeeded
NOTE: Running task 1568 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_patch)
NOTE: recipe glib-networking-2.76.0-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_patch: Succeeded
NOTE: Running task 1569 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1570 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_lic)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 1571 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_lic: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_unpack: Succeeded
NOTE: Running task 1572 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_patch)
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_lic unihash changed to ccba8ec42248c5a2c5e8610f804767f997dca587b8cbe5b3b802472c0d4bd5c1
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1573 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 1574 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_patch: Succeeded
NOTE: Running task 1575 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1576 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_patch: Succeeded
NOTE: Running task 1577 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_deploy_source_date_epoch)
NOTE: recipe coreutils-9.1-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1578 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_configure)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_configure: Succeeded
NOTE: Running task 1579 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1580 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_compile)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_compile: Succeeded
NOTE: Running task 1581 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1582 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_install)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_install: Succeeded
NOTE: Running task 1583 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1584 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_populate_sysroot)
NOTE: Running task 1585 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1586 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1587 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.76.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1588 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_configure)
NOTE: recipe glib-networking-2.76.0-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1589 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_configure: Succeeded
NOTE: Running task 1590 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1591 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_compile)
NOTE: recipe glib-networking-2.76.0-r0: task do_compile: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_compile: Succeeded
NOTE: Running task 1592 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1593 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_install)
NOTE: recipe glib-networking-2.76.0-r0: task do_install: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_install: Succeeded
NOTE: Running task 1594 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1595 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_sysroot)
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 1596 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 1597 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_package: Succeeded
NOTE: Running task 1598 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1599 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package)
NOTE: Running task 1600 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe glib-networking-2.76.0-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 1601 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1602 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe coreutils-9.1-r0: task do_configure: Succeeded
NOTE: Running task 1603 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure_ptest_base)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1604 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile)
NOTE: recipe coreutils-9.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_package: Succeeded
NOTE: Running task 1605 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_packagedata)
NOTE: recipe glib-networking-2.76.0-r0: task do_packagedata: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1606 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package_write_rpm)
NOTE: Running task 1607 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package_qa)
NOTE: recipe glib-networking-2.76.0-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package_qa: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package_qa: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_compile: Succeeded
NOTE: Running task 1608 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1609 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install)
NOTE: recipe coreutils-9.1-r0: task do_install: Started
NOTE: recipe coreutils-9.1-r0: task do_install: Succeeded
NOTE: Running task 1610 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1611 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_package: Started
NOTE: recipe coreutils-9.1-r0: task do_package: Succeeded
NOTE: Running task 1612 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata)
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1612 tasks of which 1555 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 52 ERROR messages, returning a non-zero exit code.
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-src went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-dbg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-ptest went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-staticdev went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-dev went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-doc went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-stdbuf went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-af went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-be went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-bg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ca went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-cs went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-da went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-de went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-el went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-eo went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-es went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-et went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-eu went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-fi went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-fr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ga went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-gl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-hr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-hu went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ia went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-id went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-it went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ja went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-kk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ko went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-lg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-lt went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ms went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-nb went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-nl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pt went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pt-br went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ro went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ru went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sv went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-tr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-uk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-vi went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-zh-cn went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-zh-tw went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/coreutils/9.1-r0/temp/log.do_packagedata.1954045
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata) failed with exit code '1'

--===============5328588626286533161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 54 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:099031d60f3d960586ddcc716fc7f6292a46e3a8"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 22 Local 3 Mirrors 0 Missed 19 Current 418 (13% match, 95% complete)
Removing 1 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1021 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_fetch)
NOTE: Running task 1060 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_write_config)
NOTE: Running task 1099 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_fetch)
NOTE: Running task 1166 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_write_config)
NOTE: Running task 1217 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: Running task 1387 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_fetch: Started
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_fetch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: Running task 1562 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_write_config: Started
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: Running task 1563 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_unpack)
NOTE: Running task 1564 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1565 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: Running task 1566 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_write_config: Succeeded
NOTE: Running task 1567 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_write_config: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_unpack: Succeeded
NOTE: Running task 1568 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_patch)
NOTE: recipe glib-networking-2.76.0-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 1569 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe glib-networking-2.76.0-r0: task do_patch: Succeeded
NOTE: Running task 1570 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1571 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_lic)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: Running task 1572 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_patch)
NOTE: recipe glib-networking-2.76.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_lic: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_unpack: Succeeded
NOTE: Running task 1573 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 1574 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe coreutils-9.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_patch: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_lic unihash changed to ccba8ec42248c5a2c5e8610f804767f997dca587b8cbe5b3b802472c0d4bd5c1
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_patch: Succeeded
NOTE: Running task 1575 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1576 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_patch: Succeeded
NOTE: Running task 1577 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_deploy_source_date_epoch)
NOTE: recipe coreutils-9.1-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1578 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_configure)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_configure: Succeeded
NOTE: Running task 1579 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1580 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_compile)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_compile: Succeeded
NOTE: Running task 1581 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1582 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_install)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_install: Succeeded
NOTE: Running task 1583 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1584 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_populate_sysroot)
NOTE: Running task 1585 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1586 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1587 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.76.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1588 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_configure)
NOTE: recipe glib-networking-2.76.0-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1589 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_configure: Succeeded
NOTE: Running task 1590 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1591 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_compile)
NOTE: recipe glib-networking-2.76.0-r0: task do_compile: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_compile: Succeeded
NOTE: Running task 1592 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1593 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_install)
NOTE: recipe glib-networking-2.76.0-r0: task do_install: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_install: Succeeded
NOTE: Running task 1594 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1595 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_sysroot)
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 1596 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 1597 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_configure: Succeeded
NOTE: Running task 1598 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1599 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile)
NOTE: recipe coreutils-9.1-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_package: Succeeded
NOTE: Running task 1600 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1601 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package)
NOTE: Running task 1602 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 1603 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1604 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_package: Succeeded
NOTE: Running task 1605 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_packagedata)
NOTE: recipe glib-networking-2.76.0-r0: task do_packagedata: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1606 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package_write_rpm)
NOTE: Running task 1607 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package_qa)
NOTE: recipe glib-networking-2.76.0-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package_qa: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package_qa: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_compile: Succeeded
NOTE: Running task 1608 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1609 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install)
NOTE: recipe coreutils-9.1-r0: task do_install: Started
NOTE: recipe coreutils-9.1-r0: task do_install: Succeeded
NOTE: Running task 1610 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1611 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_package: Started
NOTE: recipe coreutils-9.1-r0: task do_package: Succeeded
NOTE: Running task 1612 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata)
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1612 tasks of which 1555 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 52 ERROR messages, returning a non-zero exit code.
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-src went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-dbg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-ptest went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-staticdev went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-dev went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-doc went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-stdbuf went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-af went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-be went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-bg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ca went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-cs went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-da went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-de went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-el went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-eo went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-es went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-et went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-eu went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-fi went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-fr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ga went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-gl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-hr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-hu went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ia went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-id went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-it went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ja went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-kk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ko went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-lg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-lt went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ms went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-nb went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-nl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pt went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pt-br went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ro went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ru went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sv went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-tr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-uk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-vi went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-zh-cn went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-zh-tw went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/coreutils/9.1-r0/temp/log.do_packagedata.2329088
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata) failed with exit code '1'

--===============5328588626286533161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 48 skipped, 0 masked, 0 errors.
Removing 63 recipes from the core2-32 sysroot...done.
Removing 72 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:099031d60f3d960586ddcc716fc7f6292a46e3a8"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 159 Local 140 Mirrors 0 Missed 19 Current 163 (88% match, 94% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 164 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 169 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 172 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 178 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 179 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 180 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 181 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 182 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 183 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 184 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 185 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 186 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 194 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 195 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 197 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 199 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 200 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 201 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 202 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 203 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.68-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 708 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_fetch)
NOTE: Running task 724 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_write_config)
NOTE: Running task 725 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_fetch)
NOTE: Running task 726 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_write_config)
NOTE: Running task 727 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: Running task 729 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_fetch: Started
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_write_config: Started
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_write_config: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.68-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 208 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 210 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 747 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_unpack)
NOTE: Running task 751 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 217 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 218 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_write_config: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 772 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_unpack)
NOTE: Running task 774 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_write_config: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_unpack: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_unpack: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 227 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_setscene)
NOTE: recipe glib-networking-2.76.0-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 233 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 235 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 236 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running task 791 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 800 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe glib-networking-2.76.0-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: Running task 801 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 242 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 243 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 245 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 246 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 247 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 248 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-networking-2.76.0-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 820 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 821 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_lic)
NOTE: recipe coreutils-9.1-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 822 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_patch)
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_lic: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 823 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 252 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 253 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 255 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 256 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_lic unihash changed to ccba8ec42248c5a2c5e8610f804767f997dca587b8cbe5b3b802472c0d4bd5c1
NOTE: recipe bash-5.2.15-r0: task do_package_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_patch: Succeeded
NOTE: Running task 840 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_patch: Succeeded
NOTE: Running task 845 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 266 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.2.15-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 269 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 270 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 271 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 277 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 282 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 289 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 292 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 295 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 297 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 299 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 301 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 305 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 309 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 310 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 316 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 319 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 320 of 322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1054 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1134 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1200 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1201 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_configure)
NOTE: recipe coreutils-9.1-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_configure: Succeeded
NOTE: Running task 1202 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1203 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_compile)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_compile: Succeeded
NOTE: Running task 1204 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1205 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_install)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_install: Succeeded
NOTE: Running task 1206 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1207 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_populate_sysroot)
NOTE: Running task 1208 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1209 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1210 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.76.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1211 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1212 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_configure)
NOTE: recipe glib-networking-2.76.0-r0: task do_configure: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_configure: Succeeded
NOTE: Running task 1213 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1214 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_compile)
NOTE: recipe glib-networking-2.76.0-r0: task do_compile: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_compile: Succeeded
NOTE: Running task 1215 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1216 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_install)
NOTE: recipe glib-networking-2.76.0-r0: task do_install: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_install: Succeeded
NOTE: Running task 1217 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1218 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_sysroot)
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_configure: Succeeded
NOTE: Running task 1219 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1220 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile)
NOTE: recipe coreutils-9.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 1221 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 1222 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_package: Succeeded
NOTE: Running task 1223 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1224 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package)
NOTE: Running task 1225 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe glib-networking-2.76.0-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe coreutils-9.1-r0: task do_compile: Succeeded
NOTE: Running task 1226 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1227 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 1228 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe coreutils-9.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1229 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_package: Succeeded
NOTE: Running task 1230 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_packagedata)
NOTE: recipe coreutils-9.1-r0: task do_install: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_packagedata: Started
NOTE: Running task 1231 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1232 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package_write_rpm)
NOTE: Running task 1233 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package_qa)
NOTE: recipe glib-networking-2.76.0-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package_qa: Started
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1234 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_package: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package_qa: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_package: Succeeded
NOTE: Running task 1235 of 1237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata)
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1235 tasks of which 1178 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 52 ERROR messages, returning a non-zero exit code.
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-src went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-dbg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-ptest went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-staticdev went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-dev went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-doc went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-stdbuf went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-af went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-be went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-bg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ca went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-cs went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-da went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-de went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-el went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-eo went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-es went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-et went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-eu went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-fi went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-fr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ga went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-gl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-hr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-hu went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ia went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-id went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-it went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ja went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-kk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ko went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-lg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-lt went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ms went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-nb went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-nl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pt went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pt-br went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ro went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ru went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sv went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-tr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-uk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-vi went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-zh-cn went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-zh-tw went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/coreutils/9.1-r0/temp/log.do_packagedata.3154941
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata) failed with exit code '1'

--===============5328588626286533161==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-networking-upgrade-2.74.0-2.76.0.patch"

RnJvbSA2NzY1ODRjN2VkMjg1Mjc1MDk0ZTMyYjUyZTExMmQzYmJiOTAwNTJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAwODowMzoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
aWItbmV0d29ya2luZzogdXBncmFkZSAyLjc0LjAgLT4gMi43Ni4wCgotLS0KIC4uLi97Z2xpYi1u
ZXR3b3JraW5nXzIuNzQuMC5iYiA9PiBnbGliLW5ldHdvcmtpbmdfMi43Ni4wLmJifSAgICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy97Z2xpYi1uZXR3b3JraW5nXzIuNzQu
MC5iYiA9PiBnbGliLW5ldHdvcmtpbmdfMi43Ni4wLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtpbmdfMi43NC4wLmJi
IGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi1uZXR3b3JraW5nL2dsaWItbmV0d29ya2luZ18yLjc2
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi1uZXR3b3JraW5nL2dsaWItbmV0d29ya2luZ18yLjc0LjAuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtpbmdfMi43Ni4wLmJiCmlu
ZGV4IGZlNjkwMGIwMzYuLjc1YzAzMWU4Y2QgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3Jl
L2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtpbmdfMi43NC4wLmJiCisrKyBiL21ldGEvcmVj
aXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtpbmdfMi43Ni4wLmJiCkBAIC0x
NCw3ICsxNCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTRmYmQ2
NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIFwKIFNFQ1RJT04gPSAibGlicyIKIERFUEVORFMg
PSAiZ2xpYi0yLjAtbmF0aXZlIGdsaWItMi4wIgogCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3Vt
XSA9ICIxZjE4NWFhZWYwOTQxMjNmOGUyNWQ4ZmE1NTY2MWIzZmQ3MTAyMDE2M2EwMTc0YWRiMzVh
Mzc2ODVjZGE2MTNiIgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiMTQ5YTA1YTE3OWU2
MjlhNTM4YmUyNTY2MmFhMzI0YjQ5OWQ3YzQ1NDljNTE1MWRiNTM3M2U3ODBhMWJmMWI5YSIKIAog
UEFDS0FHRUNPTkZJRyA/Pz0gIm9wZW5zc2wgZW52aXJvbm1lbnQgJHtAYmIudXRpbHMuY29udGFp
bnMoJ1BURVNUX0VOQUJMRUQnLCAnMScsICd0ZXN0cycsICcnLCBkKX0iCiAKLS0gCjIuMzkuMgoK

--===============5328588626286533161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 64 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:099031d60f3d960586ddcc716fc7f6292a46e3a8"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 22 Local 3 Mirrors 0 Missed 19 Current 414 (13% match, 95% complete)
Removing 1 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1021 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_fetch)
NOTE: Running task 1060 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_write_config)
NOTE: Running task 1096 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_fetch)
NOTE: Running task 1158 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_write_config)
NOTE: Running task 1209 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: Running task 1376 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_fetch: Succeeded
NOTE: Running task 1548 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_unpack)
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: Running task 1549 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_unpack)
NOTE: recipe glib-networking-2.76.0-r0: task do_write_config: Started
NOTE: Running task 1550 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: Running task 1551 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: Running task 1552 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_write_config: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_write_config: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 1553 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe glib-networking-2.76.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_unpack: Succeeded
NOTE: Running task 1554 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_patch)
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_patch: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_patch: Succeeded
NOTE: Running task 1555 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1556 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_lic)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 1557 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe glib-networking-2.76.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_lic: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: Running task 1558 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_patch)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_unpack: Succeeded
NOTE: Running task 1559 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_patch)
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_lic unihash changed to ccba8ec42248c5a2c5e8610f804767f997dca587b8cbe5b3b802472c0d4bd5c1
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 1560 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe coreutils-9.1-r0: task do_patch: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_patch: Succeeded
NOTE: Running task 1561 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1562 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_patch: Succeeded
NOTE: Running task 1563 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_deploy_source_date_epoch)
NOTE: recipe coreutils-9.1-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1564 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_configure)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_configure: Succeeded
NOTE: Running task 1565 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1566 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_compile)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_compile: Succeeded
NOTE: Running task 1567 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1568 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_install)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_install: Succeeded
NOTE: Running task 1569 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1570 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_populate_sysroot)
NOTE: Running task 1571 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1572 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1573 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.76.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1574 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_configure)
NOTE: recipe glib-networking-2.76.0-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1575 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_configure: Succeeded
NOTE: Running task 1576 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1577 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_compile)
NOTE: recipe glib-networking-2.76.0-r0: task do_compile: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_compile: Succeeded
NOTE: Running task 1578 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1579 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_install)
NOTE: recipe glib-networking-2.76.0-r0: task do_install: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_install: Succeeded
NOTE: Running task 1580 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1581 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_sysroot)
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 1582 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 1583 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_configure: Succeeded
NOTE: Running task 1584 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1585 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile)
NOTE: recipe coreutils-9.1-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_package: Succeeded
NOTE: Running task 1586 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1587 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package)
NOTE: Running task 1588 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe glib-networking-2.76.0-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 1589 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1590 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_package: Succeeded
NOTE: Running task 1591 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_packagedata)
NOTE: recipe glib-networking-2.76.0-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_compile: Succeeded
NOTE: Running task 1592 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1593 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install)
NOTE: recipe glib-networking-2.76.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1594 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package_write_rpm)
NOTE: Running task 1595 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package_qa)
NOTE: recipe coreutils-9.1-r0: task do_install: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package_qa: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package_qa: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_install: Succeeded
NOTE: Running task 1596 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1597 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_package: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_package: Succeeded
NOTE: Running task 1598 of 1600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata)
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1598 tasks of which 1541 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 52 ERROR messages, returning a non-zero exit code.
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-src went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-dbg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-ptest went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-staticdev went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-dev went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-doc went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-stdbuf went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-af went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-be went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-bg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ca went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-cs went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-da went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-de went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-el went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-eo went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-es went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-et went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-eu went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-fi went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-fr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ga went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-gl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-hr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-hu went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ia went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-id went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-it went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ja went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-kk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ko went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-lg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-lt went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ms went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-nb went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-nl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pt went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pt-br went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ro went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ru went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sv went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-tr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-uk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-vi went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-zh-cn went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-zh-tw went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/coreutils/9.1-r0/temp/log.do_packagedata.2651825
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata) failed with exit code '1'

--===============5328588626286533161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 70 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:099031d60f3d960586ddcc716fc7f6292a46e3a8"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 22 Local 3 Mirrors 0 Missed 19 Current 418 (13% match, 95% complete)
Removing 1 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1021 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_fetch)
NOTE: Running task 1060 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_write_config)
NOTE: Running task 1099 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_fetch)
NOTE: Running task 1166 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_write_config)
NOTE: Running task 1217 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: Running task 1387 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_write_config: Started
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_fetch: Succeeded
NOTE: Running task 1562 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_unpack)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: Running task 1563 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_write_config: Succeeded
NOTE: Running task 1564 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_unpack)
NOTE: Running task 1565 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: Running task 1566 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.76.0-r0: task do_write_config: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 1567 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_unpack: Succeeded
NOTE: Running task 1568 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_patch)
NOTE: recipe glib-networking-2.76.0-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_patch: Succeeded
NOTE: Running task 1569 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1570 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_lic)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 1571 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_lic: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: Running task 1572 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_patch)
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_lic: Succeeded
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_lic unihash changed to ccba8ec42248c5a2c5e8610f804767f997dca587b8cbe5b3b802472c0d4bd5c1
NOTE: Running task 1573 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 1574 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-networking-2.76.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_patch: Succeeded
NOTE: Running task 1575 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1576 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure)
NOTE: recipe coreutils-9.1-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_patch: Succeeded
NOTE: Running task 1577 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1578 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_configure)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_configure: Succeeded
NOTE: Running task 1579 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1580 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_compile)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_compile: Succeeded
NOTE: Running task 1581 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1582 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_install)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_install: Succeeded
NOTE: Running task 1583 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1584 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_populate_sysroot)
NOTE: Running task 1585 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1586 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1587 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1588 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_configure)
NOTE: recipe glib-networking-2.76.0-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1589 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_configure: Succeeded
NOTE: Running task 1590 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1591 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_compile)
NOTE: recipe glib-networking-2.76.0-r0: task do_compile: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_compile: Succeeded
NOTE: Running task 1592 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1593 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_install)
NOTE: recipe glib-networking-2.76.0-r0: task do_install: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_install: Succeeded
NOTE: Running task 1594 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1595 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_sysroot)
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 1596 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 1597 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_package: Succeeded
NOTE: Running task 1598 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_configure: Succeeded
NOTE: Running task 1599 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1600 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile)
NOTE: recipe coreutils-9.1-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1601 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package)
NOTE: Running task 1602 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 1603 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1604 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_package: Succeeded
NOTE: Running task 1605 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_packagedata)
NOTE: recipe glib-networking-2.76.0-r0: task do_packagedata: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1606 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package_write_rpm)
NOTE: Running task 1607 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package_qa)
NOTE: recipe glib-networking-2.76.0-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package_qa: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package_qa: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_compile: Succeeded
NOTE: Running task 1608 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1609 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install)
NOTE: recipe coreutils-9.1-r0: task do_install: Started
NOTE: recipe coreutils-9.1-r0: task do_install: Succeeded
NOTE: Running task 1610 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1611 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_package: Started
NOTE: recipe coreutils-9.1-r0: task do_package: Succeeded
NOTE: Running task 1612 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata)
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1612 tasks of which 1555 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 52 ERROR messages, returning a non-zero exit code.
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-src went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-dbg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-ptest went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-staticdev went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-dev went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-doc went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-stdbuf went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-af went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-be went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-bg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ca went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-cs went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-da went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-de went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-el went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-eo went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-es went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-et went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-eu went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-fi went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-fr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ga went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-gl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-hr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-hu went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ia went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-id went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-it went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ja went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-kk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ko went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-lg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-lt went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ms went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-nb went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-nl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pt went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pt-br went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ro went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ru went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sv went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-tr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-uk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-vi went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-zh-cn went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-zh-tw went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/coreutils/9.1-r0/temp/log.do_packagedata.2895028
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata) failed with exit code '1'

--===============5328588626286533161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glib-networking/glib-networking-dbg: PKGSIZE changed from 591728 to 614340 (+4%)
packages/core2-32-poky-linux/glib-networking/glib-networking-dbg: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-dbg: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-dev: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-dev: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-doc: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-doc: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ab: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ab: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-an: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-an: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ar: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ar: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-as: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-as: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-be: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-be: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bg: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bg: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bn-in: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bn-in: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bs: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bs: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca+valencia: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca+valencia: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-cs: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-cs: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-da: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-da: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-de: PKGSIZE changed from 8265 to 8850 (+7%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-de: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-de: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-el: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-el: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-ca: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-ca: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-gb: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-gb: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eo: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eo: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-es: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-es: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-et: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-et: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eu: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eu: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fa: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fa: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fi: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fi: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fr: PKGSIZE changed from 8451 to 8260 (-2%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fr: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fr: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fur: PKGSIZE changed from 8072 to 7875 (-2%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fur: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fur: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gd: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gd: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gl: PKGSIZE changed from 8230 to 8751 (+6%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gl: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gl: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gu: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gu: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-he: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-he: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hi: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hi: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hr: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hr: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hu: PKGSIZE changed from 8029 to 8634 (+8%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hu: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hu: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-id: PKGSIZE changed from 7335 to 7891 (+8%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-id: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-id: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-it: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-it: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ja: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ja: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ka: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ka: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kk: PKGSIZE changed from 9814 to 9618 (-2%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kk: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kk: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-km: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-km: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kn: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kn: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ko: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ko: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lt: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lt: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lv: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lv: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ml: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ml: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-mr: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-mr: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ms: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ms: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nb: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nb: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ne: PKGSIZE changed from 10493 to 11164 (+6%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ne: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ne: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nl: PKGSIZE changed from 7739 to 7545 (-3%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nl: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nl: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-oc: PKGSIZE changed from 8254 to 8092 (-2%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-oc: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-oc: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-or: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-or: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pa: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pa: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pl: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pl: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt-br: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt-br: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt: PKGSIZE changed from 7885 to 8417 (+7%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ro: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ro: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ru: PKGSIZE changed from 10297 to 11083 (+8%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ru: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ru: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sk: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sk: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sl: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sl: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr+latin: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr+latin: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr: PKGSIZE changed from 10592 to 10386 (-2%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sv: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sv: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ta: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ta: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-te: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-te: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tg: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tg: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-th: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-th: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tr: PKGSIZE changed from 7332 to 7905 (+8%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tr: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tr: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ug: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ug: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-uk: PKGSIZE changed from 11020 to 11812 (+7%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-uk: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-uk: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-vi: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-vi: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-cn: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-cn: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-hk: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-hk: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-tw: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-tw: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-ptest: PKGSIZE changed from 330182 to 338418 (+2%)
packages/core2-32-poky-linux/glib-networking/glib-networking-ptest: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-ptest: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-src: PKGSIZE changed from 510710 to 538676 (+5%)
packages/core2-32-poky-linux/glib-networking/glib-networking-src: FILELIST: directory renamed /usr/src/debug/glib-networking/2.74.0-r0/proxy/environment -> /usr/src/debug/glib-networking/2.76.0-r0/proxy/environment, directory renamed /usr/src/debug/glib-networking/2.74.0-r0/tls/openssl -> /usr/src/debug/glib-networking/2.76.0-r0/tls/openssl, directory renamed /usr/src/debug/glib-networking/2.74.0-r0/proxy/tests -> /usr/src/debug/glib-networking/2.76.0-r0/proxy/tests, directory renamed /usr/src/debug/glib-networking/2.74.0-r0/tls/tests -> /usr/src/debug/glib-networking/2.76.0-r0/tls/tests, removed "/usr/src/debug/glib-networking/2.74.0-r0/tls/base/gtlslog.h /usr/src/debug/glib-networking/2.74.0-r0/tls/base/gtlsoutputstream.c /usr/src/debug/glib-networking/2.74.0-r0/tls/base/gtlsconnection-base.h /usr/src/debug/glib-networking/2.74.0-r0/tls/base/gtlsoutputstream.h /usr/src/debug/glib-networking/2.74.0-r0/tls/base/gtlslog.c /usr/src/debug/glib-networking/2.74.0-r0/tls/base/gtlsconnectio
 n-base.c /usr/src/debug/glib-networking/2.74.0-r0/tls/base/gtlsinputstream.h /usr/src/debug/glib-networking/2.74.0-r0/tls/base/gtlsinputstream.c", added "/usr/src/debug/glib-networking/2.76.0-r0/tls/base/gtlslog.h /usr/src/debug/glib-networking/2.76.0-r0/tls/base/gtlsoutputstream.c /usr/src/debug/glib-networking/2.76.0-r0/tls/base/gtlsconnection-base.h /usr/src/debug/glib-networking/2.76.0-r0/tls/base/gtlsoutputstream.h /usr/src/debug/glib-networking/2.76.0-r0/tls/base/gtlslog.c /usr/src/debug/glib-networking/2.76.0-r0/tls/base/gtlsconnection-base.c /usr/src/debug/glib-networking/2.76.0-r0/tls/base/gtlssessioncache.c /usr/src/debug/glib-networking/2.76.0-r0/tls/base/gtlsinputstream.h /usr/src/debug/glib-networking/2.76.0-r0/tls/base/gtlssessioncache.h /usr/src/debug/glib-networking/2.76.0-r0/tls/base/gtlsinputstream.c"
packages/core2-32-poky-linux/glib-networking/glib-networking-src: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-src: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-staticdev: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-staticdev: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking: PKGSIZE changed from 154232 to 166520 (+8%)
packages/core2-32-poky-linux/glib-networking/glib-networking: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking: SRC_URI changed from "https://download.gnome.org/sources//glib-networking/2.74/glib-networking-2.74.0.tar.xz;name=archive file://run-ptest file://eagain.patch" to "https://download.gnome.org/sources//glib-networking/2.76/glib-networking-2.76.0.tar.xz;name=archive file://run-ptest file://eagain.patch"
packages/core2-32-poky-linux/glib-networking: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking: PV changed from "2.74.0" to "2.76.0"

--===============5328588626286533161==--

