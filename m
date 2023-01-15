Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADAFBC71143
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:31 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.145832.1673805744218915711
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=T/0rpqEV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010185b698c0c9-60fcb390-1155-4b31-a8a6-d39cb61ec370-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Exz2rQq8u7nDZDXhl2uqTOOTViDwsO2PIMqlW/NmEjA=;
	b=T/0rpqEVZnPps1It2H3OTFfydH9BeT0kZZIU5+2HXW4zfnRsdqXP9kxeXyobM9FO
	FvAt0DknmLH4bGOKrNtDvmSlaGNRzbHelKKvkod9KAYXSrlxfj5G75GJ2qPw2tXvWgi
	ZTtZ7HgOinVEpDOCe0FFkeZMO4aCs0phaAx4jmnQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Exz2rQq8u7nDZDXhl2uqTOOTViDwsO2PIMqlW/NmEjA=;
	b=eXAZhC75SriMYe2AGxZwPIVdqv0fg5vogVsGF6FGJXZzJISRxpi6kLTytGgeyGvy
	tmU80R9DOkKVSyGfnfoY0cbd69XgwAfBd+210EcDzVyEzmXsP3cVt6CWSzvYiqCKqKE
	HAOZa4JBGD9O0AcnQ9YRJw41Q9Myu59EqnC3Q860=
Content-Type: multipart/mixed; boundary="===============2151667424965138920=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.1.2 SUCCEEDED
Message-ID: <01010185b698c0c9-60fcb390-1155-4b31-a8a6-d39cb61ec370-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175921

