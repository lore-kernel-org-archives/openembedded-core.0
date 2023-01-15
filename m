Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97ED6C71134
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:31 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.145725.1673805744411906516
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=msf1PJUs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010185b698c5d9-d19a3703-16f7-431c-bf83-b08788f36688-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2AMkVPhaq7cyqDU2gI6G18Dbeye5HTMQtKmTzlHnvyA=;
	b=msf1PJUsAB8YTZl5bqmI+FZBw/shFC+awCzZA/z1Ru4aAf2mryrjtz62qfzZ/5zV
	Dh7384H3OhsdvQCXtlgDF4rqihr8x85JzX5ZmPkTNoI6pT9/Em9z6vecGsaWLo4/pbp
	dmMKyLkeMxNzjB8zuuYoL6LWqnYZDKItG/4XH/ms=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2AMkVPhaq7cyqDU2gI6G18Dbeye5HTMQtKmTzlHnvyA=;
	b=GK3Ua/hAKtBcNYKJ2BEeFNNx37Qf5VE5KmbI/AGrGb0YlKOsTaJYAlKjxpO63l4o
	ouRnTUZe76GMF8RrDJOGsVlaXLmEZ2JToU7LSVXHgto+95M2C8wY1vLn2QN2qpVt+Ai
	zj4b0HneauvS2i5e08PU+HMHg2z0CnS8+7ZinxRI=
Content-Type: multipart/mixed; boundary="===============2694617505234584552=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wcwidth: upgrading to 0.2.6 SUCCEEDED
Message-ID: <01010185b698c5d9-d19a3703-16f7-431c-bf83-b08788f36688-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175925

--===============2694617505234584552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-wcwidth* to *0.2.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wcwidth-upgrade-0.2.5-0.2.6.patch
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
--===============2694617505234584552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-wcwidth: PV changed from "0.2.5" to "0.2.6"
packages/core2-32-poky-linux/python3-wcwidth: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.2.5.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.2.6.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-wcwidth: PKGV changed from 0.2.5 [default] to 0.2.6 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PV changed from "0.2.5" to "0.2.6"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PKGV changed from 0.2.5 [default] to 0.2.6 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-dev: PV changed from "0.2.5" to "0.2.6"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-dev: PKGV changed from 0.2.5 [default] to 0.2.6 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-doc: PV changed from "0.2.5" to "0.2.6"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-doc: PKGV changed from 0.2.5 [default] to 0.2.6 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-locale: PV changed from "0.2.5" to "0.2.6"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-locale: PKGV changed from 0.2.5 [default] to 0.2.6 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGSIZE changed from 8899 to 9001 (+1%)
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PV changed from "0.2.5" to "0.2.6"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGV changed from 0.2.5 [default] to 0.2.6 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-src: PV changed from "0.2.5" to "0.2.6"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-src: PKGV changed from 0.2.5 [default] to 0.2.6 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PV changed from "0.2.5" to "0.2.6"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PKGV changed from 0.2.5 [default] to 0.2.6 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth: PKGSIZE changed from 461857 to 498155 (+8%)
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth: PV changed from "0.2.5" to "0.2.6"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth: PKGV changed from 0.2.5 [default] to 0.2.6 [default]
Changes to packages/core2-32-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.11/site-packages/wcwidth-0.2.5.dist-info moved to /usr/lib/python3.11/site-packages/wcwidth-0.2.6.dist-info

--===============2694617505234584552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.11/site-packages/wcwidth-0.2.5.dist-info moved to /usr/lib/python3.11/site-packages/wcwidth-0.2.6.dist-info

