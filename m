Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DBECC6FA99
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:21 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web08.24460.1665871396926022103
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QtQECgwW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010183ddac3da0-6691db8e-c688-46de-9216-3c0569e98147-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=635CyB7TzB0YVt3fKezdgzfoDD0ED+En0Zx47rns3Gw=;
	b=QtQECgwWhkqZUS9UfmqZXHlWWjWLPeqQTxZOyNueoAjxPg3+B92MKmOe9nLet92Y
	TeZc3h3qi7EP713ZfnoETM2VGEnRylI13CZ0BcOhU5IGwVO83oCsQWcYPKWv6QnXr6j
	I31yL5dShvkMIBQLYp3WsFJESQHWs1G3jtfQ07eY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=635CyB7TzB0YVt3fKezdgzfoDD0ED+En0Zx47rns3Gw=;
	b=NzjiAok+VkhbbrQkhhvXnvRn5nSaMLzx5vBE9AFXX1WrRS/g5Yz4zB741mv8KLuO
	MMUhBTvps8MMCT1Ew5q/m6qHO6sKEUq+Xs6u1FtGFOhhzkEy19G2dP2kpOxX6getLsB
	Umv9cdCmNGikJZkLr31yJw522OW87HmhF5ZOQJnE=
Content-Type: multipart/mixed; boundary="===============8626794769081084448=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] powertop: upgrading to 2.15 SUCCEEDED
Message-ID: <01010183ddac3da0-6691db8e-c688-46de-9216-3c0569e98147-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171853

