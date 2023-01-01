Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0CD4C678DA
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:18 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.20672.1672605967732715202
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SkRzl8Ov;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101856f15a478-20cfe053-bd6b-4e85-ba44-ec0ef885b8f2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605968;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=c2jJsID7ly6C5jBE4SuW3DqwP5Gs5LNrES5NJ6gXEds=;
	b=SkRzl8OvHuHSLd5u/M1OA/oUHANcqordriZxTfz/nSHBG2u+pdd86newId2rmpyH
	FIr6jgHHcfM6gJ/1wNBllxk4dUKnu8WoW+amkjkUALADQcpwDqpHWUwrB3DW58vKfDI
	1f8cUb9JkcVYD4QPSXQsiAo2Zo+kDX+0wwrQ8XGU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605968;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=c2jJsID7ly6C5jBE4SuW3DqwP5Gs5LNrES5NJ6gXEds=;
	b=A1RFmhkql/2DUlFhA6Tm1hPDMn1/ekVAV2SKebfDC+JX+dUj6E+wyXc/AwrswdtQ
	xQd8lJr8IuxU9ONh2DNd+Y2LZ8CCe55I+fuSXzZEKUzwEkCdfq0jEBKz/M7r1yPojw6
	R2BIBmaqZ9ivJHohrr4Rgp2MNVF6X9CXEFkUZFjg=
Content-Type: multipart/mixed; boundary="===============2572324689668193185=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsolv: upgrading to 0.7.23 SUCCEEDED
Message-ID: <010101856f15a478-20cfe053-bd6b-4e85-ba44-ec0ef885b8f2-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175286

--===============2572324689668193185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsolv* to *0.7.23* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsolv-upgrade-0.7.22-0.7.23.patch
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
--===============2572324689668193185==
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
meta-yocto-bsp       = "tmp-auh-upgrades:bca5d5e4a6c31e457cbf703266a5c038018e080b"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 42 Local 5 Mirrors 0 Missed 37 Current 442 (11% match, 92% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1257 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1259 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1263 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile_ptest_base)
NOTE: Running task 1437 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1502 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_compile)
NOTE: Running task 1538 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: Running task 1552 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.23.bb:do_fetch)
NOTE: Running task 1612 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_packagedata)
NOTE: Running task 1618 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata)
NOTE: Running task 1619 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: Running task 1641 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1642 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 1643 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1644 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libsolv-0.7.23-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Started
NOTE: Running task 1645 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install)
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: recipe file-5.43-r0: task do_packagedata: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsolv-0.7.23-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: Running task 1646 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1647 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 1648 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: recipe file-5.43-r0: task do_packagedata: Failed
NOTE: Running task 1649 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.23.bb:do_unpack)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe libsolv-0.7.23-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe libsolv-0.7.23-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1649 tasks of which 1630 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-src went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-dbg went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-staticdev went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-dev went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-doc went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-locale went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/file/5.43-r0/temp/log.do_packagedata.448140
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_packagedata) failed with exit code '1'

