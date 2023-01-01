Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD6CFC54EBE
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:17 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.20182.1672605967480073083
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=U242GoMC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101856f15a801-e067a19d-0b11-4331-9da2-63c73bc584b8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605968;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gmYrgK/UjAT3MfgdlP54RmichiObJfB406phFfwB0As=;
	b=U242GoMC9d1vmMILwTBkEupq9tLKbKFj96qxWxG5XM4/Azw5tVOAXHXF/PDZO16H
	gn3DWy8C3MXxxXcqD9jYpvjPfS4QSguO6anxpevge/YUuUcU0KqJw1k5aZGlOwgHC+Y
	Witnj6onUF/2G3XR2mG0vNbngEsPFIyQ60cudvXc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605968;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gmYrgK/UjAT3MfgdlP54RmichiObJfB406phFfwB0As=;
	b=cKqb/nz+OhcfMs43V+Rbu4fS1gyL97dzd6TWrxtTtnnXrv4FPd5vIBEg7Epw0W/U
	CjFQGWB2WDa4JI8t5uRYRD0iJk0armfTSx0ily9AX9XuYVJPTswJkRL9HaQjg3kx7A/
	m2A6ikpM1aDA0Peo68MK03wbcs2S/NG77mkJfm5c=
Content-Type: multipart/mixed; boundary="===============7643378849982084547=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 230 SUCCEEDED
Message-ID: <010101856f15a801-e067a19d-0b11-4331-9da2-63c73bc584b8-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175306

--===============7643378849982084547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *230* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-224-230.patch
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
--===============7643378849982084547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.11/site-packages/diffoscope-224.dist-info -> /usr/lib/python3.11/site-packages/diffoscope-230.dist-info, added "/usr/lib/python3.11/site-packages/diffoscope/comparators/html.py /usr/lib/python3.11/site-packages/diffoscope/comparators/lzip.py /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/lzip.cpython-311.pyc /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/html.cpython-311.pyc"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-224.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-230.dist-info
  /usr/lib/python3.11/site-packages/diffoscope/comparators/html.py was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/lzip.py was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/html.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/lzip.cpython-311.pyc was added

