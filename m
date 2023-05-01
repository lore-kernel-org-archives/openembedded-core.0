Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B524EC7EE2A
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:02 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.107435.1682976351863576214
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=DyBY0Dur;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010187d9353077-618dd194-6237-46d1-a366-b65b0a9ec06c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976354;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zfBGQvlhi8ICiVt/b+jdL+WGVEZs9um1/xoah0dISf4=;
	b=DyBY0DursYr1WAtqA1nU1Dl0TrmtqHLKrDjjU40Usc5flA4/JXnu/iBg7JgDae8Z
	ge3YCwOYvY1RwoLsxnoeRTCBrihyx3l4iODdKjgaHMQ6hsJJpaSKTZLapxqBtIhcetS
	gOMy7uZXI5QgAI1rxh88SCB9NM7UB4X3QpqAlZx4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976354;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zfBGQvlhi8ICiVt/b+jdL+WGVEZs9um1/xoah0dISf4=;
	b=JzTjDuIlw3svmcHaS59zuKqBEnISdK+8DELCh0s0PivoNywVBvZeyaEOQ2R98sk0
	iDOJOykvnmNdhSo5ZmjeKqB3NVrtgmnrpFhZjgdYg0fHVdGs+0xMpl/EwxcolNiFA8x
	tP+vzTtgHkRtFMDc/TPyzKZ+miPETtPNGiHz5ZZM=
Content-Type: multipart/mixed; boundary="===============5279341786013763274=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsoup: upgrading to 3.4.2 SUCCEEDED
Message-ID: <01010187d9353077-618dd194-6237-46d1-a366-b65b0a9ec06c-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180707

--===============5279341786013763274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsoup* to *3.4.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsoup-upgrade-3.4.0-3.4.2.patch
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
--===============5279341786013763274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 57 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f954252493690732a470733584d50b7c557ff6af"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 37 Local 20 Mirrors 0 Missed 17 Current 398 (54% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1060 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_fetch)
NOTE: Running task 1141 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_write_config)
NOTE: Running task 1187 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_fetch)
NOTE: Running task 1273 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_compile)
NOTE: Running task 1275 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_compile)
NOTE: Running task 1384 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_write_config)
NOTE: recipe glib-networking-2.74.0-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Started
NOTE: Running task 1554 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_unpack)
NOTE: Running task 1555 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.52.0-r0: task do_compile: Started
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Succeeded
NOTE: Running task 1556 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_unpack)
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Started
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_unpack: Started
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 1557 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_patch)
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 1558 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_patch)
NOTE: recipe glib-networking-2.74.0-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Succeeded
NOTE: Running task 1559 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1560 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_populate_lic)
NOTE: recipe glib-networking-2.74.0-r0: task do_patch: Succeeded
NOTE: Running task 1561 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-networking-2.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_populate_lic: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_populate_lic unihash changed to c77f4da3b4be43ee2e89d8f6d12fae87ab2f8d97de2c6617b159f79b9058014e
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1562 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_configure)
NOTE: recipe glib-networking-2.74.0-r0: task do_configure: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_compile: Succeeded
NOTE: Running task 1563 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_install)
NOTE: recipe nghttp2-1.52.0-r0: task do_install: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_configure: Succeeded
NOTE: Running task 1564 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.74.0-r0: task do_configure_ptest_base: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_install: Succeeded
NOTE: Running task 1565 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_populate_sysroot)
NOTE: Running task 1566 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_package)
NOTE: recipe glib-networking-2.74.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1567 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_compile)
NOTE: recipe nghttp2-1.52.0-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_package: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_compile: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_package: Succeeded
NOTE: Running task 1568 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_packagedata)
NOTE: recipe nghttp2-1.52.0-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_packagedata: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_compile: Succeeded
NOTE: Running task 1569 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.74.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1570 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_install)
NOTE: recipe glib-networking-2.74.0-r0: task do_install: Started
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Succeeded
NOTE: Running task 1571 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_install)
NOTE: recipe libpsl-0.21.2-r0: task do_install: Started
NOTE: recipe libpsl-0.21.2-r0: task do_install: Succeeded
NOTE: Running task 1572 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_populate_sysroot)
NOTE: Running task 1573 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_package)
NOTE: recipe glib-networking-2.74.0-r0: task do_install: Succeeded
NOTE: Running task 1574 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_install_ptest_base)
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_package: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1575 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_package)
NOTE: recipe glib-networking-2.74.0-r0: task do_package: Started
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1576 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_package: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1577 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_configure)
NOTE: Running task 1578 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_packagedata)
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.2-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_package: Succeeded
NOTE: Running task 1579 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_packagedata)
NOTE: recipe libsoup-3.4.2-r0: task do_configure: Succeeded
NOTE: Running task 1580 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_compile)
NOTE: recipe glib-networking-2.74.0-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.2-r0: task do_compile: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_packagedata: Failed
NOTE: recipe libsoup-3.4.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1580 tasks of which 1547 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_packagedata
Summary: There were 79 ERROR messages, returning a non-zero exit code.
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-src went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-dbg went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-ptest went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-staticdev went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-dev went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-doc went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ab went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-an went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ar went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-as went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-be went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-bg went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-bn-in went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-bs went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ca went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ca+valencia went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-cs went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-da went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-de went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-el went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-en-ca went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-en-gb went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-eo went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-es went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-et went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-eu went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-fa went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-fi went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-fr went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-fur went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-gd went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-gl went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-gu went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-he went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-hi went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-hr went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-hu went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-id went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-it went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ja went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ka went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-kk went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-km went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-kn went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ko went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-lt went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-lv went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ml went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-mr went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ms went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-nb went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ne went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-nl went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-oc went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-or went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-pa went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-pl went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-pt went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-pt-br went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ro went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ru went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sk went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sl went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sr went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sr+latin went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sv went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ta went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-te went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-tg went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-th went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-tr went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ug went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-uk went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-vi went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-zh-cn went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-zh-hk went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-zh-tw went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/glib-networking/2.74.0-r0/temp/log.do_packagedata.1317325
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_packagedata) failed with exit code '1'

