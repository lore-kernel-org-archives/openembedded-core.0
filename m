Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C663CCA48F
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:46 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web09.4389.1655298221919856998
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Uf6Two53;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 01010181677661b3-a9b2fe10-b3d4-448c-b1af-4f04353b89e9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5zt7AgAsi1tboa3j6YjsS4zon2vT8EMee0qcEOJURe4=;
	b=Uf6Two53EA7rUHu01P296iG3jy2oWGlcRFQ1GJ21C4UX8vTGRaaDyQgY2vqc/8UB
	eqiKQI5//9vHaQ750IyRtlw4Vg4eyklCAbwv6HbsvSJASnd+5i3bQQKwPknQ3zr289G
	tR/j6daBrCZBoUE9+ZGDE1I0vu+TvfgbANiT5GfU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5zt7AgAsi1tboa3j6YjsS4zon2vT8EMee0qcEOJURe4=;
	b=E/ceQXrkPEG8eBx3uljVXSWzU/meLSsUP95IC6i0I+ei+3GySR5T/VxUyQdwlERm
	7ZHGedMLvjSw7mFCp9NTD1Va6Jfde7TzgeFQ1JhdZRpWiIu3x/s8Jau8nrUUPBKLaec
	oPqAtJi6dfQa2xMZm2V9aby3sghrr6jpO+EvfOjc=
Content-Type: multipart/mixed; boundary="===============7507117950955165525=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 1.22.4 SUCCEEDED
Message-ID: 
 <01010181677661b3-a9b2fe10-b3d4-448c-b1af-4f04353b89e9-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:40 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166959

--===============7507117950955165525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-numpy* to *1.22.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-1.22.3-1.22.4.patch
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
--===============7507117950955165525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1642 targets, 63 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-05b81cde1afea324ddb27011ebd0d4af24a37d59"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:05b81cde1afea324ddb27011ebd0d4af24a37d59"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 14 Local 2 Mirrors 0 Missed 12 Current 344 (14% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 873 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_fetch)
NOTE: Running task 902 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_fetch)
NOTE: Running task 1317 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_package_write_rpm)
NOTE: recipe python3-numpy-1.22.4-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Succeeded
NOTE: Running task 1319 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_unpack)
NOTE: Running task 1320 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_unpack)
NOTE: Running task 1321 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1322 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-1.22.4-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Succeeded
NOTE: Running task 1323 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_patch)
NOTE: recipe glibc-2.35-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_unpack: Succeeded
NOTE: Running task 1324 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_patch)
NOTE: recipe python3-numpy-1.22.4-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1325 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-numpy-1.22.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_patch: Succeeded
NOTE: Running task 1326 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1327 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_populate_lic)
NOTE: recipe python3-numpy-1.22.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_populate_lic: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1328 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure)
NOTE: recipe python3-numpy-1.22.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_populate_lic unihash changed to 81662c98b971798f28070d60a780fea929e6289294bd3ab6e0c3f790792ebc04
NOTE: recipe python3-numpy-1.22.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Started
NOTE: Running task 1329 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_configure)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Succeeded
NOTE: Running task 1330 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.22.4-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Started
NOTE: Running task 1331 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1332 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile)
NOTE: recipe python3-numpy-1.22.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Started
NOTE: Running task 1333 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_compile)
NOTE: recipe python3-numpy-1.22.4-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Succeeded
NOTE: Running task 1334 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1335 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Succeeded
NOTE: Running task 1336 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1337 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_package)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Succeeded
NOTE: Running task 1338 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Failed
NOTE: recipe glibc-2.35-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-1.22.4-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1338 tasks of which 1315 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-hypothesis/6.46.11-r0/temp/log.do_packagedata.6976
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata) failed with exit code '1'

