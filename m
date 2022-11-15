Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F06AC63716
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:46 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web09.5193.1668517535851856650
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jo3rQj65;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101847b652223-702bf5dd-ec03-40da-9570-23a90dab2ef8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5HVlnFcuNtz+5OEzjrxFK+YxBmAk6JjH0Dm2aQNgiqg=;
	b=jo3rQj658XpvM7m59+KYcy/qIYJzI8Ik70BVsTJgQbe68x+wIlcUwJfImYjxCSOe
	5ykY62H2IBAM5e/pj8bOUUggPL64c0YI+X7EHldLAhOInrb/8uFWbCULhKE7zLCYaBl
	digigLnix0iAjA87h6IrVqFP2YKvN92dHaZE1iNs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5HVlnFcuNtz+5OEzjrxFK+YxBmAk6JjH0Dm2aQNgiqg=;
	b=kPtSCx5uHn1Q3nbB1UFg8XLRihBdNooDBqL87EPN52Wl9W9CrmvR7mD4Sx8G9MjQ
	ton+FFGw8eJvzJdTHisi/Oq7YhBh6tvgCVaE1s1Ayu7YsclcCwuOpS4kSGondLKXCwT
	TToD9ESLshX7ipvp+3yUtVbLwAxqTHLhpnPk+Cv0=
Content-Type: multipart/mixed; boundary="===============7310446652642231471=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kmscube: upgrading to 345111481d654b38a72b5c3629151dc74f7a82bc
 SUCCEEDED
Message-ID: <010101847b652223-702bf5dd-ec03-40da-9570-23a90dab2ef8-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173320