--===============5279341786013763274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 67 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f954252493690732a470733584d50b7c557ff6af"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 37 Local 20 Mirrors 0 Missed 17 Current 394 (54% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1059 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_fetch)
NOTE: Running task 1135 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_write_config)
NOTE: Running task 1181 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_fetch)
NOTE: Running task 1266 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_compile)
NOTE: Running task 1267 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_compile)
NOTE: Running task 1374 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_write_config)
NOTE: recipe glib-networking-2.74.0-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_write_config: Started
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_fetch: Succeeded
NOTE: Running task 1540 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_unpack)
NOTE: Running task 1541 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_compile: Started
NOTE: Running task 1542 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_unpack)
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Started
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_unpack: Started
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 1543 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_patch)
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 1544 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_patch)
NOTE: recipe glib-networking-2.74.0-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Succeeded
NOTE: Running task 1545 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1546 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_populate_lic)
NOTE: recipe glib-networking-2.74.0-r0: task do_patch: Succeeded
NOTE: Running task 1547 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-networking-2.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_populate_lic: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_populate_lic unihash changed to c77f4da3b4be43ee2e89d8f6d12fae87ab2f8d97de2c6617b159f79b9058014e
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1548 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_configure)
NOTE: recipe glib-networking-2.74.0-r0: task do_configure: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_compile: Succeeded
NOTE: Running task 1549 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_install)
NOTE: recipe glib-networking-2.74.0-r0: task do_configure: Succeeded
NOTE: Running task 1550 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_configure_ptest_base)
NOTE: recipe nghttp2-1.52.0-r0: task do_install: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1551 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_compile)
NOTE: recipe glib-networking-2.74.0-r0: task do_compile: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_install: Succeeded
NOTE: Running task 1552 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_populate_sysroot)
NOTE: Running task 1553 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_package)
NOTE: recipe nghttp2-1.52.0-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_package: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_package: Succeeded
NOTE: Running task 1554 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_packagedata)
NOTE: recipe nghttp2-1.52.0-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_packagedata: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_compile: Succeeded
NOTE: Running task 1555 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.74.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Succeeded
NOTE: Running task 1556 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_install)
NOTE: recipe glib-networking-2.74.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1557 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_install)
NOTE: recipe libpsl-0.21.2-r0: task do_install: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_install: Started
NOTE: recipe libpsl-0.21.2-r0: task do_install: Succeeded
NOTE: Running task 1558 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_populate_sysroot)
NOTE: Running task 1559 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_package)
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_package: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_install: Succeeded
NOTE: Running task 1560 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.74.0-r0: task do_install_ptest_base: Started
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1561 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.74.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1562 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_package)
NOTE: recipe libsoup-3.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_package: Started
NOTE: recipe libpsl-0.21.2-r0: task do_package: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1563 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_configure)
NOTE: Running task 1564 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_packagedata)
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.2-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_configure: Succeeded
NOTE: Running task 1565 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_compile)
NOTE: recipe libsoup-3.4.2-r0: task do_compile: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_package: Succeeded
NOTE: Running task 1566 of 1574 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_packagedata)
NOTE: recipe glib-networking-2.74.0-r0: task do_packagedata: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_packagedata: Failed
NOTE: recipe libsoup-3.4.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1566 tasks of which 1533 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_packagedata
Summary: There were 79 ERROR messages, returning a non-zero exit code.
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-src went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-dbg went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-ptest went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-staticdev went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-dev went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-doc went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ab went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-an went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ar went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-as went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-be went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-bg went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-bn-in went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-bs went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ca went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ca+valencia went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-cs went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-da went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-de went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-el went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-en-ca went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-en-gb went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-eo went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-es went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-et went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-eu went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-fa went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-fi went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-fr went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-fur went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-gd went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-gl went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-gu went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-he went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-hi went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-hr went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-hu went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-id went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-it went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ja went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ka went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-kk went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-km went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-kn went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ko went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-lt went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-lv went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ml went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-mr went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ms went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-nb went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ne went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-nl went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-oc went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-or went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-pa went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-pl went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-pt went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-pt-br went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ro went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ru went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sk went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sl went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sr went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sr+latin went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sv went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ta went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-te went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-tg went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-th went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-tr went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ug went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-uk went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-vi went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-zh-cn went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-zh-hk went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-zh-tw went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/glib-networking/2.74.0-r0/temp/log.do_packagedata.1327881
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_packagedata) failed with exit code '1'