--===============2151667424965138920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *6.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.1-6.1.2.patch
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
--===============2151667424965138920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 17378392 to 17376316 (-0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.1 [default] to 6.1.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.1" to "6.1.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 207638 to 208613 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.1 [default] to 6.1.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.1" to "6.1.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.1 [default] to 6.1.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.1" to "6.1.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.1 [default] to 6.1.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.1" to "6.1.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 3735611 to 3738312 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.1 [default] to 6.1.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.1" to "6.1.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.1 [default] to 6.1.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.1" to "6.1.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 6152272 to 6148178 (-0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.1 [default] to 6.1.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.1" to "6.1.2"
packages/core2-32-poky-linux/btrfs-tools: PKGV changed from 6.1 [default] to 6.1.2 [default]
packages/core2-32-poky-linux/btrfs-tools: PV changed from "6.1" to "6.1.2"
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.1.2-py3.11.egg-info was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.1.2-py3.11.egg-info/dependency_links.txt was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.1.2-py3.11.egg-info/PKG-INFO was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.1.2-py3.11.egg-info/SOURCES.txt was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.1.2-py3.11.egg-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.1-py3.11.egg-info was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.1-py3.11.egg-info/dependency_links.txt was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.1-py3.11.egg-info/PKG-INFO was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.1-py3.11.egg-info/SOURCES.txt was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.1-py3.11.egg-info/top_level.txt was removed

--===============2151667424965138920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.1.2-py3.11.egg-info was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.1.2-py3.11.egg-info/dependency_links.txt was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.1.2-py3.11.egg-info/PKG-INFO was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.1.2-py3.11.egg-info/SOURCES.txt was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.1.2-py3.11.egg-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.1-py3.11.egg-info was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.1-py3.11.egg-info/dependency_links.txt was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.1-py3.11.egg-info/PKG-INFO was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.1-py3.11.egg-info/SOURCES.txt was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.1-py3.11.egg-info/top_level.txt was removed

--===============2151667424965138920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1698 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1696 targets, 40 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:eede70b8c26eae686ea8d46f47ffb82af86736ec"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 42 Local 7 Mirrors 0 Missed 35 Current 276 (16% match, 88% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 298 of 318 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 318 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 304 of 318 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 318 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running task 800 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 909 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_fetch)
NOTE: Running task 913 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: Running task 914 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: Running task 915 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: Running task 933 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_fetch)
NOTE: Running task 1004 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: Running task 1006 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: Running task 1032 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_deploy_source_date_epoch)
NOTE: Running task 1033 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1054 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_package_write_rpm)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2022g-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-locale-2.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glibc-locale-2.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_fetch: Started
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: Running task 1055 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_fetch: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
NOTE: Running task 1056 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe tzdata-2022g-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glibc-locale-2.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-locale-2.36-r0: task do_prepare_recipe_sysroot: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ncurses/6.3+20220423-r0/temp/log.do_packagedata_setscene.3960163
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 317 of 318 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_package_setscene)
NOTE: Running task 1057 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
NOTE: Running task 1058 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: Running task 1059 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: Running task 1060 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_unpack)
NOTE: Running task 1061 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1062 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1063 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: Running task 1064 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: Running task 1065 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1066 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running noexec task 1067 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_configure)
NOTE: Running noexec task 1068 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_compile)
NOTE: Running task 1069 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_install)
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Started
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_unpack: Started
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_package_setscene: Started
NOTE: recipe glibc-locale-2.36-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: Running task 1072 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1073 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: Running task 1074 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: Running task 1075 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_patch)
NOTE: Running task 1076 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1077 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_patch)
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Succeeded
NOTE: Running task 1078 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_patch)
NOTE: Running task 1079 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: Running task 1080 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_patch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.1-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1081 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_configure)
NOTE: recipe coreutils-9.1-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: Running task 1082 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sed-4.9-r0: task do_configure: Started
NOTE: Running task 1083 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_configure)
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1084 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: Running task 1085 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1086 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_populate_lic)
NOTE: recipe coreutils-9.1-r0: task do_patch: Succeeded
NOTE: Running task 1087 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1088 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_populate_lic: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_configure: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1089 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_compile)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_populate_lic unihash changed to 372533cd394700545952a4760c28062bf383cfcf9dac2a872044f89d38044346
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_compile: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1090 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: Running task 1091 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_compile: Succeeded
NOTE: Running task 1092 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 1093 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_install: Succeeded
NOTE: Running task 1094 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_package_setscene: Succeeded
NOTE: Running task 1095 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: Setscene tasks completed
NOTE: Running task 1120 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1124 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata)
NOTE: Running task 1128 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: Running task 1130 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1131 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure)
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1132 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe bash-5.2.15-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Succeeded
NOTE: Running task 1139 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-locale-2.36-r0: task do_install: Succeeded
NOTE: Running task 1140 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_package)
NOTE: recipe glibc-locale-2.36-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: Running task 1141 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: Running task 1142 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: Running task 1143 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: Running task 1144 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1145 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe gmp-6.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1146 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_compile)
NOTE: recipe gmp-6.2.1-r0: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_configure: Succeeded
NOTE: Running task 1147 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure_ptest_base)
NOTE: recipe bash-5.2.15-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.2.15-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1148 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_compile)
NOTE: recipe bash-5.2.15-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_configure: Succeeded
NOTE: Running task 1149 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: Running task 1150 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile_ptest_base)
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1151 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1152 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Started
NOTE: recipe bash-5.2.15-r0: task do_compile: Succeeded
NOTE: Running task 1153 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_compile_ptest_base)
NOTE: recipe bash-5.2.15-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Succeeded
NOTE: Running task 1154 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_compile: Succeeded
NOTE: Running task 1155 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_compile_ptest_base)
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1156 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_install)
NOTE: recipe sed-4.9-r0: task do_install: Started
NOTE: recipe gmp-6.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1157 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_install)
NOTE: recipe gmp-6.2.1-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1158 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot)
NOTE: Running task 1159 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package)
NOTE: recipe gmp-6.2.1-r0: task do_install: Succeeded
NOTE: Running task 1160 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot)
NOTE: Running task 1161 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package)
NOTE: recipe sed-4.9-r0: task do_install: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Started
NOTE: Running task 1162 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Started
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1163 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1164 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1165 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1166 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure)
NOTE: recipe coreutils-9.1-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1167 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_configure)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_configure: Started
NOTE: recipe bash-5.2.15-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1168 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_install)
NOTE: recipe bash-5.2.15-r0: task do_install: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Succeeded
NOTE: Running task 1169 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Running task 1170 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata)
NOTE: recipe sed-4.9-r0: task do_packagedata: Started
NOTE: recipe sed-4.9-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1171 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_compile)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_install: Succeeded
NOTE: Running task 1172 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_install_ptest_base)
NOTE: recipe bash-5.2.15-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Succeeded
NOTE: Running task 1173 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1174 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_install)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_install: Started
NOTE: recipe bash-5.2.15-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1175 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package)
NOTE: recipe bash-5.2.15-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_install: Succeeded
NOTE: Running task 1176 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_package)
NOTE: Running task 1177 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package: Succeeded
NOTE: Running task 1178 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1179 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_package_write_rpm)
NOTE: Running task 1180 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_package_qa)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_qa: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_qa: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_package: Succeeded
NOTE: Running task 1181 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata)
NOTE: recipe bash-5.2.15-r0: task do_packagedata: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_configure: Succeeded
NOTE: Running task 1182 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1183 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile)
NOTE: recipe coreutils-9.1-r0: task do_compile: Started
NOTE: recipe coreutils-9.1-r0: task do_compile: Succeeded
NOTE: Running task 1184 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1185 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install)
NOTE: recipe coreutils-9.1-r0: task do_install: Started
NOTE: recipe coreutils-9.1-r0: task do_install: Succeeded
NOTE: Running task 1186 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1187 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_package: Started
NOTE: recipe coreutils-9.1-r0: task do_package: Succeeded
NOTE: Running task 1188 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata)
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Succeeded
NOTE: recipe glibc-locale-2.36-r0: task do_package: Succeeded
NOTE: Running task 1189 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_packagedata)
NOTE: recipe glibc-locale-2.36-r0: task do_packagedata: Started
NOTE: recipe glibc-locale-2.36-r0: task do_packagedata: Succeeded
NOTE: Running task 1190 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_package_write_rpm)
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1191 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1191 tasks of which 1082 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 22 ERROR messages, returning a non-zero exit code.
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-src went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-dbg went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libtinfo went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libncursesw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libncurses went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libticw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libtic went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libpanelw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libpanel went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libmenuw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libmenu went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libformw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libform went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-staticdev went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-dev went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-doc went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-locale went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-tools went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-terminfo-base went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-terminfo went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2151667424965138920==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.1-6.1.2.patch"