--===============2572324689668193185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libsolv: PV changed from "0.7.22" to "0.7.23"
packages/core2-32-poky-linux/libsolv: PKGV changed from 0.7.22 [default] to 0.7.23 [default]
packages/core2-32-poky-linux/libsolv/libsolv-dbg: PV changed from "0.7.22" to "0.7.23"
packages/core2-32-poky-linux/libsolv/libsolv-dbg: PKGV changed from 0.7.22 [default] to 0.7.23 [default]
packages/core2-32-poky-linux/libsolv/libsolv-dbg: PKGSIZE changed from 2314768 to 2364692 (+2%)
packages/core2-32-poky-linux/libsolv/libsolv-dev: PV changed from "0.7.22" to "0.7.23"
packages/core2-32-poky-linux/libsolv/libsolv-dev: PKGV changed from 0.7.22 [default] to 0.7.23 [default]
packages/core2-32-poky-linux/libsolv/libsolv-dev: PKGSIZE changed from 126599 to 128805 (+2%)
packages/core2-32-poky-linux/libsolv/libsolv-doc: PV changed from "0.7.22" to "0.7.23"
packages/core2-32-poky-linux/libsolv/libsolv-doc: PKGV changed from 0.7.22 [default] to 0.7.23 [default]
packages/core2-32-poky-linux/libsolv/libsolv-doc: PKGSIZE changed from 281775 to 296630 (+5%)
packages/core2-32-poky-linux/libsolv/libsolv-locale: PV changed from "0.7.22" to "0.7.23"
packages/core2-32-poky-linux/libsolv/libsolv-locale: PKGV changed from 0.7.22 [default] to 0.7.23 [default]
packages/core2-32-poky-linux/libsolv/libsolv-src: FILELIST: directory renamed /usr/src/debug/libsolv/0.7.22-r0/tools -> /usr/src/debug/libsolv/0.7.23-r0/tools, directory renamed /usr/src/debug/libsolv/0.7.22-r0/ext -> /usr/src/debug/libsolv/0.7.23-r0/ext, removed "/usr/src/debug/libsolv/0.7.22-r0/src/solverdebug.h /usr/src/debug/libsolv/0.7.22-r0/src/solvversion.h /usr/src/debug/libsolv/0.7.22-r0/src/solver_util.c /usr/src/debug/libsolv/0.7.22-r0/src/solverdebug.c /usr/src/debug/libsolv/0.7.22-r0/src/solvversion.c /usr/src/debug/libsolv/0.7.22-r0/src/dataiterator.h /usr/src/debug/libsolv/0.7.22-r0/src/repo_solv.c /usr/src/debug/libsolv/0.7.22-r0/src/repo_solv.h /usr/src/debug/libsolv/0.7.22-r0/src/repo_write.c /usr/src/debug/libsolv/0.7.22-r0/src/poolarch.c /usr/src/debug/libsolv/0.7.22-r0/src/poolid.h /usr/src/debug/libsolv/0.7.22-r0/src/repo_write.h /usr/src/debug/libsolv/0.7.22-r0/src/solver_private.h /usr/src/debug/libsolv/0.7.22-r0/src/poolid.c /usr/src/debug/libsolv/0.7.22-r0/s
 rc/poolarch.h /usr/src/debug/libsolv/0.7.22-r0/src/bitmap.c /usr/src/debug/libsolv/0.7.22-r0/src/problems.h /usr/src/debug/libsolv/0.7.22-r0/src/cplxdeps.c /usr/src/debug/libsolv/0.7.22-r0/src/repopage.h /usr/src/debug/libsolv/0.7.22-r0/src/policy.h /usr/src/debug/libsolv/0.7.22-r0/src/evr.c /usr/src/debug/libsolv/0.7.22-r0/src/md5.c /usr/src/debug/libsolv/0.7.22-r0/src/selection.h /usr/src/debug/libsolv/0.7.22-r0/src/cplxdeps.h /usr/src/debug/libsolv/0.7.22-r0/src/repopage.c /usr/src/debug/libsolv/0.7.22-r0/src/bitmap.h /usr/src/debug/libsolv/0.7.22-r0/src/problems.c /usr/src/debug/libsolv/0.7.22-r0/src/selection.c /usr/src/debug/libsolv/0.7.22-r0/src/md5.h /usr/src/debug/libsolv/0.7.22-r0/src/evr.h /usr/src/debug/libsolv/0.7.22-r0/src/policy.c /usr/src/debug/libsolv/0.7.22-r0/src/userinstalled.c /usr/src/debug/libsolv/0.7.22-r0/src/sha2.h /usr/src/debug/libsolv/0.7.22-r0/src/chksum.c /usr/src/debug/libsolv/0.7.22-r0/src/fileprovides.c /usr/src/debug/libsolv/0.7.22-r0/src/repo.c /u
 sr/src/debug/libsolv/0.7.22-r0/src/order.c /usr/src/debug/libsolv/0.7.22-r0/src/chksum.h /usr/src/debug/libsolv/0.7.22-r0/src/repo.h /usr/src/debug/libsolv/0.7.22-r0/src/knownid.h /usr/src/debug/libsolv/0.7.22-r0/src/sha2.c /usr/src/debug/libsolv/0.7.22-r0/src/sha1.h /usr/src/debug/libsolv/0.7.22-r0/src/util.h /usr/src/debug/libsolv/0.7.22-r0/src/pool.h /usr/src/debug/libsolv/0.7.22-r0/src/repodata.c /usr/src/debug/libsolv/0.7.22-r0/src/repopack.h /usr/src/debug/libsolv/0.7.22-r0/src/transaction.c /usr/src/debug/libsolv/0.7.22-r0/src/rules.c /usr/src/debug/libsolv/0.7.22-r0/src/pool.c /usr/src/debug/libsolv/0.7.22-r0/src/repodata.h /usr/src/debug/libsolv/0.7.22-r0/src/sha1.c /usr/src/debug/libsolv/0.7.22-r0/src/transaction.h /usr/src/debug/libsolv/0.7.22-r0/src/filelistfilter.c /usr/src/debug/libsolv/0.7.22-r0/src/rules.h /usr/src/debug/libsolv/0.7.22-r0/src/util.c /usr/src/debug/libsolv/0.7.22-r0/src/dirpool.h /usr/src/debug/libsolv/0.7.22-r0/src/solvable.c /usr/src/debug/libsolv/0
 .7.22-r0/src/poolvendor.h /usr/src/debug/libsolv/0.7.22-r0/src/poolvendor.c /usr/src/debug/libsolv/0.7.22-r0/src/solvable.h /usr/src/debug/libsolv/0.7.22-r0/src/diskusage.c /usr/src/debug/libsolv/0.7.22-r0/src/suse.c /usr/src/debug/libsolv/0.7.22-r0/src/solver.c /usr/src/debug/libsolv/0.7.22-r0/src/queue.h /usr/src/debug/libsolv/0.7.22-r0/src/dirpool.c /usr/src/debug/libsolv/0.7.22-r0/src/cleandeps.c /usr/src/debug/libsolv/0.7.22-r0/src/strpool.c /usr/src/debug/libsolv/0.7.22-r0/src/hash.h /usr/src/debug/libsolv/0.7.22-r0/src/strpool.h /usr/src/debug/libsolv/0.7.22-r0/src/queue.c /usr/src/debug/libsolv/0.7.22-r0/src/solver.h /usr/src/debug/libsolv/0.7.22-r0/src/pooltypes.h", added "/usr/src/debug/libsolv/0.7.23-r0/src/solverdebug.h /usr/src/debug/libsolv/0.7.23-r0/src/solvversion.h /usr/src/debug/libsolv/0.7.23-r0/src/solver_util.c /usr/src/debug/libsolv/0.7.23-r0/src/solverdebug.c /usr/src/debug/libsolv/0.7.23-r0/src/solvversion.c /usr/src/debug/libsolv/0.7.23-r0/src/dataiterator.h
  /usr/src/debug/libsolv/0.7.23-r0/src/repo_solv.c /usr/src/debug/libsolv/0.7.23-r0/src/repo_solv.h /usr/src/debug/libsolv/0.7.23-r0/src/repo_write.c /usr/src/debug/libsolv/0.7.23-r0/src/poolarch.c /usr/src/debug/libsolv/0.7.23-r0/src/poolid.h /usr/src/debug/libsolv/0.7.23-r0/src/repo_write.h /usr/src/debug/libsolv/0.7.23-r0/src/solver_private.h /usr/src/debug/libsolv/0.7.23-r0/src/poolid.c /usr/src/debug/libsolv/0.7.23-r0/src/poolarch.h /usr/src/debug/libsolv/0.7.23-r0/src/bitmap.c /usr/src/debug/libsolv/0.7.23-r0/src/problems.h /usr/src/debug/libsolv/0.7.23-r0/src/cplxdeps.c /usr/src/debug/libsolv/0.7.23-r0/src/repopage.h /usr/src/debug/libsolv/0.7.23-r0/src/policy.h /usr/src/debug/libsolv/0.7.23-r0/src/evr.c /usr/src/debug/libsolv/0.7.23-r0/src/md5.c /usr/src/debug/libsolv/0.7.23-r0/src/selection.h /usr/src/debug/libsolv/0.7.23-r0/src/cplxdeps.h /usr/src/debug/libsolv/0.7.23-r0/src/repopage.c /usr/src/debug/libsolv/0.7.23-r0/src/bitmap.h /usr/src/debug/libsolv/0.7.23-r0/src/proble
 ms.c /usr/src/debug/libsolv/0.7.23-r0/src/selection.c /usr/src/debug/libsolv/0.7.23-r0/src/evr.h /usr/src/debug/libsolv/0.7.23-r0/src/md5.h /usr/src/debug/libsolv/0.7.23-r0/src/policy.c /usr/src/debug/libsolv/0.7.23-r0/src/userinstalled.c /usr/src/debug/libsolv/0.7.23-r0/src/sha2.h /usr/src/debug/libsolv/0.7.23-r0/src/chksum.c /usr/src/debug/libsolv/0.7.23-r0/src/fileprovides.c /usr/src/debug/libsolv/0.7.23-r0/src/repo.c /usr/src/debug/libsolv/0.7.23-r0/src/order.c /usr/src/debug/libsolv/0.7.23-r0/src/chksum.h /usr/src/debug/libsolv/0.7.23-r0/src/repo.h /usr/src/debug/libsolv/0.7.23-r0/src/knownid.h /usr/src/debug/libsolv/0.7.23-r0/src/sha2.c /usr/src/debug/libsolv/0.7.23-r0/src/sha1.h /usr/src/debug/libsolv/0.7.23-r0/src/util.h /usr/src/debug/libsolv/0.7.23-r0/src/pool.h /usr/src/debug/libsolv/0.7.23-r0/src/repodata.c /usr/src/debug/libsolv/0.7.23-r0/src/repopack.h /usr/src/debug/libsolv/0.7.23-r0/src/transaction.c /usr/src/debug/libsolv/0.7.23-r0/src/rules.c /usr/src/debug/libsolv
 /0.7.23-r0/src/pool.c /usr/src/debug/libsolv/0.7.23-r0/src/repodata.h /usr/src/debug/libsolv/0.7.23-r0/src/sha1.c /usr/src/debug/libsolv/0.7.23-r0/src/transaction.h /usr/src/debug/libsolv/0.7.23-r0/src/filelistfilter.c /usr/src/debug/libsolv/0.7.23-r0/src/rules.h /usr/src/debug/libsolv/0.7.23-r0/src/util.c /usr/src/debug/libsolv/0.7.23-r0/src/dirpool.h /usr/src/debug/libsolv/0.7.23-r0/src/decision.c /usr/src/debug/libsolv/0.7.23-r0/src/poolvendor.h /usr/src/debug/libsolv/0.7.23-r0/src/solvable.c /usr/src/debug/libsolv/0.7.23-r0/src/poolvendor.c /usr/src/debug/libsolv/0.7.23-r0/src/solvable.h /usr/src/debug/libsolv/0.7.23-r0/src/diskusage.c /usr/src/debug/libsolv/0.7.23-r0/src/suse.c /usr/src/debug/libsolv/0.7.23-r0/src/solver.c /usr/src/debug/libsolv/0.7.23-r0/src/queue.h /usr/src/debug/libsolv/0.7.23-r0/src/dirpool.c /usr/src/debug/libsolv/0.7.23-r0/src/cleandeps.c /usr/src/debug/libsolv/0.7.23-r0/src/strpool.c /usr/src/debug/libsolv/0.7.23-r0/src/hash.h /usr/src/debug/libsolv/0.7.
 23-r0/src/strpool.h /usr/src/debug/libsolv/0.7.23-r0/src/queue.c /usr/src/debug/libsolv/0.7.23-r0/src/solver.h /usr/src/debug/libsolv/0.7.23-r0/src/pooltypes.h"
