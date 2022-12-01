Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53876C64EC3
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:34 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.46817.1669908626228612075
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=AdcI9NyE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010184ce4f77f5-c07008bc-e6c9-4334-bc85-693d87d5e4a4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908625;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sAc8sFzNlAvJ//7aR9sZKe14bdXFv9mI/5aIYYlO4F4=;
	b=AdcI9NyE5OJiKacorJqfyOnMg8Anv04Mt0FchyFy5XxWiqyh2AqXFbe4JU4CPtok
	Q+hPAEdpKP0ckB6mFDjCnJ2VYdTuhZH9wX1PLK67F2yPt5o0oQ7IOAEGNKjra7f42wu
	J92TVmNaKWDE0qKWiRnaqfdx98io3p03bbiNRD4w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908625;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sAc8sFzNlAvJ//7aR9sZKe14bdXFv9mI/5aIYYlO4F4=;
	b=SetBprn4TSor7izLGLFvbBM3bwlZTGgRCbYkmC0hhNT339uZel6h2V7sB0JwY5+f
	Xi9juWWlIQyGZoBnz7cEyoil0zpHnsyHV+VGUmvyk21g/pBMWmK0vKr6gGt5gwYGTsY
	Nb/sHhpWpeBXn/VMHlhVGflJSvFWszyITPCtgE4c=
Content-Type: multipart/mixed; boundary="===============2157861690533087477=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.0.2 SUCCEEDED
Message-ID: <01010184ce4f77f5-c07008bc-e6c9-4334-bc85-693d87d5e4a4-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174133

--===============2157861690533087477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *6.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.0.1-6.0.2.patch
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
--===============2157861690533087477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1668 targets, 54 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:47599a284a727b5e8159ee6d5f0cacaca71912c6"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 15 Local 4 Mirrors 0 Missed 11 Current 299 (26% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 300 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_populate_sysroot_setscene)
NOTE: Running task 790 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 926 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1089 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_unpack)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
NOTE: Running task 1090 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libxcrypt/4.4.30-r0/temp/log.do_packagedata_setscene.796009
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 313 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_package_setscene)
NOTE: recipe libxcrypt-4.4.30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1091 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_patch)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: Running task 1092 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1093 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1094 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_populate_lic)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_populate_lic: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_package_setscene: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_populate_lic unihash changed to d3c2cee66dd3b2efaf102a4cafeb60dbfebeb3c35e94dfa1e0fc45415d050854
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcrypt-4.4.30-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1122 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1126 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: Running task 1143 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1155 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: Running task 1156 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1157 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: Running task 1158 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1159 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Succeeded
NOTE: Running task 1160 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1161 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot)
NOTE: Running task 1162 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1163 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1164 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_configure)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1165 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_compile)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Succeeded
NOTE: Running task 1166 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1167 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_install)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_install: Succeeded
NOTE: Running task 1168 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_package)
NOTE: Running task 1169 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package: Succeeded
NOTE: Running task 1170 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1171 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_package_write_rpm)
NOTE: Running task 1172 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_package_qa)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package_qa: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package_qa: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1173 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1173 tasks of which 1143 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2157861690533087477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.0.1 [default] to 6.0.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 17282872 to 17318148 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.0.1" to "6.0.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.0.1 [default] to 6.0.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.0.1" to "6.0.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.0.1 [default] to 6.0.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.0.1" to "6.0.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.0.1 [default] to 6.0.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.0.1" to "6.0.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: FILELIST: directory renamed /usr/src/debug/btrfs-tools/6.0.1-r0/common -> /usr/src/debug/btrfs-tools/6.0.2-r0/common, directory renamed /usr/src/debug/btrfs-tools/6.0.1-r0/cmds -> /usr/src/debug/btrfs-tools/6.0.2-r0/cmds, directory renamed /usr/src/debug/btrfs-tools/6.0.1-r0/convert -> /usr/src/debug/btrfs-tools/6.0.2-r0/convert, directory renamed /usr/src/debug/btrfs-tools/6.0.1-r0/image -> /usr/src/debug/btrfs-tools/6.0.2-r0/image, directory renamed /usr/src/debug/btrfs-tools/6.0.1-r0 -> /usr/src/debug/btrfs-tools/6.0.2-r0, directory renamed /usr/src/debug/btrfs-tools/6.0.1-r0/crypto -> /usr/src/debug/btrfs-tools/6.0.2-r0/crypto, directory renamed /usr/src/debug/btrfs-tools/6.0.1-r0/kernel-shared -> /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared, directory renamed /usr/src/debug/btrfs-tools/6.0.1-r0/mkfs -> /usr/src/debug/btrfs-tools/6.0.2-r0/mkfs, directory renamed /usr/src/debug/btrfs-tools/6.0.1-r0/libbtrfs -> /usr/src
 /debug/btrfs-tools/6.0.2-r0/libbtrfs, directory renamed /usr/src/debug/btrfs-tools/6.0.1-r0/libbtrfsutil -> /usr/src/debug/btrfs-tools/6.0.2-r0/libbtrfsutil, directory renamed /usr/src/debug/btrfs-tools/6.0.1-r0/libbtrfsutil/python -> /usr/src/debug/btrfs-tools/6.0.2-r0/libbtrfsutil/python, directory renamed /usr/src/debug/btrfs-tools/6.0.1-r0/check -> /usr/src/debug/btrfs-tools/6.0.2-r0/check, removed "/usr/src/debug/btrfs-tools/6.0.1-r0/kernel-lib/rbtree.c /usr/src/debug/btrfs-tools/6.0.1-r0/kernel-lib/overflow.h /usr/src/debug/btrfs-tools/6.0.1-r0/kernel-lib/rbtree_types.h /usr/src/debug/btrfs-tools/6.0.1-r0/kernel-lib/rbtree_augmented.h /usr/src/debug/btrfs-tools/6.0.1-r0/kernel-lib/list.h /usr/src/debug/btrfs-tools/6.0.1-r0/kernel-lib/raid56.h /usr/src/debug/btrfs-tools/6.0.1-r0/kernel-lib/bitops.h /usr/src/debug/btrfs-tools/6.0.1-r0/kernel-lib/raid56.c /usr/src/debug/btrfs-tools/6.0.1-r0/kernel-lib/rbtree.h /usr/src/debug/btrfs-tools/6.0.1-r0/kernel-lib/list_sort.c /usr/src/de
 bug/btrfs-tools/6.0.1-r0/kernel-lib/list_sort.h /usr/src/debug/btrfs-tools/6.0.1-r0/kernel-lib/tables.c", added "/usr/src/debug/btrfs-tools/6.0.2-r0/kernel-lib/list_sort.h /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-lib/raid56.h /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-lib/bitmap.h /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-lib/list.h /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-lib/rbtree_types.h /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-lib/list_sort.c /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-lib/raid56.c /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-lib/bitops.h /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-lib/rbtree_augmented.h /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-lib/overflow.h /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-lib/rbtree.h /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-lib/tables.c /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-lib/rbtree.c"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.0.1 [default] to 6.0.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 3656541 to 3662686 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.0.1" to "6.0.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.0.1 [default] to 6.0.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.0.1" to "6.0.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.0.1 [default] to 6.0.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 6119474 to 6127698 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.0.1" to "6.0.2"