--===============7643378849982084547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1690 targets, 64 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:b089f8b6fca0edbd46fce27fd83099fd4193af69"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 72 Local 16 Mirrors 0 Missed 56 Current 652 (22% match, 92% complete)
Removing 1 stale sstate objects for arch qemumips...done.
Removing 1 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 695 of 724 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 724 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 724 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1360 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 1410 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1435 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: Running task 1452 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_fetch)
NOTE: Running task 1466 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 1467 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 1469 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 1470 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_fetch)
NOTE: Running task 1471 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 1481 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: recipe file-5.43-r0: task do_packagedata_setscene: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe curl-7.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe diffoscope-230-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-230-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe vim-9.0.0947-r0: task do_fetch: Started
NOTE: Running task 1546 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: Running task 1547 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_unpack)
NOTE: Running task 1548 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.39-r0: task do_fetch: Started
NOTE: Running task 1549 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1550 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: recipe binutils-2.39-r0: task do_fetch: Succeeded
NOTE: Running task 1551 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 1552 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_unpack)
NOTE: recipe vim-9.0.0947-r0: task do_fetch: Succeeded
NOTE: Running task 1553 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe diffoscope-230-r0: task do_unpack: Started
NOTE: recipe file-5.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe curl-7.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1554 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 1555 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe binutils-2.39-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/curl/7.86.0-r0/temp/log.do_packagedata_setscene.2594967
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 721 of 724 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_package_setscene)
NOTE: recipe vim-9.0.0947-r0: task do_unpack: Started
NOTE: recipe diffoscope-230-r0: task do_unpack: Succeeded
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: Running task 1556 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: Running task 1557 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_patch)
NOTE: Running task 1558 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 1559 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 1560 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe diffoscope-230-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1561 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe diffoscope-230-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: Running task 1562 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_deploy_source_date_epoch)
NOTE: Running task 1563 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_populate_lic)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: Running task 1564 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-230-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-230-r0: task do_populate_lic: Started
NOTE: Running task 1565 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1566 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1567 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-230-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_populate_lic unihash changed to e50cb604709927a9403118178ec72ed87a1d302a02cd05df41df882867a3a93b
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-230-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-9.0.0947-r0: task do_unpack: Succeeded
NOTE: Running task 1568 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe vim-9.0.0947-r0: task do_patch: Started
NOTE: recipe curl-7.86.0-r0: task do_package_setscene: Started
NOTE: recipe vim-9.0.0947-r0: task do_patch: Succeeded
NOTE: Running task 1569 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.0947-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.0947-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.86.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 722 of 724 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.39-r0: task do_unpack: Succeeded
NOTE: Running task 1574 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_patch)
NOTE: recipe binutils-2.39-r0: task do_patch: Started
NOTE: recipe glibc-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2091 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_configure)
NOTE: Running task 2101 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_install)
NOTE: Running task 2164 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2168 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: Running task 2244 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_packagedata)
NOTE: Running task 2309 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2325 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2366 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe gnutls-3.7.8-r0: task do_configure: Started
NOTE: Running task 2370 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2371 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.6.2-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.86.0-r0: task do_packagedata: Started
NOTE: recipe diffoscope-230-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2409 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2410 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2411 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe curl-7.86.0-r0: task do_packagedata: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2412 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe binutils-2.39-r0: task do_patch: Succeeded
NOTE: Running task 2413 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_deploy_source_date_epoch)
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: Running task 2414 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2415 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-230-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2416 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_configure)
NOTE: Running task 2417 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: Running task 2418 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.2-r0: task do_install: Succeeded
NOTE: Running task 2419 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot)
NOTE: Running task 2420 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_package)
NOTE: recipe vim-9.0.0947-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-230-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-230-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2421 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_compile)
NOTE: Running task 2422 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2423 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe diffoscope-230-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vim-9.0.0947-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2424 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_configure)
NOTE: recipe vim-9.0.0947-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2425 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: Running task 2426 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2427 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe diffoscope-230-r0: task do_compile: Succeeded
NOTE: Running task 2428 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: Running task 2429 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe diffoscope-230-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2430 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2431 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: Running task 2432 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe diffoscope-230-r0: task do_install: Succeeded
NOTE: Running task 2433 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2434 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Running task 2435 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_package)
NOTE: Running task 2436 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-230-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe diffoscope-230-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Succeeded
NOTE: Running task 2437 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe diffoscope-230-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 2438 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2439 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 2440 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2441 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-230-r0: task do_package: Succeeded
NOTE: Running task 2442 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_packagedata)
NOTE: recipe diffoscope-230-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-230-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 2443 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: Running task 2444 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_install)
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Succeeded
NOTE: Running task 2445 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_package)
NOTE: Running task 2446 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vim-9.0.0947-r0: task do_configure: Succeeded
NOTE: Running task 2447 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_compile)
NOTE: recipe vim-9.0.0947-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Succeeded
NOTE: Running task 2448 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2449 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2450 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile)
NOTE: recipe lzo-2.10-r0: task do_compile: Started
NOTE: recipe lzo-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2451 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2452 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install)
NOTE: recipe lzo-2.10-r0: task do_install: Started
NOTE: recipe lzo-2.10-r0: task do_install: Succeeded
NOTE: Running task 2453 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2454 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package)
NOTE: Running task 2455 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot)
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_package: Started
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2456 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2457 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2458 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe lzo-2.10-r0: task do_package: Succeeded
NOTE: Running task 2459 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata)
NOTE: recipe lzo-2.10-r0: task do_packagedata: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.0947-r0: task do_compile: Succeeded
NOTE: Running task 2460 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_install)
NOTE: recipe vim-9.0.0947-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2461 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2462 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2463 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2464 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe vim-9.0.0947-r0: task do_install: Succeeded
NOTE: Running task 2465 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-9.0.0947-r0: task do_package: Started
NOTE: recipe vim-9.0.0947-r0: task do_package: Succeeded
NOTE: Running task 2466 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_packagedata)
NOTE: recipe vim-9.0.0947-r0: task do_packagedata: Started
NOTE: recipe vim-9.0.0947-r0: task do_packagedata: Succeeded
NOTE: Running task 2467 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package_write_rpm)
NOTE: recipe vim-9.0.0947-r0: task do_package_write_rpm: Started
NOTE: recipe vim-9.0.0947-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_configure: Succeeded
NOTE: Running task 2468 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_compile)
NOTE: recipe gnutls-3.7.8-r0: task do_compile: Started
NOTE: recipe gnutls-3.7.8-r0: task do_compile: Succeeded
NOTE: Running task 2469 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_install)
NOTE: recipe gnutls-3.7.8-r0: task do_install: Started
NOTE: recipe gnutls-3.7.8-r0: task do_install: Succeeded
NOTE: Running task 2470 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_populate_sysroot)
NOTE: Running task 2471 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_package)
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.7.8-r0: task do_package: Started
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2472 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2473 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.8-r0: task do_package: Succeeded
NOTE: Running task 2474 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_packagedata)
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Succeeded
NOTE: Running task 2475 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Succeeded
NOTE: Running task 2476 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Succeeded
NOTE: Running task 2477 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot)
NOTE: Running task 2478 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2479 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2480 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure)
NOTE: recipe elfutils-0.188-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Succeeded
NOTE: Running task 2481 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_configure: Succeeded
NOTE: Running task 2482 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2483 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile)
NOTE: recipe elfutils-0.188-r0: task do_compile: Started
NOTE: recipe elfutils-0.188-r0: task do_compile: Succeeded
NOTE: Running task 2484 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2485 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install)
NOTE: recipe elfutils-0.188-r0: task do_install: Started
NOTE: recipe elfutils-0.188-r0: task do_install: Succeeded
NOTE: Running task 2486 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2487 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_package)
NOTE: Running task 2488 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_populate_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_package: Started
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2489 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2490 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2491 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_configure)
NOTE: recipe binutils-2.39-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2492 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Started
NOTE: recipe binutils-2.39-r0: task do_configure: Succeeded
NOTE: Running task 2493 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_compile)
NOTE: recipe binutils-2.39-r0: task do_compile: Started
NOTE: recipe elfutils-0.188-r0: task do_package: Succeeded
NOTE: Running task 2494 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_packagedata)
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 2495 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_compile)
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 2496 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_install)
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Succeeded
NOTE: Running task 2497 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package)
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Succeeded
NOTE: Running task 2498 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2499 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.18.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.39-r0: task do_compile: Succeeded
NOTE: Running task 2500 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_install)
NOTE: recipe binutils-2.39-r0: task do_install: Started
NOTE: recipe binutils-2.39-r0: task do_install: Succeeded
NOTE: Running task 2501 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_package)
NOTE: recipe binutils-2.39-r0: task do_package: Started
NOTE: recipe binutils-2.39-r0: task do_package: Succeeded
NOTE: Running task 2502 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_packagedata)
NOTE: recipe binutils-2.39-r0: task do_packagedata: Started
NOTE: recipe binutils-2.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2503 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_package_write_rpm)
NOTE: Running task 2504 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_package_write_rpm)
NOTE: Running task 2505 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_package_qa)
NOTE: recipe binutils-2.39-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-230-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-230-r0: task do_package_qa: Started
NOTE: recipe diffoscope-230-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-230-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.39-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2506 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_build)
NOTE: Tasks Summary: Attempted 2506 tasks of which 2363 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-src went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dbg went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package libcurl went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-ptest went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-staticdev went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dev went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-doc went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-locale went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7643378849982084547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1691 targets, 48 skipped, 0 masked, 0 errors.
Removing 113 recipes from the core2-32 sysroot...done.
Removing 121 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============7643378849982084547==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-224-230.patch"

