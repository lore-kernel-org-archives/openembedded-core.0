Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810B0C64E92
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.854.1667349634052922150
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BMLgtMBp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018435c8595d-0ca01728-1dcf-45ad-927b-4558b08a3ae1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OqP4BUiV93pJecAwhPrLQkWVDegV2UIAANQDn1j/61c=;
	b=BMLgtMBpWlCPXrxcVC9j4+/rkFwfhQqdyhcbFictIlS3Nmcg/5RVNP47DAH6bB68
	+x7XkJk9n6I4kKVvr8g8gN0ivNxtwECxYRFjMaxMn+sUYpZvqe195JgBmTkiQlqTJmo
	rtq+2mWY/0TDaSLixOaHpMzVwi3ZkXJLMPz1XLtE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OqP4BUiV93pJecAwhPrLQkWVDegV2UIAANQDn1j/61c=;
	b=KVNxb0KQozPI4O0k3ZnXVMdFkYyKwBhYq8xVwdy7RE21ZWa1NvCXBr2Q1K6zUY3x
	YyiqDzrcseoZhqNN5funZ7mRoQYX7isPYM/FrKjuJqy7kCN7AieLG1iHDoDuqQQ0v8j
	s8pW3m/rsp5lm9tWRvkcNtGtCiz91WtHqea6SQcs=
Content-Type: multipart/mixed; boundary="===============5955258854989345632=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytz: upgrading to 2022.6 SUCCEEDED
Message-ID: <0101018435c8595d-0ca01728-1dcf-45ad-927b-4558b08a3ae1-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172444

--===============5955258854989345632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pytz* to *2022.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytz-upgrade-2022.4-2022.6.patch
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
--===============5955258854989345632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pytz: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytz/pytz-2022.4.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/p/pytz/pytz-2022.6.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-pytz: PKGV changed from 2022.4 [default] to 2022.6 [default]
packages/core2-32-poky-linux/python3-pytz: PV changed from "2022.4" to "2022.6"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-dbg: PKGV changed from 2022.4 [default] to 2022.6 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-dbg: PV changed from "2022.4" to "2022.6"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-dev: PKGV changed from 2022.4 [default] to 2022.6 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-dev: PV changed from "2022.4" to "2022.6"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-doc: PKGV changed from 2022.4 [default] to 2022.6 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-doc: PV changed from "2022.4" to "2022.6"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-locale: PKGV changed from 2022.4 [default] to 2022.6 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-locale: PV changed from "2022.4" to "2022.6"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-ptest: PKGSIZE changed from 59166 to 59021 (-0%)
packages/core2-32-poky-linux/python3-pytz/python3-pytz-ptest: PKGV changed from 2022.4 [default] to 2022.6 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-ptest: PV changed from "2022.4" to "2022.6"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-src: PKGV changed from 2022.4 [default] to 2022.6 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-src: PV changed from "2022.4" to "2022.6"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-staticdev: PKGV changed from 2022.4 [default] to 2022.6 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-staticdev: PV changed from "2022.4" to "2022.6"
packages/core2-32-poky-linux/python3-pytz/python3-pytz: PKGSIZE changed from 1077013 to 1072686 (-0%)
packages/core2-32-poky-linux/python3-pytz/python3-pytz: PKGV changed from 2022.4 [default] to 2022.6 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz: PV changed from "2022.4" to "2022.6"
Changes to packages/core2-32-poky-linux/python3-pytz (sysroot):
  /usr/lib/python3.11/site-packages/pytz-2022.4.dist-info moved to /usr/lib/python3.11/site-packages/pytz-2022.6.dist-info

--===============5955258854989345632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pytz (sysroot):
  /usr/lib/python3.11/site-packages/pytz-2022.4.dist-info moved to /usr/lib/python3.11/site-packages/pytz-2022.6.dist-info