--===============5279341786013763274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libsoup: SRC_URI changed from "https://download.gnome.org/sources//libsoup/3.4/libsoup-3.4.0.tar.xz" to "https://download.gnome.org/sources//libsoup/3.4/libsoup-3.4.2.tar.xz"
packages/core2-32-poky-linux/libsoup: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-dbg: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-dbg: PKGSIZE changed from 1631008 to 1634420 (+0%)
packages/core2-32-poky-linux/libsoup/libsoup-dbg: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-dev: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-dev: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-doc: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-doc: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ab: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ab: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-an: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-an: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-as: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-as: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-be: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-be: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-bg: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-bg: PKGSIZE changed from 5394 to 5378 (-0%)
packages/core2-32-poky-linux/libsoup/libsoup-locale-bg: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-bn-in: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-bn-in: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-bs: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-bs: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ca+valencia: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ca+valencia: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ca: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ca: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-cs: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-cs: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-da: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-da: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-de: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-de: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-el: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-el: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-en-gb: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-en-gb: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-eo: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-eo: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-es: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-es: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-et: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-et: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-eu: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-eu: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-fa: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-fa: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-fi: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-fi: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-fr: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-fr: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-fur: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-fur: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-gd: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-gd: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-gl: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-gl: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-gu: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-gu: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-he: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-he: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-hi: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-hi: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-hr: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-hr: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-hu: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-hu: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-id: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-id: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-it: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-it: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ja: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ja: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ka: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ka: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-kn: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-kn: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ko: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ko: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-lt: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-lt: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-lv: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-lv: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ml: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ml: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-mr: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-mr: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ms: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ms: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-nb: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-nb: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ne: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ne: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-nl: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-nl: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-oc: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-oc: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-or: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-or: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-pa: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-pa: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-pl: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-pl: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-pt-br: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-pt-br: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-pt: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-pt: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ro: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ro: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ru: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ru: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sk: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sk: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sl: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sl: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sr+latin: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sr+latin: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sr: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sr: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sv: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sv: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ta: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ta: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-te: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-te: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-tg: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-tg: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-th: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-th: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-tr: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-tr: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ug: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ug: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-uk: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-uk: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-uz+cyrillic: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-uz+cyrillic: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-vi: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-vi: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-cn: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-cn: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-hk: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-hk: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-tw: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-tw: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-src: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-src: PKGSIZE changed from 1766656 to 1770462 (+0%)
packages/core2-32-poky-linux/libsoup/libsoup-src: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-staticdev: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup-staticdev: PKGV changed from 3.4.0 [default] to 3.4.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup: PV changed from "3.4.0" to "3.4.2"
packages/core2-32-poky-linux/libsoup/libsoup: PKGSIZE changed from 756156 to 760252 (+1%)
packages/core2-32-poky-linux/libsoup/libsoup: PKGV changed from 3.4.0 [default] to 3.4.2 [default]

