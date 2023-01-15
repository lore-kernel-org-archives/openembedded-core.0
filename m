Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF21CC71149
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:31 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.145831.1673805744088210279
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GNao9fdS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010185b698c49b-6c8a400a-6488-4407-ba39-51eca6eb8c3f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=W03yX3iiUo8k5sj5950IE84mYdIkz6tAYanKkUIOsI0=;
	b=GNao9fdSIdWJtU1IiSfAkkM0pazdXkZfW+hpcK/i3nUp+GIHwlQsKztWFN7xdkUI
	DnqbAwsIxbmoA8ebBW0rDxQPNbcMzL4t5tpAdnBy4bH+cksfIMe7vRJ8YbPUj5h01fr
	iuorrfbbdAGkX6t2pWhzFMCtg0lEYQUze8H1wdZI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=W03yX3iiUo8k5sj5950IE84mYdIkz6tAYanKkUIOsI0=;
	b=VMJ3USZ1gkeFKBjAdijJ8EF3i9/VMoEhR2Xd/dScwt6oqVczchwZOCSpt5tIA1AJ
	u/Cy4qn4YInwkTZBfMCtFYcrgVJNEWzE4vDP0mwFdpFrsnZAFIYVZ6jW0y+fUcQvzc1
	XDzOVGplLUWRQ9JPQyUSy2bzIJdrjsTMtWbY2TiQ=
Content-Type: multipart/mixed; boundary="===============2881347209360719971=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytz: upgrading to 2022.7.1 SUCCEEDED
Message-ID: <01010185b698c49b-6c8a400a-6488-4407-ba39-51eca6eb8c3f-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175916

--===============2881347209360719971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pytz* to *2022.7.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytz-upgrade-2022.7-2022.7.1.patch
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
--===============2881347209360719971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pytz: PKGV changed from 2022.7 [default] to 2022.7.1 [default]
packages/core2-32-poky-linux/python3-pytz: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytz/pytz-2022.7.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/p/pytz/pytz-2022.7.1.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-pytz: PV changed from "2022.7" to "2022.7.1"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-dbg: PKGV changed from 2022.7 [default] to 2022.7.1 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-dbg: PV changed from "2022.7" to "2022.7.1"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-dev: PKGV changed from 2022.7 [default] to 2022.7.1 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-dev: PV changed from "2022.7" to "2022.7.1"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-doc: PKGV changed from 2022.7 [default] to 2022.7.1 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-doc: PV changed from "2022.7" to "2022.7.1"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-locale: PKGV changed from 2022.7 [default] to 2022.7.1 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-locale: PV changed from "2022.7" to "2022.7.1"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-ptest: PKGSIZE changed from 59131 to 59134 (+0%)
packages/core2-32-poky-linux/python3-pytz/python3-pytz-ptest: PKGV changed from 2022.7 [default] to 2022.7.1 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-ptest: PV changed from "2022.7" to "2022.7.1"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-src: PKGV changed from 2022.7 [default] to 2022.7.1 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-src: PV changed from "2022.7" to "2022.7.1"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-staticdev: PKGV changed from 2022.7 [default] to 2022.7.1 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-staticdev: PV changed from "2022.7" to "2022.7.1"
packages/core2-32-poky-linux/python3-pytz/python3-pytz: PKGSIZE changed from 1062320 to 1062247 (-0%)
packages/core2-32-poky-linux/python3-pytz/python3-pytz: PKGV changed from 2022.7 [default] to 2022.7.1 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz: PV changed from "2022.7" to "2022.7.1"
Changes to packages/core2-32-poky-linux/python3-pytz (sysroot):
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info was added
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info/LICENSE.txt was added
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info/zip-safe was added
  /usr/lib/python3.11/site-packages/pytz-2022.7.dist-info was removed
  /usr/lib/python3.11/site-packages/pytz-2022.7.dist-info/LICENSE.txt was removed
  /usr/lib/python3.11/site-packages/pytz-2022.7.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/pytz-2022.7.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/pytz-2022.7.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/pytz-2022.7.dist-info/WHEEL was removed
  /usr/lib/python3.11/site-packages/pytz-2022.7.dist-info/zip-safe was removed

--===============2881347209360719971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pytz (sysroot):
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info was added
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info/LICENSE.txt was added
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info/zip-safe was added
  /usr/lib/python3.11/site-packages/pytz-2022.7.dist-info was removed
  /usr/lib/python3.11/site-packages/pytz-2022.7.dist-info/LICENSE.txt was removed
  /usr/lib/python3.11/site-packages/pytz-2022.7.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/pytz-2022.7.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/pytz-2022.7.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/pytz-2022.7.dist-info/WHEEL was removed
  /usr/lib/python3.11/site-packages/pytz-2022.7.dist-info/zip-safe was removed