RnJvbSAxMTZlZjBhN2U1YzEyNzE0NDYwOWI0MmJhZTZkZWJjNGE0OWNmOGVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMDc6MjM6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
dHJmcy10b29sczogdXBncmFkZSA2LjEgLT4gNi4xLjIKCi0tLQogLi4uL2J0cmZzLXRvb2xzL3ti
dHJmcy10b29sc182LjEuYmIgPT4gYnRyZnMtdG9vbHNfNi4xLjIuYmJ9ICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL3tidHJmcy10b29sc182LjEuYmIgPT4gYnRyZnMt
dG9vbHNfNi4xLjIuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9i
dHJmcy10b29scy9idHJmcy10b29sc182LjEuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4x
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9v
bHNfNi4xLjIuYmIKaW5kZXggNDRlYzJlMWYxNi4uYjEwZDdlZmRiNSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMS5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4xLjIuYmIKQEAg
LTE5LDcgKzE5LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQva2RhdmUvYnRyZnMtcHJvZ3MuZ2l0O2IKICAgICAgICAgICAgZmlsZTov
LzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1h
ci5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLVVzZS1wcmVhZC1wd3JpdGUtZnRydW5j
YXRlLXN0YXQtaW5zdGVhZC1vZi02NGJpdC1lcXUucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNS
RVYgPSAiY2RlNWZhYTY3ODdlNmZhNzIwYzk5ZDJmMTBjYWExODdhNDkzYzEzZiIKK1NSQ1JFViA9
ICI2NjBkMTBkM2ZiMmU4NzkwOWQzNzliMGVhM2M1MjkzNDU0MzQ1NWM3IgogUyA9ICIke1dPUktE
SVJ9L2dpdCIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiBcCi0tIAoyLjM3LjMKCg==