--===============8626794769081084448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *powertop* to *2.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-powertop-upgrade-2.14-2.15.patch
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
--===============8626794769081084448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 35 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:2657521ad788d0dc06399bcac48bb7a06f378d91"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 39 Mirrors 0 Missed 11 Current 363 (78% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 373 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running task 1230 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_fetch)
NOTE: Running task 1317 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_fetch)
NOTE: recipe pciutils-3.8.0-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe powertop-2.15-r0: task do_fetch: Started
NOTE: recipe pciutils-3.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1460 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_unpack)
NOTE: recipe powertop-2.15-r0: task do_fetch: Succeeded
NOTE: Running task 1461 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_unpack)
NOTE: recipe pciutils-3.8.0-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe powertop-2.15-r0: task do_unpack: Started
NOTE: recipe pciutils-3.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1462 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_patch)
NOTE: recipe pciutils-3.8.0-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.36-r0/temp/log.do_packagedata_setscene.1488090
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 412 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_package_setscene)
NOTE: recipe pciutils-3.8.0-r0: task do_patch: Succeeded
NOTE: recipe powertop-2.15-r0: task do_unpack: Succeeded
NOTE: Running task 1463 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_patch)
NOTE: Running task 1464 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pciutils-3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe powertop-2.15-r0: task do_patch: Started
NOTE: recipe powertop-2.15-r0: task do_patch: Succeeded
NOTE: recipe pciutils-3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1465 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 1466 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_populate_lic)
NOTE: recipe powertop-2.15-r0: task do_populate_lic: Started
NOTE: recipe powertop-2.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe powertop-2.15-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_populate_lic unihash changed to 962fe246d746ff2889d8706ad885aee57304a971446fa2f0c2481d22d832594e
NOTE: recipe powertop-2.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1487 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1489 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata)
NOTE: recipe pciutils-3.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata: Succeeded
NOTE: recipe pciutils-3.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1494 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_configure)
NOTE: recipe pciutils-3.8.0-r0: task do_configure: Started
NOTE: recipe pciutils-3.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1495 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_compile)
NOTE: recipe pciutils-3.8.0-r0: task do_compile: Started
NOTE: recipe pciutils-3.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1496 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_install)
NOTE: recipe pciutils-3.8.0-r0: task do_install: Started
NOTE: recipe pciutils-3.8.0-r0: task do_install: Succeeded
NOTE: Running task 1497 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_populate_sysroot)
NOTE: Running task 1498 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_package)
NOTE: recipe pciutils-3.8.0-r0: task do_package: Started
NOTE: recipe pciutils-3.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe pciutils-3.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1499 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe powertop-2.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe powertop-2.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1500 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_configure)
NOTE: recipe powertop-2.15-r0: task do_configure: Started
NOTE: recipe pciutils-3.8.0-r0: task do_package: Succeeded
NOTE: Running task 1501 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_packagedata)
NOTE: recipe pciutils-3.8.0-r0: task do_packagedata: Started
NOTE: recipe pciutils-3.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe powertop-2.15-r0: task do_configure: Succeeded
NOTE: Running task 1502 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_compile)
NOTE: recipe powertop-2.15-r0: task do_compile: Started
NOTE: recipe powertop-2.15-r0: task do_compile: Succeeded
NOTE: Running task 1503 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_install)
NOTE: recipe powertop-2.15-r0: task do_install: Started
NOTE: recipe powertop-2.15-r0: task do_install: Succeeded
NOTE: Running task 1504 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_package)
NOTE: Running task 1505 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_populate_sysroot)
NOTE: recipe powertop-2.15-r0: task do_populate_sysroot: Started
NOTE: recipe powertop-2.15-r0: task do_package: Started
NOTE: recipe powertop-2.15-r0: task do_populate_sysroot: Succeeded
NOTE: recipe powertop-2.15-r0: task do_package: Succeeded
NOTE: Running task 1506 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_packagedata)
NOTE: recipe powertop-2.15-r0: task do_packagedata: Started
NOTE: recipe powertop-2.15-r0: task do_packagedata: Succeeded
NOTE: Running task 1507 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_package_write_rpm)
NOTE: Running task 1508 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_package_qa)
NOTE: recipe powertop-2.15-r0: task do_package_write_rpm: Started
NOTE: recipe powertop-2.15-r0: task do_package_qa: Started
NOTE: recipe powertop-2.15-r0: task do_package_qa: Succeeded
NOTE: recipe powertop-2.15-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1509 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_build)
NOTE: Tasks Summary: Attempted 1509 tasks of which 1482 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 52 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-src went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dbg went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-staticdev went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dev went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-doc went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-af went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ar went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-az went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-bg went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ca went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-crh went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-cs went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-da went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-de went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-el went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-en-gb went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-eo went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-es went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fi went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fr went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fur went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-gl went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-he went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hr went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hu went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-id went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-it went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ja went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ka went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ko went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ky went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-lt went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nb went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nl went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pl went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt-br went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ro went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ru went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-rw went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sk went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sl went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sq went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sr went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sv went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-tr went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-uk went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-vi went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-cn went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-tw went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8626794769081084448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:2657521ad788d0dc06399bcac48bb7a06f378d91"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 39 Mirrors 0 Missed 11 Current 359 (78% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 369 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running task 1220 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_fetch)
NOTE: Running task 1306 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_fetch)
NOTE: recipe pciutils-3.8.0-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe powertop-2.15-r0: task do_fetch: Started
NOTE: recipe pciutils-3.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1446 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_unpack)
NOTE: recipe powertop-2.15-r0: task do_fetch: Succeeded
NOTE: Running task 1447 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_unpack)
NOTE: recipe pciutils-3.8.0-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe powertop-2.15-r0: task do_unpack: Started
NOTE: recipe pciutils-3.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1448 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_patch)
NOTE: recipe pciutils-3.8.0-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/xkeyboard-config/2.36-r0/temp/log.do_packagedata_setscene.1507773
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 408 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_package_setscene)
NOTE: recipe pciutils-3.8.0-r0: task do_patch: Succeeded
NOTE: recipe powertop-2.15-r0: task do_unpack: Succeeded
NOTE: Running task 1449 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_patch)
NOTE: Running task 1450 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pciutils-3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe powertop-2.15-r0: task do_patch: Started
NOTE: recipe powertop-2.15-r0: task do_patch: Succeeded
NOTE: Running task 1451 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_deploy_source_date_epoch)
NOTE: recipe pciutils-3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1452 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_populate_lic)
NOTE: recipe powertop-2.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe powertop-2.15-r0: task do_populate_lic: Started
NOTE: recipe powertop-2.15-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_populate_lic unihash changed to 962fe246d746ff2889d8706ad885aee57304a971446fa2f0c2481d22d832594e
NOTE: recipe powertop-2.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1473 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1475 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata)
NOTE: recipe pciutils-3.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata: Started
NOTE: recipe pciutils-3.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata: Succeeded
NOTE: Running task 1476 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_configure)
NOTE: recipe pciutils-3.8.0-r0: task do_configure: Started
NOTE: recipe pciutils-3.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1481 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_compile)
NOTE: recipe pciutils-3.8.0-r0: task do_compile: Started
NOTE: recipe pciutils-3.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1482 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_install)
NOTE: recipe pciutils-3.8.0-r0: task do_install: Started
NOTE: recipe pciutils-3.8.0-r0: task do_install: Succeeded
NOTE: Running task 1483 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_populate_sysroot)
NOTE: Running task 1484 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_package)
NOTE: recipe pciutils-3.8.0-r0: task do_package: Started
NOTE: recipe pciutils-3.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe pciutils-3.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1485 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe powertop-2.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe powertop-2.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1486 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_configure)
NOTE: recipe powertop-2.15-r0: task do_configure: Started
NOTE: recipe pciutils-3.8.0-r0: task do_package: Succeeded
NOTE: Running task 1487 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_packagedata)
NOTE: recipe pciutils-3.8.0-r0: task do_packagedata: Started
NOTE: recipe pciutils-3.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe powertop-2.15-r0: task do_configure: Succeeded
NOTE: Running task 1488 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_compile)
NOTE: recipe powertop-2.15-r0: task do_compile: Started
NOTE: recipe powertop-2.15-r0: task do_compile: Succeeded
NOTE: Running task 1489 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_install)
NOTE: recipe powertop-2.15-r0: task do_install: Started
NOTE: recipe powertop-2.15-r0: task do_install: Succeeded
NOTE: Running task 1490 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_package)
NOTE: Running task 1491 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_populate_sysroot)
NOTE: recipe powertop-2.15-r0: task do_populate_sysroot: Started
NOTE: recipe powertop-2.15-r0: task do_package: Started
NOTE: recipe powertop-2.15-r0: task do_populate_sysroot: Succeeded
NOTE: recipe powertop-2.15-r0: task do_package: Succeeded
NOTE: Running task 1492 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_packagedata)
NOTE: recipe powertop-2.15-r0: task do_packagedata: Started
NOTE: recipe powertop-2.15-r0: task do_packagedata: Succeeded
NOTE: Running task 1493 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_package_write_rpm)
NOTE: Running task 1494 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_package_qa)
NOTE: recipe powertop-2.15-r0: task do_package_write_rpm: Started
NOTE: recipe powertop-2.15-r0: task do_package_qa: Started
NOTE: recipe powertop-2.15-r0: task do_package_qa: Succeeded
NOTE: recipe powertop-2.15-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1495 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_build)
NOTE: Tasks Summary: Attempted 1495 tasks of which 1468 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 52 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-src went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dbg went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-staticdev went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dev went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-doc went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-af went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ar went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-az went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-bg went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ca went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-crh went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-cs went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-da went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-de went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-el went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-en-gb went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-eo went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-es went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fi went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fr went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fur went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-gl went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-he went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hr went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hu went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-id went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-it went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ja went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ka went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ko went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ky went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-lt went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nb went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nl went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pl went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt-br went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ro went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ru went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-rw went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sk went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sl went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sq went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sr went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sv went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-tr went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-uk went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-vi went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-cn went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-tw went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8626794769081084448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:2657521ad788d0dc06399bcac48bb7a06f378d91"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 40 Mirrors 0 Missed 11 Current 362 (78% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 372 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running task 1229 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_fetch)
NOTE: Running task 1317 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe pciutils-3.8.0-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe powertop-2.15-r0: task do_fetch: Started
NOTE: recipe pciutils-3.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1460 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_unpack)
NOTE: recipe powertop-2.15-r0: task do_fetch: Succeeded
NOTE: Running task 1461 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_unpack)
NOTE: recipe pciutils-3.8.0-r0: task do_unpack: Started
NOTE: recipe powertop-2.15-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pciutils-3.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1462 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_patch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/xkeyboard-config/2.36-r0/temp/log.do_packagedata_setscene.1517662
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 412 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_package_setscene)
NOTE: recipe pciutils-3.8.0-r0: task do_patch: Started
NOTE: recipe pciutils-3.8.0-r0: task do_patch: Succeeded
NOTE: recipe powertop-2.15-r0: task do_unpack: Succeeded
NOTE: Running task 1463 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_patch)
NOTE: Running task 1464 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pciutils-3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe powertop-2.15-r0: task do_patch: Started
NOTE: recipe powertop-2.15-r0: task do_patch: Succeeded
NOTE: recipe pciutils-3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1465 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 1466 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_populate_lic)
NOTE: recipe powertop-2.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe powertop-2.15-r0: task do_populate_lic: Started
NOTE: recipe powertop-2.15-r0: task do_populate_lic: Succeeded
NOTE: recipe powertop-2.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_populate_lic unihash changed to 962fe246d746ff2889d8706ad885aee57304a971446fa2f0c2481d22d832594e
NOTE: recipe xkeyboard-config-2.36-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1487 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1489 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata)
NOTE: recipe pciutils-3.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata: Succeeded
NOTE: recipe pciutils-3.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1494 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_configure)
NOTE: recipe pciutils-3.8.0-r0: task do_configure: Started
NOTE: recipe pciutils-3.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1495 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_compile)
NOTE: recipe pciutils-3.8.0-r0: task do_compile: Started
NOTE: recipe pciutils-3.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1496 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_install)
NOTE: recipe pciutils-3.8.0-r0: task do_install: Started
NOTE: recipe pciutils-3.8.0-r0: task do_install: Succeeded
NOTE: Running task 1497 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_populate_sysroot)
NOTE: Running task 1498 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_package)
NOTE: recipe pciutils-3.8.0-r0: task do_package: Started
NOTE: recipe pciutils-3.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe pciutils-3.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1499 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe powertop-2.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe powertop-2.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1500 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_configure)
NOTE: recipe powertop-2.15-r0: task do_configure: Started
NOTE: recipe pciutils-3.8.0-r0: task do_package: Succeeded
NOTE: Running task 1501 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_packagedata)
NOTE: recipe pciutils-3.8.0-r0: task do_packagedata: Started
NOTE: recipe pciutils-3.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe powertop-2.15-r0: task do_configure: Succeeded
NOTE: Running task 1502 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_compile)
NOTE: recipe powertop-2.15-r0: task do_compile: Started
NOTE: recipe powertop-2.15-r0: task do_compile: Succeeded
NOTE: Running task 1503 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_install)
NOTE: recipe powertop-2.15-r0: task do_install: Started
NOTE: recipe powertop-2.15-r0: task do_install: Succeeded
NOTE: Running task 1504 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_package)
NOTE: Running task 1505 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_populate_sysroot)
NOTE: recipe powertop-2.15-r0: task do_populate_sysroot: Started
NOTE: recipe powertop-2.15-r0: task do_package: Started
NOTE: recipe powertop-2.15-r0: task do_populate_sysroot: Succeeded
NOTE: recipe powertop-2.15-r0: task do_package: Succeeded
NOTE: Running task 1506 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_packagedata)
NOTE: recipe powertop-2.15-r0: task do_packagedata: Started
NOTE: recipe powertop-2.15-r0: task do_packagedata: Succeeded
NOTE: Running task 1507 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_package_write_rpm)
NOTE: Running task 1508 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_package_qa)
NOTE: recipe powertop-2.15-r0: task do_package_write_rpm: Started
NOTE: recipe powertop-2.15-r0: task do_package_qa: Started
NOTE: recipe powertop-2.15-r0: task do_package_qa: Succeeded
NOTE: recipe powertop-2.15-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1509 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_build)
NOTE: Tasks Summary: Attempted 1509 tasks of which 1482 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 52 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-src went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dbg went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-staticdev went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dev went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-doc went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-af went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ar went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-az went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-bg went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ca went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-crh went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-cs went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-da went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-de went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-el went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-en-gb went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-eo went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-es went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fi went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fr went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fur went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-gl went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-he went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hr went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hu went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-id went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-it went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ja went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ka went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ko went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ky went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-lt went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nb went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nl went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pl went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt-br went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ro went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ru went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-rw went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sk went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sl went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sq went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sr went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sv went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-tr went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-uk went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-vi went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-cn went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-tw went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8626794769081084448==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-powertop-upgrade-2.14-2.15.patch"

