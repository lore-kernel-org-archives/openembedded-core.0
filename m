Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 333B0C87FF2
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:52 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.107426.1682976350180551352
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fR+qIPKe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010187d9351fc8-3339bf61-6e51-458c-ae2a-6bb7641f185a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wOT/iH2IBPXkMyk0luVA6yBH4MKdAusKwigISGlRw8w=;
	b=fR+qIPKecHq+1/BQbX84RZuXYmWiOCVzoRjZXsktMFKW5DymsfQhSdGX3KK42Mry
	MvmInvkmggSLLKxAcSrKxLq4IBBTNC8dSV2KBfOlIQAn/hKMn6ioEAY/rFCTCyQ+KRi
	j3XDV68iVPM8MAUBzaDpxzyFRMhcs0uPsr66OWp4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wOT/iH2IBPXkMyk0luVA6yBH4MKdAusKwigISGlRw8w=;
	b=pZkXlKhXeKFDzPeBY3m5HXSDfk/3DirfcVw6b+/RLUa2ZQO4R9o0Gb0ixewpZpmc
	WaDmxiNdwvbNXvbHsLkJt78CDPRMNEc/BwiHtI40xpkprXpXqDZZndAxDTzvH7n4t96
	9JUmjEOOcQBG0PHaHNtP+zdEzBzJaT+VGxn9ct/k=
Content-Type: multipart/mixed; boundary="===============0643098963014337398=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 1.24.3 SUCCEEDED
Message-ID: <01010187d9351fc8-3339bf61-6e51-458c-ae2a-6bb7641f185a-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180622

--===============0643098963014337398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-numpy* to *1.24.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-1.24.2-1.24.3.patch
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
--===============0643098963014337398==
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
meta-yocto-bsp       = "tmp-auh-upgrades:e5991bf6f482be6a9f951e43db2582bdb87e5cb1"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 26 Local 10 Mirrors 0 Missed 16 Current 377 (38% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 381 of 403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 914 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_fetch)
NOTE: Running task 924 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-importlib-metadata/6.2.0-r0/temp/log.do_packagedata_setscene.1520449
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 402 of 403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_package_setscene)
NOTE: recipe python3-numpy-1.24.3-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_fetch: Succeeded
NOTE: Running task 946 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_unpack)
NOTE: Running task 947 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_unpack)
NOTE: Running task 972 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1000 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1070 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_fetch)
NOTE: recipe python3-numpy-1.24.3-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_fetch: Started
NOTE: Running task 1475 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1476 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_patch)
NOTE: Running task 1477 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_unpack)
NOTE: Running task 1478 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-1.24.3-r0: task do_unpack: Succeeded
NOTE: Running task 1480 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_patch)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1481 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_patch)
NOTE: recipe python3-numpy-1.24.3-r0: task do_patch: Started
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_patch: Succeeded
NOTE: Running task 1482 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-numpy-1.24.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_patch: Succeeded
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 1483 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1484 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_populate_lic)
NOTE: Setscene tasks completed
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1494 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata)
NOTE: recipe python3-numpy-1.24.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_populate_lic: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1495 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_configure)
NOTE: recipe python3-numpy-1.24.3-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_populate_lic unihash changed to 6b8cc1156aadf83484c11218f187a7c50b4b0aaf242626fe570dc40b5d8873d0
NOTE: Running task 1496 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure: Started
NOTE: Running task 1497 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_configure)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure: Succeeded
NOTE: Running task 1499 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure: Succeeded
NOTE: Running task 1500 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1501 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1502 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_compile)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile: Started
NOTE: Running task 1503 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_compile)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1504 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_compile)
NOTE: recipe python3-numpy-1.24.3-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1505 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile: Succeeded
NOTE: Running task 1506 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_compile_ptest_base)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1507 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_install: Succeeded
NOTE: Running task 1508 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_package)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install: Succeeded
NOTE: Running task 1509 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1510 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package: Succeeded
NOTE: Running task 1511 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_packagedata)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_packagedata: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1512 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_package: Succeeded
NOTE: Running task 1513 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_packagedata: Failed
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1513 tasks of which 1478 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata
Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-hypothesis/6.71.0-r0/temp/log.do_packagedata.1524351
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata) failed with exit code '1'

