Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA043C64EBC
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web12.870.1667349631595276587
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HScAhz6j;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018435c8584f-57d0efdd-bfba-4ee4-9ef4-9237f002bf25-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Pt8LSxZ+lSA5QpVMHF4G9fp3ECEtYljIM6QY66aM8I4=;
	b=HScAhz6jeBgi2VmjlCdIlA02ukcqOnoZ7PImKqMbLM8j2MgLe978x4nP5Fn+PhiE
	C89mJTwuL9Bpy1licnyVunp/cPL+p6Fggc7Io0w05lPh0/gVdmcmJw9Mg1N3uuF3rOT
	7bt4WmBat5krBylXbw5H1uZHXiLy8Z0xDRprMT+c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Pt8LSxZ+lSA5QpVMHF4G9fp3ECEtYljIM6QY66aM8I4=;
	b=D+Mmt2p0ORObeNGl6OjritxD22jjlFLjyrbELvpEC/CnxKI7R9LHPP+mBxY5D8fp
	PGfpnTk2aSYBT07KZ+QhNG4/i5g4q9LPlgGc5PElKSyUpaKqOmUW0ncgnXZ2zT+d5nS
	cCKZYzl9XhKmxpUVMb+h56thBDD+EPXjgXk3ezzM=
Content-Type: multipart/mixed; boundary="===============3603551191691408629=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 1.23.4 SUCCEEDED
Message-ID: <0101018435c8584f-57d0efdd-bfba-4ee4-9ef4-9237f002bf25-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172435

--===============3603551191691408629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-numpy* to *1.23.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-1.23.3-1.23.4.patch
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
--===============3603551191691408629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-numpy: PV changed from "1.23.3" to "1.23.4"
packages/core2-32-poky-linux/python3-numpy: PKGV changed from 1.23.3 [default] to 1.23.4 [default]
packages/core2-32-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v1.23.3/numpy-1.23.3.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest file://0001-generate_umath.py-do-not-write-full-path-to-output-f.patch" to "https://github.com/numpy/numpy/releases/download/v1.23.4/numpy-1.23.4.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest file://0001-generate_umath.py-do-not-write-full-path-to-output-f.patch"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "1.23.3" to "1.23.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 1.23.3 [default] to 1.23.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 37824680 to 37824728 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "1.23.3" to "1.23.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 1.23.3 [default] to 1.23.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "1.23.3" to "1.23.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 1.23.3 [default] to 1.23.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "1.23.3" to "1.23.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 1.23.3 [default] to 1.23.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "1.23.3" to "1.23.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 1.23.3 [default] to 1.23.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PV changed from "1.23.3" to "1.23.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 1.23.3 [default] to 1.23.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 18712977 to 18713031 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "1.23.3" to "1.23.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 1.23.3 [default] to 1.23.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 260598 to 260602 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PV changed from "1.23.3" to "1.23.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGV changed from 1.23.3 [default] to 1.23.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 39955250 to 39960503 (+0%)
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.11/site-packages/numpy-1.23.3.dist-info moved to /usr/lib/python3.11/site-packages/numpy-1.23.4.dist-info

--===============3603551191691408629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.11/site-packages/numpy-1.23.3.dist-info moved to /usr/lib/python3.11/site-packages/numpy-1.23.4.dist-info