packages/core2-32-poky-linux/libsolv/libsolv-src: PV changed from "0.7.22" to "0.7.23"
packages/core2-32-poky-linux/libsolv/libsolv-src: PKGV changed from 0.7.22 [default] to 0.7.23 [default]
packages/core2-32-poky-linux/libsolv/libsolv-src: PKGSIZE changed from 1590486 to 1637219 (+3%)
packages/core2-32-poky-linux/libsolv/libsolv-staticdev: PV changed from "0.7.22" to "0.7.23"
packages/core2-32-poky-linux/libsolv/libsolv-staticdev: PKGV changed from 0.7.22 [default] to 0.7.23 [default]
packages/core2-32-poky-linux/libsolv/libsolv-tools: PV changed from "0.7.22" to "0.7.23"
packages/core2-32-poky-linux/libsolv/libsolv-tools: PKGV changed from 0.7.22 [default] to 0.7.23 [default]
packages/core2-32-poky-linux/libsolv/libsolv-tools: PKGSIZE changed from 175308 to 179404 (+2%)
packages/core2-32-poky-linux/libsolv/libsolv: PV changed from "0.7.22" to "0.7.23"
packages/core2-32-poky-linux/libsolv/libsolv: PKGV changed from 0.7.22 [default] to 0.7.23 [default]
packages/core2-32-poky-linux/libsolv/libsolv: PKGSIZE changed from 653752 to 674232 (+3%)
packages/core2-32-poky-linux/libsolv/libsolvext: PV changed from "0.7.22" to "0.7.23"
packages/core2-32-poky-linux/libsolv/libsolvext: PKGV changed from 0.7.22 [default] to 0.7.23 [default]