--===============2881347209360719971==
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
meta-yocto-bsp       = "tmp-auh-upgrades:33968789402654cb8f153df9bd7880e73e287687"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 13 Local 6 Mirrors 0 Missed 7 Current 343 (46% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 344 of 356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running task 899 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_fetch)
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1323 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_unpack)
NOTE: Running task 1324 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 354 of 356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1325 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_patch)
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-pytest/7.2.0-r0/temp/log.do_packagedata_setscene.3521949
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 355 of 356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_package_setscene)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1326 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1327 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_populate_lic)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_populate_lic: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_populate_lic unihash changed to c2cdffd7aff5846ca77ac88e9cbbdf6cb2425a7428fe9e8b5fc2c1d8f53ac6dd
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1328 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure)
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_setscene: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1329 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1339 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1340 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile)
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Succeeded
NOTE: Running task 1342 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile_ptest_base)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1343 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Succeeded
NOTE: Running task 1344 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install_ptest_base)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1345 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package)
NOTE: Running task 1346 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_populate_sysroot)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Succeeded
NOTE: Running task 1347 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1348 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package_write_rpm)
NOTE: Running task 1349 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package_qa)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_qa: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1350 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1350 tasks of which 1331 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2881347209360719971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 52 skipped, 0 masked, 0 errors.
Removing 22 recipes from the core2-32 sysroot...done.
Removing 48 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:33968789402654cb8f153df9bd7880e73e287687"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 189 Local 182 Mirrors 0 Missed 7 Current 163 (96% match, 98% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 164 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 172 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 173 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running task 628 of 1335 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 733 of 1335 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_unpack)
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 176 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 177 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 178 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 179 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 180 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 181 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 182 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 183 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 184 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 185 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 186 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 187 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 188 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 189 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 190 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata_setscene)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-5.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-65.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 734 of 1335 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_patch)
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 191 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 192 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 193 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 194 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 195 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-22.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-5.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-pytest/7.2.0-r0/temp/log.do_packagedata_setscene.3538059
NOTE: recipe python3-packaging-22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 204 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_package_setscene)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-65.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 747 of 1335 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 800 of 1335 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_populate_lic)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_populate_lic: Started
NOTE: Running setscene task 235 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 237 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 239 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_populate_lic unihash changed to c2cdffd7aff5846ca77ac88e9cbbdf6cb2425a7428fe9e8b5fc2c1d8f53ac6dd
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 243 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 248 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 254 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 255 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 257 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 263 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 264 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 272 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 273 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 274 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 276 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 277 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 278 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 280 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 281 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 285 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 293 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 297 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 304 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 315 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 319 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 321 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 322 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 326 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 329 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 330 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 333 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 336 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 337 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 346 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 349 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 350 of 352 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1123 of 1335 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1205 of 1335 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1324 of 1335 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1325 of 1335 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure_ptest_base)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1326 of 1335 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Succeeded
NOTE: Running task 1327 of 1335 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile_ptest_base)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1328 of 1335 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Succeeded
NOTE: Running task 1329 of 1335 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install_ptest_base)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1330 of 1335 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package)
NOTE: Running task 1331 of 1335 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_populate_sysroot)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Succeeded
NOTE: Running task 1332 of 1335 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1333 of 1335 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package_write_rpm)
NOTE: Running task 1334 of 1335 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package_qa)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_qa: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1335 of 1335 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1335 tasks of which 1316 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2881347209360719971==
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
meta-yocto-bsp       = "tmp-auh-upgrades:33968789402654cb8f153df9bd7880e73e287687"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 13 Local 6 Mirrors 0 Missed 7 Current 343 (46% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 344 of 356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running task 899 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_fetch)
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1323 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_unpack)
NOTE: Running task 1324 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 354 of 356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1325 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_patch)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-pytest/7.2.0-r0/temp/log.do_packagedata_setscene.3529828
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 355 of 356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_package_setscene)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1326 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1327 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_populate_lic)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_populate_lic: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_populate_lic unihash changed to c2cdffd7aff5846ca77ac88e9cbbdf6cb2425a7428fe9e8b5fc2c1d8f53ac6dd
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1328 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure)
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_setscene: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1329 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Started
NOTE: Setscene tasks completed
NOTE: Running task 1339 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1340 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile)
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Succeeded
NOTE: Running task 1342 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile_ptest_base)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1343 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Succeeded
NOTE: Running task 1344 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install_ptest_base)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1345 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package)
NOTE: Running task 1346 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_populate_sysroot)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Succeeded
NOTE: Running task 1347 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1348 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package_write_rpm)
NOTE: Running task 1349 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package_qa)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_qa: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1350 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1350 tasks of which 1331 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2881347209360719971==
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
meta-yocto-bsp       = "tmp-auh-upgrades:33968789402654cb8f153df9bd7880e73e287687"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 13 Local 6 Mirrors 0 Missed 7 Current 343 (46% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 344 of 356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running task 899 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_fetch)
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1323 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_unpack)
NOTE: Running task 1324 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 354 of 356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1325 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_patch)
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-pytest/7.2.0-r0/temp/log.do_packagedata_setscene.3525943
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 355 of 356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_package_setscene)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1326 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1327 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_populate_lic)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_populate_lic: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_populate_lic unihash changed to c2cdffd7aff5846ca77ac88e9cbbdf6cb2425a7428fe9e8b5fc2c1d8f53ac6dd
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1328 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure)
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_setscene: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1329 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Started
NOTE: Setscene tasks completed
NOTE: Running task 1339 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1340 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile)
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Succeeded
NOTE: Running task 1342 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile_ptest_base)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1343 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Succeeded
NOTE: Running task 1344 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install_ptest_base)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1345 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package)
NOTE: Running task 1346 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_populate_sysroot)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Succeeded
NOTE: Running task 1347 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1348 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package_write_rpm)
NOTE: Running task 1349 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package_qa)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_qa: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1350 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1350 tasks of which 1331 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2881347209360719971==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytz-upgrade-2022.7-2022.7.1.patch"