--===============3603551191691408629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 53 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:795660d6cd13f8c63404a271520bd2feabca98e9"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 20 Local 12 Mirrors 0 Missed 8 Current 344 (60% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 347 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_packagedata_setscene)
NOTE: Running task 883 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_fetch)
NOTE: Running task 1330 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_write_rpm_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-more-itertools/8.14.0-r0/temp/log.do_packagedata_setscene.666782
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 360 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_package_setscene)
NOTE: Running task 1331 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_unpack)
NOTE: Running task 1332 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_package_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-hypothesis/6.56.1-r0/temp/log.do_packagedata_setscene.666930
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 362 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_package_setscene)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 1345 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_setscene: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_unpack: Succeeded
NOTE: Running task 1346 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_patch)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1359 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_packagedata)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_patch: Succeeded
NOTE: Running task 1361 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1362 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_populate_lic)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_lic: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_populate_lic unihash changed to 557ccdc07dfaed2c631c5bc260120001a9500eacbc0fa9f55751e3e7f420d429
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1364 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_configure)
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure: Succeeded
NOTE: Running task 1365 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1366 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_compile)
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile: Started
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile: Succeeded
NOTE: Running task 1367 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_compile_ptest_base)
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1368 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_install)
NOTE: recipe python3-numpy-1.23.4-r0: task do_install: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_install: Succeeded
NOTE: Running task 1369 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_install_ptest_base)
NOTE: recipe python3-numpy-1.23.4-r0: task do_install_ptest_base: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1370 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_package)
NOTE: Running task 1371 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_populate_sysroot)
NOTE: recipe python3-numpy-1.23.4-r0: task do_package: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_sysroot: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_package: Succeeded
NOTE: Running task 1372 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_packagedata)
NOTE: recipe python3-numpy-1.23.4-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1373 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_package_write_rpm)
NOTE: Running task 1374 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_package_qa)
NOTE: recipe python3-numpy-1.23.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_package_qa: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_package_qa: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1375 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_build)
NOTE: Tasks Summary: Attempted 1375 tasks of which 1354 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 18 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-src went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dbg went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-ptest went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-staticdev went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dev went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-doc went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-locale went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3603551191691408629==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-1.23.3-1.23.4.patch"

RnJvbSAxNmU4NGY3NmQ0ZjI5YTBmNzBjODExMjVjODg4OWY3ODE2NmMzNjE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxMDozNjowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbnVtcHk6IHVwZ3JhZGUgMS4yMy4zIC0+IDEuMjMuNAoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLW51bXB5XzEuMjMuMy5iYiA9PiBweXRob24zLW51bXB5XzEuMjMuNC5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLW51bXB5XzEuMjMuMy5iYiA9PiBw
eXRob24zLW51bXB5XzEuMjMuNC5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMS4yMy4zLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzEuMjMuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDk2
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlf
MS4yMy4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
bnVtcHlfMS4yMy40LmJiCmluZGV4IDlkMDg2YWVkZmQuLmQ5MTcyNjkyYjUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8xLjIzLjMuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzEuMjMuNC5iYgpA
QCAtMTMsNyArMTMsNyBAQCBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92
JHtQVn0vJHtTUkNOQU1FfS0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vcnVuLXB0
ZXN0IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtZ2VuZXJhdGVfdW1hdGgucHktZG8tbm90LXdy
aXRlLWZ1bGwtcGF0aC10by1vdXRwdXQtZi5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI1MWJmNDljMGNkMWQ1MmJlMGEyNDBhYTY2ZjM0NThhZmM0Yjk1ZDg5OTNk
MmQwNGYwZDkxZmE2MGMxMGFmNmNkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImVkMmNjOTJhZjBl
ZmFkMjAxOTg2MzhjNjliYjBmYzI4NzBhNThkYWJmYmE2ZWI3MjJjOTMzYjQ4NTU2YzY4NmMiCiAK
IEdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcmVsZWFz
ZXMiCiAKLS0gCjIuMzEuMQoK