RnJvbSA2YWIyZmNhYmNlYzZlMjNmZWVhZGMxNGY2MzVlNTY5M2JhZDI1NDZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTc6Mjk6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
b3dlcnRvcDogdXBncmFkZSAyLjE0IC0+IDIuMTUKCi0tLQogLi4uYy1maXgtY29tcGF0aWJpbGl0
eS13aXRoLW5jdXJzZXMtNi4zLnBhdGNoIHwgNTIgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL3tw
b3dlcnRvcF8yLjE0LmJiID0+IHBvd2VydG9wXzIuMTUuYmJ9ICAgIHwgIDMgKy0KIDIgZmlsZXMg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDU0IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAw
NjQ0IG1ldGEvcmVjaXBlcy1rZXJuZWwvcG93ZXJ0b3AvcG93ZXJ0b3AvMDAwMS1zcmMtZml4LWNv
bXBhdGliaWxpdHktd2l0aC1uY3Vyc2VzLTYuMy5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1r
ZXJuZWwvcG93ZXJ0b3Ave3Bvd2VydG9wXzIuMTQuYmIgPT4gcG93ZXJ0b3BfMi4xNS5iYn0gKDg3
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL3Bvd2VydG9wL3Bvd2VydG9wLzAw
MDEtc3JjLWZpeC1jb21wYXRpYmlsaXR5LXdpdGgtbmN1cnNlcy02LjMucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMta2VybmVsL3Bvd2VydG9wL3Bvd2VydG9wLzAwMDEtc3JjLWZpeC1jb21wYXRpYmlsaXR5
LXdpdGgtbmN1cnNlcy02LjMucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDg0
YjA1YWM5NzEuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9wb3dlcnRvcC9w
b3dlcnRvcC8wMDAxLXNyYy1maXgtY29tcGF0aWJpbGl0eS13aXRoLW5jdXJzZXMtNi4zLnBhdGNo
CisrKyAvZGV2L251bGwKQEAgLTEsNTIgKzAsMCBAQAotRnJvbSA3NmQzZjA4NTE1MjBiYzg0ODhl
NDMyZjQyMzk0MWYxZTcyY2M3NDA1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogQWxl
eGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KLURhdGU6IE1vbiwgMjUgT2N0IDIw
MjEgMTc6NDc6MjMgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSF0gc3JjOiBmaXggY29tcGF0aWJpbGl0
eSB3aXRoIG5jdXJzZXMgNi4zCi0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczov
L2dpdGh1Yi5jb20vZmVucnVzNzUvcG93ZXJ0b3AvcHVsbC85Ml0KLVNpZ25lZC1vZmYtYnk6IEFs
ZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+Ci0tLS0KLSBzcmMvZGV2aWNlcy9k
ZXZmcmVxLmNwcCB8IDIgKy0KLSBzcmMvZGlzcGxheS5jcHAgICAgICAgICB8IDIgKy0KLSBzcmMv
bGliLmNwcCAgICAgICAgICAgICB8IDIgKy0KLSAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL3NyYy9kZXZpY2VzL2RldmZyZXEu
Y3BwIGIvc3JjL2RldmljZXMvZGV2ZnJlcS5jcHAKLWluZGV4IDA1MDlkMGYuLmIxOTRhYzQgMTAw
NjQ0Ci0tLS0gYS9zcmMvZGV2aWNlcy9kZXZmcmVxLmNwcAotKysrIGIvc3JjL2RldmljZXMvZGV2
ZnJlcS5jcHAKLUBAIC0yOTcsNyArMjk3LDcgQEAgdm9pZCBkaXNwbGF5X2RldmZyZXFfZGV2aWNl
cyh2b2lkKQotIAkJCWRmLT5maWxsX2ZyZXFfdXRpbGl6YXRpb24oaiwgYnVmKTsKLSAJCQlzdHJj
YXQoZmxpbmUsIGJ1Zik7Ci0gCQkJc3RyY2F0KGZsaW5lLCAiXG4iKTsKLS0JCQl3cHJpbnR3KHdp
biwgZmxpbmUpOwotKwkJCXdwcmludHcod2luLCAiJXMiLCBmbGluZSk7Ci0gCQl9Ci0gCQl3cHJp
bnR3KHdpbiwgIlxuIik7Ci0gCX0KLWRpZmYgLS1naXQgYS9zcmMvZGlzcGxheS5jcHAgYi9zcmMv
ZGlzcGxheS5jcHAKLWluZGV4IDcxMzExNDQuLmNjMDM5MTkgMTAwNjQ0Ci0tLS0gYS9zcmMvZGlz
cGxheS5jcHAKLSsrKyBiL3NyYy9kaXNwbGF5LmNwcAotQEAgLTEyNSw3ICsxMjUsNyBAQCB2b2lk
IHNob3dfdGFiKHVuc2lnbmVkIGludCB0YWIpCi0gCi0gCWMgPSBib3R0b21fbGluZXNbdGFiX25h
bWVzW3RhYl1dLmNfc3RyKCk7Ci0gCWlmIChjICYmIHN0cmxlbihjKSA+IDApCi0tCQltdndwcmlu
dHcoYm90dG9tX2xpbmUsIDAsMCwgYyk7Ci0rCQltdndwcmludHcoYm90dG9tX2xpbmUsIDAsMCwg
IiVzIiwgYyk7Ci0gCWVsc2UKLSAJCW12d3ByaW50dyhib3R0b21fbGluZSwgMCwgMCwKLSAJCQki
PEVTQz4gJXMgfCA8VEFCPiAvIDxTaGlmdCArIFRBQj4gJXMgfCAiLCBfKCJFeGl0IiksCi1kaWZm
IC0tZ2l0IGEvc3JjL2xpYi5jcHAgYi9zcmMvbGliLmNwcAotaW5kZXggNWU0OGYzNy4uNWNkMWM0
YSAxMDA2NDQKLS0tLSBhL3NyYy9saWIuY3BwCi0rKysgYi9zcmMvbGliLmNwcAotQEAgLTU4Myw3
ICs1ODMsNyBAQCB2b2lkIHVpX25vdGlmeV91c2VyX25jdXJzZXMoY29uc3QgY2hhciAqZnJtdCwg
Li4uKQotIAkgKiBidWZmZXIgKi8KLSAJdnNucHJpbnRmKG5vdGlmeSwgVUlfTk9USUZZX0JVRkZf
U1ogLSAxLCBmcm10LCBsaXN0KTsKLSAJdmFfZW5kKGxpc3QpOwotLQltdnByaW50dygxLCAwLCBu
b3RpZnkpOwotKwltdnByaW50dygxLCAwLCAiJXMiLCBub3RpZnkpOwotIAlhdHRyb2ZmKENPTE9S
X1BBSVIoMSkpOwotIH0KLSAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvcG93ZXJ0
b3AvcG93ZXJ0b3BfMi4xNC5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvcG93ZXJ0b3AvcG93ZXJ0
b3BfMi4xNS5iYgpzaW1pbGFyaXR5IGluZGV4IDg3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
a2VybmVsL3Bvd2VydG9wL3Bvd2VydG9wXzIuMTQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1r
ZXJuZWwvcG93ZXJ0b3AvcG93ZXJ0b3BfMi4xNS5iYgppbmRleCBhMmYzMDA0MGI1Li4wYWFlNGM5
Mzk3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL3Bvd2VydG9wL3Bvd2VydG9wXzIu
MTQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9wb3dlcnRvcC9wb3dlcnRvcF8yLjE1LmJi
CkBAIC04LDkgKzgsOCBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0x
MmY4ODRkMmFlMWZmODdjMDllNWI3Y2NjMmM0Y2E3ZSIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRo
dWIuY29tL2ZlbnJ1czc1L3Bvd2VydG9wO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIgXAog
ICAgICAgICAgICBmaWxlOi8vMDAwMS13YWtldXBfeHh4LmgtaW5jbHVkZS1saW1pdHMuaC5wYXRj
aCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLXNyYy1maXgtY29tcGF0aWJpbGl0eS13aXRoLW5j
dXJzZXMtNi4zLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDUkVWID0gIjUyZjAyMmY5YmJlNmUw
NjBmYmExMTcwMWQ2NTdhOGQ5NzYyNzAyYmEiCitTUkNSRVYgPSAiZDUxYWQzOTU0MzZkNGQxZGNj
M2NhNDZlMTUxOWZmZWI0NzViZjY1MSIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi4z
MS4xCgo=

