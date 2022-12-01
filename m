Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03226C64E7E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:34 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.46771.1669908627009594817
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=f901tEeg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010184ce4f7b41-606b8126-3e21-4e2b-9e46-27cc21cd5524-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lseGvj9KarTAUE3dXixgpqL0/es517FRD752sSc1NNo=;
	b=f901tEegWp62UsXUCI2NYEv4MwVkVHzM6XFtRpRtONSbTBxPagIOgU1Qqfk5qWcQ
	+El39hbES6Ost0YYVRZUuaJd/TCu4w2hQUxFfU+mlHE0lOuBTsonqHDF7Fn7Qp7xsMK
	gRydZrjKRNhFRu7V25qnUg3eNsRX/veFgIfHmylA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lseGvj9KarTAUE3dXixgpqL0/es517FRD752sSc1NNo=;
	b=HBlzsVy/Up9fjh0QyGohtSv5uwCVXL1IDxuM3CJ3XP+YF4OzsCi5e+tBJxWQYKsc
	JvtOxVCpfn7oIkFkPlVGHLA2e2D2gl2qXDH+uUj75E/FW6bR+TMIwtLxml4/Lik9sID
	WrXlngVMiti7fuMvHvLqAzOvBlXa1wg0AVDGgwHs=
Content-Type: multipart/mixed; boundary="===============8788420306580023790=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangrc.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycairo: upgrading to 1.23.0 SUCCEEDED
Message-ID: <01010184ce4f7b41-606b8126-3e21-4e2b-9e46-27cc21cd5524-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174150

--===============8788420306580023790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pycairo* to *1.23.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycairo-upgrade-1.21.0-1.23.0.patch
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
--===============8788420306580023790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1668 targets, 54 skipped, 0 masked, 0 errors.
Removing 2 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5381dd8b439e178690cd0f694e5cd56571511039"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 28 Local 21 Mirrors 0 Missed 7 Current 406 (75% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 407 of 434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 419 of 434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 427 of 434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1272 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_fetch)
NOTE: Running task 1374 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_write_config)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_write_config: Started
NOTE: Running task 1377 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_unpack)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_unpack: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1495 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_patch)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_patch: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_patch: Succeeded
NOTE: Running task 1518 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1519 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_populate_lic)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_populate_lic: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_populate_lic unihash changed to f413ede038e1e78cbc5da121141d9de6ee25ec792ab5e2da0d85640452196d26
NOTE: recipe python3-pycairo-1.23.0-r0: task do_deploy_source_date_epoch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/glib-2.0/1_2.74.1-r0/temp/log.do_packagedata_setscene.1640287
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 433 of 434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb:do_package_setscene)
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_package_setscene: Started
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1539 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1540 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb:do_packagedata)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1541 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_configure)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_configure: Succeeded
NOTE: Running task 1544 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_compile)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_compile: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_compile: Succeeded
NOTE: Running task 1545 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_install)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_install: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_install: Succeeded
NOTE: Running task 1546 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_package)
NOTE: Running task 1547 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_populate_sysroot)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package: Succeeded
NOTE: Running task 1548 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_packagedata)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1549 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_package_write_rpm)
NOTE: Running task 1550 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_package_qa)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package_qa: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1551 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1551 tasks of which 1534 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 110 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8788420306580023790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pycairo: PV changed from "1.21.0" to "1.23.0"
packages/core2-32-poky-linux/python3-pycairo: PKGV changed from 1.21.0 [default] to 1.23.0 [default]
packages/core2-32-poky-linux/python3-pycairo: SRC_URI changed from "https://github.com/pygobject/pycairo/releases//download/v1.21.0/pycairo-1.21.0.tar.gz" to "https://github.com/pygobject/pycairo/releases//download/v1.23.0/pycairo-1.23.0.tar.gz"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dbg: PV changed from "1.21.0" to "1.23.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dbg: PKGSIZE changed from 392132 to 392140 (+0%)
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dbg: PKGV changed from 1.21.0 [default] to 1.23.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dev: PV changed from "1.21.0" to "1.23.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dev: PKGV changed from 1.21.0 [default] to 1.23.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-doc: PV changed from "1.21.0" to "1.23.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-doc: PKGV changed from 1.21.0 [default] to 1.23.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-locale: PV changed from "1.21.0" to "1.23.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-locale: PKGV changed from 1.21.0 [default] to 1.23.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-src: PV changed from "1.21.0" to "1.23.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-src: PKGSIZE changed from 358648 to 360684 (+1%)
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-src: PKGV changed from 1.21.0 [default] to 1.23.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-staticdev: PV changed from "1.21.0" to "1.23.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-staticdev: PKGV changed from 1.21.0 [default] to 1.23.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo: FILELIST: removed "/usr/lib/python3.11/site-packages/pycairo-1.21.0.egg-info", added "/usr/lib/python3.11/site-packages/pycairo-1.23.0.egg-info"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo: PV changed from "1.21.0" to "1.23.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo: PKGSIZE changed from 419917 to 423497 (+1%)
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo: PKGV changed from 1.21.0 [default] to 1.23.0 [default]
Changes to packages/core2-32-poky-linux/python3-pycairo (sysroot):
  /usr/lib/python3.11/site-packages/pycairo-1.21.0.egg-info moved to /usr/lib/python3.11/site-packages/pycairo-1.23.0.egg-info