RnJvbSAwOTUxOTU5ZDQ0M2EwMmUyYmEzZWNmZjkyNjBjMTRiOTdhNDAwZDU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAxOTo1MTo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMjI0IC0+IDIzMAoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8yMjQuYmIgPT4gZGlmZm9zY29wZV8yMzAuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzIyNC5iYiA9PiBkaWZmb3Njb3BlXzIz
MC5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMjI0LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzIzMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjI0LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjMwLmJiCmluZGV4IDVkNjM0Yjgw
NzMuLjQ5NmVkOWU2MDIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yMjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzIzMC5iYgpAQCAtMTIsNyArMTIsNyBAQCBQWVBJX1BBQ0tBR0UgPSAiZGlm
Zm9zY29wZSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICIxOTIwZWJkY2E0MGU4NWYwMTlhODRlMDIyMGU0YTc5ZjAwZmZkYWZjMGY3OGUxZjFlMjIx
OTEyM2Q1YzA4ZGZiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImEzNTkwOGMxNWJiMDA2MDU4Zjc0
YzJkNGYyYmUzYjFhYzdjZjYyYzg3MmNmYmQyOTUwMTE0YThhNzA1ZDgxMDgiCiAKIFJERVBFTkRT
OiR7UE59ICs9ICJiaW51dGlscyB2aW0gc3F1YXNoZnMtdG9vbHMgcHl0aG9uMy1saWJhcmNoaXZl
LWMgcHl0aG9uMy1tYWdpYyBweXRob24zLXJwbSIKIAotLSAKMi4zNy4zCgo=

--===============7643378849982084547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "224" to "230"
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 224 [default] to 230 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "224" to "230"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 224 [default] to 230 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "224" to "230"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 224 [default] to 230 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "224" to "230"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 224 [default] to 230 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "224" to "230"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 224 [default] to 230 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "224" to "230"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 224 [default] to 230 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "224" to "230"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 224 [default] to 230 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1372712 to 1388149 (+1%)
packages/core2-32-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.11/site-packages/diffoscope-224.dist-info -> /usr/lib/python3.11/site-packages/diffoscope-230.dist-info, added "/usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/lzip.cpython-311.pyc /usr/lib/python3.11/site-packages/diffoscope/comparators/lzip.py /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/html.cpython-311.pyc /usr/lib/python3.11/site-packages/diffoscope/comparators/html.py"
packages/core2-32-poky-linux/diffoscope: PV changed from "224" to "230"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 224 [default] to 230 [default]
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-224.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-230.tar.gz"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-224.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-230.dist-info
  /usr/lib/python3.11/site-packages/diffoscope/comparators/html.py was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/lzip.py was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/html.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/lzip.cpython-311.pyc was added