--===============5279341786013763274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 51 skipped, 0 masked, 0 errors.
Removing 42 recipes from the core2-32 sysroot...done.
Removing 68 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f954252493690732a470733584d50b7c557ff6af"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 188 Local 171 Mirrors 0 Missed 17 Current 152 (90% match, 95% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 153 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 156 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 157 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 158 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 166 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 167 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 170 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 173 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 174 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 176 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 177 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 182 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 183 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 689 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_fetch)
NOTE: Running task 700 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_write_config)
NOTE: Running task 703 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_fetch)
NOTE: Running task 719 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_write_config)
NOTE: recipe nghttp2-1.52.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 729 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_fetch)
NOTE: Running task 730 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_write_config: Started
NOTE: Running setscene task 198 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 200 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 201 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Started
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 206 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 207 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running task 743 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_unpack)
NOTE: recipe glib-networking-2.74.0-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 744 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_unpack)
NOTE: recipe nghttp2-1.52.0-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 210 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 211 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe nghttp2-1.52.0-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_write_config: Succeeded
NOTE: Running task 754 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_unpack)
NOTE: Running task 755 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_unpack: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_unpack: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 788 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_patch)
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 789 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_patch)
NOTE: recipe glib-networking-2.74.0-r0: task do_patch: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 224 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running task 790 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_patch)
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_patch: Succeeded
NOTE: Running task 795 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Succeeded
NOTE: Running task 796 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 797 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_populate_lic)
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_patch: Started
NOTE: Running task 798 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: recipe glib-networking-2.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_populate_lic: Started
NOTE: Running setscene task 227 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 228 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 229 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 230 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 231 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.52.0-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: Running task 799 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_generate_toolchain_file)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 233 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 234 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 236 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 237 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 238 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 239 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libsoup-3.4.2-r0: task do_populate_lic: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_populate_lic unihash changed to c77f4da3b4be43ee2e89d8f6d12fae87ab2f8d97de2c6617b159f79b9058014e
NOTE: Running setscene task 244 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 245 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 246 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 247 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 248 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 249 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 251 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 256 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 267 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 275 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 276 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 277 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 280 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 282 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 284 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 294 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 299 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 303 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 305 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 308 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 310 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 313 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 315 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 317 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 318 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 321 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 324 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 334 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 337 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 338 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1141 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1173 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1175 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1245 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1246 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe glib-networking-2.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_configure: Started
NOTE: Running task 1247 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_configure: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_configure: Succeeded
NOTE: Running task 1248 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.74.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1249 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_compile)
NOTE: recipe glib-networking-2.74.0-r0: task do_compile: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_compile: Succeeded
NOTE: Running task 1250 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.74.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1251 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_install)
NOTE: recipe glib-networking-2.74.0-r0: task do_install: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_configure: Succeeded
NOTE: Running task 1252 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_compile)
NOTE: recipe nghttp2-1.52.0-r0: task do_compile: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_install: Succeeded
NOTE: Running task 1253 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.74.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1254 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_package)
NOTE: recipe glib-networking-2.74.0-r0: task do_package: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_compile: Succeeded
NOTE: Running task 1255 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_install)
NOTE: recipe nghttp2-1.52.0-r0: task do_install: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_install: Succeeded
NOTE: Running task 1256 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_populate_sysroot)
NOTE: Running task 1257 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_package)
NOTE: recipe nghttp2-1.52.0-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_package: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_package: Succeeded
NOTE: Running task 1258 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_packagedata)
NOTE: recipe nghttp2-1.52.0-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_packagedata: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_package: Succeeded
NOTE: Running task 1259 of 1275 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_packagedata)
NOTE: recipe glib-networking-2.74.0-r0: task do_packagedata: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_packagedata: Failed
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1259 tasks of which 1223 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_packagedata
Summary: There were 79 ERROR messages, returning a non-zero exit code.
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-src went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-dbg went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-ptest went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-staticdev went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-dev went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-doc went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ab went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-an went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ar went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-as went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-be went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-bg went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-bn-in went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-bs went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ca went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ca+valencia went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-cs went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-da went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-de went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-el went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-en-ca went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-en-gb went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-eo went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-es went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-et went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-eu went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-fa went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-fi went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-fr went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-fur went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-gd went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-gl went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-gu went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-he went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-hi went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-hr went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-hu went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-id went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-it went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ja went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ka went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-kk went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-km went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-kn went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ko went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-lt went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-lv went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ml went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-mr went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ms went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-nb went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ne went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-nl went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-oc went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-or went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-pa went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-pl went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-pt went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-pt-br went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ro went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ru went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sk went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sl went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sr went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sr+latin went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sv went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ta went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-te went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-tg went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-th went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-tr went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ug went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-uk went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-vi went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-zh-cn went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-zh-hk went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-zh-tw went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/glib-networking/2.74.0-r0/temp/log.do_packagedata.1354179
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_packagedata) failed with exit code '1'