--===============0643098963014337398==
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
meta-yocto-bsp       = "tmp-auh-upgrades:e5991bf6f482be6a9f951e43db2582bdb87e5cb1"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 26 Local 10 Mirrors 0 Missed 16 Current 377 (38% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 381 of 403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-importlib-metadata/6.2.0-r0/temp/log.do_packagedata_setscene.1526815
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 402 of 403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_package_setscene)
NOTE: Running task 914 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_fetch)
NOTE: Running task 924 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_fetch)
NOTE: Running task 1066 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_fetch)
NOTE: recipe python3-numpy-1.24.3-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_fetch: Started
NOTE: Running task 1433 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_unpack)
NOTE: Running task 1434 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1435 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_unpack)
NOTE: Running task 1436 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1468 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_unpack)
NOTE: Running task 1469 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1478 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_package_write_rpm)
NOTE: recipe python3-numpy-1.24.3-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1479 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_patch)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_unpack: Succeeded
NOTE: Running task 1480 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_patch)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm: Started
NOTE: Running task 1481 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_patch)
NOTE: recipe python3-numpy-1.24.3-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1491 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_patch: Succeeded
NOTE: Running task 1492 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1493 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1494 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1495 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_populate_lic)
NOTE: recipe python3-numpy-1.24.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_populate_lic: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1496 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_configure)
NOTE: Running task 1497 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_configure)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_populate_lic unihash changed to 6b8cc1156aadf83484c11218f187a7c50b4b0aaf242626fe570dc40b5d8873d0
NOTE: recipe python3-numpy-1.24.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_configure: Started
NOTE: Running task 1499 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_configure)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1500 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure: Started
NOTE: Running task 1501 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_configure_ptest_base)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure: Succeeded
NOTE: Running task 1502 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1503 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_compile)
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1504 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_compile)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1505 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile: Succeeded
NOTE: Running task 1506 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_compile_ptest_base)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_install: Succeeded
NOTE: Running task 1507 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1508 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install: Succeeded
NOTE: Running task 1509 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_install_ptest_base)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package: Succeeded
NOTE: Running task 1510 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1511 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1512 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_package: Succeeded
NOTE: Running task 1513 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_packagedata: Failed
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1513 tasks of which 1478 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata
Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-hypothesis/6.71.0-r0/temp/log.do_packagedata.1530723
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata) failed with exit code '1'

--===============0643098963014337398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v1.24.2/numpy-1.24.2.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest" to "https://github.com/numpy/numpy/releases/download/v1.24.3/numpy-1.24.3.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest"
packages/core2-32-poky-linux/python3-numpy: PKGV changed from 1.24.2 [default] to 1.24.3 [default]
packages/core2-32-poky-linux/python3-numpy: PV changed from "1.24.2" to "1.24.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 1.24.2 [default] to 1.24.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "1.24.2" to "1.24.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 40986436 to 40986732 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 1.24.2 [default] to 1.24.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "1.24.2" to "1.24.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 1.24.2 [default] to 1.24.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "1.24.2" to "1.24.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 1.24.2 [default] to 1.24.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "1.24.2" to "1.24.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 1.24.2 [default] to 1.24.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "1.24.2" to "1.24.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 1.24.2 [default] to 1.24.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PV changed from "1.24.2" to "1.24.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 18907513 to 18907800 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 1.24.2 [default] to 1.24.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "1.24.2" to "1.24.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 242548 to 242556 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGV changed from 1.24.2 [default] to 1.24.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.11/site-packages/numpy-1.24.2.dist-info -> /usr/lib/python3.11/site-packages/numpy-1.24.3.dist-info, added "/usr/lib/python3.11/site-packages/numpy/f2py/tests/src/string/scalar_string.f90"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PV changed from "1.24.2" to "1.24.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 39489638 to 39500903 (+0%)
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.11/site-packages/numpy-1.24.2.dist-info moved to /usr/lib/python3.11/site-packages/numpy-1.24.3.dist-info
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/string/scalar_string.f90 was added