packages/core2-32-poky-linux/btrfs-tools: PKGV changed from 6.0.1 [default] to 6.0.2 [default]
packages/core2-32-poky-linux/btrfs-tools: PV changed from "6.0.1" to "6.0.2"
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.0.1-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.0.2-py3.11.egg-info

--===============2157861690533087477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1670 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (887 cached, 1 parsed). 1668 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:47599a284a727b5e8159ee6d5f0cacaca71912c6"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 15 Local 4 Mirrors 0 Missed 11 Current 299 (26% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 300 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_populate_sysroot_setscene)
NOTE: Running task 790 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 926 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1089 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_unpack)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
NOTE: Running task 1090 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libxcrypt/4.4.30-r0/temp/log.do_packagedata_setscene.777429
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 313 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_package_setscene)
NOTE: recipe libxcrypt-4.4.30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1091 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_patch)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: Running task 1092 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1093 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1094 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_populate_lic)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_populate_lic: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_package_setscene: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_populate_lic unihash changed to d3c2cee66dd3b2efaf102a4cafeb60dbfebeb3c35e94dfa1e0fc45415d050854
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcrypt-4.4.30-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1122 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1126 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: Running task 1143 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1155 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: Running task 1156 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1157 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: Running task 1158 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1159 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Succeeded
NOTE: Running task 1160 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1161 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot)
NOTE: Running task 1162 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1163 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1164 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_configure)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1165 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_compile)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Succeeded
NOTE: Running task 1166 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1167 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_install)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_install: Succeeded
NOTE: Running task 1168 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_package)
NOTE: Running task 1169 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package: Succeeded
NOTE: Running task 1170 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1171 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_package_write_rpm)
NOTE: Running task 1172 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_package_qa)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package_qa: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package_qa: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1173 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1173 tasks of which 1143 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2157861690533087477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.0.1-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.0.2-py3.11.egg-info