--===============8788420306580023790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1669 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (887 cached, 1 parsed). 1668 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5381dd8b439e178690cd0f694e5cd56571511039"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 28 Local 21 Mirrors 0 Missed 7 Current 406 (75% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 407 of 434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 419 of 434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 427 of 434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1272 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_fetch)
NOTE: Running task 1374 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_write_config)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_write_config: Started
NOTE: Running task 1377 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_unpack)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_unpack: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 1495 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_patch)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_patch: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_patch: Succeeded
NOTE: Running task 1518 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1519 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_populate_lic)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_populate_lic: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_populate_lic unihash changed to f413ede038e1e78cbc5da121141d9de6ee25ec792ab5e2da0d85640452196d26
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glib-2.0/1_2.74.1-r0/temp/log.do_packagedata_setscene.1637695
NOTE: recipe python3-pycairo-1.23.0-r0: task do_deploy_source_date_epoch: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 433 of 434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb:do_package_setscene)
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_package_setscene: Started
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1539 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1540 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb:do_packagedata)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1541 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_configure)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_configure: Succeeded
NOTE: Running task 1544 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_compile)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_compile: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_compile: Succeeded
NOTE: Running task 1545 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_install)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_install: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_install: Succeeded
NOTE: Running task 1546 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_package)
NOTE: Running task 1547 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_populate_sysroot)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package: Succeeded
NOTE: Running task 1548 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_packagedata)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1549 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_package_write_rpm)
NOTE: Running task 1550 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_package_qa)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package_qa: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1551 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1551 tasks of which 1534 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 110 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8788420306580023790==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycairo-upgrade-1.21.0-1.23.0.patch"

RnJvbSA1NWQwMzY2Zjg3MmExNzE0NjIzOWJlZjUwYTMxYWUzZmRkMDYyYjk3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAwOTo0OTo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHljYWlybzogdXBncmFkZSAxLjIxLjAgLT4gMS4yMy4wCgotLS0KIC4uLi97cHl0aG9u
My1weWNhaXJvXzEuMjEuMC5iYiA9PiBweXRob24zLXB5Y2Fpcm9fMS4yMy4wLmJifSAgICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHljYWlyb18xLjIxLjAuYmIg
PT4gcHl0aG9uMy1weWNhaXJvXzEuMjMuMC5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljYWlyb18xLjIxLjAuYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljYWlyb18xLjIzLjAuYmIKc2ltaWxhcml0
eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXB5Y2Fpcm9fMS4yMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtcHljYWlyb18xLjIzLjAuYmIKaW5kZXggYjY5MjA2NzgwOS4uNTIxNGEwNWQ1
MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y2Fp
cm9fMS4yMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
eWNhaXJvXzEuMjMuMC5iYgpAQCAtMTMsNyArMTMsNyBAQCBERVBFTkRTID0gImNhaXJvIHB5dGhv
bjMiCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQVn0vcHljYWly
by0ke1BWfS50YXIuZ3oiCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5
Z29iamVjdC9weWNhaXJvL3JlbGVhc2VzLyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI1MTkw
N2YxOGE1NTJkZjkzOGFhMzM4NjY1N2ZmNGI1YTQ5MzdkZGU3MGUxMWFhMDQyYmMyOTc5NTdmNGI3
NGIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOWI2MWFjODE4NzIzYWRjMDQzNjczMDEzMTdlYjJl
ODE0YTgzNTIyZjA3YmJkMWY0MDlhZjBkYWRhNDYzYzQ0YyIKIAogUyA9ICIke1dPUktESVJ9L3B5
Y2Fpcm8tJHtQVn0iCiAKLS0gCjIuMzEuMQoK