--===============0643098963014337398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 51 skipped, 0 masked, 0 errors.
Removing 28 recipes from the core2-32 sysroot...done.
Removing 53 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:e5991bf6f482be6a9f951e43db2582bdb87e5cb1"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 216 Local 200 Mirrors 0 Missed 16 Current 183 (92% match, 95% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 184 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 197 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 198 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 203 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 204 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 206 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running task 642 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_fetch)
NOTE: Running task 648 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running task 705 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_fetch)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_fetch: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_fetch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 213 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-1.24.3-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 214 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 215 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 216 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 217 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 218 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 219 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 220 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 221 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 222 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 223 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 224 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 225 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 226 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 227 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: Running task 843 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_unpack)
NOTE: Running task 844 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_unpack)
NOTE: Running task 845 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_unpack)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-9.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_unpack: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 231 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 232 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 233 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 234 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 235 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-1.24.3-r0: task do_unpack: Started
NOTE: Running task 854 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_patch)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_unpack: Succeeded
NOTE: Running task 855 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_patch)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-importlib-metadata/6.2.0-r0/temp/log.do_packagedata_setscene.1539848
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 242 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_package_setscene)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-9.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_patch: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_patch: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 268 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running task 857 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_patch)
NOTE: Running task 858 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 887 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 280 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 282 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_patch: Succeeded
NOTE: Running task 949 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 950 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_populate_lic)
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 297 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-1.24.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_populate_lic: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_populate_lic unihash changed to 6b8cc1156aadf83484c11218f187a7c50b4b0aaf242626fe570dc40b5d8873d0
NOTE: recipe python3-numpy-1.24.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 305 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 308 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 312 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 321 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 322 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 323 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 326 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 328 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 330 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 335 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 342 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 345 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 350 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 365 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 368 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 369 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 372 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 374 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 376 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 377 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 379 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_package_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 380 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 382 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 387 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 393 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 396 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 397 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1257 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1281 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1367 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1465 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata)
NOTE: Running task 1480 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm)
NOTE: recipe python3-numpy-1.24.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_package_write_rpm: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1482 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_configure)
NOTE: Running task 1483 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_configure)
NOTE: Running task 1484 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_configure)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1485 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_compile)
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure: Succeeded
NOTE: Running task 1486 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_configure_ptest_base)
NOTE: Running task 1487 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_configure_ptest_base)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1488 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_compile)
NOTE: Running task 1489 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_compile)
NOTE: recipe python3-numpy-1.24.3-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1490 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile: Succeeded
NOTE: Running task 1491 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_compile_ptest_base)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 1492 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1493 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install: Succeeded
NOTE: Running task 1494 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package: Succeeded
NOTE: Running task 1495 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1496 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_package)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1497 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_package: Succeeded
NOTE: Running task 1498 of 1508 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.24.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1498 tasks of which 1463 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata
Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-hypothesis/6.71.0-r0/temp/log.do_packagedata.1548222
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata) failed with exit code '1'

--===============0643098963014337398==
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
meta-yocto-bsp       = "tmp-auh-upgrades:e5991bf6f482be6a9f951e43db2582bdb87e5cb1"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 26 Local 10 Mirrors 0 Missed 16 Current 377 (38% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 381 of 403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-importlib-metadata/6.2.0-r0/temp/log.do_packagedata_setscene.1533057
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 402 of 403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_package_setscene)
NOTE: Running task 914 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_fetch)
NOTE: Running task 924 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_fetch)
NOTE: Running task 1066 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_fetch)
NOTE: recipe python3-numpy-1.24.3-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_fetch: Succeeded
NOTE: Running task 1354 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_unpack)
NOTE: Running task 1355 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_fetch: Started
NOTE: Running task 1356 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_unpack)
NOTE: Running task 1357 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1394 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_unpack)
NOTE: Running task 1395 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1477 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_package_write_rpm)
NOTE: recipe python3-numpy-1.24.3-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_unpack: Succeeded
NOTE: Running task 1478 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_patch)
NOTE: Running task 1479 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_patch)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_unpack: Succeeded
NOTE: Running task 1481 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_patch)
NOTE: recipe python3-numpy-1.24.3-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1491 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1492 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_patch: Succeeded
NOTE: Running task 1493 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_patch: Succeeded
NOTE: Running task 1494 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1495 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_populate_lic)
NOTE: recipe python3-numpy-1.24.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_populate_lic: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1496 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1498 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_configure)
NOTE: recipe python3-numpy-1.24.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_populate_lic unihash changed to 6b8cc1156aadf83484c11218f187a7c50b4b0aaf242626fe570dc40b5d8873d0
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure: Started
NOTE: Running task 1499 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_configure)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1500 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure: Succeeded
NOTE: Running task 1501 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure: Succeeded
NOTE: Running task 1502 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1503 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_compile)
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1504 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_compile)
NOTE: recipe python3-numpy-1.24.3-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1505 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile: Succeeded
NOTE: Running task 1506 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_compile_ptest_base)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_install: Succeeded
NOTE: Running task 1507 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1508 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install: Succeeded
NOTE: Running task 1509 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package: Succeeded
NOTE: Running task 1510 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1511 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_package)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1512 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_package: Succeeded
NOTE: Running task 1513 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_packagedata: Failed
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1513 tasks of which 1478 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata
Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-hypothesis/6.71.0-r0/temp/log.do_packagedata.1536968
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata) failed with exit code '1'