--===============2694617505234584552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1698 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1696 targets, 40 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:341d8c50e3d6194d219e19ac61d41163638fe020"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 15 Local 7 Mirrors 0 Missed 8 Current 338 (46% match, 97% complete)
Removing 1 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 340 of 353 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 341 of 353 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb:do_packagedata_setscene)
NOTE: Running task 899 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_fetch)
NOTE: recipe python3-setuptools-65.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Succeeded
NOTE: Running task 1300 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_unpack)
NOTE: Running task 1301 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-7.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-setuptools/65.6.3-r0/temp/log.do_packagedata_setscene.4059151
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 352 of 353 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb:do_package_setscene)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Succeeded
NOTE: Running task 1312 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_patch)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Succeeded
NOTE: Running task 1313 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1314 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_populate_lic)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_populate_lic: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_populate_lic unihash changed to f1610e1f94f0ecbf1ab6ab4116fa2472e517e05bd1fbe86b912dd0c170b9a369
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1315 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure)
NOTE: recipe python3-setuptools-65.6.3-r0: task do_package_setscene: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Succeeded
NOTE: Running task 1316 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure_ptest_base)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1317 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile)
NOTE: recipe python3-setuptools-65.6.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1327 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Started
NOTE: recipe python3-setuptools-65.6.3-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-65.6.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Succeeded
NOTE: Running task 1328 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile_ptest_base)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1329 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Succeeded
NOTE: Running task 1330 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install_ptest_base)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1331 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_package)
NOTE: Running task 1332 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_populate_sysroot)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_populate_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Succeeded
NOTE: Running task 1333 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1334 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_package_write_rpm)
NOTE: Running task 1335 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_package_write_rpm)
NOTE: Running task 1336 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_package_qa)
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package_qa: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package_qa: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_package_write_rpm unihash changed to fc7db395cf0e4fc7159ed70ee1fe55cf4501c81a758da97155c0a19846d26919
NOTE: Running noexec task 1337 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_build)
NOTE: Tasks Summary: Attempted 1337 tasks of which 1317 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-src went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dbg went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkg-resources went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-staticdev went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dev went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-doc went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-locale went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2694617505234584552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 52 skipped, 0 masked, 0 errors.
Removing 23 recipes from the core2-32 sysroot...done.
Removing 47 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:341d8c50e3d6194d219e19ac61d41163638fe020"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 187 Local 179 Mirrors 0 Missed 8 Current 162 (95% match, 97% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 164 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 165 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 166 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 167 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 168 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 169 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 170 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 171 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 172 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 173 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 174 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 175 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 178 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 184 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 185 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-attrs-22.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-5.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-65.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 628 of 1322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 189 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-22.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-5.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-setuptools/65.6.3-r0/temp/log.do_packagedata_setscene.4070378
NOTE: recipe python3-packaging-22.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 208 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_package_setscene)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 209 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 214 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb:do_package_setscene)
NOTE: Running setscene task 215 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 216 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 217 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 218 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 758 of 1322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_unpack)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Succeeded
NOTE: Running task 782 of 1322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Succeeded
NOTE: Running task 791 of 1322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 792 of 1322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_populate_lic)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_populate_lic: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 231 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 233 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 235 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_populate_lic: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_populate_lic unihash changed to f1610e1f94f0ecbf1ab6ab4116fa2472e517e05bd1fbe86b912dd0c170b9a369
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 239 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 244 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-65.6.3-r0: task do_package_setscene: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 249 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pytest-7.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-65.6.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 251 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pytest-7.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 254 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 256 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 260 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 263 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 264 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 269 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 270 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 271 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 273 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 274 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 275 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 276 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 277 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 278 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 282 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 287 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 291 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 294 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 298 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 315 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 318 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 319 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 322 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 324 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 326 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 327 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 330 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 333 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 334 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 343 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 346 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 347 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1117 of 1322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1302 of 1322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-65.6.3-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-65.6.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1310 of 1322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Succeeded
NOTE: Running task 1311 of 1322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure_ptest_base)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1312 of 1322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Succeeded
NOTE: Running task 1313 of 1322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile_ptest_base)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1314 of 1322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Succeeded
NOTE: Running task 1315 of 1322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install_ptest_base)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1316 of 1322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_package)
NOTE: Running task 1317 of 1322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_populate_sysroot)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_populate_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Succeeded
NOTE: Running task 1318 of 1322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1319 of 1322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_package_write_rpm)
NOTE: Running task 1320 of 1322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_package_write_rpm)
NOTE: Running task 1321 of 1322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_package_qa)
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package_qa: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package_qa: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_package_write_rpm unihash changed to 1942819dbb91a53a76fd093fe1f4c01083589d5182a2b26bd3990c9cf75cfe0d
NOTE: Running noexec task 1322 of 1322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_build)
NOTE: Tasks Summary: Attempted 1322 tasks of which 1302 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-src went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dbg went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkg-resources went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-staticdev went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dev went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-doc went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-locale went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2694617505234584552==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wcwidth-upgrade-0.2.5-0.2.6.patch"