--===============2157861690533087477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1668 targets, 71 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:47599a284a727b5e8159ee6d5f0cacaca71912c6"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 15 Local 4 Mirrors 0 Missed 11 Current 299 (26% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 300 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_populate_sysroot_setscene)
NOTE: Running task 790 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 926 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1089 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_unpack)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
NOTE: Running task 1090 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libxcrypt/4.4.30-r0/temp/log.do_packagedata_setscene.833278
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 313 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_package_setscene)
NOTE: recipe libxcrypt-4.4.30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1091 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_patch)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1092 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: Running task 1093 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1094 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_populate_lic)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_populate_lic: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_package_setscene: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_populate_lic unihash changed to d3c2cee66dd3b2efaf102a4cafeb60dbfebeb3c35e94dfa1e0fc45415d050854
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcrypt-4.4.30-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1122 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1126 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: Running task 1143 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1155 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: Running task 1156 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1157 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: Running task 1158 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1159 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Succeeded
NOTE: Running task 1160 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1161 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot)
NOTE: Running task 1162 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1163 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1164 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_configure)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1165 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_compile)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Succeeded
NOTE: Running task 1166 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1167 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_install)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_install: Succeeded
NOTE: Running task 1168 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_package)
NOTE: Running task 1169 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package: Succeeded
NOTE: Running task 1170 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1171 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_package_write_rpm)
NOTE: Running task 1172 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_package_qa)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package_qa: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package_qa: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1173 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1173 tasks of which 1143 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2157861690533087477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1668 targets, 64 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:47599a284a727b5e8159ee6d5f0cacaca71912c6"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 15 Local 4 Mirrors 0 Missed 11 Current 299 (26% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 300 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_populate_sysroot_setscene)
NOTE: Running task 790 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 926 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1089 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_unpack)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
NOTE: Running task 1090 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libxcrypt/4.4.30-r0/temp/log.do_packagedata_setscene.814543
NOTE: recipe libxcrypt-4.4.30-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 313 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_package_setscene)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1091 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_patch)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: Running task 1092 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1093 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1094 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_populate_lic)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_populate_lic: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_package_setscene: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_populate_lic unihash changed to d3c2cee66dd3b2efaf102a4cafeb60dbfebeb3c35e94dfa1e0fc45415d050854
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcrypt-4.4.30-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1122 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1126 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: Running task 1143 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1155 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: Running task 1156 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1157 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: Running task 1158 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1159 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Succeeded
NOTE: Running task 1160 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1161 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot)
NOTE: Running task 1162 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1163 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1164 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_configure)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1165 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_compile)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Succeeded
NOTE: Running task 1166 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1167 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_install)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_install: Succeeded
NOTE: Running task 1168 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_package)
NOTE: Running task 1169 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package: Succeeded
NOTE: Running task 1170 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1171 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_package_write_rpm)
NOTE: Running task 1172 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_package_qa)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package_qa: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package_qa: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1173 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1173 tasks of which 1143 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2157861690533087477==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.0.1-6.0.2.patch"

RnJvbSA2YmE5ZDY0YTJhOWU4N2Y3MzE1NDg2OTUwNTY0ZDhhMWIxNGI4NjhkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAwODowNDozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJ0
cmZzLXRvb2xzOiB1cGdyYWRlIDYuMC4xIC0+IDYuMC4yCgotLS0KIC4uLi9idHJmcy10b29scy97
YnRyZnMtdG9vbHNfNi4wLjEuYmIgPT4gYnRyZnMtdG9vbHNfNi4wLjIuYmJ9ICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy97YnRyZnMtdG9vbHNfNi4wLjEuYmIgPT4gYnRy
ZnMtdG9vbHNfNi4wLjIuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMC4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTgl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29s
c182LjAuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0
cmZzLXRvb2xzXzYuMC4yLmJiCmluZGV4IDcxNDQwODdhMTEuLjg3MmZiYTZiNmQgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjAuMS5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4w
LjIuYmIKQEAgLTE4LDcgKzE4LDcgQEAgREVQRU5EUyA9ICJ1dGlsLWxpbnV4IHpsaWIiCiBTUkNf
VVJJID0gImdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9rZGF2
ZS9idHJmcy1wcm9ncy5naXQ7YnJhbmNoPW1hc3RlciBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAx
LUFkZC1hLXBvc3NpYmlsaXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0
Y2ggXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiNDQxZDAxNTU2ODczMzg1ZDU1ZmQ0OTQwZjUw
ZWU3YWUxZmNmYjEzZCIKK1NSQ1JFViA9ICJmZjk2NGJhNmFlZjk4YmQxYmFmZThmZjliMDA4ODUw
MWIzMGJkZDI3IgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiBc
Ci0tIAoyLjMxLjEKCg==

--===============2157861690533087477==--