--===============2572324689668193185==
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
meta-yocto-bsp       = "tmp-auh-upgrades:bca5d5e4a6c31e457cbf703266a5c038018e080b"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 41 Local 5 Mirrors 0 Missed 36 Current 443 (12% match, 92% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1259 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1260 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1265 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile_ptest_base)
NOTE: Running task 1451 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_compile)
NOTE: Running task 1504 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_compile)
NOTE: Running task 1540 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: Running task 1554 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.23.bb:do_fetch)
NOTE: Running task 1616 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_packagedata)
NOTE: Running task 1624 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1643 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 1644 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1645 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1646 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.8-r0: task do_compile: Started
NOTE: recipe libsolv-0.7.23-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: Running task 1647 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install)
NOTE: recipe file-5.43-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Started
NOTE: recipe libsolv-0.7.23-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: Running task 1648 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.23.bb:do_unpack)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 1649 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1650 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: Running task 1651 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe file-5.43-r0: task do_packagedata: Failed
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe libsolv-0.7.23-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe libsolv-0.7.23-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1651 tasks of which 1633 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-src went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-dbg went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-staticdev went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-dev went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-doc went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-locale went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/file/5.43-r0/temp/log.do_packagedata.421002
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_packagedata) failed with exit code '1'

--===============2572324689668193185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1690 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:bca5d5e4a6c31e457cbf703266a5c038018e080b"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 41 Local 5 Mirrors 0 Missed 36 Current 443 (12% match, 92% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1259 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1262 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1265 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile_ptest_base)
NOTE: Running task 1437 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1502 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_compile)
NOTE: Running task 1538 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: Running task 1552 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.23.bb:do_fetch)
NOTE: Running task 1614 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: Running task 1619 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: Running task 1641 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 1642 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1643 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1644 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libsolv-0.7.23-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: Running task 1645 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install)
NOTE: recipe file-5.43-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe libsolv-0.7.23-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1646 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.23.bb:do_unpack)
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: Running task 1647 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: Running task 1648 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1649 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe file-5.43-r0: task do_packagedata: Failed
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe libsolv-0.7.23-r0: task do_unpack: Started
NOTE: recipe gnutls-3.7.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe libsolv-0.7.23-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1649 tasks of which 1631 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-src went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-dbg went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-staticdev went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-dev went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-doc went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-locale went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/file/5.43-r0/temp/log.do_packagedata.414044
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_packagedata) failed with exit code '1'