--===============5955258854989345632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 53 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:c942de9c6ab073f01571eb22b87323a0b5161b88"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 17 Local 10 Mirrors 0 Missed 7 Current 336 (58% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 338 of 353 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running task 881 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_fetch)
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_fetch: Succeeded
NOTE: Running task 1313 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_unpack)
NOTE: Running task 1314 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 351 of 353 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_packagedata_setscene)
NOTE: recipe python3-pytz-2022.6-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_unpack: Succeeded
NOTE: Running task 1315 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_patch)
NOTE: recipe python3-pytz-2022.6-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-pytest/7.1.3-r0/temp/log.do_packagedata_setscene.894638
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 352 of 353 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_package_setscene)
NOTE: recipe python3-pytz-2022.6-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1316 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1317 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_populate_lic)
NOTE: recipe python3-pytz-2022.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_populate_lic: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_populate_lic unihash changed to be9e06e8f15cab708ee932fa64b0f3fb22fa0bcf30e270522baad10b6c46532f
NOTE: recipe python3-pytz-2022.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1318 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_configure)
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_setscene: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_configure: Succeeded
NOTE: Running task 1319 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1329 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.6-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1330 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_compile)
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_compile: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_compile: Succeeded
NOTE: Running task 1332 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_compile_ptest_base)
NOTE: recipe python3-pytz-2022.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1333 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_install)
NOTE: recipe python3-pytz-2022.6-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_install: Succeeded
NOTE: Running task 1334 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_install_ptest_base)
NOTE: recipe python3-pytz-2022.6-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1335 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_package)
NOTE: Running task 1336 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_populate_sysroot)
NOTE: recipe python3-pytz-2022.6-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_package: Succeeded
NOTE: Running task 1337 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.6-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1338 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_package_write_rpm)
NOTE: Running task 1339 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_package_qa)
NOTE: recipe python3-pytz-2022.6-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_package_qa: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1340 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_build)
NOTE: Tasks Summary: Attempted 1340 tasks of which 1321 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5955258854989345632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1665 targets, 49 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:c942de9c6ab073f01571eb22b87323a0b5161b88"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 192 Local 185 Mirrors 0 Missed 7 Current 157 (96% match, 97% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 158 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 166 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 167 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running task 611 of 1325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_fetch: Succeeded
NOTE: Running task 724 of 1325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_unpack)
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 173 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 174 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 175 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 176 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 177 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 178 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 179 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 180 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 181 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 182 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 183 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 184 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 185 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 186 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 187 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_packagedata_setscene)
NOTE: recipe python3-pytz-2022.6-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 725 of 1325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_patch)
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 188 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 189 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 190 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 191 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 192 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-pytest/7.1.3-r0/temp/log.do_packagedata_setscene.902589
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 209 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_package_setscene)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-65.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 758 of 1325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 795 of 1325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_populate_lic)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 230 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 234 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_populate_lic: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 239 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_populate_lic unihash changed to be9e06e8f15cab708ee932fa64b0f3fb22fa0bcf30e270522baad10b6c46532f
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 246 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 249 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 251 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 257 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 258 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 264 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 274 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 275 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 276 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 277 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 280 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 281 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 282 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 283 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 284 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 286 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 293 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 296 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 305 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 311 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 313 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
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
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 324 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 326 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 327 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 330 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 336 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 337 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 343 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 346 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 347 of 349 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1113 of 1325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1195 of 1325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1314 of 1325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_configure)
NOTE: recipe python3-pytz-2022.6-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_configure: Succeeded
NOTE: Running task 1315 of 1325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_configure_ptest_base)
NOTE: recipe python3-pytz-2022.6-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1316 of 1325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_compile)
NOTE: recipe python3-pytz-2022.6-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_compile: Succeeded
NOTE: Running task 1317 of 1325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_compile_ptest_base)
NOTE: recipe python3-pytz-2022.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1318 of 1325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_install)
NOTE: recipe python3-pytz-2022.6-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_install: Succeeded
NOTE: Running task 1319 of 1325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_install_ptest_base)
NOTE: recipe python3-pytz-2022.6-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1320 of 1325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_package)
NOTE: Running task 1321 of 1325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_populate_sysroot)
NOTE: recipe python3-pytz-2022.6-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_package: Succeeded
NOTE: Running task 1322 of 1325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.6-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1323 of 1325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_package_write_rpm)
NOTE: Running task 1324 of 1325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_package_qa)
NOTE: recipe python3-pytz-2022.6-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_package_qa: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1325 of 1325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_build)
NOTE: Tasks Summary: Attempted 1325 tasks of which 1306 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5955258854989345632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 63 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:c942de9c6ab073f01571eb22b87323a0b5161b88"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 17 Local 10 Mirrors 0 Missed 7 Current 336 (58% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 338 of 353 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running task 881 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_fetch)
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_fetch: Succeeded
NOTE: Running task 1313 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_unpack)
NOTE: Running task 1314 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 351 of 353 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_packagedata_setscene)
NOTE: recipe python3-pytz-2022.6-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_unpack: Succeeded
NOTE: Running task 1315 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_patch)
NOTE: recipe python3-pytz-2022.6-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-pytest/7.1.3-r0/temp/log.do_packagedata_setscene.897228
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 352 of 353 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_package_setscene)
NOTE: recipe python3-pytz-2022.6-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1316 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1317 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_populate_lic)
NOTE: recipe python3-pytz-2022.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_populate_lic: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_populate_lic unihash changed to be9e06e8f15cab708ee932fa64b0f3fb22fa0bcf30e270522baad10b6c46532f
NOTE: recipe python3-pytz-2022.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1318 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_configure)
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_setscene: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_configure: Succeeded
NOTE: Running task 1319 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1329 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.6-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1330 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_compile)
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_compile: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_compile: Succeeded
NOTE: Running task 1332 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_compile_ptest_base)
NOTE: recipe python3-pytz-2022.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1333 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_install)
NOTE: recipe python3-pytz-2022.6-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_install: Succeeded
NOTE: Running task 1334 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_install_ptest_base)
NOTE: recipe python3-pytz-2022.6-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1335 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_package)
NOTE: Running task 1336 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_populate_sysroot)
NOTE: recipe python3-pytz-2022.6-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_package: Succeeded
NOTE: Running task 1337 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.6-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1338 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_package_write_rpm)
NOTE: Running task 1339 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_package_qa)
NOTE: recipe python3-pytz-2022.6-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_package_qa: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1340 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_build)
NOTE: Tasks Summary: Attempted 1340 tasks of which 1321 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5955258854989345632==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytz-upgrade-2022.4-2022.6.patch"