--===============2151667424965138920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 52 skipped, 0 masked, 0 errors.
Removing 50 recipes from the core2-32 sysroot...done.
Removing 51 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:eede70b8c26eae686ea8d46f47ffb82af86736ec"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 158 Local 118 Mirrors 0 Missed 40 Current 156 (74% match, 87% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 166 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 168 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 175 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 176 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 190 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 191 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 571 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 572 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: Running task 611 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_fetch)
NOTE: Running task 612 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_fetch)
NOTE: Running task 613 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: Running task 614 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: Running task 615 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: Running task 627 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_fetch)
NOTE: Running task 660 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: Running task 663 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: recipe libcap-2.66-r0: task do_fetch: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Started
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.66-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: Running task 699 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_unpack)
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: Running task 700 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: Running task 701 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_unpack)
NOTE: Running task 702 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: Running task 703 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: Running task 704 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 705 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Succeeded
NOTE: Running task 706 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 707 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_unpack)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
NOTE: Running task 708 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
NOTE: recipe libcap-2.66-r0: task do_unpack: Started
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 713 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: recipe libcap-2.66-r0: task do_unpack: Succeeded
NOTE: Running task 714 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_patch)
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: recipe libcap-2.66-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: Running task 715 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: Running task 716 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 206 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_package_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.66-r0: task do_patch: Succeeded
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: Running task 717 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Succeeded
NOTE: Running task 718 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_deploy_source_date_epoch)
NOTE: Running task 719 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: Running task 720 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 721 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 722 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_patch)
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: Running task 723 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_patch)
NOTE: Running task 724 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_patch)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 209 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 210 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 211 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 212 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 213 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 214 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.66-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_patch: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: Running task 729 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 730 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.66-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 739 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_patch: Succeeded
NOTE: Running task 740 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 741 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_populate_lic)
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.1-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_populate_lic: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 742 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
NOTE: Running task 743 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_populate_lic unihash changed to 372533cd394700545952a4760c28062bf383cfcf9dac2a872044f89d38044346
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 220 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 221 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 222 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 223 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: Running task 748 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.11.1-r0: task do_package_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 749 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 229 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 230 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 231 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 233 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 234 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 235 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 236 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 237 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 238 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 239 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 240 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 241 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 242 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 243 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 244 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 245 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 246 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 247 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 248 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 249 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 251 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 255 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 261 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 262 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ncurses/6.3+20220423-r0/temp/log.do_packagedata_setscene.693346
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 276 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_package_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_package_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 278 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 282 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 284 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 287 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 289 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 290 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_package_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_package_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 291 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 293 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 295 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 298 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 299 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 308 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 311 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 312 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1046 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1047 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1053 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata)
NOTE: Running task 1069 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1070 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1073 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1074 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1092 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1093 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1094 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_package_write_rpm)
NOTE: recipe acl-2.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.66-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-2.66-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1095 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_configure)
NOTE: Running task 1096 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_configure)
NOTE: Running task 1097 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1098 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_configure)
NOTE: recipe acl-2.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1099 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_configure)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_configure: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-2.66-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: Running task 1100 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_configure)
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1101 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure)
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1108 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe gmp-6.2.1-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_configure: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_configure: Started
NOTE: Running task 1109 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_compile)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: Running task 1110 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe libcap-2.66-r0: task do_configure: Succeeded
NOTE: Running task 1111 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_compile)
NOTE: recipe sed-4.9-r0: task do_configure: Started
NOTE: recipe bash-5.2.15-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe libcap-2.66-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_compile: Succeeded
NOTE: Running task 1112 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_install)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_install: Succeeded
NOTE: Running task 1113 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Started
NOTE: recipe libcap-2.66-r0: task do_compile: Succeeded
NOTE: Running task 1114 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_install)
NOTE: recipe libcap-2.66-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Succeeded
NOTE: Running task 1115 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata: Succeeded
NOTE: recipe libcap-2.66-r0: task do_install: Succeeded
NOTE: Running task 1116 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_populate_sysroot)
NOTE: Running task 1117 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_package)
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-2.66-r0: task do_package: Started
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcap-2.66-r0: task do_package: Succeeded
NOTE: Running task 1118 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata)
NOTE: recipe libcap-2.66-r0: task do_packagedata: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1119 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_configure_ptest_base)
NOTE: recipe acl-2.3.1-r0: task do_configure_ptest_base: Started
NOTE: recipe acl-2.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1120 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_compile)
NOTE: recipe acl-2.3.1-r0: task do_compile: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: Running task 1121 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: Running task 1122 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe acl-2.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1123 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_compile_ptest_base)
NOTE: recipe acl-2.3.1-r0: task do_compile_ptest_base: Started
NOTE: recipe acl-2.3.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1124 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_install)
NOTE: recipe acl-2.3.1-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: Running task 1125 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1126 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe acl-2.3.1-r0: task do_install: Succeeded
NOTE: Running task 1127 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_install_ptest_base)
NOTE: recipe acl-2.3.1-r0: task do_install_ptest_base: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1128 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot)
NOTE: Running task 1129 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package)
NOTE: Running task 1130 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: recipe acl-2.3.1-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_package: Succeeded
NOTE: Running task 1131 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata)
NOTE: recipe acl-2.3.1-r0: task do_packagedata: Started
NOTE: recipe bash-5.2.15-r0: task do_configure: Succeeded
NOTE: Running task 1132 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure_ptest_base)
NOTE: recipe acl-2.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.2.15-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1133 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_compile)
NOTE: recipe bash-5.2.15-r0: task do_compile: Started
NOTE: recipe gmp-6.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1134 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_compile)
NOTE: recipe gmp-6.2.1-r0: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_compile: Succeeded
NOTE: Running task 1135 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_compile_ptest_base)
NOTE: recipe bash-5.2.15-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: Running task 1136 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1137 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_configure: Succeeded
NOTE: Running task 1138 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_configure_ptest_base)
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1139 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_compile)
NOTE: recipe sed-4.9-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Succeeded
NOTE: Running task 1140 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Started
NOTE: recipe bash-5.2.15-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1141 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_install)
NOTE: recipe bash-5.2.15-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_compile: Succeeded
NOTE: Running task 1142 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_compile_ptest_base)
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1143 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_install)
NOTE: recipe sed-4.9-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1144 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot)
NOTE: Running task 1145 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package)
NOTE: recipe gmp-6.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1146 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Started
NOTE: recipe gmp-6.2.1-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1147 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe sed-4.9-r0: task do_install: Succeeded
NOTE: Running task 1148 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_install_ptest_base)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Started
NOTE: recipe gmp-6.2.1-r0: task do_install: Succeeded
NOTE: Running task 1149 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot)
NOTE: Running task 1150 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package)
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1151 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Started
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1152 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_configure)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_configure: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1153 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1154 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure)
NOTE: recipe coreutils-9.1-r0: task do_configure: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Succeeded
NOTE: Running task 1155 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Started
NOTE: recipe bash-5.2.15-r0: task do_install: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1156 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_install_ptest_base)
NOTE: recipe bash-5.2.15-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Running task 1157 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata)
NOTE: recipe sed-4.9-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1158 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_compile)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_packagedata: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1159 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package)
NOTE: recipe bash-5.2.15-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Succeeded
NOTE: Running task 1160 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1161 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_install)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_install: Succeeded
NOTE: Running task 1162 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_package)
NOTE: Running task 1163 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_package: Succeeded
NOTE: Running task 1164 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package: Succeeded
NOTE: Running task 1165 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_packagedata)
NOTE: recipe bash-5.2.15-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1166 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_package_write_rpm)
NOTE: Running task 1167 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_package_qa)
NOTE: recipe bash-5.2.15-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_qa: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_qa: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_configure: Succeeded
NOTE: Running task 1168 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1169 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile)
NOTE: recipe coreutils-9.1-r0: task do_compile: Started
NOTE: recipe coreutils-9.1-r0: task do_compile: Succeeded
NOTE: Running task 1170 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1171 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install)
NOTE: recipe coreutils-9.1-r0: task do_install: Started
NOTE: recipe coreutils-9.1-r0: task do_install: Succeeded
NOTE: Running task 1172 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1173 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_package: Started
NOTE: recipe coreutils-9.1-r0: task do_package: Succeeded
NOTE: Running task 1174 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata)
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1175 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_package_write_rpm)
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1176 of 1176 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1176 tasks of which 1049 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 22 ERROR messages, returning a non-zero exit code.
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-src went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-dbg went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libtinfo went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libncursesw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libncurses went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libticw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libtic went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libpanelw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libpanel went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libmenuw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libmenu went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libformw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libform went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-staticdev went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-dev went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-doc went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-locale went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-tools went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-terminfo-base went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-terminfo went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2151667424965138920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1696 targets, 68 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:eede70b8c26eae686ea8d46f47ffb82af86736ec"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 44 Local 9 Mirrors 0 Missed 35 Current 274 (20% match, 88% complete)
Removing 1 stale sstate objects for arch mips32r2...done.
Removing 1 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 296 of 318 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 318 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 302 of 318 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 318 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running task 695 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 757 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_fetch)
NOTE: Running task 759 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: Running task 760 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: Running task 761 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: Running task 775 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_fetch)
NOTE: Running task 812 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: Running task 813 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: Running task 841 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_deploy_source_date_epoch)
NOTE: recipe tzdata-2022g-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Started
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Started
NOTE: recipe glibc-locale-2.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_fetch: Started
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: Running task 856 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_unpack)
NOTE: Running task 857 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: Running task 858 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: Running task 859 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: Running task 860 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: Running task 861 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 862 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_unpack)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 864 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Started
NOTE: recipe tzdata-2022g-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-locale-2.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/ncurses/6.3+20220423-r0/temp/log.do_packagedata_setscene.226740
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 315 of 318 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_package_setscene)
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Succeeded
NOTE: Running task 866 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: Running task 867 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: Running task 868 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: Running task 869 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 870 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_patch)
NOTE: Running task 871 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_patch)
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: Running task 872 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: Running task 873 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Succeeded
NOTE: Running task 874 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: Running task 875 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_patch: Succeeded
NOTE: Running task 876 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
NOTE: Running task 877 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 878 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_populate_lic)
NOTE: Running task 879 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_patch: Succeeded
NOTE: Running task 880 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_populate_lic: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_populate_lic unihash changed to 372533cd394700545952a4760c28062bf383cfcf9dac2a872044f89d38044346
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: Running task 881 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe ncurses-6.3+20220423-r0: task do_package_setscene: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 882 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 316 of 318 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1053 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1065 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata)
NOTE: Running task 1083 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1093 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1094 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1112 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1113 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1114 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1119 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_package_write_rpm)
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-locale-2.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1120 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_configure)
NOTE: Running task 1121 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe glibc-locale-2.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1122 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_configure)
NOTE: Running noexec task 1123 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_compile)
NOTE: Running task 1124 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_install)
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1125 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_configure)
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1126 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_configure)
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: Running task 1127 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1128 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata: Succeeded
NOTE: recipe glibc-locale-2.36-r0: task do_install: Started
NOTE: recipe gmp-6.2.1-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_configure: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: Running task 1135 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_compile)
NOTE: Running task 1136 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe sed-4.9-r0: task do_configure: Started
NOTE: recipe bash-5.2.15-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_compile: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_compile: Succeeded
NOTE: Running task 1137 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_install)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_install: Succeeded
NOTE: Running task 1138 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Succeeded
NOTE: Running task 1139 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata: Started
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata: Succeeded
NOTE: recipe glibc-locale-2.36-r0: task do_install: Succeeded
NOTE: Running task 1140 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_package)
NOTE: recipe glibc-locale-2.36-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: Running task 1141 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: Running task 1142 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: Running task 1143 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: Running task 1144 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1145 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_configure: Succeeded
NOTE: Running task 1146 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure_ptest_base)
NOTE: recipe bash-5.2.15-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.2.15-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1147 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_compile)
NOTE: recipe bash-5.2.15-r0: task do_compile: Started
NOTE: recipe gmp-6.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1148 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_compile)
NOTE: recipe gmp-6.2.1-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_configure: Succeeded
NOTE: Running task 1149 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: Running task 1150 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile_ptest_base)
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1151 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1152 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Started
NOTE: recipe bash-5.2.15-r0: task do_compile: Succeeded
NOTE: Running task 1153 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_compile_ptest_base)
NOTE: recipe bash-5.2.15-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Succeeded
NOTE: Running task 1154 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Started
NOTE: recipe gmp-6.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1155 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_install)
NOTE: recipe gmp-6.2.1-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_compile: Succeeded
NOTE: Running task 1156 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_compile_ptest_base)
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1157 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_install)
NOTE: recipe sed-4.9-r0: task do_install: Started
NOTE: recipe gmp-6.2.1-r0: task do_install: Succeeded
NOTE: Running task 1158 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot)
NOTE: Running task 1159 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1160 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1161 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot)
NOTE: Running task 1162 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Started
NOTE: recipe sed-4.9-r0: task do_install: Succeeded
NOTE: Running task 1163 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1164 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure)
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_configure: Started
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1165 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1166 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe bash-5.2.15-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1167 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_install)
NOTE: recipe bash-5.2.15-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1168 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_configure)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_configure: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Succeeded
NOTE: Running task 1169 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Running task 1170 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata)
NOTE: recipe sed-4.9-r0: task do_packagedata: Started
NOTE: recipe sed-4.9-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1171 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_compile)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_install: Succeeded
NOTE: Running task 1172 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_install_ptest_base)
NOTE: recipe bash-5.2.15-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Succeeded
NOTE: Running task 1173 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1174 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_install)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_install: Started
NOTE: recipe bash-5.2.15-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1175 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package)
NOTE: recipe bash-5.2.15-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_install: Succeeded
NOTE: Running task 1176 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_package)
NOTE: Running task 1177 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package: Succeeded
NOTE: Running task 1178 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1179 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_package_write_rpm)
NOTE: Running task 1180 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_package_qa)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_qa: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_qa: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_package: Succeeded
NOTE: Running task 1181 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata)
NOTE: recipe bash-5.2.15-r0: task do_packagedata: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_configure: Succeeded
NOTE: Running task 1182 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1183 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile)
NOTE: recipe coreutils-9.1-r0: task do_compile: Started
NOTE: recipe coreutils-9.1-r0: task do_compile: Succeeded
NOTE: Running task 1184 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1185 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install)
NOTE: recipe coreutils-9.1-r0: task do_install: Started
NOTE: recipe coreutils-9.1-r0: task do_install: Succeeded
NOTE: Running task 1186 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1187 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_package: Started
NOTE: recipe coreutils-9.1-r0: task do_package: Succeeded
NOTE: Running task 1188 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata)
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Succeeded
NOTE: recipe glibc-locale-2.36-r0: task do_package: Succeeded
NOTE: Running task 1189 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_packagedata)
NOTE: recipe glibc-locale-2.36-r0: task do_packagedata: Started
NOTE: recipe glibc-locale-2.36-r0: task do_packagedata: Succeeded
NOTE: Running task 1190 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_package_write_rpm)
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1191 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1191 tasks of which 1082 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 22 ERROR messages, returning a non-zero exit code.
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-src went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-dbg went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libtinfo went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libncursesw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libncurses went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libticw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libtic went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libpanelw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libpanel went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libmenuw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libmenu went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libformw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libform went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-staticdev went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-dev went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-doc went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-locale went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-tools went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-terminfo-base went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-terminfo went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2151667424965138920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1696 targets, 58 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:eede70b8c26eae686ea8d46f47ffb82af86736ec"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 44 Local 9 Mirrors 0 Missed 35 Current 274 (20% match, 88% complete)
Removing 1 stale sstate objects for arch qemuarm...done.
Removing 1 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 296 of 318 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 318 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 302 of 318 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 318 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running task 695 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 757 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_fetch)
NOTE: Running task 759 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: Running task 760 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: Running task 761 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: Running task 775 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_fetch)
NOTE: Running task 811 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: Running task 813 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: Running task 841 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_deploy_source_date_epoch)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2022g-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-locale-2.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_fetch: Started
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: Running task 856 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_unpack)
NOTE: Running task 857 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: Running task 858 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: Running task 859 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: Running task 860 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Succeeded
NOTE: Running task 861 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 862 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_unpack)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 863 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
NOTE: recipe tzdata-2022g-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-locale-2.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/ncurses/6.3+20220423-r0/temp/log.do_packagedata_setscene.4190911
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 315 of 318 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_package_setscene)
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Succeeded
NOTE: Running task 866 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: Running task 867 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: Running task 868 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: Running task 869 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_patch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: Running task 870 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_patch)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 871 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_patch)
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: Running task 872 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_patch)
NOTE: Running task 873 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Succeeded
NOTE: Running task 874 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: Running task 875 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_patch: Succeeded
NOTE: Running task 876 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 877 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_populate_lic)
NOTE: recipe coreutils-9.1-r0: task do_patch: Succeeded
NOTE: Running task 878 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: Running task 879 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_patch: Succeeded
NOTE: Running task 880 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_populate_lic: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_populate_lic unihash changed to 372533cd394700545952a4760c28062bf383cfcf9dac2a872044f89d38044346
NOTE: recipe btrfs-tools-6.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: Running task 881 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe ncurses-6.3+20220423-r0: task do_package_setscene: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 882 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 316 of 318 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1053 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1065 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata)
NOTE: Running task 1083 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1093 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1094 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1112 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1113 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1114 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1119 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_package_write_rpm)
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-locale-2.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1120 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: Running task 1121 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_configure)
NOTE: recipe glibc-locale-2.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1122 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_configure)
NOTE: Running noexec task 1123 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_compile)
NOTE: Running task 1124 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_install)
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1125 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_configure)
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1126 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_configure)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_configure: Started
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1127 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1128 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_configure: Started
NOTE: recipe glibc-locale-2.36-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_configure: Succeeded
NOTE: Running task 1135 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: Running task 1136 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_compile)
NOTE: recipe sed-4.9-r0: task do_configure: Started
NOTE: recipe bash-5.2.15-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_compile: Succeeded
NOTE: Running task 1137 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_install)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_install: Succeeded
NOTE: Running task 1138 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Succeeded
NOTE: Running task 1139 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-locale-2.36-r0: task do_install: Succeeded
NOTE: Running task 1140 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_package)
NOTE: recipe glibc-locale-2.36-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: Running task 1141 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: Running task 1142 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: Running task 1143 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: Running task 1144 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1145 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_configure: Succeeded
NOTE: Running task 1146 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure_ptest_base)
NOTE: recipe bash-5.2.15-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.2.15-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1147 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_compile)
NOTE: recipe bash-5.2.15-r0: task do_compile: Started
NOTE: recipe gmp-6.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1148 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_compile)
NOTE: recipe gmp-6.2.1-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: Running task 1149 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1150 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Started
NOTE: recipe bash-5.2.15-r0: task do_compile: Succeeded
NOTE: Running task 1151 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_compile_ptest_base)
NOTE: recipe bash-5.2.15-r0: task do_compile_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_configure: Succeeded
NOTE: Running task 1152 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_configure_ptest_base)
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1153 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_compile)
NOTE: recipe sed-4.9-r0: task do_compile: Started
NOTE: recipe gmp-6.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1154 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_install)
NOTE: recipe gmp-6.2.1-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Succeeded
NOTE: Running task 1155 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Started
NOTE: recipe gmp-6.2.1-r0: task do_install: Succeeded
NOTE: Running task 1156 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot)
NOTE: Running task 1157 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1158 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1159 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure)
NOTE: recipe sed-4.9-r0: task do_compile: Succeeded
NOTE: Running task 1160 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_configure: Started
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1161 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_install)
NOTE: recipe bash-5.2.15-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe sed-4.9-r0: task do_install: Started
NOTE: Running task 1162 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_install)
NOTE: recipe bash-5.2.15-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1163 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot)
NOTE: Running task 1164 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1165 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_install: Succeeded
NOTE: Running task 1166 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_install_ptest_base)
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1167 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1168 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_configure)
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_configure: Started
NOTE: Running task 1169 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Running task 1170 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata)
NOTE: recipe bash-5.2.15-r0: task do_install: Succeeded
NOTE: Running task 1171 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_install_ptest_base)
NOTE: recipe sed-4.9-r0: task do_packagedata: Started
NOTE: recipe bash-5.2.15-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1172 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_compile)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Succeeded
NOTE: Running task 1173 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1174 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package)
NOTE: recipe bash-5.2.15-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1175 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_install)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_install: Succeeded
NOTE: Running task 1176 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_package)
NOTE: Running task 1177 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package: Succeeded
NOTE: Running task 1178 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1179 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_package_write_rpm)
NOTE: Running task 1180 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_package_qa)
NOTE: recipe bash-5.2.15-r0: task do_package: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_qa: Started
NOTE: Running task 1181 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata)
NOTE: recipe bash-5.2.15-r0: task do_packagedata: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_qa: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_configure: Succeeded
NOTE: Running task 1182 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1183 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile)
NOTE: recipe coreutils-9.1-r0: task do_compile: Started
NOTE: recipe coreutils-9.1-r0: task do_compile: Succeeded
NOTE: Running task 1184 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1185 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install)
NOTE: recipe coreutils-9.1-r0: task do_install: Started
NOTE: recipe coreutils-9.1-r0: task do_install: Succeeded
NOTE: Running task 1186 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1187 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_package: Started
NOTE: recipe coreutils-9.1-r0: task do_package: Succeeded
NOTE: Running task 1188 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata)
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Succeeded
NOTE: recipe glibc-locale-2.36-r0: task do_package: Succeeded
NOTE: Running task 1189 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_packagedata)
NOTE: recipe glibc-locale-2.36-r0: task do_packagedata: Started
NOTE: recipe glibc-locale-2.36-r0: task do_packagedata: Succeeded
NOTE: Running task 1190 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_package_write_rpm)
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1191 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1191 tasks of which 1082 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 22 ERROR messages, returning a non-zero exit code.
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-src went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-dbg went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libtinfo went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libncursesw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libncurses went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libticw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libtic went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libpanelw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libpanel went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libmenuw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libmenu went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libformw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libform went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-staticdev went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-dev went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-doc went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-locale went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-tools went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-terminfo-base went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-terminfo went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2151667424965138920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1696 targets, 75 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:eede70b8c26eae686ea8d46f47ffb82af86736ec"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 44 Local 9 Mirrors 0 Missed 35 Current 274 (20% match, 88% complete)
Removing 1 stale sstate objects for arch ppc7400...done.
Removing 1 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 296 of 318 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 318 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 302 of 318 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 318 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running task 695 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 757 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_fetch)
NOTE: Running task 759 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: Running task 760 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: Running task 761 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: Running task 775 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_fetch)
NOTE: Running task 812 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: Running task 813 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: Running task 841 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_deploy_source_date_epoch)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2022g-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Started
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-locale-2.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_fetch: Started
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 856 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: Running task 857 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: Running task 858 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: Running task 859 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: Running task 860 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Succeeded
NOTE: Running task 861 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 862 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_unpack)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
NOTE: Running task 864 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
NOTE: recipe tzdata-2022g-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: recipe glibc-locale-2.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/ncurses/6.3+20220423-r0/temp/log.do_packagedata_setscene.456796
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 315 of 318 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_package_setscene)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: Running task 866 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: Running task 867 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: Running task 868 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Succeeded
NOTE: Running task 869 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: Running task 870 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 871 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_patch)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 872 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_patch)
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Succeeded
NOTE: Running task 873 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_patch)
NOTE: Running task 874 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.1-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: Running task 875 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
NOTE: Running task 876 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_patch: Succeeded
NOTE: Running task 877 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 878 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 879 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_populate_lic)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.1-r0: task do_patch: Succeeded
NOTE: Running task 880 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_populate_lic: Started
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_populate_lic unihash changed to 372533cd394700545952a4760c28062bf383cfcf9dac2a872044f89d38044346
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: Running task 881 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe ncurses-6.3+20220423-r0: task do_package_setscene: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 882 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 316 of 318 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1053 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1065 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata)
NOTE: Running task 1083 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1093 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1094 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1112 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1113 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1114 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1119 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_package_write_rpm)
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-locale-2.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1120 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_configure)
NOTE: Running task 1121 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe glibc-locale-2.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1122 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_configure)
NOTE: Running noexec task 1123 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_compile)
NOTE: Running task 1124 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_install)
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1125 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_configure)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1126 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_configure)
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1127 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure)
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1134 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe glibc-locale-2.36-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_configure: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: Running task 1135 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_compile)
NOTE: Running task 1136 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe sed-4.9-r0: task do_configure: Started
NOTE: recipe bash-5.2.15-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_compile: Succeeded
NOTE: Running task 1137 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_install)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_install: Succeeded
NOTE: Running task 1138 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Started
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Succeeded
NOTE: Running task 1139 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata: Succeeded
NOTE: recipe glibc-locale-2.36-r0: task do_install: Succeeded
NOTE: Running task 1140 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_package)
NOTE: recipe glibc-locale-2.36-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: Running task 1141 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: Running task 1142 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: Running task 1143 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: Running task 1144 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1145 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_configure: Succeeded
NOTE: Running task 1146 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure_ptest_base)
NOTE: recipe bash-5.2.15-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.2.15-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1147 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_compile)
NOTE: recipe bash-5.2.15-r0: task do_compile: Started
NOTE: recipe gmp-6.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1148 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_compile)
NOTE: recipe gmp-6.2.1-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: Running task 1149 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1150 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_configure: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_compile: Succeeded
NOTE: Running task 1151 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_configure_ptest_base)
NOTE: Running task 1152 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_compile_ptest_base)
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.2.15-r0: task do_compile_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1153 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_compile)
NOTE: recipe sed-4.9-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Succeeded
NOTE: Running task 1154 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Started
NOTE: recipe gmp-6.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1155 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_install)
NOTE: recipe gmp-6.2.1-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_compile: Succeeded
NOTE: Running task 1156 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_compile_ptest_base)
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1157 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_install)
NOTE: recipe sed-4.9-r0: task do_install: Started
NOTE: recipe bash-5.2.15-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1158 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1159 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot)
NOTE: Running task 1160 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package)
NOTE: recipe bash-5.2.15-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_install: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Started
NOTE: Running task 1161 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot)
NOTE: Running task 1162 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1163 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1164 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_install: Succeeded
NOTE: Running task 1165 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_install_ptest_base)
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1166 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure)
NOTE: recipe coreutils-9.1-r0: task do_configure: Started
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1167 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: Running task 1168 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_configure)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_configure: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Succeeded
NOTE: Running task 1169 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Running task 1170 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata)
NOTE: recipe sed-4.9-r0: task do_packagedata: Started
NOTE: recipe bash-5.2.15-r0: task do_install: Succeeded
NOTE: Running task 1171 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_install_ptest_base)
NOTE: recipe bash-5.2.15-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1172 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_compile)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Succeeded
NOTE: Running task 1173 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1174 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package)
NOTE: recipe bash-5.2.15-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1175 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_install)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_install: Succeeded
NOTE: Running task 1176 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_package)
NOTE: Running task 1177 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package: Succeeded
NOTE: Running task 1178 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1179 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_package_write_rpm)
NOTE: Running task 1180 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_package_qa)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_qa: Started
NOTE: recipe bash-5.2.15-r0: task do_package: Succeeded
NOTE: Running task 1181 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata)
NOTE: recipe bash-5.2.15-r0: task do_packagedata: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_qa: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_configure: Succeeded
NOTE: Running task 1182 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1183 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile)
NOTE: recipe coreutils-9.1-r0: task do_compile: Started
NOTE: recipe coreutils-9.1-r0: task do_compile: Succeeded
NOTE: Running task 1184 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1185 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install)
NOTE: recipe coreutils-9.1-r0: task do_install: Started
NOTE: recipe coreutils-9.1-r0: task do_install: Succeeded
NOTE: Running task 1186 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1187 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_package: Started
NOTE: recipe coreutils-9.1-r0: task do_package: Succeeded
NOTE: Running task 1188 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata)
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Succeeded
NOTE: recipe glibc-locale-2.36-r0: task do_package: Succeeded
NOTE: Running task 1189 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_packagedata)
NOTE: recipe glibc-locale-2.36-r0: task do_packagedata: Started
NOTE: recipe glibc-locale-2.36-r0: task do_packagedata: Succeeded
NOTE: Running task 1190 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_package_write_rpm)
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1191 of 1191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1191 tasks of which 1082 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 22 ERROR messages, returning a non-zero exit code.
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-src went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-dbg went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libtinfo went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libncursesw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libncurses went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libticw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libtic went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libpanelw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libpanel went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libmenuw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libmenu went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libformw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libform went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-staticdev went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-dev went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-doc went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-locale went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-tools went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-terminfo-base went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-terminfo went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2151667424965138920==--