--===============3603551191691408629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1665 targets, 49 skipped, 0 masked, 0 errors.
Removing 25 recipes from the core2-32 sysroot...done.
Removing 50 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:795660d6cd13f8c63404a271520bd2feabca98e9"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 200 Local 192 Mirrors 0 Missed 8 Current 160 (96% match, 97% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 162 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 170 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 171 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 172 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 173 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running task 611 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_fetch: Succeeded
NOTE: Running task 733 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_unpack)
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 178 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 179 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 180 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 181 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 182 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 183 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 184 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 185 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 186 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 187 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 188 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 189 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 190 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 191 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 192 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 193 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 194 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-1.23.4-r0: task do_unpack: Started
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 195 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 196 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 197 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 199 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-more-itertools/8.14.0-r0/temp/log.do_packagedata_setscene.688066
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 206 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_package_setscene)
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-hypothesis/6.56.1-r0/temp/log.do_packagedata_setscene.688136
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_unpack: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 210 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_package_setscene)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 742 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_patch)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 242 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 244 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 246 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-1.23.4-r0: task do_patch: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 249 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 256 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-1.23.4-r0: task do_patch: Succeeded
NOTE: Running task 827 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 828 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_populate_lic)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_lic: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_populate_lic unihash changed to 557ccdc07dfaed2c631c5bc260120001a9500eacbc0fa9f55751e3e7f420d429
NOTE: recipe python3-numpy-1.23.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_setscene: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_package_setscene: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 262 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 264 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 268 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 275 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 276 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 277 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 282 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 285 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 286 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 287 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 288 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 290 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 291 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 292 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 293 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 294 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 295 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 301 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 305 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 312 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 322 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 324 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 329 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 330 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 333 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 335 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 337 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 338 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 340 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_package_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 341 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 343 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 345 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 348 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 353 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 357 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 358 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1130 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1227 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_packagedata)
NOTE: Running task 1329 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_packagedata)
NOTE: Running task 1345 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm)
NOTE: recipe python3-numpy-1.23.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_packagedata: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1349 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_configure)
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure: Succeeded
NOTE: Running task 1350 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1351 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_compile)
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile: Succeeded
NOTE: Running task 1352 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_compile_ptest_base)
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1353 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_install)
NOTE: recipe python3-numpy-1.23.4-r0: task do_install: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_install: Succeeded
NOTE: Running task 1354 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_install_ptest_base)
NOTE: recipe python3-numpy-1.23.4-r0: task do_install_ptest_base: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1355 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_package)
NOTE: Running task 1356 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_populate_sysroot)
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_sysroot: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_package: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_package: Succeeded
NOTE: Running task 1357 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_packagedata)
NOTE: recipe python3-numpy-1.23.4-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1358 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_package_write_rpm)
NOTE: Running task 1359 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_package_qa)
NOTE: recipe python3-numpy-1.23.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_package_qa: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_package_qa: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1360 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_build)
NOTE: Tasks Summary: Attempted 1360 tasks of which 1339 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 18 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-src went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dbg went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-ptest went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-staticdev went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dev went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-doc went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-locale went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3603551191691408629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 63 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:795660d6cd13f8c63404a271520bd2feabca98e9"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 20 Local 12 Mirrors 0 Missed 8 Current 344 (60% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 347 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_packagedata_setscene)
NOTE: Running task 883 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_fetch)
NOTE: Running task 1330 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_write_rpm_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-more-itertools/8.14.0-r0/temp/log.do_packagedata_setscene.673777
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 360 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_package_setscene)
NOTE: Running task 1331 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_unpack)
NOTE: Running task 1332 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-1.23.4-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_package_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-hypothesis/6.56.1-r0/temp/log.do_packagedata_setscene.673925
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 362 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_package_setscene)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 1345 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_packagedata)
NOTE: recipe python3-numpy-1.23.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_setscene: Started
NOTE: Running task 1346 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_patch)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1359 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_packagedata)
NOTE: recipe python3-numpy-1.23.4-r0: task do_patch: Succeeded
NOTE: Running task 1361 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1362 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_populate_lic)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_lic: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_populate_lic unihash changed to 557ccdc07dfaed2c631c5bc260120001a9500eacbc0fa9f55751e3e7f420d429
NOTE: recipe python3-numpy-1.23.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1363 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_configure)
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure: Succeeded
NOTE: Running task 1365 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1366 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_compile)
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile: Started
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile: Succeeded
NOTE: Running task 1367 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_compile_ptest_base)
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1368 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_install)
NOTE: recipe python3-numpy-1.23.4-r0: task do_install: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_install: Succeeded
NOTE: Running task 1369 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_install_ptest_base)
NOTE: recipe python3-numpy-1.23.4-r0: task do_install_ptest_base: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1370 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_package)
NOTE: Running task 1371 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_populate_sysroot)
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_sysroot: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_package: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_package: Succeeded
NOTE: Running task 1372 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_packagedata)
NOTE: recipe python3-numpy-1.23.4-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1373 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_package_write_rpm)
NOTE: Running task 1374 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_package_qa)
NOTE: recipe python3-numpy-1.23.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_package_qa: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_package_qa: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1375 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_build)
NOTE: Tasks Summary: Attempted 1375 tasks of which 1354 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 18 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-src went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dbg went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-ptest went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-staticdev went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dev went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-doc went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-locale went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3603551191691408629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 70 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:795660d6cd13f8c63404a271520bd2feabca98e9"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 20 Local 12 Mirrors 0 Missed 8 Current 344 (60% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 347 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_packagedata_setscene)
NOTE: Running task 883 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_fetch)
NOTE: Running task 1330 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_package_write_rpm)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_write_rpm_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-more-itertools/8.14.0-r0/temp/log.do_packagedata_setscene.680724
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 360 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_package_setscene)
NOTE: Running task 1331 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_unpack)
NOTE: Running task 1332 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_unpack: Started
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_package_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-hypothesis/6.56.1-r0/temp/log.do_packagedata_setscene.680872
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 362 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_package_setscene)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 1345 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_setscene: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_unpack: Succeeded
NOTE: Running task 1346 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_patch)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_patch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1359 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_packagedata)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_patch: Succeeded
NOTE: Running task 1361 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1362 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_populate_lic)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_lic: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_populate_lic unihash changed to 557ccdc07dfaed2c631c5bc260120001a9500eacbc0fa9f55751e3e7f420d429
NOTE: recipe python3-numpy-1.23.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1364 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_configure)
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure: Succeeded
NOTE: Running task 1365 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1366 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_compile)
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile: Started
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile: Succeeded
NOTE: Running task 1367 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_compile_ptest_base)
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1368 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_install)
NOTE: recipe python3-numpy-1.23.4-r0: task do_install: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_install: Succeeded
NOTE: Running task 1369 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_install_ptest_base)
NOTE: recipe python3-numpy-1.23.4-r0: task do_install_ptest_base: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1370 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_package)
NOTE: Running task 1371 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_populate_sysroot)
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_sysroot: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_package: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_package: Succeeded
NOTE: Running task 1372 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_packagedata)
NOTE: recipe python3-numpy-1.23.4-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1373 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_package_write_rpm)
NOTE: Running task 1374 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_package_qa)
NOTE: recipe python3-numpy-1.23.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_package_qa: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_package_qa: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1375 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_build)
NOTE: Tasks Summary: Attempted 1375 tasks of which 1354 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 18 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-src went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dbg went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-ptest went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-staticdev went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dev went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-doc went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-locale went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3603551191691408629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1666 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1664 targets, 35 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:795660d6cd13f8c63404a271520bd2feabca98e9"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 20 Local 12 Mirrors 0 Missed 8 Current 344 (60% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 347 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_packagedata_setscene)
NOTE: Running task 883 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_fetch)
NOTE: Running task 1330 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_write_rpm_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-more-itertools/8.14.0-r0/temp/log.do_packagedata_setscene.659354
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 360 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_package_setscene)
NOTE: Running task 1331 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_unpack)
NOTE: Running task 1332 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_unpack: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_package_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_prepare_recipe_sysroot: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.56.1-r0/temp/log.do_packagedata_setscene.659502
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 362 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_package_setscene)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 1345 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_setscene: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_unpack: Succeeded
NOTE: Running task 1346 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_patch)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_patch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1359 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb:do_packagedata)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_packagedata: Started
NOTE: Running task 1361 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1362 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_populate_lic)
NOTE: recipe python3-numpy-1.23.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_lic: Started
NOTE: recipe python3-hypothesis-6.56.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_populate_lic unihash changed to 557ccdc07dfaed2c631c5bc260120001a9500eacbc0fa9f55751e3e7f420d429
NOTE: recipe python3-numpy-1.23.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1364 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_configure)
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure: Succeeded
NOTE: Running task 1365 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1366 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_compile)
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile: Started
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile: Succeeded
NOTE: Running task 1367 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_compile_ptest_base)
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1368 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_install)
NOTE: recipe python3-numpy-1.23.4-r0: task do_install: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_install: Succeeded
NOTE: Running task 1369 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_install_ptest_base)
NOTE: recipe python3-numpy-1.23.4-r0: task do_install_ptest_base: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1370 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_package)
NOTE: Running task 1371 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_populate_sysroot)
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_sysroot: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_package: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_package: Succeeded
NOTE: Running task 1372 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_packagedata)
NOTE: recipe python3-numpy-1.23.4-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1373 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_package_write_rpm)
NOTE: Running task 1374 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_package_qa)
NOTE: recipe python3-numpy-1.23.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_package_qa: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_package_qa: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1375 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_build)
NOTE: Tasks Summary: Attempted 1375 tasks of which 1354 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 18 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-src went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dbg went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-ptest went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-staticdev went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dev went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-doc went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-locale went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.14.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-8.14.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.56.4-r0 to 0:6.56.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.56.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3603551191691408629==--