--===============5279341786013763274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 74 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f954252493690732a470733584d50b7c557ff6af"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 37 Local 20 Mirrors 0 Missed 17 Current 398 (54% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1060 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_fetch)
NOTE: Running task 1141 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_write_config)
NOTE: Running task 1187 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_fetch)
NOTE: Running task 1273 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_compile)
NOTE: Running task 1275 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_compile)
NOTE: Running task 1384 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_write_config)
NOTE: recipe glib-networking-2.74.0-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_write_config: Started
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_fetch: Succeeded
NOTE: Running task 1554 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_unpack)
NOTE: Running task 1555 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Succeeded
NOTE: Running task 1556 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_unpack)
NOTE: recipe nghttp2-1.52.0-r0: task do_compile: Started
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Started
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_unpack: Started
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 1557 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_patch)
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 1558 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_patch)
NOTE: recipe glib-networking-2.74.0-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Succeeded
NOTE: Running task 1559 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1560 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_populate_lic)
NOTE: recipe glib-networking-2.74.0-r0: task do_patch: Succeeded
NOTE: Running task 1561 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_populate_lic: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_populate_lic unihash changed to c77f4da3b4be43ee2e89d8f6d12fae87ab2f8d97de2c6617b159f79b9058014e
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1562 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_configure)
NOTE: recipe glib-networking-2.74.0-r0: task do_configure: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_compile: Succeeded
NOTE: Running task 1563 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_install)
NOTE: recipe glib-networking-2.74.0-r0: task do_configure: Succeeded
NOTE: Running task 1564 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_configure_ptest_base)
NOTE: recipe nghttp2-1.52.0-r0: task do_install: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1565 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_compile)
NOTE: recipe glib-networking-2.74.0-r0: task do_compile: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_install: Succeeded
NOTE: Running task 1566 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_populate_sysroot)
NOTE: Running task 1567 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_package)
NOTE: recipe nghttp2-1.52.0-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_package: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_package: Succeeded
NOTE: Running task 1568 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_packagedata)
NOTE: recipe nghttp2-1.52.0-r0: task do_packagedata: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_compile: Succeeded
NOTE: Running task 1569 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_compile_ptest_base)
NOTE: recipe nghttp2-1.52.0-r0: task do_packagedata: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1570 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_install)
NOTE: recipe glib-networking-2.74.0-r0: task do_install: Started
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Succeeded
NOTE: Running task 1571 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_install)
NOTE: recipe libpsl-0.21.2-r0: task do_install: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_install: Succeeded
NOTE: Running task 1572 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.74.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_install: Succeeded
NOTE: Running task 1573 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_package)
NOTE: Running task 1574 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_populate_sysroot)
NOTE: Running task 1575 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_package)
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_package: Started
NOTE: recipe libpsl-0.21.2-r0: task do_package: Started
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1576 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-3.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1577 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_package: Succeeded
NOTE: Running task 1578 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_packagedata)
NOTE: recipe libsoup-3.4.2-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_package: Succeeded
NOTE: Running task 1579 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_packagedata)
NOTE: recipe glib-networking-2.74.0-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.2-r0: task do_configure: Succeeded
NOTE: Running task 1580 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_compile)
NOTE: recipe libsoup-3.4.2-r0: task do_compile: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_packagedata: Failed
NOTE: recipe libsoup-3.4.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1580 tasks of which 1547 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_packagedata
Summary: There were 79 ERROR messages, returning a non-zero exit code.
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-src went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-dbg went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-ptest went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-staticdev went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-dev went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-doc went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ab went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-an went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ar went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-as went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-be went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-bg went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-bn-in went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-bs went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ca went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ca+valencia went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-cs went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-da went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-de went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-el went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-en-ca went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-en-gb went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-eo went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-es went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-et went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-eu went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-fa went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-fi went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-fr went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-fur went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-gd went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-gl went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-gu went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-he went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-hi went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-hr went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-hu went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-id went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-it went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ja went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ka went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-kk went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-km went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-kn went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ko went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-lt went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-lv went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ml went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-mr went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ms went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-nb went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ne went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-nl went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-oc went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-or went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-pa went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-pl went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-pt went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-pt-br went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ro went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ru went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sk went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sl went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sr went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sr+latin went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sv went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ta went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-te went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-tg went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-th went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-tr went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ug went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-uk went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-vi went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-zh-cn went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-zh-hk went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-zh-tw went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/glib-networking/2.74.0-r0/temp/log.do_packagedata.1338403
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_packagedata) failed with exit code '1'