--===============7310446652642231471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kmscube* to *345111481d654b38a72b5c3629151dc74f7a82bc* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kmscube-upgrade-to-latest-revision.patch
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
--===============7310446652642231471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 887 .bb files complete (0 cached, 887 parsed). 1665 targets, 64 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:264d94f0d165c7efaa6717e975b288c5291165d0"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 44 Mirrors 0 Missed 7 Current 323 (86% match, 98% complete)
Removing 1 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 330 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 897 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_fetch)
NOTE: Running task 953 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_write_config)
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmscube-git-r0: task do_fetch: Started
NOTE: recipe kmscube-git-r0: task do_write_config: Started
NOTE: recipe kmscube-git-r0: task do_fetch: Succeeded
NOTE: recipe kmscube-git-r0: task do_write_config: Succeeded
NOTE: Running task 955 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_unpack)
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmscube-git-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/xz/5.2.7-r0/temp/log.do_packagedata_setscene.1170418
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 359 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_package_setscene)
NOTE: recipe kmscube-git-r0: task do_unpack: Succeeded
NOTE: Running task 956 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_patch)
NOTE: recipe kmscube-git-r0: task do_patch: Started
NOTE: recipe kmscube-git-r0: task do_patch: Succeeded
NOTE: Running task 957 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 958 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_lic)
NOTE: recipe kmscube-git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmscube-git-r0: task do_populate_lic: Started
NOTE: recipe kmscube-git-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_lic unihash changed to 9fd6aa3cc5d24a6703b82e0e6fc2f4aba23c9a1ccebdd45e4df1f31ea81b0073
NOTE: recipe kmscube-git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_package_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 361 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 363 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 364 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 365 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 368 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-mips-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-mips-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 370 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 371 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-mips-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-mips-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1322 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata)
NOTE: Running task 1348 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.2.7-r0: task do_packagedata: Started
NOTE: recipe kmscube-git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata: Succeeded
NOTE: recipe kmscube-git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1364 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_configure)
NOTE: recipe kmscube-git-r0: task do_configure: Started
NOTE: recipe kmscube-git-r0: task do_configure: Succeeded
NOTE: Running task 1365 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_compile)
NOTE: recipe kmscube-git-r0: task do_compile: Started
NOTE: recipe kmscube-git-r0: task do_compile: Succeeded
NOTE: Running task 1366 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_install)
NOTE: recipe kmscube-git-r0: task do_install: Started
NOTE: recipe kmscube-git-r0: task do_install: Succeeded
NOTE: Running task 1367 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package)
NOTE: Running task 1368 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_sysroot)
NOTE: recipe kmscube-git-r0: task do_package: Started
NOTE: recipe kmscube-git-r0: task do_populate_sysroot: Started
NOTE: recipe kmscube-git-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kmscube-git-r0: task do_package: Succeeded
NOTE: Running task 1369 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_packagedata)
NOTE: recipe kmscube-git-r0: task do_packagedata: Started
NOTE: recipe kmscube-git-r0: task do_packagedata: Succeeded
NOTE: Running task 1370 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package_write_rpm)
NOTE: Running task 1371 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package_qa)
NOTE: recipe kmscube-git-r0: task do_package_write_rpm: Started
NOTE: recipe kmscube-git-r0: task do_package_qa: Started
NOTE: recipe kmscube-git-r0: task do_package_qa: Succeeded
NOTE: recipe kmscube-git-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1372 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1372 tasks of which 1355 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7310446652642231471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 887 .bb files complete (0 cached, 887 parsed). 1665 targets, 54 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:264d94f0d165c7efaa6717e975b288c5291165d0"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 44 Mirrors 0 Missed 7 Current 323 (86% match, 98% complete)
Removing 1 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 330 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 897 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_fetch)
NOTE: Running task 953 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_write_config)
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmscube-git-r0: task do_fetch: Started
NOTE: recipe kmscube-git-r0: task do_write_config: Started
NOTE: recipe kmscube-git-r0: task do_fetch: Succeeded
NOTE: recipe kmscube-git-r0: task do_write_config: Succeeded
NOTE: Running task 955 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_unpack)
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmscube-git-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/xz/5.2.7-r0/temp/log.do_packagedata_setscene.1167477
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 359 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_package_setscene)
NOTE: recipe kmscube-git-r0: task do_unpack: Succeeded
NOTE: Running task 956 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_patch)
NOTE: recipe kmscube-git-r0: task do_patch: Started
NOTE: recipe kmscube-git-r0: task do_patch: Succeeded
NOTE: Running task 957 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 958 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_lic)
NOTE: recipe kmscube-git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmscube-git-r0: task do_populate_lic: Started
NOTE: recipe kmscube-git-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_lic unihash changed to 9fd6aa3cc5d24a6703b82e0e6fc2f4aba23c9a1ccebdd45e4df1f31ea81b0073
NOTE: recipe kmscube-git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_package_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 361 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 363 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 364 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 365 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 368 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-arm-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-arm-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 370 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 371 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-arm-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-arm-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1323 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata)
NOTE: Running task 1348 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.2.7-r0: task do_packagedata: Started
NOTE: recipe kmscube-git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata: Succeeded
NOTE: recipe kmscube-git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1364 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_configure)
NOTE: recipe kmscube-git-r0: task do_configure: Started
NOTE: recipe kmscube-git-r0: task do_configure: Succeeded
NOTE: Running task 1365 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_compile)
NOTE: recipe kmscube-git-r0: task do_compile: Started
NOTE: recipe kmscube-git-r0: task do_compile: Succeeded
NOTE: Running task 1366 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_install)
NOTE: recipe kmscube-git-r0: task do_install: Started
NOTE: recipe kmscube-git-r0: task do_install: Succeeded
NOTE: Running task 1367 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package)
NOTE: Running task 1368 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_sysroot)
NOTE: recipe kmscube-git-r0: task do_package: Started
NOTE: recipe kmscube-git-r0: task do_populate_sysroot: Started
NOTE: recipe kmscube-git-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kmscube-git-r0: task do_package: Succeeded
NOTE: Running task 1369 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_packagedata)
NOTE: recipe kmscube-git-r0: task do_packagedata: Started
NOTE: recipe kmscube-git-r0: task do_packagedata: Succeeded
NOTE: Running task 1370 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package_write_rpm)
NOTE: Running task 1371 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package_qa)
NOTE: recipe kmscube-git-r0: task do_package_write_rpm: Started
NOTE: recipe kmscube-git-r0: task do_package_qa: Started
NOTE: recipe kmscube-git-r0: task do_package_qa: Succeeded
NOTE: recipe kmscube-git-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1372 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1372 tasks of which 1355 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7310446652642231471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1665 entries from dependency cache.
Parsing recipes...done.
Parsing of 887 .bb files complete (886 cached, 1 parsed). 1665 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:264d94f0d165c7efaa6717e975b288c5291165d0"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 44 Mirrors 0 Missed 7 Current 323 (86% match, 98% complete)
Removing 1 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 330 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 897 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_fetch)
NOTE: Running task 953 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_write_config)
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe kmscube-git-r0: task do_write_config: Started
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmscube-git-r0: task do_fetch: Started
NOTE: recipe kmscube-git-r0: task do_write_config: Succeeded
NOTE: recipe kmscube-git-r0: task do_fetch: Succeeded
NOTE: Running task 955 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_unpack)
NOTE: recipe kmscube-git-r0: task do_unpack: Started
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/xz/5.2.7-r0/temp/log.do_packagedata_setscene.1164589
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 359 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_package_setscene)
NOTE: recipe kmscube-git-r0: task do_unpack: Succeeded
NOTE: Running task 956 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_patch)
NOTE: recipe kmscube-git-r0: task do_patch: Started
NOTE: recipe kmscube-git-r0: task do_patch: Succeeded
NOTE: Running task 957 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 958 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_lic)
NOTE: recipe kmscube-git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmscube-git-r0: task do_populate_lic: Started
NOTE: recipe kmscube-git-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_lic unihash changed to 9fd6aa3cc5d24a6703b82e0e6fc2f4aba23c9a1ccebdd45e4df1f31ea81b0073
NOTE: recipe kmscube-git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_package_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 361 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 363 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 364 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 365 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 368 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 370 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 371 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1322 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata)
NOTE: Running task 1348 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.2.7-r0: task do_packagedata: Started
NOTE: recipe kmscube-git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata: Succeeded
NOTE: recipe kmscube-git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1364 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_configure)
NOTE: recipe kmscube-git-r0: task do_configure: Started
NOTE: recipe kmscube-git-r0: task do_configure: Succeeded
NOTE: Running task 1365 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_compile)
NOTE: recipe kmscube-git-r0: task do_compile: Started
NOTE: recipe kmscube-git-r0: task do_compile: Succeeded
NOTE: Running task 1366 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_install)
NOTE: recipe kmscube-git-r0: task do_install: Started
NOTE: recipe kmscube-git-r0: task do_install: Succeeded
NOTE: Running task 1367 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package)
NOTE: Running task 1368 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_sysroot)
NOTE: recipe kmscube-git-r0: task do_package: Started
NOTE: recipe kmscube-git-r0: task do_populate_sysroot: Started
NOTE: recipe kmscube-git-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kmscube-git-r0: task do_package: Succeeded
NOTE: Running task 1369 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_packagedata)
NOTE: recipe kmscube-git-r0: task do_packagedata: Started
NOTE: recipe kmscube-git-r0: task do_packagedata: Succeeded
NOTE: Running task 1370 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package_write_rpm)
NOTE: Running task 1371 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package_qa)
NOTE: recipe kmscube-git-r0: task do_package_write_rpm: Started
NOTE: recipe kmscube-git-r0: task do_package_qa: Started
NOTE: recipe kmscube-git-r0: task do_package_qa: Succeeded
NOTE: recipe kmscube-git-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1372 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1372 tasks of which 1355 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7310446652642231471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 887 .bb files complete (0 cached, 887 parsed). 1665 targets, 71 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:264d94f0d165c7efaa6717e975b288c5291165d0"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 44 Mirrors 0 Missed 7 Current 323 (86% match, 98% complete)
Removing 1 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 330 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 897 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_fetch)
NOTE: Running task 953 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_write_config)
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe kmscube-git-r0: task do_write_config: Started
NOTE: recipe kmscube-git-r0: task do_fetch: Started
NOTE: recipe kmscube-git-r0: task do_write_config: Succeeded
NOTE: recipe kmscube-git-r0: task do_fetch: Succeeded
NOTE: Running task 955 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_unpack)
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmscube-git-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/xz/5.2.7-r0/temp/log.do_packagedata_setscene.1173300
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 359 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_package_setscene)
NOTE: recipe kmscube-git-r0: task do_unpack: Succeeded
NOTE: Running task 956 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_patch)
NOTE: recipe kmscube-git-r0: task do_patch: Started
NOTE: recipe kmscube-git-r0: task do_patch: Succeeded
NOTE: Running task 957 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 958 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_lic)
NOTE: recipe kmscube-git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmscube-git-r0: task do_populate_lic: Started
NOTE: recipe kmscube-git-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_lic unihash changed to 9fd6aa3cc5d24a6703b82e0e6fc2f4aba23c9a1ccebdd45e4df1f31ea81b0073
NOTE: recipe kmscube-git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_package_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 361 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 363 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 364 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 365 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 368 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-powerpc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-powerpc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 370 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 371 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-powerpc-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-powerpc-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1322 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata)
NOTE: Running task 1348 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.2.7-r0: task do_packagedata: Started
NOTE: recipe kmscube-git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata: Succeeded
NOTE: recipe kmscube-git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1364 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_configure)
NOTE: recipe kmscube-git-r0: task do_configure: Started
NOTE: recipe kmscube-git-r0: task do_configure: Succeeded
NOTE: Running task 1365 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_compile)
NOTE: recipe kmscube-git-r0: task do_compile: Started
NOTE: recipe kmscube-git-r0: task do_compile: Succeeded
NOTE: Running task 1366 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_install)
NOTE: recipe kmscube-git-r0: task do_install: Started
NOTE: recipe kmscube-git-r0: task do_install: Succeeded
NOTE: Running task 1367 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package)
NOTE: Running task 1368 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_sysroot)
NOTE: recipe kmscube-git-r0: task do_package: Started
NOTE: recipe kmscube-git-r0: task do_populate_sysroot: Started
NOTE: recipe kmscube-git-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kmscube-git-r0: task do_package: Succeeded
NOTE: Running task 1369 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_packagedata)
NOTE: recipe kmscube-git-r0: task do_packagedata: Started
NOTE: recipe kmscube-git-r0: task do_packagedata: Succeeded
NOTE: Running task 1370 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package_write_rpm)
NOTE: Running task 1371 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package_qa)
NOTE: recipe kmscube-git-r0: task do_package_write_rpm: Started
NOTE: recipe kmscube-git-r0: task do_package_qa: Started
NOTE: recipe kmscube-git-r0: task do_package_qa: Succeeded
NOTE: recipe kmscube-git-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1372 of 1372 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1372 tasks of which 1355 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7310446652642231471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 887 .bb files complete (0 cached, 887 parsed). 1666 targets, 49 skipped, 0 masked, 0 errors.
Removing 128 recipes from the core2-32 sysroot...done.
Removing 134 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:264d94f0d165c7efaa6717e975b288c5291165d0"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 218 Local 208 Mirrors 0 Missed 10 Current 157 (95% match, 97% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 167 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_packagedata_setscene)
NOTE: Running setscene task 169 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 170 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 171 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 172 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 173 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 174 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 175 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 176 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 177 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 178 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 179 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 180 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running task 739 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_fetch)
NOTE: Running task 784 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_write_config)
NOTE: Running task 786 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_write_config)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmscube-git-r0: task do_fetch: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmscube-git-r0: task do_write_config: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_write_config: Started
NOTE: recipe kmscube-git-r0: task do_fetch: Succeeded
NOTE: recipe kmscube-git-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_write_config: Succeeded
NOTE: Running task 788 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_unpack)
NOTE: Running task 789 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_fetch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 201 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 204 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 205 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 207 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 209 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 211 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 213 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 216 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 218 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 221 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe kmscube-git-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 816 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 223 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 224 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 226 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 227 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 231 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 233 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 235 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 236 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmscube-git-r0: task do_unpack: Succeeded
NOTE: Running task 839 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_patch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 242 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 245 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmscube-git-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 246 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 251 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe kmscube-git-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 857 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 858 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_lic)
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 253 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 254 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe kmscube-git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmscube-git-r0: task do_populate_lic: Started
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 256 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 257 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kmscube-git-r0: task do_populate_lic: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_lic unihash changed to 9fd6aa3cc5d24a6703b82e0e6fc2f4aba23c9a1ccebdd45e4df1f31ea81b0073
NOTE: recipe kmscube-git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 261 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 263 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 264 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 266 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 268 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 271 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 275 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 276 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 277 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 281 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 282 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 283 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 284 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 286 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 287 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 288 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 289 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 290 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 291 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 296 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 301 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 302 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 306 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 310 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 313 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 316 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/xz/5.2.7-r0/temp/log.do_packagedata_setscene.1179568
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 323 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_package_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 944 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_patch)
NOTE: recipe mesa-2_22.2.3-r0: task do_patch: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_patch: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_package_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 337 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 341 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 342 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 345 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 347 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 349 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 350 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 353 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 356 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 357 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 366 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 370 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 371 of 375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1324 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata)
NOTE: Running task 1331 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.2.7-r0: task do_packagedata: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1358 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_configure)
NOTE: recipe mesa-2_22.2.3-r0: task do_configure: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1359 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_compile)
NOTE: recipe mesa-2_22.2.3-r0: task do_compile: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1360 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_install)
NOTE: recipe mesa-2_22.2.3-r0: task do_install: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_install: Succeeded
NOTE: Running task 1361 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_populate_sysroot)
NOTE: Running task 1362 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_package)
NOTE: recipe mesa-2_22.2.3-r0: task do_package: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1363 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmscube-git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmscube-git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1364 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_configure)
NOTE: recipe kmscube-git-r0: task do_configure: Started
NOTE: recipe kmscube-git-r0: task do_configure: Succeeded
NOTE: Running task 1365 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_compile)
NOTE: recipe kmscube-git-r0: task do_compile: Started
NOTE: recipe kmscube-git-r0: task do_compile: Succeeded
NOTE: Running task 1366 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_install)
NOTE: recipe kmscube-git-r0: task do_install: Started
NOTE: recipe kmscube-git-r0: task do_install: Succeeded
NOTE: Running task 1367 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_sysroot)
NOTE: recipe kmscube-git-r0: task do_populate_sysroot: Started
NOTE: recipe kmscube-git-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_package: Succeeded
NOTE: Running task 1368 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_packagedata)
NOTE: recipe mesa-2_22.2.3-r0: task do_packagedata: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1369 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package)
NOTE: recipe kmscube-git-r0: task do_package: Started
NOTE: recipe kmscube-git-r0: task do_package: Succeeded
NOTE: Running task 1370 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_packagedata)
NOTE: recipe kmscube-git-r0: task do_packagedata: Started
NOTE: recipe kmscube-git-r0: task do_packagedata: Succeeded
NOTE: Running task 1371 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package_write_rpm)
NOTE: Running task 1372 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package_qa)
NOTE: recipe kmscube-git-r0: task do_package_write_rpm: Started
NOTE: recipe kmscube-git-r0: task do_package_qa: Started
NOTE: recipe kmscube-git-r0: task do_package_qa: Succeeded
NOTE: recipe kmscube-git-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1373 of 1373 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1373 tasks of which 1345 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.2.8-r0 to 0:5.2.7-r0) [version-going-backwards]
ERROR: xz-5.2.7-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7310446652642231471==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-kmscube-upgrade-to-latest-revision.patch"