--===============8788420306580023790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pycairo/python3-pycairo: FILELIST: removed "/usr/lib/python3.11/site-packages/pycairo-1.21.0.egg-info", added "/usr/lib/python3.11/site-packages/pycairo-1.23.0.egg-info"
Changes to packages/core2-32-poky-linux/python3-pycairo (sysroot):
  /usr/lib/python3.11/site-packages/pycairo-1.21.0.egg-info moved to /usr/lib/python3.11/site-packages/pycairo-1.23.0.egg-info

--===============8788420306580023790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1668 targets, 71 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 2 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5381dd8b439e178690cd0f694e5cd56571511039"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 28 Local 21 Mirrors 0 Missed 7 Current 406 (75% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 407 of 434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 419 of 434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 427 of 434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1272 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_fetch)
NOTE: Running task 1374 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_write_config)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_write_config: Started
NOTE: Running task 1377 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_unpack)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_unpack: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1502 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_patch)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_patch: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_patch: Succeeded
NOTE: Running task 1518 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1519 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_populate_lic)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_populate_lic: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_populate_lic: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/glib-2.0/1_2.74.1-r0/temp/log.do_packagedata_setscene.1645520
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 433 of 434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb:do_package_setscene)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_populate_lic unihash changed to f413ede038e1e78cbc5da121141d9de6ee25ec792ab5e2da0d85640452196d26
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_package_setscene: Started
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1539 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1540 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb:do_packagedata)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1541 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_configure)
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_configure: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_configure: Succeeded
NOTE: Running task 1544 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_compile)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_compile: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_compile: Succeeded
NOTE: Running task 1545 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_install)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_install: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_install: Succeeded
NOTE: Running task 1546 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_package)
NOTE: Running task 1547 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_populate_sysroot)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package: Succeeded
NOTE: Running task 1548 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_packagedata)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1549 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_package_write_rpm)
NOTE: Running task 1550 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_package_qa)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package_qa: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1551 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1551 tasks of which 1534 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 110 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8788420306580023790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1669 targets, 49 skipped, 0 masked, 0 errors.
Removing 64 recipes from the core2-32 sysroot...done.
Removing 75 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5381dd8b439e178690cd0f694e5cd56571511039"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 262 Local 249 Mirrors 0 Missed 13 Current 173 (95% match, 97% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 183 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 185 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 186 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 187 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 188 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 191 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_packagedata_setscene)
NOTE: Running setscene task 193 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 194 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 195 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 196 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 198 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 199 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 200 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 201 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 202 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 203 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 204 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 205 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 206 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 207 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 208 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 209 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 213 of 435 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-mako-native-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 745 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 752 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_fetch)
NOTE: Running task 764 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_fetch)
NOTE: Running task 786 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_write_config)
NOTE: Running task 789 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_write_config)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 215 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 216 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 218 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 220 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 222 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 223 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 225 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 227 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 228 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 231 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 236 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 237 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 241 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_write_config: Started
NOTE: recipe python3-mako-native-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 244 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.2.3-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 838 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_unpack)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_write_config: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 839 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_unpack)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 840 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_write_config: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_unpack: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 841 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_patch)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_unpack: Started
NOTE: Running setscene task 250 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 251 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: Running setscene task 255 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 256 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 259 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 260 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 263 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 266 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 268 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.38-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_patch: Succeeded
NOTE: Running task 872 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 873 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_populate_lic)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 273 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 277 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_populate_lic: Started
NOTE: Running setscene task 281 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/glib-2.0/1_2.74.1-r0/temp/log.do_packagedata_setscene.1648289
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 283 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb:do_package_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 284 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_populate_lic unihash changed to f413ede038e1e78cbc5da121141d9de6ee25ec792ab5e2da0d85640452196d26
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 286 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 288 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 290 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 293 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 295 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 298 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 300 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 302 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 304 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_package_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 307 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 312 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 911 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_patch)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 323 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 328 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 330 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.2.3-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 337 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 343 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 344 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 952 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_patch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 351 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 353 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 355 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.40.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 360 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 366 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 368 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 371 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 385 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 392 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 398 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 400 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 403 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 405 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 408 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 410 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 412 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 413 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 416 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 419 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 420 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 429 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 432 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 433 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1448 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1528 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb:do_packagedata)
NOTE: recipe mesa-2_22.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_packagedata: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1530 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_configure)
NOTE: recipe mesa-2_22.2.3-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1531 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_compile)
NOTE: recipe mesa-2_22.2.3-r0: task do_compile: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1532 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_install)
NOTE: recipe mesa-2_22.2.3-r0: task do_install: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_install: Succeeded
NOTE: Running task 1533 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_populate_sysroot)
NOTE: Running task 1534 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_package)
NOTE: recipe mesa-2_22.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_package: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1535 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1536 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_package: Succeeded
NOTE: Running task 1537 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_packagedata)
NOTE: recipe mesa-2_22.2.3-r0: task do_packagedata: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 1538 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 1539 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 1540 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 1541 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1542 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1543 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_configure)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 1544 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_configure: Succeeded
NOTE: Running task 1545 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_compile)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_compile: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_compile: Succeeded
NOTE: Running task 1546 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_install)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_install: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_install: Succeeded
NOTE: Running task 1547 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_package)
NOTE: Running task 1548 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_populate_sysroot)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package: Succeeded
NOTE: Running task 1549 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_packagedata)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1550 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_package_write_rpm)
NOTE: Running task 1551 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_package_qa)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package_qa: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1552 of 1552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1552 tasks of which 1514 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 110 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8788420306580023790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1668 targets, 64 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5381dd8b439e178690cd0f694e5cd56571511039"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 28 Local 21 Mirrors 0 Missed 7 Current 406 (75% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 407 of 434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 419 of 434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 427 of 434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1272 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_fetch)
NOTE: Running task 1374 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_write_config)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_write_config: Started
NOTE: Running task 1377 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_unpack)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_unpack: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 1495 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_patch)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_patch: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_patch: Succeeded
NOTE: Running task 1518 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1519 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_populate_lic)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_populate_lic: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_populate_lic unihash changed to f413ede038e1e78cbc5da121141d9de6ee25ec792ab5e2da0d85640452196d26
NOTE: recipe python3-pycairo-1.23.0-r0: task do_deploy_source_date_epoch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/glib-2.0/1_2.74.1-r0/temp/log.do_packagedata_setscene.1642930
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 433 of 434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb:do_package_setscene)
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_package_setscene: Started
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1539 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1540 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb:do_packagedata)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1541 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_configure)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.74.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_configure: Succeeded
NOTE: Running task 1544 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_compile)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_compile: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_compile: Succeeded
NOTE: Running task 1545 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_install)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_install: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_install: Succeeded
NOTE: Running task 1546 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_package)
NOTE: Running task 1547 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_populate_sysroot)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package: Succeeded
NOTE: Running task 1548 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_packagedata)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1549 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_package_write_rpm)
NOTE: Running task 1550 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_package_qa)
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package_qa: Started
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pycairo-1.23.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1551 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1551 tasks of which 1534 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 110 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.74.2-r0 to 1:2.74.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.74.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8788420306580023790==--