--===============0643098963014337398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1799 targets, 39 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:e5991bf6f482be6a9f951e43db2582bdb87e5cb1"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 26 Local 10 Mirrors 0 Missed 16 Current 377 (38% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 381 of 403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-importlib-metadata/6.2.0-r0/temp/log.do_packagedata_setscene.1478649
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 402 of 403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_package_setscene)
NOTE: Running task 914 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_fetch)
NOTE: Running task 924 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_fetch)
NOTE: Running task 1066 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_fetch)
NOTE: recipe python3-numpy-1.24.3-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_fetch: Succeeded
NOTE: Running task 1379 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_unpack)
NOTE: Running task 1380 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_unpack)
NOTE: Running task 1381 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_fetch: Started
NOTE: Running task 1382 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1401 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_unpack)
NOTE: Running task 1402 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1478 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_package_write_rpm)
NOTE: recipe python3-numpy-1.24.3-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_unpack: Succeeded
NOTE: Running task 1479 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_patch)
NOTE: Running task 1480 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_patch)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_unpack: Succeeded
NOTE: Running task 1481 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_patch)
NOTE: recipe python3-numpy-1.24.3-r0: task do_patch: Started
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1491 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_patch: Succeeded
NOTE: Running task 1492 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_patch: Succeeded
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Started
NOTE: Running task 1493 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_patch: Succeeded
NOTE: Running task 1494 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1495 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_populate_lic)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_populate_lic: Started
NOTE: Running task 1496 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_configure)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1497 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_populate_lic unihash changed to 6b8cc1156aadf83484c11218f187a7c50b4b0aaf242626fe570dc40b5d8873d0
NOTE: recipe python3-numpy-1.24.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1499 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_configure)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1500 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_configure_ptest_base)
NOTE: Running task 1501 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_compile)
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure: Succeeded
NOTE: Running task 1502 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_compile)
NOTE: Running task 1503 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1504 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_compile)
NOTE: recipe python3-numpy-1.24.3-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1505 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile: Succeeded
NOTE: Running task 1506 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_install: Succeeded
NOTE: Running task 1507 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1508 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install: Succeeded
NOTE: Running task 1509 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package: Succeeded
NOTE: Running task 1510 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1511 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_package)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1512 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_package: Succeeded
NOTE: Running task 1513 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_packagedata: Failed
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1513 tasks of which 1478 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata
Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.75.1-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.71.0-r0/temp/log.do_packagedata.1482620
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata) failed with exit code '1'

--===============0643098963014337398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.11/site-packages/numpy-1.24.2.dist-info -> /usr/lib/python3.11/site-packages/numpy-1.24.3.dist-info, added "/usr/lib/python3.11/site-packages/numpy/f2py/tests/src/string/scalar_string.f90"
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.11/site-packages/numpy-1.24.2.dist-info moved to /usr/lib/python3.11/site-packages/numpy-1.24.3.dist-info
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/string/scalar_string.f90 was added

--===============0643098963014337398==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-1.24.2-1.24.3.patch"

RnJvbSBlM2IzZTlhOWNiOWRmNzZlYTRiZWIxZTU0YjFjNDYxZjM4MWQyNDI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxMDo1ODozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbnVtcHk6IHVwZ3JhZGUgMS4yNC4yIC0+IDEuMjQuMwoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLW51bXB5XzEuMjQuMi5iYiA9PiBweXRob24zLW51bXB5XzEuMjQuMy5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLW51bXB5XzEuMjQuMi5iYiA9PiBw
eXRob24zLW51bXB5XzEuMjQuMy5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMS4yNC4yLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzEuMjQuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk2
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlf
MS4yNC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
bnVtcHlfMS4yNC4zLmJiCmluZGV4IGJmY2ZjNTI3MjkuLjcxMGFmNWZlOGYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8xLjI0LjIuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzEuMjQuMy5iYgpA
QCAtMTIsNyArMTIsNyBAQCBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92
JHtQVn0vJHtTUkNOQU1FfS0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1u
dW1weS1jb3JlLURlZmluZS1SSVNDVi0zMi1zdXBwb3J0LnBhdGNoIFwKICAgICAgICAgICAgZmls
ZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwMDNh
OWY1MzBlODgwY2IyY2QxNzdjYmExYWY3MjIwYjlhYTQyZGVmOWM0YWZjMmEyZmMzZWU2YmU3ZWIy
YjIyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImFiMzQ0ZjFiZjIxZjE0MGFkYWI4ZTQ3ZmRiYzdj
MzVhNDc3ZGMwMTQwODc5MWY4YmEwMGQwMThkZDBiYzUxNTUiCiAKIEdJVEhVQl9CQVNFX1VSSSA9
ICJodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcmVsZWFzZXMiCiBVUFNUUkVBTV9DSEVD
S19SRUdFWCA9ICJyZWxlYXNlcy90YWcvdj8oP1A8cHZlcj5cZCsoXC5cZCspKykkIgotLSAKMi4z
OS4yCgo=

--===============0643098963014337398==--