RnJvbSAyMDE5MTk1MjJhYWQ4M2I4OTk1MmY4ZDA5MGRiNDRiOTdhOGZmNzQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMTI6Mjc6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5dHo6IHVwZ3JhZGUgMjAyMi43IC0+IDIwMjIuNy4xCgotLS0KIC4uLi9weXRob24v
e3B5dGhvbjMtcHl0el8yMDIyLjcuYmIgPT4gcHl0aG9uMy1weXR6XzIwMjIuNy4xLmJifSB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHl0el8yMDIyLjcuYmIgPT4g
cHl0aG9uMy1weXR6XzIwMjIuNy4xLmJifSAoODklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXR6XzIwMjIuNy5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1weXR6XzIwMjIuNy4xLmJiCnNpbWlsYXJpdHkgaW5kZXgg
ODklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXR6
XzIwMjIuNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXB5dHpfMjAyMi43LjEuYmIKaW5kZXggYTZhNjljOGI1OS4uNTUzYjljZmExOCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dHpfMjAyMi43LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXR6XzIwMjIuNy4xLmJi
CkBAIC01LDcgKzUsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDtt
ZDU9MWE2N2ZjNDZjMWI1OTZjY2U1ZDIxMjA5YmJlNzU5OTkiCiAKIGluaGVyaXQgcHlwaSBzZXR1
cHRvb2xzMyBwdGVzdAogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2NjZmFlN2I0YjJjMDY3NDY0
YTY3MzNjNjI2MTY3M2ZkYjhmZDFiZTkwNTQ2MDM5NmI5N2EwNzNlOWZhNjgzYSIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICIwMWEwNjgxYzRiOTY4NGEyODMwNDYxNWViYTU1ZDFhYjMxYWUwMGJmNjhl
YzE1N2VjMzcwOGE4MTgyZGJiY2QwIgogCiBSREVQRU5EUzoke1BOfTpjbGFzcy10YXJnZXQgKz0g
IlwKICAgICAke1BZVEhPTl9QTn0tZGF0ZXRpbWUgXAotLSAKMi4zNy4zCgo=

--===============2881347209360719971==
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
meta-yocto-bsp       = "tmp-auh-upgrades:33968789402654cb8f153df9bd7880e73e287687"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 13 Local 6 Mirrors 0 Missed 7 Current 343 (46% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 344 of 356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running task 899 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_fetch)
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1323 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_unpack)
NOTE: Running task 1324 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 354 of 356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1325 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_patch)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-pytest/7.2.0-r0/temp/log.do_packagedata_setscene.3533763
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 355 of 356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_package_setscene)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1326 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1327 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_populate_lic)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_populate_lic: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_populate_lic unihash changed to c2cdffd7aff5846ca77ac88e9cbbdf6cb2425a7428fe9e8b5fc2c1d8f53ac6dd
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1328 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure)
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_setscene: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1329 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Started
NOTE: Setscene tasks completed
NOTE: Running task 1339 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1340 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile)
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Succeeded
NOTE: Running task 1342 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile_ptest_base)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1343 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Succeeded
NOTE: Running task 1344 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install_ptest_base)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1345 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package)
NOTE: Running task 1346 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_populate_sysroot)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Succeeded
NOTE: Running task 1347 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1348 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package_write_rpm)
NOTE: Running task 1349 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package_qa)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_qa: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1350 of 1350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1350 tasks of which 1331 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:7.2.1-r0 to 0:7.2.0-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2881347209360719971==--