--===============7507117950955165525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1643 targets, 49 skipped, 0 masked, 0 errors.
Removing 24 recipes from the core2-32 sysroot...done.
Removing 50 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-05b81cde1afea324ddb27011ebd0d4af24a37d59"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:05b81cde1afea324ddb27011ebd0d4af24a37d59"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 198 Local 186 Mirrors 0 Missed 12 Current 156 (93% match, 96% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 169 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 170 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 171 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 172 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running task 601 of 1333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_fetch)
NOTE: Running task 617 of 1333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Succeeded
NOTE: Running task 707 of 1333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_unpack)
NOTE: Running task 708 of 1333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_unpack)
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 175 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 176 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 177 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 178 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 179 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 180 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 181 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 182 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 183 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 184 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 185 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_62.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 186 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 187 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 188 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 189 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 190 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-1.22.4-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Started
NOTE: recipe python3-attrs-21.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-4.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-62.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Succeeded
NOTE: Running setscene task 191 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 192 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 193 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 194 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 195 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 709 of 1333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_patch)
NOTE: recipe python3-attrs-21.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-8.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-4.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-62.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 226 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 227 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Succeeded
NOTE: recipe python3-numpy-1.22.4-r0: task do_unpack: Succeeded
NOTE: Running task 774 of 1333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_deploy_source_date_epoch)
NOTE: recipe psmisc-23.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 776 of 1333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_patch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_patch: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 240 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 242 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 244 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-numpy-1.22.4-r0: task do_patch: Succeeded
NOTE: Running task 796 of 1333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 797 of 1333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_populate_lic)
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 247 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 254 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-1.22.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_populate_lic: Started
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 257 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 258 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 259 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 261 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 264 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 266 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 268 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 270 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 272 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 274 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 275 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.5.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_populate_lic unihash changed to 81662c98b971798f28070d60a780fea929e6289294bd3ab6e0c3f790792ebc04
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 280 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 282 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 285 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 295 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 303 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 307 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 317 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 323 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 325 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 327 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 329 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 331 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 332 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 334 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_package_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 335 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 337 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 339 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 342 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 348 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 351 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 352 of 354 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1103 of 1333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1128 of 1333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1311 of 1333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm)
NOTE: recipe python3-numpy-1.22.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.22.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1313 of 1333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure)
NOTE: Running task 1314 of 1333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_configure)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Succeeded
NOTE: recipe python3-numpy-1.22.4-r0: task do_configure: Succeeded
NOTE: Running task 1315 of 1333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure_ptest_base)
NOTE: Running task 1316 of 1333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-numpy-1.22.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1317 of 1333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile)
NOTE: Running task 1318 of 1333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_compile)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Succeeded
NOTE: Running task 1319 of 1333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile_ptest_base)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1320 of 1333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Succeeded
NOTE: Running task 1321 of 1333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1322 of 1333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_package)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Succeeded
NOTE: Running task 1323 of 1333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.22.4-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1323 tasks of which 1300 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-hypothesis/6.46.11-r0/temp/log.do_packagedata.21111
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata) failed with exit code '1'

--===============7507117950955165525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1644 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (881 cached, 1 parsed). 1642 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-05b81cde1afea324ddb27011ebd0d4af24a37d59"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:05b81cde1afea324ddb27011ebd0d4af24a37d59"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 14 Local 2 Mirrors 0 Missed 12 Current 344 (14% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 873 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_fetch)
NOTE: Running task 902 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_fetch)
NOTE: Running task 1317 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_package_write_rpm)
NOTE: recipe python3-numpy-1.22.4-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Succeeded
NOTE: Running task 1318 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_unpack)
NOTE: Running task 1319 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_unpack)
NOTE: Running task 1320 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1321 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-1.22.4-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Succeeded
NOTE: Running task 1323 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_patch)
NOTE: recipe glibc-2.35-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_unpack: Succeeded
NOTE: Running task 1324 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_patch)
NOTE: recipe python3-numpy-1.22.4-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Succeeded
NOTE: recipe python3-numpy-1.22.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1325 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_patch: Succeeded
NOTE: Running task 1326 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1327 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_populate_lic)
NOTE: recipe python3-numpy-1.22.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_populate_lic: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1328 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure)
NOTE: recipe python3-numpy-1.22.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_populate_lic unihash changed to 81662c98b971798f28070d60a780fea929e6289294bd3ab6e0c3f790792ebc04
NOTE: recipe python3-numpy-1.22.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Started
NOTE: Running task 1329 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_configure)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Succeeded
NOTE: Running task 1330 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.22.4-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Started
NOTE: Running task 1331 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1332 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile)
NOTE: recipe python3-numpy-1.22.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Started
NOTE: Running task 1333 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_compile)
NOTE: recipe python3-numpy-1.22.4-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Succeeded
NOTE: Running task 1334 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1335 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Succeeded
NOTE: Running task 1336 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1337 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_package)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Succeeded
NOTE: Running task 1338 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Failed
NOTE: recipe glibc-2.35-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-1.22.4-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1338 tasks of which 1315 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.46.11-r0/temp/log.do_packagedata.4190947
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata) failed with exit code '1'

--===============7507117950955165525==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-1.22.3-1.22.4.patch"

From 031f241eaf67185be749d64bbc105a5f3019f9cb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 08:23:03 +0000
Subject: [PATCH] python3-numpy: upgrade 1.22.3 -> 1.22.4