--===============8626794769081084448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 51 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:2657521ad788d0dc06399bcac48bb7a06f378d91"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 39 Mirrors 0 Missed 11 Current 363 (78% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 373 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running task 1229 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_fetch)
NOTE: Running task 1317 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pciutils-3.8.0-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe powertop-2.15-r0: task do_fetch: Started
NOTE: recipe pciutils-3.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1460 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_unpack)
NOTE: recipe powertop-2.15-r0: task do_fetch: Succeeded
NOTE: Running task 1461 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_unpack)
NOTE: recipe pciutils-3.8.0-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe powertop-2.15-r0: task do_unpack: Started
NOTE: recipe pciutils-3.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1462 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_patch)
NOTE: recipe pciutils-3.8.0-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/xkeyboard-config/2.36-r0/temp/log.do_packagedata_setscene.1497935
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 412 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_package_setscene)
NOTE: recipe pciutils-3.8.0-r0: task do_patch: Succeeded
NOTE: recipe powertop-2.15-r0: task do_unpack: Succeeded
NOTE: Running task 1463 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_patch)
NOTE: Running task 1464 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pciutils-3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe powertop-2.15-r0: task do_patch: Started
NOTE: recipe powertop-2.15-r0: task do_patch: Succeeded
NOTE: Running task 1465 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 1466 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_populate_lic)
NOTE: recipe pciutils-3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe powertop-2.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe powertop-2.15-r0: task do_populate_lic: Started
NOTE: recipe powertop-2.15-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_populate_lic unihash changed to 962fe246d746ff2889d8706ad885aee57304a971446fa2f0c2481d22d832594e
NOTE: recipe powertop-2.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1487 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1489 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata)
NOTE: recipe pciutils-3.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata: Succeeded
NOTE: recipe pciutils-3.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1494 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_configure)
NOTE: recipe pciutils-3.8.0-r0: task do_configure: Started
NOTE: recipe pciutils-3.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1495 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_compile)
NOTE: recipe pciutils-3.8.0-r0: task do_compile: Started
NOTE: recipe pciutils-3.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1496 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_install)
NOTE: recipe pciutils-3.8.0-r0: task do_install: Started
NOTE: recipe pciutils-3.8.0-r0: task do_install: Succeeded
NOTE: Running task 1497 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_populate_sysroot)
NOTE: Running task 1498 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_package)
NOTE: recipe pciutils-3.8.0-r0: task do_package: Started
NOTE: recipe pciutils-3.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe pciutils-3.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1499 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe powertop-2.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe powertop-2.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1500 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_configure)
NOTE: recipe powertop-2.15-r0: task do_configure: Started
NOTE: recipe pciutils-3.8.0-r0: task do_package: Succeeded
NOTE: Running task 1501 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb:do_packagedata)
NOTE: recipe pciutils-3.8.0-r0: task do_packagedata: Started
NOTE: recipe pciutils-3.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe powertop-2.15-r0: task do_configure: Succeeded
NOTE: Running task 1502 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_compile)
NOTE: recipe powertop-2.15-r0: task do_compile: Started
NOTE: recipe powertop-2.15-r0: task do_compile: Succeeded
NOTE: Running task 1503 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_install)
NOTE: recipe powertop-2.15-r0: task do_install: Started
NOTE: recipe powertop-2.15-r0: task do_install: Succeeded
NOTE: Running task 1504 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_package)
NOTE: Running task 1505 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_populate_sysroot)
NOTE: recipe powertop-2.15-r0: task do_populate_sysroot: Started
NOTE: recipe powertop-2.15-r0: task do_package: Started
NOTE: recipe powertop-2.15-r0: task do_populate_sysroot: Succeeded
NOTE: recipe powertop-2.15-r0: task do_package: Succeeded
NOTE: Running task 1506 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_packagedata)
NOTE: recipe powertop-2.15-r0: task do_packagedata: Started
NOTE: recipe powertop-2.15-r0: task do_packagedata: Succeeded
NOTE: Running task 1507 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_package_write_rpm)
NOTE: Running task 1508 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_package_qa)
NOTE: recipe powertop-2.15-r0: task do_package_write_rpm: Started
NOTE: recipe powertop-2.15-r0: task do_package_qa: Started
NOTE: recipe powertop-2.15-r0: task do_package_qa: Succeeded
NOTE: recipe powertop-2.15-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1509 of 1509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.15.bb:do_build)
NOTE: Tasks Summary: Attempted 1509 tasks of which 1482 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 52 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-src went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dbg went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-staticdev went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dev went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-doc went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-af went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ar went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-az went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-bg went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ca went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-crh went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-cs went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-da went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-de went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-el went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-en-gb went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-eo went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-es went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fi went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fr went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fur went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-gl went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-he went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hr went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hu went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-id went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-it went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ja went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ka went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ko went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ky went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-lt went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nb went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nl went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pl went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt-br went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ro went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ru went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-rw went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sk went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sl went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sq went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sr went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sv went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-tr went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-uk went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-vi went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-cn went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-tw went backwards which would break package feeds (from 0:2.37-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.36-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8626794769081084448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/powertop: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop: SRC_URI changed from "git://github.com/fenrus75/powertop;protocol=https;branch=master file://0001-wakeup_xxx.h-include-limits.h.patch file://0001-src-fix-compatibility-with-ncurses-6.3.patch" to "git://github.com/fenrus75/powertop;protocol=https;branch=master file://0001-wakeup_xxx.h-include-limits.h.patch"
packages/core2-32-poky-linux/powertop/powertop-bash-completion: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-bash-completion: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-dbg: PKGSIZE changed from 7263612 to 6929396 (-5%)
packages/core2-32-poky-linux/powertop/powertop-dbg: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-dbg: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-dev: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-dev: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-doc: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-doc: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-locale-ca: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-locale-ca: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-locale-cs-cz: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-locale-cs-cz: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-locale-de-de: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-locale-de-de: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-locale-en-gb: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-locale-en-gb: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-locale-en-us: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-locale-en-us: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-locale-es-es: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-locale-es-es: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-locale-hu-hu: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-locale-hu-hu: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-locale-id-id: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-locale-id-id: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-locale-nl-nl: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-locale-nl-nl: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-locale-zh-tw: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-locale-zh-tw: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-src: PKGSIZE changed from 774344 to 775489 (+0%)
packages/core2-32-poky-linux/powertop/powertop-src: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-src: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-staticdev: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-staticdev: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop: PKGSIZE changed from 579176 to 570984 (-1%)
packages/core2-32-poky-linux/powertop/powertop: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop: PV changed from "2.14" to "2.15"

--===============8626794769081084448==--