RnJvbSA0NzhhOTkzZDVmM2E0Mjc1ZjE1ZDUxZTliMWIwZTE2MGU1ZGY0OTA2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxMDo1ODozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHl0ejogdXBncmFkZSAyMDIyLjQgLT4gMjAyMi42CgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcHl0el8yMDIyLjQuYmIgPT4gcHl0aG9uMy1weXR6XzIwMjIuNi5iYn0gICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHl0el8yMDIyLjQuYmIgPT4gcHl0
aG9uMy1weXR6XzIwMjIuNi5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0el8yMDIyLjQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcHl0el8yMDIyLjYuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dHpfMjAyMi40
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0el8y
MDIyLjYuYmIKaW5kZXggMzMwMzE0ZjFiZC4uOTYzMWY1OTI4OCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dHpfMjAyMi40LmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXR6XzIwMjIuNi5iYgpAQCAtNSw3ICs1
LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PTFhNjdmYzQ2
YzFiNTk2Y2NlNWQyMTIwOWJiZTc1OTk5IgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMgcHRl
c3QKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ4Y2U3OTlkODNiNmY4YWFiMjAyMGUzNjliNjI3
NDQ2Njk2NjE5ZTc5NjQ1NDE5NjEwYjlmYWNkOTA5YjMxNzQiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiZTg5NTEyNDA2Yjc5M2NhMzlmNTk3MWJjOTk5Y2M1MzhjZTEyNWMwZTUxYzI3OTQxYmVmNDU2
OGI0NjAwOTVlMiIKIAogUkRFUEVORFM6JHtQTn06Y2xhc3MtdGFyZ2V0ICs9ICJcCiAgICAgJHtQ
WVRIT05fUE59LWRhdGV0aW1lIFwKLS0gCjIuMzEuMQoK