--===============7643378849982084547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1690 targets, 54 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:b089f8b6fca0edbd46fce27fd83099fd4193af69"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 72 Local 16 Mirrors 0 Missed 56 Current 652 (22% match, 92% complete)
Removing 1 stale sstate objects for arch qemuarm...done.
Removing 1 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 695 of 724 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 724 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 724 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1360 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 1409 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1435 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: Running task 1452 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_fetch)
NOTE: Running task 1466 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 1468 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 1469 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 1470 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 1471 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_fetch)
NOTE: Running task 1481 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: recipe file-5.43-r0: task do_packagedata_setscene: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe curl-7.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe diffoscope-230-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-230-r0: task do_fetch: Succeeded
NOTE: recipe vim-9.0.0947-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.39-r0: task do_fetch: Started
NOTE: Running task 1546 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: Running task 1547 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_unpack)
NOTE: Running task 1548 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 1549 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.39-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1550 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: Running task 1551 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 1552 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_unpack)
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe diffoscope-230-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe file-5.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vim-9.0.0947-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1553 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: Running task 1554 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: Running task 1555 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe binutils-2.39-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/curl/7.86.0-r0/temp/log.do_packagedata_setscene.2466344
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 721 of 724 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_package_setscene)
NOTE: recipe curl-7.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe diffoscope-230-r0: task do_unpack: Succeeded
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe vim-9.0.0947-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: Running task 1556 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: Running task 1557 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_patch)
NOTE: Running task 1558 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 1559 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 1560 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: recipe diffoscope-230-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1561 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: recipe diffoscope-230-r0: task do_patch: Succeeded
NOTE: Running task 1562 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_deploy_source_date_epoch)
NOTE: Running task 1563 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_populate_lic)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: Running task 1564 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-230-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-230-r0: task do_populate_lic: Started
NOTE: Running task 1565 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1566 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1567 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-230-r0: task do_populate_lic: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-230-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_populate_lic unihash changed to e50cb604709927a9403118178ec72ed87a1d302a02cd05df41df882867a3a93b
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-9.0.0947-r0: task do_unpack: Succeeded
NOTE: Running task 1568 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe vim-9.0.0947-r0: task do_patch: Started
NOTE: recipe curl-7.86.0-r0: task do_package_setscene: Started
NOTE: recipe vim-9.0.0947-r0: task do_patch: Succeeded
NOTE: Running task 1569 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.0947-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.0947-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.86.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 722 of 724 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.39-r0: task do_unpack: Succeeded
NOTE: Running task 1574 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_patch)
NOTE: recipe binutils-2.39-r0: task do_patch: Started
NOTE: recipe glibc-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2095 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_install)
NOTE: Running task 2103 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_install)
NOTE: Running task 2166 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2169 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: Running task 2248 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_packagedata)
NOTE: Running task 2311 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2327 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2367 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: Running task 2372 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2373 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.6.2-r0: task do_install: Started
NOTE: recipe gnutls-3.7.8-r0: task do_install: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.86.0-r0: task do_packagedata: Started
NOTE: recipe diffoscope-230-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2411 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2412 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: Running task 2413 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-7.86.0-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2414 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe binutils-2.39-r0: task do_patch: Succeeded
NOTE: Running task 2415 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: Running task 2416 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2417 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe diffoscope-230-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2418 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_configure)
NOTE: recipe libarchive-3.6.2-r0: task do_install: Succeeded
NOTE: Running task 2419 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: Running task 2420 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe binutils-2.39-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2421 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot)
NOTE: Running task 2422 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_package)
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: recipe diffoscope-230-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe vim-9.0.0947-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe binutils-2.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-230-r0: task do_configure: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2423 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_compile)
NOTE: Running task 2424 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2425 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe diffoscope-230-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vim-9.0.0947-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2426 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_configure)
NOTE: recipe vim-9.0.0947-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2427 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2428 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe diffoscope-230-r0: task do_compile: Succeeded
NOTE: Running task 2429 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2430 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe diffoscope-230-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2431 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: Running task 2432 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2433 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2434 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe diffoscope-230-r0: task do_install: Succeeded
NOTE: Running task 2435 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_package)
NOTE: Running task 2436 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_populate_sysroot)
NOTE: recipe diffoscope-230-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe diffoscope-230-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2437 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2438 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe libarchive-3.6.2-r0: task do_package: Succeeded
NOTE: Running task 2439 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Started
NOTE: recipe diffoscope-230-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 2440 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: Running task 2441 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 2442 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2443 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe gnutls-3.7.8-r0: task do_install: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: Running task 2444 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_populate_sysroot)
NOTE: Running task 2445 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.7.8-r0: task do_package: Started
NOTE: recipe diffoscope-230-r0: task do_package: Succeeded
NOTE: Running task 2446 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_packagedata)
NOTE: recipe diffoscope-230-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2447 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-230-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2448 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 2449 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_package: Succeeded
NOTE: Running task 2450 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_packagedata)
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.0947-r0: task do_configure: Succeeded
NOTE: Running task 2451 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_compile)
NOTE: recipe vim-9.0.0947-r0: task do_compile: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2452 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure_ptest_base)
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: Running task 2453 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_install)
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Started
NOTE: Running task 2454 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile)
NOTE: recipe lzo-2.10-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Succeeded
NOTE: Running task 2455 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_package)
NOTE: Running task 2456 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2457 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2458 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install)
NOTE: recipe lzo-2.10-r0: task do_install: Started
NOTE: recipe lzo-2.10-r0: task do_install: Succeeded
NOTE: Running task 2459 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2460 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package)
NOTE: Running task 2461 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Succeeded
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_package: Started
NOTE: Running task 2462 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2463 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2464 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2465 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe lzo-2.10-r0: task do_package: Succeeded
NOTE: Running task 2466 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata)
NOTE: recipe lzo-2.10-r0: task do_packagedata: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2467 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2468 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe vim-9.0.0947-r0: task do_compile: Succeeded
NOTE: Running task 2469 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_install)
NOTE: recipe vim-9.0.0947-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2470 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2471 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Succeeded
NOTE: Running task 2472 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-9.0.0947-r0: task do_install: Succeeded
NOTE: Running task 2473 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package)
NOTE: recipe vim-9.0.0947-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Succeeded
NOTE: Running task 2474 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Succeeded
NOTE: Running task 2475 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot)
NOTE: Running task 2476 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2477 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2478 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure)
NOTE: recipe elfutils-0.188-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Succeeded
NOTE: Running task 2479 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.0947-r0: task do_package: Succeeded
NOTE: Running task 2480 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_packagedata)
NOTE: recipe vim-9.0.0947-r0: task do_packagedata: Started
NOTE: recipe vim-9.0.0947-r0: task do_packagedata: Succeeded
NOTE: Running task 2481 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package_write_rpm)
NOTE: recipe vim-9.0.0947-r0: task do_package_write_rpm: Started
NOTE: recipe elfutils-0.188-r0: task do_configure: Succeeded
NOTE: Running task 2482 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2483 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile)
NOTE: recipe elfutils-0.188-r0: task do_compile: Started
NOTE: recipe vim-9.0.0947-r0: task do_package_write_rpm: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_compile: Succeeded
NOTE: Running task 2484 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2485 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install)
NOTE: recipe elfutils-0.188-r0: task do_install: Started
NOTE: recipe elfutils-0.188-r0: task do_install: Succeeded
NOTE: Running task 2486 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2487 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_package)
NOTE: Running task 2488 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_populate_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_package: Started
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2489 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2490 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2491 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_configure)
NOTE: recipe binutils-2.39-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2492 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Started
NOTE: recipe binutils-2.39-r0: task do_configure: Succeeded
NOTE: Running task 2493 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_compile)
NOTE: recipe binutils-2.39-r0: task do_compile: Started
NOTE: recipe elfutils-0.188-r0: task do_package: Succeeded
NOTE: Running task 2494 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_packagedata)
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 2495 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_compile)
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 2496 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_install)
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Succeeded
NOTE: Running task 2497 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package)
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Succeeded
NOTE: Running task 2498 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2499 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.18.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.39-r0: task do_compile: Succeeded
NOTE: Running task 2500 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_install)
NOTE: recipe binutils-2.39-r0: task do_install: Started
NOTE: recipe binutils-2.39-r0: task do_install: Succeeded
NOTE: Running task 2501 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_package)
NOTE: recipe binutils-2.39-r0: task do_package: Started
NOTE: recipe binutils-2.39-r0: task do_package: Succeeded
NOTE: Running task 2502 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_packagedata)
NOTE: recipe binutils-2.39-r0: task do_packagedata: Started
NOTE: recipe binutils-2.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2503 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_package_write_rpm)
NOTE: Running task 2504 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_package_write_rpm)
NOTE: Running task 2505 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_package_qa)
NOTE: recipe binutils-2.39-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-230-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-230-r0: task do_package_qa: Started
NOTE: recipe diffoscope-230-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-230-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.39-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2506 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_build)
NOTE: Tasks Summary: Attempted 2506 tasks of which 2365 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-src went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dbg went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package libcurl went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-ptest went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-staticdev went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dev went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-doc went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-locale went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7643378849982084547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1691 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (892 cached, 1 parsed). 1690 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:b089f8b6fca0edbd46fce27fd83099fd4193af69"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 70 Local 14 Mirrors 0 Missed 56 Current 658 (20% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 701 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_packagedata_setscene)
NOTE: Running setscene task 702 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1858 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 1880 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_configure)
NOTE: Running task 1891 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_install)
NOTE: recipe file-5.43-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.8-r0: task do_configure: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe file-5.43-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/curl/7.86.0-r0/temp/log.do_packagedata_setscene.2294958
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe curl-7.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_package_setscene)
NOTE: Running task 1897 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 2009 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2010 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2086 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: Running task 2132 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_fetch)
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_install: Started
NOTE: Running task 2186 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2187 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_fetch)
NOTE: Running task 2188 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2189 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2190 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: recipe curl-7.86.0-r0: task do_package_setscene: Started
NOTE: Running task 2236 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2285 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe diffoscope-230-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: Running task 2384 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: recipe diffoscope-230-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe vim-9.0.0947-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: Running task 2385 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_unpack)
NOTE: Running task 2386 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.39-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: Running task 2387 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: Running task 2388 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2389 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: Running task 2390 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2391 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2392 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.39-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: Running task 2393 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_unpack)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe vim-9.0.0947-r0: task do_fetch: Succeeded
NOTE: Running task 2394 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: Running task 2395 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-230-r0: task do_unpack: Started
NOTE: recipe diffoscope-230-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2396 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2397 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe binutils-2.39-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-230-r0: task do_unpack: Succeeded
NOTE: Running task 2398 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe vim-9.0.0947-r0: task do_unpack: Started
NOTE: Running task 2399 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: Running task 2400 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-230-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2401 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_install: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2402 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot)
NOTE: Running task 2403 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_package)
NOTE: Running task 2404 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2405 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 2406 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-230-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Started
NOTE: Running task 2407 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_deploy_source_date_epoch)
NOTE: Running task 2408 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_populate_lic)
NOTE: Running task 2409 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.2-r0: task do_package: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2410 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2411 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe diffoscope-230-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: Running task 2412 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-230-r0: task do_populate_lic: Started
NOTE: recipe diffoscope-230-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe vim-9.0.0947-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: Running task 2413 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 2414 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-230-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_populate_lic unihash changed to e50cb604709927a9403118178ec72ed87a1d302a02cd05df41df882867a3a93b
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2415 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-230-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2416 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: Running task 2417 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2418 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe diffoscope-230-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2419 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2420 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe diffoscope-230-r0: task do_configure: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.86.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 2421 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_compile)
NOTE: Setscene tasks completed
NOTE: Running task 2435 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: Running task 2436 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: Running task 2437 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe diffoscope-230-r0: task do_compile: Started
NOTE: recipe curl-7.86.0-r0: task do_packagedata: Started
NOTE: recipe vim-9.0.0947-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: Running task 2438 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: recipe vim-9.0.0947-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-7.86.0-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.0947-r0: task do_patch: Succeeded
NOTE: recipe vim-9.0.0947-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2439 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.0947-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: recipe vim-9.0.0947-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2440 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: Running task 2441 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe vim-9.0.0947-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2442 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: Running task 2443 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: Running task 2444 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe diffoscope-230-r0: task do_compile: Succeeded
NOTE: Running task 2445 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe diffoscope-230-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2446 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2447 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2448 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: Running task 2449 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2450 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: Running task 2451 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe binutils-2.39-r0: task do_unpack: Succeeded
NOTE: Running task 2452 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Started
NOTE: recipe diffoscope-230-r0: task do_install: Succeeded
NOTE: Running task 2453 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_package)
NOTE: Running task 2454 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_populate_sysroot)
NOTE: recipe binutils-2.39-r0: task do_patch: Started
NOTE: recipe diffoscope-230-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-230-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe diffoscope-230-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 2455 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe binutils-2.39-r0: task do_patch: Succeeded
NOTE: Running task 2456 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe binutils-2.39-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2457 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe binutils-2.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 2458 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2459 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-230-r0: task do_package: Succeeded
NOTE: Running task 2460 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-230-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 2461 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe diffoscope-230-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: Running task 2462 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_install)
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Succeeded
NOTE: Running task 2463 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_package)
NOTE: Running task 2464 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vim-9.0.0947-r0: task do_configure: Succeeded
NOTE: Running task 2465 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_compile)
NOTE: recipe vim-9.0.0947-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Succeeded
NOTE: Running task 2466 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2467 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2468 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile)
NOTE: recipe lzo-2.10-r0: task do_compile: Started
NOTE: recipe lzo-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2469 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2470 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install)
NOTE: recipe lzo-2.10-r0: task do_install: Started
NOTE: recipe lzo-2.10-r0: task do_install: Succeeded
NOTE: Running task 2471 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2472 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package)
NOTE: Running task 2473 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot)
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_package: Started
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2474 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2475 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2476 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe vim-9.0.0947-r0: task do_compile: Succeeded
NOTE: Running task 2477 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_install)
NOTE: recipe vim-9.0.0947-r0: task do_install: Started
NOTE: recipe lzo-2.10-r0: task do_package: Succeeded
NOTE: Running task 2478 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata)
NOTE: recipe lzo-2.10-r0: task do_packagedata: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2479 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2480 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2481 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2482 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe vim-9.0.0947-r0: task do_install: Succeeded
NOTE: Running task 2483 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe vim-9.0.0947-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-9.0.0947-r0: task do_package: Succeeded
NOTE: Running task 2484 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_packagedata)
NOTE: recipe vim-9.0.0947-r0: task do_packagedata: Started
NOTE: recipe vim-9.0.0947-r0: task do_packagedata: Succeeded
NOTE: Running task 2485 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package_write_rpm)
NOTE: recipe vim-9.0.0947-r0: task do_package_write_rpm: Started
NOTE: recipe vim-9.0.0947-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_configure: Succeeded
NOTE: Running task 2486 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_compile)
NOTE: recipe gnutls-3.7.8-r0: task do_compile: Started
NOTE: recipe gnutls-3.7.8-r0: task do_compile: Succeeded
NOTE: Running task 2487 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_install)
NOTE: recipe gnutls-3.7.8-r0: task do_install: Started
NOTE: recipe gnutls-3.7.8-r0: task do_install: Succeeded
NOTE: Running task 2488 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_populate_sysroot)
NOTE: Running task 2489 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_package)
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.7.8-r0: task do_package: Started
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2490 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2491 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.8-r0: task do_package: Succeeded
NOTE: Running task 2492 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_packagedata)
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Succeeded
NOTE: Running task 2493 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Succeeded
NOTE: Running task 2494 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Succeeded
NOTE: Running task 2495 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot)
NOTE: Running task 2496 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2497 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2498 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure)
NOTE: recipe elfutils-0.188-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Succeeded
NOTE: Running task 2499 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_configure: Succeeded
NOTE: Running task 2500 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2501 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile)
NOTE: recipe elfutils-0.188-r0: task do_compile: Started
NOTE: recipe elfutils-0.188-r0: task do_compile: Succeeded
NOTE: Running task 2502 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2503 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install)
NOTE: recipe elfutils-0.188-r0: task do_install: Started
NOTE: recipe elfutils-0.188-r0: task do_install: Succeeded
NOTE: Running task 2504 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2505 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_package)
NOTE: Running task 2506 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_populate_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_package: Started
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2507 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2508 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2509 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_configure)
NOTE: recipe binutils-2.39-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2510 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Started
NOTE: recipe binutils-2.39-r0: task do_configure: Succeeded
NOTE: Running task 2511 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_compile)
NOTE: recipe binutils-2.39-r0: task do_compile: Started
NOTE: recipe elfutils-0.188-r0: task do_package: Succeeded
NOTE: Running task 2512 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_packagedata)
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 2513 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_compile)
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 2514 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_install)
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Succeeded
NOTE: Running task 2515 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package)
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Succeeded
NOTE: Running task 2516 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2517 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.18.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.39-r0: task do_compile: Succeeded
NOTE: Running task 2518 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_install)
NOTE: recipe binutils-2.39-r0: task do_install: Started
NOTE: recipe binutils-2.39-r0: task do_install: Succeeded
NOTE: Running task 2519 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_package)
NOTE: recipe binutils-2.39-r0: task do_package: Started
NOTE: recipe binutils-2.39-r0: task do_package: Succeeded
NOTE: Running task 2520 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_packagedata)
NOTE: recipe binutils-2.39-r0: task do_packagedata: Started
NOTE: recipe binutils-2.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2521 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_package_write_rpm)
NOTE: Running task 2522 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_package_write_rpm)
NOTE: Running task 2523 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_package_qa)
NOTE: recipe binutils-2.39-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-230-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-230-r0: task do_package_qa: Started
NOTE: recipe diffoscope-230-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-230-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.39-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2524 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_build)
NOTE: Tasks Summary: Attempted 2524 tasks of which 2381 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-src went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dbg went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package libcurl went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-ptest went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-staticdev went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dev went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-doc went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-locale went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7643378849982084547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1690 targets, 71 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:b089f8b6fca0edbd46fce27fd83099fd4193af69"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 72 Local 16 Mirrors 0 Missed 56 Current 652 (22% match, 92% complete)
Removing 1 stale sstate objects for arch qemuppc...done.
Removing 1 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 695 of 724 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 724 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 724 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1360 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 1370 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 1434 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: Running task 1451 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_fetch)
NOTE: Running task 1465 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 1466 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_fetch)
NOTE: Running task 1467 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 1468 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 1470 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 1479 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: recipe file-5.43-r0: task do_packagedata_setscene: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe curl-7.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe curl-7.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe diffoscope-230-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-230-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: Running task 1544 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 1545 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_unpack)
NOTE: recipe binutils-2.39-r0: task do_fetch: Started
NOTE: recipe vim-9.0.0947-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: Running task 1546 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 1547 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: recipe binutils-2.39-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 1548 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_unpack)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1549 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: Running task 1550 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe vim-9.0.0947-r0: task do_fetch: Succeeded
NOTE: Running task 1551 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe diffoscope-230-r0: task do_unpack: Started
NOTE: recipe file-5.43-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/curl/7.86.0-r0/temp/log.do_packagedata_setscene.2755463
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 721 of 724 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_package_setscene)
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe curl-7.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe binutils-2.39-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1552 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.0947-r0: task do_unpack: Started
NOTE: recipe diffoscope-230-r0: task do_unpack: Succeeded
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: Running task 1553 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: Running task 1554 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_patch)
NOTE: Running task 1555 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 1556 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-230-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-230-r0: task do_patch: Succeeded
NOTE: Running task 1557 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: Running task 1558 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: Running task 1559 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_populate_lic)
NOTE: Running task 1560 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: Running task 1561 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 1562 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: recipe diffoscope-230-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-230-r0: task do_populate_lic: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: Running task 1563 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: Running task 1564 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: Running task 1565 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-230-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_populate_lic unihash changed to e50cb604709927a9403118178ec72ed87a1d302a02cd05df41df882867a3a93b
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: recipe diffoscope-230-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1566 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.0947-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1567 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: Running task 1568 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.0947-r0: task do_patch: Started
NOTE: recipe curl-7.86.0-r0: task do_package_setscene: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-9.0.0947-r0: task do_patch: Succeeded
NOTE: Running task 1569 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.0947-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.0947-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.86.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 722 of 724 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.39-r0: task do_unpack: Succeeded
NOTE: Running task 1574 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_patch)
NOTE: recipe binutils-2.39-r0: task do_patch: Started
NOTE: recipe glibc-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2095 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_install)
NOTE: Running task 2103 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_install)
NOTE: Running task 2166 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2169 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: Running task 2248 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_packagedata)
NOTE: Running task 2311 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2327 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2366 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.8-r0: task do_install: Started
NOTE: Running task 2372 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2373 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.6.2-r0: task do_install: Started
NOTE: recipe curl-7.86.0-r0: task do_packagedata: Started
NOTE: recipe diffoscope-230-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2411 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2412 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2413 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2414 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe curl-7.86.0-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: recipe binutils-2.39-r0: task do_patch: Succeeded
NOTE: Running task 2415 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2416 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: Running task 2417 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-230-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2418 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: Running task 2419 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe binutils-2.39-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2420 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe libarchive-3.6.2-r0: task do_install: Succeeded
NOTE: Running task 2421 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot)
NOTE: Running task 2422 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_package)
NOTE: recipe vim-9.0.0947-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe diffoscope-230-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe binutils-2.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe diffoscope-230-r0: task do_configure: Succeeded
NOTE: Running task 2423 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: Running task 2424 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2425 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe diffoscope-230-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vim-9.0.0947-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2426 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_configure)
NOTE: recipe vim-9.0.0947-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2427 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2428 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2429 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe diffoscope-230-r0: task do_compile: Succeeded
NOTE: Running task 2430 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: Running task 2431 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe diffoscope-230-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2432 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2433 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: Running task 2434 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2435 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2436 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe diffoscope-230-r0: task do_install: Succeeded
NOTE: Running task 2437 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_package)
NOTE: Running task 2438 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe diffoscope-230-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-230-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe diffoscope-230-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_package: Succeeded
NOTE: Running task 2439 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata)
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2440 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: Running task 2441 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2442 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: Running task 2443 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe gnutls-3.7.8-r0: task do_install: Succeeded
NOTE: Running task 2444 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_populate_sysroot)
NOTE: Running task 2445 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.7.8-r0: task do_package: Started
NOTE: recipe diffoscope-230-r0: task do_package: Succeeded
NOTE: Running task 2446 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_packagedata)
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe diffoscope-230-r0: task do_packagedata: Started
NOTE: Running task 2447 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-230-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2448 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Started
NOTE: Running task 2449 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_package: Succeeded
NOTE: Running task 2450 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_packagedata)
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.0947-r0: task do_configure: Succeeded
NOTE: Running task 2451 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_compile)
NOTE: recipe vim-9.0.0947-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: Running task 2452 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_install)
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2453 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2454 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Succeeded
NOTE: Running task 2455 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_package)
NOTE: recipe lzo-2.10-r0: task do_compile: Started
NOTE: Running task 2456 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2457 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2458 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install)
NOTE: recipe lzo-2.10-r0: task do_install: Started
NOTE: recipe lzo-2.10-r0: task do_install: Succeeded
NOTE: Running task 2459 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Succeeded
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2460 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package)
NOTE: Running task 2461 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_packagedata)
NOTE: Running task 2462 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Started
NOTE: recipe lzo-2.10-r0: task do_package: Started
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2463 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2464 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2465 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe lzo-2.10-r0: task do_package: Succeeded
NOTE: Running task 2466 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata)
NOTE: recipe lzo-2.10-r0: task do_packagedata: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2467 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2468 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe vim-9.0.0947-r0: task do_compile: Succeeded
NOTE: Running task 2469 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_install)
NOTE: recipe vim-9.0.0947-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2470 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2471 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Succeeded
NOTE: Running task 2472 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Started
NOTE: recipe vim-9.0.0947-r0: task do_install: Succeeded
NOTE: Running task 2473 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Succeeded
NOTE: Running task 2474 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_install)
NOTE: recipe vim-9.0.0947-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Succeeded
NOTE: Running task 2475 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot)
NOTE: Running task 2476 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2477 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2478 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure)
NOTE: recipe elfutils-0.188-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Succeeded
NOTE: Running task 2479 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_configure: Succeeded
NOTE: Running task 2480 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure_ptest_base)
NOTE: recipe vim-9.0.0947-r0: task do_package: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Started
NOTE: Running task 2481 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_packagedata)
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2482 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile)
NOTE: recipe vim-9.0.0947-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.188-r0: task do_compile: Started
NOTE: recipe vim-9.0.0947-r0: task do_packagedata: Succeeded
NOTE: Running task 2483 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package_write_rpm)
NOTE: recipe vim-9.0.0947-r0: task do_package_write_rpm: Started
NOTE: recipe vim-9.0.0947-r0: task do_package_write_rpm: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_compile: Succeeded
NOTE: Running task 2484 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2485 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install)
NOTE: recipe elfutils-0.188-r0: task do_install: Started
NOTE: recipe elfutils-0.188-r0: task do_install: Succeeded
NOTE: Running task 2486 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2487 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_package)
NOTE: Running task 2488 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_populate_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_package: Started
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2489 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2490 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2491 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_configure)
NOTE: recipe binutils-2.39-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2492 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Started
NOTE: recipe binutils-2.39-r0: task do_configure: Succeeded
NOTE: Running task 2493 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_compile)
NOTE: recipe binutils-2.39-r0: task do_compile: Started
NOTE: recipe elfutils-0.188-r0: task do_package: Succeeded
NOTE: Running task 2494 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_packagedata)
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 2495 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_compile)
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 2496 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_install)
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Succeeded
NOTE: Running task 2497 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package)
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Succeeded
NOTE: Running task 2498 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2499 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.18.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.39-r0: task do_compile: Succeeded
NOTE: Running task 2500 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_install)
NOTE: recipe binutils-2.39-r0: task do_install: Started
NOTE: recipe binutils-2.39-r0: task do_install: Succeeded
NOTE: Running task 2501 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_package)
NOTE: recipe binutils-2.39-r0: task do_package: Started
NOTE: recipe binutils-2.39-r0: task do_package: Succeeded
NOTE: Running task 2502 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_packagedata)
NOTE: recipe binutils-2.39-r0: task do_packagedata: Started
NOTE: recipe binutils-2.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2503 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_package_write_rpm)
NOTE: Running task 2504 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_package_write_rpm)
NOTE: Running task 2505 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_package_qa)
NOTE: recipe binutils-2.39-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-230-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-230-r0: task do_package_qa: Started
NOTE: recipe diffoscope-230-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-230-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.39-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2506 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_230.bb:do_build)
NOTE: Tasks Summary: Attempted 2506 tasks of which 2363 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-src went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dbg went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package libcurl went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-ptest went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-staticdev went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dev went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-doc went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-locale went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl went backwards which would break package feeds (from 0:7.87.0-r0 to 0:7.86.0-r0) [version-going-backwards]
ERROR: curl-7.86.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7643378849982084547==--