--===============2572324689668193185==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsolv-upgrade-0.7.22-0.7.23.patch"

RnJvbSBkNWQ5ZTQwNDc0MTRmMWRmMjU5MmZjYTAyYTVlYjYyYjYwNzI2NTJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAxMjowMDoxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnNvbHY6IHVwZ3JhZGUgMC43LjIyIC0+IDAuNy4yMwoKLS0tCiAuLi4vbGlic29sdi97bGlic29s
dl8wLjcuMjIuYmIgPT4gbGlic29sdl8wLjcuMjMuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbGlic29sdi97bGlic29sdl8wLjcuMjIuYmIgPT4gbGlic29sdl8wLjcu
MjMuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYv
bGlic29sdl8wLjcuMjIuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJzb2x2
XzAuNy4yMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvbGlic29sdi9saWJzb2x2XzAuNy4yMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2xpYnNvbHYvbGlic29sdl8wLjcuMjMuYmIKaW5kZXggYzI3YmY5YzY3ZS4uMTI1
NjkwNTcyMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGlic29s
dl8wLjcuMjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGlic29sdl8w
LjcuMjMuYmIKQEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL29w
ZW5TVVNFL2xpYnNvbHYuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMS11dGlscy1Db25zaWRlLW11c2wtd2hlbi13cmFwcGluZy1xc29ydF9y
LnBhdGNoIFwKICIKIAotU1JDUkVWID0gImVhMTE0YjI1N2I3OGJkYTZlZTNlNDIzODExOGVkOTNi
YzU3YzU5ODQiCitTUkNSRVYgPSAiNmRlYWNhN2NmNjFlYzJiMzJjNGEzYjQ5NGE3NTFjOGQxNWVm
YmU4YiIKIAogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+XGQrKFwuXGQr
KSspIgogCi0tIAoyLjM3LjMKCg==

--===============2572324689668193185==
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
meta-yocto-bsp       = "tmp-auh-upgrades:bca5d5e4a6c31e457cbf703266a5c038018e080b"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 41 Local 5 Mirrors 0 Missed 36 Current 443 (12% match, 92% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1261 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1262 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1265 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile_ptest_base)
NOTE: Running task 1449 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_compile)
NOTE: Running task 1504 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_compile)
NOTE: Running task 1540 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: Running task 1554 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.23.bb:do_fetch)
NOTE: Running task 1616 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: Running task 1621 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: Running task 1643 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 1644 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1645 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1646 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.8-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libsolv-0.7.23-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: Running task 1647 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install)
NOTE: recipe file-5.43-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsolv-0.7.23-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.43-r0: task do_packagedata: Failed
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1648 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1648 tasks of which 1633 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-src went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-dbg went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-staticdev went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-dev went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-doc went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file-locale went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: QA Issue: Package version for package file went backwards which would break package feeds (from 0:5.44-r0 to 0:5.43-r0) [version-going-backwards]
ERROR: file-5.43-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/file/5.43-r0/temp/log.do_packagedata.455173
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_packagedata) failed with exit code '1'

--===============2572324689668193185==--