--===============5955258854989345632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 70 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:c942de9c6ab073f01571eb22b87323a0b5161b88"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 17 Local 10 Mirrors 0 Missed 7 Current 336 (58% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 338 of 353 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running task 881 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_fetch)
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_fetch: Succeeded
NOTE: Running task 1313 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_unpack)
NOTE: Running task 1314 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 351 of 353 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_packagedata_setscene)
NOTE: recipe python3-pytz-2022.6-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_unpack: Succeeded
NOTE: Running task 1315 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_patch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-pytest/7.1.3-r0/temp/log.do_packagedata_setscene.899861
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-pytz-2022.6-r0: task do_patch: Started
NOTE: Running setscene task 352 of 353 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_package_setscene)
NOTE: recipe python3-pytz-2022.6-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1316 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1317 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_populate_lic)
NOTE: recipe python3-pytz-2022.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_populate_lic: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_populate_lic unihash changed to be9e06e8f15cab708ee932fa64b0f3fb22fa0bcf30e270522baad10b6c46532f
NOTE: recipe python3-pytz-2022.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1318 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_configure)
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_setscene: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_configure: Succeeded
NOTE: Running task 1319 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1329 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.6-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1330 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_compile)
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_compile: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_compile: Succeeded
NOTE: Running task 1332 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_compile_ptest_base)
NOTE: recipe python3-pytz-2022.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1333 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_install)
NOTE: recipe python3-pytz-2022.6-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_install: Succeeded
NOTE: Running task 1334 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_install_ptest_base)
NOTE: recipe python3-pytz-2022.6-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1335 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_package)
NOTE: Running task 1336 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_populate_sysroot)
NOTE: recipe python3-pytz-2022.6-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_package: Succeeded
NOTE: Running task 1337 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.6-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1338 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_package_write_rpm)
NOTE: Running task 1339 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_package_qa)
NOTE: recipe python3-pytz-2022.6-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_package_qa: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1340 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_build)
NOTE: Tasks Summary: Attempted 1340 tasks of which 1321 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5955258854989345632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1666 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1664 targets, 35 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:c942de9c6ab073f01571eb22b87323a0b5161b88"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 17 Local 10 Mirrors 0 Missed 7 Current 336 (58% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 338 of 353 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running task 881 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_fetch)
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_fetch: Succeeded
NOTE: Running task 1313 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_unpack)
NOTE: Running task 1314 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 351 of 353 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_packagedata_setscene)
NOTE: recipe python3-pytz-2022.6-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_unpack: Succeeded
NOTE: Running task 1315 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_patch)
NOTE: recipe python3-pytz-2022.6-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-pytest/7.1.3-r0/temp/log.do_packagedata_setscene.892005
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 352 of 353 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_package_setscene)
NOTE: recipe python3-pytz-2022.6-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1316 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1317 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_populate_lic)
NOTE: recipe python3-pytz-2022.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_populate_lic: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_populate_lic unihash changed to be9e06e8f15cab708ee932fa64b0f3fb22fa0bcf30e270522baad10b6c46532f
NOTE: recipe python3-pytz-2022.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1318 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_configure)
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_setscene: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_configure: Succeeded
NOTE: Running task 1319 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1329 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.6-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1330 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_compile)
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_compile: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_compile: Succeeded
NOTE: Running task 1332 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_compile_ptest_base)
NOTE: recipe python3-pytz-2022.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1333 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_install)
NOTE: recipe python3-pytz-2022.6-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_install: Succeeded
NOTE: Running task 1334 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_install_ptest_base)
NOTE: recipe python3-pytz-2022.6-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1335 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_package)
NOTE: Running task 1336 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_populate_sysroot)
NOTE: recipe python3-pytz-2022.6-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_package: Succeeded
NOTE: Running task 1337 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.6-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1338 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_package_write_rpm)
NOTE: Running task 1339 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_package_qa)
NOTE: recipe python3-pytz-2022.6-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_package_qa: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1340 of 1340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_build)
NOTE: Tasks Summary: Attempted 1340 tasks of which 1321 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.3-r0) [version-going-backwards]
ERROR: python3-pytest-7.1.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5955258854989345632==--