---
 .../python/{python3-numpy_1.22.3.bb => python3-numpy_1.22.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.22.3.bb => python3-numpy_1.22.4.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.22.3.bb b/meta/recipes-devtools/python/python3-numpy_1.22.4.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_1.22.3.bb
rename to meta/recipes-devtools/python/python3-numpy_1.22.4.bb
index b5b1c4e714..7aa473a7e9 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.22.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.22.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "a906c0b4301a3d62ccf66d058fe779a65c1c34f6719ef2058f96e1856f48bca5"
+SRC_URI[sha256sum] = "b4308198d0e41efaa108e57d69973398439c7299a9d551680cdd603cf6d20709"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.31.1


--===============7507117950955165525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-numpy: PV changed from "1.22.3" to "1.22.4"
packages/core2-32-poky-linux/python3-numpy: PKGV changed from 1.22.3 [default] to 1.22.4 [default]
packages/core2-32-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v1.22.3/numpy-1.22.3.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest" to "https://github.com/numpy/numpy/releases/download/v1.22.4/numpy-1.22.4.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 30772680 to 30773484 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "1.22.3" to "1.22.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 1.22.3 [default] to 1.22.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "1.22.3" to "1.22.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 1.22.3 [default] to 1.22.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "1.22.3" to "1.22.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 1.22.3 [default] to 1.22.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "1.22.3" to "1.22.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 1.22.3 [default] to 1.22.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "1.22.3" to "1.22.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 1.22.3 [default] to 1.22.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 18538049 to 18539381 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PV changed from "1.22.3" to "1.22.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 1.22.3 [default] to 1.22.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 260590 to 260622 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "1.22.3" to "1.22.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 1.22.3 [default] to 1.22.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 33116355 to 33126764 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PV changed from "1.22.3" to "1.22.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGV changed from 1.22.3 [default] to 1.22.4 [default]
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.10/site-packages/numpy-1.22.3.dist-info moved to /usr/lib/python3.10/site-packages/numpy-1.22.4.dist-info

--===============7507117950955165525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1642 targets, 53 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-05b81cde1afea324ddb27011ebd0d4af24a37d59"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:05b81cde1afea324ddb27011ebd0d4af24a37d59"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 14 Local 2 Mirrors 0 Missed 12 Current 344 (14% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 873 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_fetch)
NOTE: Running task 902 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_fetch)
NOTE: Running task 1318 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_package_write_rpm)
NOTE: recipe python3-numpy-1.22.4-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Succeeded
NOTE: Running task 1319 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_unpack)
NOTE: Running task 1320 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_unpack)
NOTE: Running task 1321 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1322 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-1.22.4-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Succeeded
NOTE: Running task 1323 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_patch)
NOTE: recipe glibc-2.35-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_unpack: Succeeded
NOTE: Running task 1324 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_patch)
NOTE: recipe python3-numpy-1.22.4-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1325 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-numpy-1.22.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_patch: Succeeded
NOTE: Running task 1326 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1327 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_populate_lic)
NOTE: recipe python3-numpy-1.22.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_populate_lic: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1328 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure)
NOTE: recipe python3-numpy-1.22.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_populate_lic unihash changed to 81662c98b971798f28070d60a780fea929e6289294bd3ab6e0c3f790792ebc04
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1329 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_configure)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Succeeded
NOTE: Running task 1330 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.22.4-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_configure: Succeeded
NOTE: Running task 1331 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1332 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile)
NOTE: recipe python3-numpy-1.22.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1333 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_compile)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Succeeded
NOTE: Running task 1334 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1335 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Succeeded
NOTE: Running task 1336 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1337 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_package)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Succeeded
NOTE: Running task 1338 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Failed
NOTE: recipe glibc-2.35-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-1.22.4-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1338 tasks of which 1315 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-hypothesis/6.46.11-r0/temp/log.do_packagedata.2278
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata) failed with exit code '1'

--===============7507117950955165525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.10/site-packages/numpy-1.22.3.dist-info moved to /usr/lib/python3.10/site-packages/numpy-1.22.4.dist-info

--===============7507117950955165525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1642 targets, 70 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-05b81cde1afea324ddb27011ebd0d4af24a37d59"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:05b81cde1afea324ddb27011ebd0d4af24a37d59"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 14 Local 2 Mirrors 0 Missed 12 Current 344 (14% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 873 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_fetch)
NOTE: Running task 902 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_fetch)
NOTE: Running task 1317 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_package_write_rpm)
NOTE: recipe python3-numpy-1.22.4-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Succeeded
NOTE: Running task 1318 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_unpack)
NOTE: Running task 1319 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_unpack)
NOTE: Running task 1320 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1321 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-1.22.4-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.35-r0: task do_package_write_rpm: Started
NOTE: Running task 1323 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_patch)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_unpack: Succeeded
NOTE: Running task 1324 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_patch)
NOTE: recipe python3-numpy-1.22.4-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1325 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-numpy-1.22.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_patch: Succeeded
NOTE: Running task 1326 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1327 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_populate_lic)
NOTE: recipe python3-numpy-1.22.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_populate_lic: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1328 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure)
NOTE: recipe python3-numpy-1.22.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_populate_lic unihash changed to 81662c98b971798f28070d60a780fea929e6289294bd3ab6e0c3f790792ebc04
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1329 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_configure)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Succeeded
NOTE: Running task 1330 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.22.4-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_configure: Succeeded
NOTE: Running task 1331 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1332 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile)
NOTE: recipe python3-numpy-1.22.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.22.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Started
NOTE: Running task 1333 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.22.4.bb:do_compile)
NOTE: recipe python3-numpy-1.22.4-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Succeeded
NOTE: Running task 1334 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1335 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Succeeded
NOTE: Running task 1336 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1337 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_package)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Succeeded
NOTE: Running task 1338 of 1348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Failed
NOTE: recipe glibc-2.35-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-1.22.4-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1338 tasks of which 1315 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.47.2-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-hypothesis/6.46.11-r0/temp/log.do_packagedata.11642
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata) failed with exit code '1'

--===============7507117950955165525==--