RnJvbSAyNDU0ZjdlNzZkZTM2MmRmOTFhYjdiYTRlMWJjMjA4NjliNjE0OGIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMTI6NDQ6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdjd2lkdGg6IHVwZ3JhZGUgMC4yLjUgLT4gMC4yLjYKCi0tLQogLi4uL3tweXRob24z
LXdjd2lkdGhfMC4yLjUuYmIgPT4gcHl0aG9uMy13Y3dpZHRoXzAuMi42LmJifSAgICAgfCAzICst
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtd2N3aWR0aF8wLjIuNS5iYiA9
PiBweXRob24zLXdjd2lkdGhfMC4yLjYuYmJ9ICg4MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdjd2lkdGhfMC4yLjUuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8wLjIuNi5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDgwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
d2N3aWR0aF8wLjIuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXdjd2lkdGhfMC4yLjYuYmIKaW5kZXggYTUzMmQzYzVjYi4uMzY4MTQ2ZGJhNCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdjd2lkdGhfMC4y
LjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdjd2lkdGhf
MC4yLjYuYmIKQEAgLTQsOCArNCw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9q
cXVhc3Qvd2N3aWR0aCIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vTElDRU5TRTttZDU9YjE1OTc5YzM5YTI1NDM4OTJmY2E4Y2Q4NmI0YjUyY2IiCiAKLVNSQ19V
UklbbWQ1c3VtXSA9ICJhMDdhNzVmOTlkMzE2ZTE0ODM4YWM3NjBjODMxZWEzNyIKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICJjNGQ2NDdiOTk4NzI5MjlmZGI3YmRjYWE0ZmJlN2YwMTQxM2VkM2Q5ODA3
N2RmNzk4NTMwZTViMDRmMTE2YzgzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImE1MjIwNzgwYTQw
NGRiZTMzNTM3ODk4NzA5NzhlNDcyY2ZlNDc3NzYxZjA2ZWU1NTA3NzI1NmU1MDliMTU2ZDAiCiAK
IGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMyBwdGVzdAogCi0tIAoyLjM3LjMKCg==