RnJvbSA1NGE1NWY1N2JkOWQ5NTc2ZTYyZTAwMzg2ZjdmNjg3ZjJkYzdhM2EzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgTm92IDIwMjIgMDk6NTM6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBr
bXNjdWJlOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mva21zY3ViZS9rbXNjdWJlX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9rbXNjdWJlL2ttc2N1YmVfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1
YmUva21zY3ViZV9naXQuYmIKaW5kZXggNmVkOTdkZmFmZS4uYjJjMTBlMDlmYiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1YmUva21zY3ViZV9naXQuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1YmUva21zY3ViZV9naXQuYmIKQEAgLTEwLDcgKzEwLDcg
QEAgREVQRU5EUyA9ICJ2aXJ0dWFsL2xpYmdsZXMzIHZpcnR1YWwvbGliZ2xlczIgdmlydHVhbC9l
Z2wgbGliZHJtIgogCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9rbXNjdWJlLmM7YmVnaW5s
aW5lPTE7ZW5kbGluZT0yMzttZDU9OGIzMDlkNGVlNjdiNzMxNWZmNzM4MTI3MGRkNjMxZmIiCiAK
LVNSQ1JFViA9ICIzYmY2ZWUxYTAyMzM0Mzg2ZDg3Y2ZlMzU2YzNiZmIwYjI0ZTFmZWQ4IgorU1JD
UkVWID0gIjM0NTExMTQ4MWQ2NTRiMzhhNzJiNWMzNjI5MTUxZGM3NGY3YTgyYmMiCiBTUkNfVVJJ
ID0gImdpdDovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9rbXNjdWJlO2JyYW5jaD1tYXN0
ZXI7cHJvdG9jb2w9aHR0cHMiCiBVUFNUUkVBTV9DSEVDS19DT01NSVRTID0gIjEiCiAKLS0gCjIu
MzEuMQoK

--===============7310446652642231471==--