--===============5279341786013763274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1799 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f954252493690732a470733584d50b7c557ff6af"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 36 Local 19 Mirrors 0 Missed 17 Current 399 (52% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1060 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_fetch)
NOTE: Running task 1141 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_write_config)
NOTE: Running task 1187 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_fetch)
NOTE: Running task 1274 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_compile)
NOTE: Running task 1275 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_compile)
NOTE: Running task 1384 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_write_config)
NOTE: recipe glib-networking-2.74.0-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_write_config: Started
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_fetch: Succeeded
NOTE: Running task 1554 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_unpack)
NOTE: Running task 1555 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_compile: Started
NOTE: Running task 1556 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_unpack)
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Started
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_unpack: Started
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 1557 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_patch)
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 1558 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_patch)
NOTE: recipe glib-networking-2.74.0-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Succeeded
NOTE: Running task 1559 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1560 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_populate_lic)
NOTE: recipe glib-networking-2.74.0-r0: task do_patch: Succeeded
NOTE: Running task 1561 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-networking-2.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_populate_lic: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_populate_lic unihash changed to c77f4da3b4be43ee2e89d8f6d12fae87ab2f8d97de2c6617b159f79b9058014e
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1562 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_configure)
NOTE: recipe glib-networking-2.74.0-r0: task do_configure: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_compile: Succeeded
NOTE: Running task 1563 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_install)
NOTE: recipe nghttp2-1.52.0-r0: task do_install: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_install: Succeeded
NOTE: Running task 1564 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_populate_sysroot)
NOTE: Running task 1565 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_package)
NOTE: recipe glib-networking-2.74.0-r0: task do_configure: Succeeded
NOTE: Running task 1566 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_configure_ptest_base)
NOTE: recipe nghttp2-1.52.0-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_package: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1567 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_compile)
NOTE: recipe glib-networking-2.74.0-r0: task do_compile: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_package: Succeeded
NOTE: Running task 1568 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_packagedata)
NOTE: recipe nghttp2-1.52.0-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_packagedata: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_compile: Succeeded
NOTE: Running task 1569 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.74.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1570 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_install)
NOTE: recipe glib-networking-2.74.0-r0: task do_install: Started
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Succeeded
NOTE: Running task 1571 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_install)
NOTE: recipe libpsl-0.21.2-r0: task do_install: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_install: Succeeded
NOTE: Running task 1572 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_install_ptest_base)
NOTE: recipe libpsl-0.21.2-r0: task do_install: Succeeded
NOTE: Running task 1573 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_populate_sysroot)
NOTE: Running task 1574 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_package)
NOTE: recipe glib-networking-2.74.0-r0: task do_install_ptest_base: Started
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_package: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1575 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_package)
NOTE: recipe glib-networking-2.74.0-r0: task do_package: Started
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1576 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_package: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1577 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_configure)
NOTE: Running task 1578 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_packagedata)
NOTE: recipe libsoup-3.4.2-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_package: Succeeded
NOTE: Running task 1579 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_packagedata)
NOTE: recipe glib-networking-2.74.0-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.2-r0: task do_configure: Succeeded
NOTE: Running task 1580 of 1588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_compile)
NOTE: recipe libsoup-3.4.2-r0: task do_compile: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_packagedata: Failed
NOTE: recipe libsoup-3.4.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1580 tasks of which 1547 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_packagedata
Summary: There were 79 ERROR messages, returning a non-zero exit code.
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-src went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-dbg went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-ptest went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-staticdev went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-dev went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-doc went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ab went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-an went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ar went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-as went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-be went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-bg went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-bn-in went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-bs went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ca went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ca+valencia went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-cs went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-da went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-de went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-el went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-en-ca went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-en-gb went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-eo went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-es went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-et went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-eu went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-fa went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-fi went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-fr went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-fur went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-gd went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-gl went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-gu went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-he went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-hi went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-hr went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-hu went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-id went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-it went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ja went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ka went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-kk went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-km went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-kn went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ko went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-lt went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-lv went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ml went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-mr went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ms went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-nb went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ne went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-nl went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-oc went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-or went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-pa went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-pl went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-pt went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-pt-br went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ro went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ru went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sk went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sl went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sr went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sr+latin went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sv went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ta went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-te went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-tg went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-th went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-tr went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ug went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-uk went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-vi went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-zh-cn went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-zh-hk went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-zh-tw went backwards which would break package feeds (from 0:2.76.0-r0 to 0:2.74.0-r0) [version-going-backwards]
ERROR: glib-networking-2.74.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glib-networking/2.74.0-r0/temp/log.do_packagedata.1306743
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_packagedata) failed with exit code '1'