--===============2694617505234584552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1696 targets, 68 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:341d8c50e3d6194d219e19ac61d41163638fe020"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 15 Local 7 Mirrors 0 Missed 8 Current 338 (46% match, 97% complete)
Removing 1 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 340 of 353 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 341 of 353 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb:do_packagedata_setscene)
NOTE: Running task 899 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_fetch)
NOTE: recipe python3-setuptools-65.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Succeeded
NOTE: Running task 1300 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_unpack)
NOTE: Running task 1301 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-7.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-setuptools/65.6.3-r0/temp/log.do_packagedata_setscene.4064792
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 352 of 353 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb:do_package_setscene)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Succeeded
NOTE: Running task 1312 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_patch)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Succeeded
NOTE: Running task 1313 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1314 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_populate_lic)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_populate_lic: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_populate_lic unihash changed to f1610e1f94f0ecbf1ab6ab4116fa2472e517e05bd1fbe86b912dd0c170b9a369
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1315 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure)
NOTE: recipe python3-setuptools-65.6.3-r0: task do_package_setscene: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Succeeded
NOTE: Running task 1316 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure_ptest_base)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1317 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile)
NOTE: recipe python3-setuptools-65.6.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1327 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Started
NOTE: recipe python3-setuptools-65.6.3-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-65.6.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Succeeded
NOTE: Running task 1328 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile_ptest_base)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1329 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Succeeded
NOTE: Running task 1330 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install_ptest_base)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1331 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_package)
NOTE: Running task 1332 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_populate_sysroot)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_populate_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Succeeded
NOTE: Running task 1333 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1334 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_package_write_rpm)
NOTE: Running task 1335 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_package_write_rpm)
NOTE: Running task 1336 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_package_qa)
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package_qa: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package_qa: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_package_write_rpm unihash changed to 64aa43ac65e39852e85ca164966efc9864ed6cee8bef413103e8318b62156f66
NOTE: Running noexec task 1337 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_build)
NOTE: Tasks Summary: Attempted 1337 tasks of which 1317 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-src went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dbg went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkg-resources went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-staticdev went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dev went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-doc went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-locale went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2694617505234584552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1696 targets, 58 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:341d8c50e3d6194d219e19ac61d41163638fe020"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 15 Local 7 Mirrors 0 Missed 8 Current 338 (46% match, 97% complete)
Removing 1 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 340 of 353 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 341 of 353 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb:do_packagedata_setscene)
NOTE: Running task 899 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_fetch)
NOTE: recipe python3-setuptools-65.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Succeeded
NOTE: Running task 1300 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_unpack)
NOTE: Running task 1301 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-7.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-setuptools/65.6.3-r0/temp/log.do_packagedata_setscene.4062024
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 352 of 353 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb:do_package_setscene)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Succeeded
NOTE: Running task 1312 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_patch)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Succeeded
NOTE: Running task 1313 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1314 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_populate_lic)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_populate_lic: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_populate_lic unihash changed to f1610e1f94f0ecbf1ab6ab4116fa2472e517e05bd1fbe86b912dd0c170b9a369
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1315 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure)
NOTE: recipe python3-setuptools-65.6.3-r0: task do_package_setscene: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Succeeded
NOTE: Running task 1316 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure_ptest_base)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-setuptools-65.6.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1326 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1327 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile)
NOTE: recipe python3-setuptools-65.6.3-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Started
NOTE: recipe python3-setuptools-65.6.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Succeeded
NOTE: Running task 1328 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile_ptest_base)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1329 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Succeeded
NOTE: Running task 1330 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install_ptest_base)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1331 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_package)
NOTE: Running task 1332 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_populate_sysroot)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_populate_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Succeeded
NOTE: Running task 1333 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1334 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_package_write_rpm)
NOTE: Running task 1335 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_package_write_rpm)
NOTE: Running task 1336 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_package_qa)
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package_qa: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package_qa: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_package_write_rpm unihash changed to 609cefb1daa2f637b35636730f374618ad395700513fdd3413d5e3969c61ff3b
NOTE: Running noexec task 1337 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_build)
NOTE: Tasks Summary: Attempted 1337 tasks of which 1317 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-src went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dbg went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkg-resources went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-staticdev went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dev went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-doc went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-locale went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2694617505234584552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1696 targets, 75 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:341d8c50e3d6194d219e19ac61d41163638fe020"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 15 Local 7 Mirrors 0 Missed 8 Current 338 (46% match, 97% complete)
Removing 1 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 340 of 353 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 341 of 353 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb:do_packagedata_setscene)
NOTE: Running task 899 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_fetch)
NOTE: recipe python3-setuptools-65.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Succeeded
NOTE: Running task 1300 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_unpack)
NOTE: Running task 1301 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-7.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-setuptools/65.6.3-r0/temp/log.do_packagedata_setscene.4067524
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 352 of 353 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb:do_package_setscene)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Succeeded
NOTE: Running task 1312 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_patch)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Succeeded
NOTE: Running task 1313 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1314 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_populate_lic)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_populate_lic: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_populate_lic unihash changed to f1610e1f94f0ecbf1ab6ab4116fa2472e517e05bd1fbe86b912dd0c170b9a369
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1315 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure)
NOTE: recipe python3-setuptools-65.6.3-r0: task do_package_setscene: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Succeeded
NOTE: Running task 1316 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure_ptest_base)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1317 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile)
NOTE: recipe python3-setuptools-65.6.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1327 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Started
NOTE: recipe python3-setuptools-65.6.3-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-65.6.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Succeeded
NOTE: Running task 1328 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile_ptest_base)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1329 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Succeeded
NOTE: Running task 1330 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install_ptest_base)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1331 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_package)
NOTE: Running task 1332 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_populate_sysroot)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_populate_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Succeeded
NOTE: Running task 1333 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1334 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_package_write_rpm)
NOTE: Running task 1335 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_package_write_rpm)
NOTE: Running task 1336 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_package_qa)
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package_qa: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package_qa: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_package_write_rpm unihash changed to ab6fb77c5c9628ca92272bf75e8b3a0edd979c4aaa27ce4f700888dd2fdeed72
NOTE: Running noexec task 1337 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_build)
NOTE: Tasks Summary: Attempted 1337 tasks of which 1317 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-src went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dbg went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkg-resources went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-staticdev went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dev went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-doc went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-locale went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools went backwards which would break package feeds (from 0:65.7.0-r0 to 0:65.6.3-r0) [version-going-backwards]
ERROR: python3-setuptools-65.6.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2694617505234584552==--