--===============5279341786013763274==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsoup-upgrade-3.4.0-3.4.2.patch"

RnJvbSA4ZjM4NzFmMzViOTIyNDNlYTg0NmEzYjk1MWM1Zjk2ZjNjMzVhMGQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAyMToxODozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnNvdXA6IHVwZ3JhZGUgMy40LjAgLT4gMy40LjIKCi0tLQogLi4uL2xpYnNvdXAve2xpYnNvdXBf
My40LjAuYmIgPT4gbGlic291cF8zLjQuMi5iYn0gICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGlic291cC97bGlic291cF8zLjQuMC5iYiA9PiBsaWJzb3VwXzMuNC4yLmJi
fSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnNvdXAvbGlic291
cF8zLjQuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnNvdXAvbGlic291cF8zLjQuMi5i
YgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJzb3VwL2xpYnNvdXBfMy40LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YnNvdXAvbGlic291cF8zLjQuMi5iYgppbmRleCBkMzVlNGYyNWMxLi4zN2U1NGFiZTczIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJzb3VwL2xpYnNvdXBfMy40LjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlic291cC9saWJzb3VwXzMuNC4yLmJiCkBAIC0xMiw3
ICsxMiw3IEBAIERFUEVORFMgPSAiZ2xpYi0yLjAgZ2xpYi0yLjAtbmF0aXZlIGxpYnhtbDIgc3Fs
aXRlMyBsaWJwc2wgbmdodHRwMiIKIFNIUlRfVkVSID0gIiR7QGQuZ2V0VmFyKCdQVicpLnNwbGl0
KCcuJylbMF19LiR7QGQuZ2V0VmFyKCdQVicpLnNwbGl0KCcuJylbMV19IgogCiBTUkNfVVJJID0g
IiR7R05PTUVfTUlSUk9SfS9saWJzb3VwLyR7U0hSVF9WRVJ9L2xpYnNvdXAtJHtQVn0udGFyLnh6
IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjIzZWZmZjZhYzcwZjJjMWU4NzM1MDdkYWM1MjY0OWVl
YzAzMmMxNTk3YTRhZTk1MTc2MmNlMzEyMzc4OWFjYzkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
NzhjOGZhMzdjYjE1MmQ0MGVjOGM0YTE0OGQ2MTU1ZTJmNjk0N2YzZjE2MDJhN2NkYTNhMzFhZDQw
ZjVlZTJmMyIKIAogUFJPVklERVMgPSAibGlic291cC0zLjAiCiBDVkVfUFJPRFVDVCA9ICJsaWJz
b3VwIgotLSAKMi4zOS4yCgo=

--===============5279341786013763274==--

