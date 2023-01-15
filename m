Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD36C7112B
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:31 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.145717.1673805743737565380
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cGI7nISf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010185b698c871-bfb23fd3-f4c2-4c7e-b50b-682b04510a3e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wz80xvq4ItS4gH3Pmh7Hqn9pYBKvIze4asMRWwf2SE4=;
	b=cGI7nISfSWuf9jRylQG00GCVcK6DKF3Y2qKtGMdXfcAlBAqUw5RvhL9z3e8MdZJv
	KbaiKqIWjPIl6Sdg87+v8NS/hyJYbk8FptQq1taA9rh/nUzDy03GbTP2ca5Y47bWPm4
	dd0Ak6sw3W2QtoKNhoLNwuS6L4XgTCuVYOHOQ8fM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wz80xvq4ItS4gH3Pmh7Hqn9pYBKvIze4asMRWwf2SE4=;
	b=GL5vP7xFkeT7RPq6GexOef89tDgYGOzxz/WDsTSVhh2K+pyYjhbpcQ/ibRE5fy5l
	0mN6vpiKxUPtMTEsMDnmCmgJBL2p4zSuzayzqbfiti4TfNH4Z1/nh9djHVM77Uw6YNK
	SNbG/aA7xsEdAgH5QXtQlfvbAhh0b96JD4mjxk1E=
Content-Type: multipart/mixed; boundary="===============5291934305031760629=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gi-docgen: upgrading to 2023.1 SUCCEEDED
Message-ID: <01010185b698c871-bfb23fd3-f4c2-4c7e-b50b-682b04510a3e-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175935

--===============5291934305031760629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gi-docgen* to *2023.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gi-docgen-upgrade-2022.2-2023.1.patch
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
--===============5291934305031760629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gi-docgen/gi-docgen-dbg: PV changed from "2022.2" to "2023.1"
packages/core2-32-poky-linux/gi-docgen/gi-docgen-dbg: PKGV changed from 2022.2 [default] to 2023.1 [default]
packages/core2-32-poky-linux/gi-docgen/gi-docgen-dev: PV changed from "2022.2" to "2023.1"
packages/core2-32-poky-linux/gi-docgen/gi-docgen-dev: PKGV changed from 2022.2 [default] to 2023.1 [default]
packages/core2-32-poky-linux/gi-docgen/gi-docgen-doc: PV changed from "2022.2" to "2023.1"
packages/core2-32-poky-linux/gi-docgen/gi-docgen-doc: PKGV changed from 2022.2 [default] to 2023.1 [default]
packages/core2-32-poky-linux/gi-docgen/gi-docgen-locale: PV changed from "2022.2" to "2023.1"
packages/core2-32-poky-linux/gi-docgen/gi-docgen-locale: PKGV changed from 2022.2 [default] to 2023.1 [default]
packages/core2-32-poky-linux/gi-docgen/gi-docgen-src: PV changed from "2022.2" to "2023.1"
packages/core2-32-poky-linux/gi-docgen/gi-docgen-src: PKGV changed from 2022.2 [default] to 2023.1 [default]
packages/core2-32-poky-linux/gi-docgen/gi-docgen-staticdev: PV changed from "2022.2" to "2023.1"
packages/core2-32-poky-linux/gi-docgen/gi-docgen-staticdev: PKGV changed from 2022.2 [default] to 2023.1 [default]
packages/core2-32-poky-linux/gi-docgen/gi-docgen: PKGSIZE changed from 2249391 to 2252741 (+0%)
packages/core2-32-poky-linux/gi-docgen/gi-docgen: PV changed from "2022.2" to "2023.1"
packages/core2-32-poky-linux/gi-docgen/gi-docgen: PKGV changed from 2022.2 [default] to 2023.1 [default]
packages/core2-32-poky-linux/gi-docgen: PV changed from "2022.2" to "2023.1"
packages/core2-32-poky-linux/gi-docgen: PKGV changed from 2022.2 [default] to 2023.1 [default]
Changes to packages/core2-32-poky-linux/gi-docgen (sysroot):
  /usr/lib/python3.11/site-packages/gi_docgen-2022.2.dist-info moved to /usr/lib/python3.11/site-packages/gi_docgen-2023.1.dist-info

--===============5291934305031760629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/gi-docgen (sysroot):
  /usr/lib/python3.11/site-packages/gi_docgen-2022.2.dist-info moved to /usr/lib/python3.11/site-packages/gi_docgen-2023.1.dist-info

--===============5291934305031760629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1697 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:132cd9bd349138bfc559aac5d88cb57b5c4f5fcb"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 72 Local 45 Mirrors 0 Missed 27 Current 268 (62% match, 92% complete)
Removing 1 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 283 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 726 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_fetch)
NOTE: Running task 730 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_fetch)
NOTE: Running task 732 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_fetch)
NOTE: Running task 778 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_fetch)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_fetch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_fetch: Started
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_fetch: Succeeded
NOTE: Running task 852 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_unpack)
NOTE: Running task 853 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_unpack)
NOTE: Running task 854 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_unpack)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: Running task 855 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_unpack)
NOTE: recipe python3-markdown-3.4.1-r0: task do_unpack: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_unpack: Started
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 856 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_patch)
NOTE: recipe python3-markdown-3.4.1-r0: task do_unpack: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: Running task 857 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_patch)
NOTE: Running task 858 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_patch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/xz/5.4.0-r0/temp/log.do_packagedata_setscene.2234950
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 323 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_package_setscene)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_patch: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_patch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_patch: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 859 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 860 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 861 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: Running task 862 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_patch)
NOTE: recipe python3-markdown-3.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: Running task 863 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 864 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_lic)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_lic: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_lic unihash changed to 6fd19e4faf8c673a804c1e94ee810b32d237e9293a6e6f34e53140633d83da74
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.4.0-r0: task do_package_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 325 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 327 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 328 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 329 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 332 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 334 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 335 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1112 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata)
NOTE: Running task 1153 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile_ptest_base)
NOTE: Running task 1154 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: Running task 1155 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1166 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1168 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1171 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_install)
NOTE: Running task 1196 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1228 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_install: Started
NOTE: Running task 1229 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: recipe xz-5.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1240 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_configure)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1241 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_configure)
NOTE: Running task 1242 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_configure)
NOTE: Running task 1243 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: Running task 1244 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install_ptest_base)
NOTE: recipe python3-markdown-3.4.1-r0: task do_configure: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_configure: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: Running task 1245 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1246 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_compile)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_configure: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Started
NOTE: Running task 1247 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_compile)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1248 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_compile)
NOTE: Running task 1249 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_compile: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_compile: Started
NOTE: Running task 1250 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_package)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1251 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_install: Succeeded
NOTE: Running task 1252 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_package)
NOTE: recipe python3-pygments-2.13.0-r0: task do_package: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_compile: Succeeded
NOTE: Running task 1253 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_install)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1254 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_install)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_install: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_install: Started
NOTE: Running task 1255 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Succeeded
NOTE: Running task 1256 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Started
NOTE: Running task 1257 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_packagedata)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_install: Succeeded
NOTE: Running task 1258 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_install)
NOTE: Running task 1259 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_package)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 1260 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1261 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_package_write_rpm)
NOTE: recipe python3-markdown-3.4.1-r0: task do_install: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1262 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package_write_rpm)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 1263 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_package)
NOTE: Running task 1264 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_install: Succeeded
NOTE: Running task 1265 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_package)
NOTE: recipe python3-markdown-3.4.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 1266 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_packagedata)
NOTE: Running task 1267 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_packagedata)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_packagedata: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_package: Succeeded
NOTE: Running task 1268 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_packagedata)
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 1269 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_package_write_rpm)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata: Failed
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_package: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1269 tasks of which 1212 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 39 ERROR messages, returning a non-zero exit code.
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-src went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-dbg went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-staticdev went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-dev went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-doc went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-locale went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-pygments/2.13.0-r0/temp/log.do_packagedata.2241832
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_packagedata) failed with exit code '1'

--===============5291934305031760629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 52 skipped, 0 masked, 0 errors.
Removing 27 recipes from the core2-32 sysroot...done.
Removing 42 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:132cd9bd349138bfc559aac5d88cb57b5c4f5fcb"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 196 Local 169 Mirrors 0 Missed 27 Current 140 (86% match, 91% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 145 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 146 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 147 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 152 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 157 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 163 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 166 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 518 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_fetch)
NOTE: Running task 521 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_fetch)
NOTE: Running task 522 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_fetch)
NOTE: Running task 539 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_fetch)
NOTE: recipe python3-setuptools-65.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_fetch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 576 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_unpack)
NOTE: Running task 577 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_unpack)
NOTE: Running task 578 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_unpack)
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: Running task 579 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_unpack)
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 191 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.13.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 580 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_fetch)
NOTE: Running task 581 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_fetch)
NOTE: Running task 582 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-65.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_unpack: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_unpack: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 591 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_patch)
NOTE: recipe python3-markdown-3.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: Running task 592 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_patch)
NOTE: Running task 593 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_patch)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 594 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_unpack)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 595 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_unpack)
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 596 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: Running setscene task 196 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 197 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 199 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 200 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_patch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_unpack: Started
NOTE: Running setscene task 203 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 204 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: Running task 601 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_deploy_source_date_epoch)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 602 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 603 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_patch)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 604 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 605 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_unpack: Succeeded
NOTE: Running task 616 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_patch)
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: Running task 617 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_patch)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_patch: Started
NOTE: Running setscene task 215 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 217 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 219 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 631 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 632 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_lic)
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_lic: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 222 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 226 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 227 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 228 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 229 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 230 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 231 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 233 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 234 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 235 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 236 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 237 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 238 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 239 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 240 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 241 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 242 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 243 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 246 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 251 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_lic unihash changed to 6fd19e4faf8c673a804c1e94ee810b32d237e9293a6e6f34e53140633d83da74
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 255 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 257 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 260 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 264 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/xz/5.4.0-r0/temp/log.do_packagedata_setscene.2271650
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 274 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_package_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 281 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 289 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.0-r0: task do_package_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 296 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 300 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 301 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 304 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 306 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 308 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 309 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 312 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 315 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 316 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 325 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 329 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 330 of 336 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1104 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata)
NOTE: Running task 1112 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1113 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1138 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1149 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1150 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1151 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1176 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1212 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_configure)
NOTE: Running task 1213 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: recipe python3-markdown-3.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1214 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_configure)
NOTE: Running task 1215 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_configure)
NOTE: recipe python3-pygments-2.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1216 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_configure)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1217 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_configure)
NOTE: Running task 1218 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_configure: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_configure: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: Running task 1219 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-markdown-3.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1220 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_configure_ptest_base)
NOTE: recipe python3-pygments-2.13.0-r0: task do_configure: Succeeded
NOTE: Running task 1221 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_compile)
NOTE: Running task 1222 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_compile)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_configure: Succeeded
NOTE: Running task 1223 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_compile)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1224 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_compile)
NOTE: Running task 1225 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_compile: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_compile: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1226 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: Running task 1227 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_compile: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1228 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_install)
NOTE: Running task 1229 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_install)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_install: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_install: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 1230 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1231 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_compile: Succeeded
NOTE: Running task 1232 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1233 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile_ptest_base)
NOTE: Running task 1234 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_install)
NOTE: recipe python3-markdown-3.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 1235 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_install)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_install: Succeeded
NOTE: Running task 1236 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: Running task 1237 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_package)
NOTE: recipe python3-pygments-2.13.0-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1238 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install)
NOTE: recipe python3-markdown-3.4.1-r0: task do_install: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 1239 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_package)
NOTE: Running task 1240 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_sysroot)
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: Running task 1241 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-markdown-3.4.1-r0: task do_install: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Succeeded
NOTE: Running task 1242 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install_ptest_base)
NOTE: Running task 1243 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1244 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1245 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package: Succeeded
NOTE: Running task 1246 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_packagedata)
NOTE: Running task 1247 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_packagedata)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_install: Succeeded
NOTE: Running task 1248 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_package)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_package: Started
NOTE: Running task 1249 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_package_write_rpm)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package_write_rpm: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 1250 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_packagedata)
NOTE: recipe python3-markdown-3.4.1-r0: task do_package: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: Running task 1251 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_packagedata)
NOTE: recipe python3-markdown-3.4.1-r0: task do_packagedata: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1252 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata)
NOTE: Running task 1253 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_packagedata)
NOTE: Running task 1254 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_package_write_rpm)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1255 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_package_write_rpm)
NOTE: Running task 1256 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package_write_rpm)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_package: Succeeded
NOTE: Running task 1257 of 1261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_packagedata)
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1257 tasks of which 1177 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 39 ERROR messages, returning a non-zero exit code.
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-src went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-dbg went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-staticdev went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-dev went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-doc went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-locale went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-pygments/2.13.0-r0/temp/log.do_packagedata.2282171
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_packagedata) failed with exit code '1'

--===============5291934305031760629==
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
meta-yocto-bsp       = "tmp-auh-upgrades:132cd9bd349138bfc559aac5d88cb57b5c4f5fcb"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 72 Local 45 Mirrors 0 Missed 27 Current 268 (62% match, 92% complete)
Removing 1 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 283 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 726 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_fetch)
NOTE: Running task 730 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_fetch)
NOTE: Running task 731 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_fetch)
NOTE: Running task 778 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_fetch)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_fetch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_fetch: Started
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_fetch: Succeeded
NOTE: Running task 852 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_unpack)
NOTE: Running task 853 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_unpack)
NOTE: Running task 854 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_unpack)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: Running task 855 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_unpack)
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_unpack: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_unpack: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 856 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_patch)
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 857 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_patch)
NOTE: Running task 858 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_patch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/xz/5.4.0-r0/temp/log.do_packagedata_setscene.2252300
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 323 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_package_setscene)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_patch: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_patch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_patch: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 859 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 860 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 861 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: Running task 862 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_patch)
NOTE: recipe python3-markdown-3.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: Running task 863 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 864 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_lic)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_lic: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_lic unihash changed to 6fd19e4faf8c673a804c1e94ee810b32d237e9293a6e6f34e53140633d83da74
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.4.0-r0: task do_package_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 325 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 327 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 328 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 329 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 332 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-mips-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-mips-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 334 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 335 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-mips-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-mips-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1118 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata)
NOTE: Running task 1153 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile_ptest_base)
NOTE: Running task 1154 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: Running task 1155 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1166 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1167 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1171 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_install)
NOTE: Running task 1196 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1228 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1229 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: recipe xz-5.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1240 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_configure)
NOTE: recipe python3-markdown-3.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1241 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_configure)
NOTE: Running task 1242 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_configure)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1243 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Succeeded
NOTE: Running task 1244 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install_ptest_base)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_configure: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_configure: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1245 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_compile)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_configure: Succeeded
NOTE: Running task 1246 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_compile)
NOTE: Running task 1247 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_compile)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1248 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: Running task 1249 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_compile: Started
NOTE: Running task 1250 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_package)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_compile: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1251 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_install: Succeeded
NOTE: Running task 1252 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_package)
NOTE: recipe python3-pygments-2.13.0-r0: task do_package: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_compile: Succeeded
NOTE: Running task 1253 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_install)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1254 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_install)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_install: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 1255 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_install)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Succeeded
NOTE: Running task 1256 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: Running task 1257 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_packagedata)
NOTE: recipe python3-markdown-3.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_install: Succeeded
NOTE: Running task 1258 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_install)
NOTE: Running task 1259 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_package)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 1260 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_install: Started
NOTE: Running task 1261 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_package_write_rpm)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1262 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_package)
NOTE: Running task 1263 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package_write_rpm)
NOTE: Running task 1264 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_sysroot)
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_install: Succeeded
NOTE: Running task 1265 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_package)
NOTE: recipe python3-markdown-3.4.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package: Succeeded
NOTE: Running task 1266 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_packagedata)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 1267 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_packagedata)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_packagedata: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_package: Succeeded
NOTE: Running task 1268 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_packagedata)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1269 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_package_write_rpm)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package_write_rpm: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 1270 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_packagedata)
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata: Failed
NOTE: recipe python3-markdown-3.4.1-r0: task do_package: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1270 tasks of which 1212 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 39 ERROR messages, returning a non-zero exit code.
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-src went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-dbg went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-staticdev went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-dev went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-doc went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-locale went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-pygments/2.13.0-r0/temp/log.do_packagedata.2259183
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_packagedata) failed with exit code '1'

--===============5291934305031760629==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gi-docgen-upgrade-2022.2-2023.1.patch"

RnJvbSBhNTAxZDRlMWFhYWExYjY4YjI0YjE4MDgzZGQ4YTUxNWMxODQ0NTkyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMTU6MDY6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
aS1kb2NnZW46IHVwZ3JhZGUgMjAyMi4yIC0+IDIwMjMuMQoKLS0tCiBtZXRhL3JlY2lwZXMtZ25v
bWUvZ2ktZG9jZ2VuL2dpLWRvY2dlbl9naXQuYmIgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWdub21lL2dpLWRvY2dlbi9naS1kb2NnZW5fZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2dp
LWRvY2dlbi9naS1kb2NnZW5fZ2l0LmJiCmluZGV4IGZhNDFmMmNjZDIuLjY0MzNhMGY4YjUgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9naS1kb2NnZW4vZ2ktZG9jZ2VuX2dpdC5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ2ktZG9jZ2VuL2dpLWRvY2dlbl9naXQuYmIKQEAgLTEw
LDggKzEwLDggQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vZ2ktZG9jZ2VuLnB5O2JlZ2lu
bGluZT0xO2VuZGxpbmU9NTttZDU9MmRjMGYxZjAxMjAyNDcKIAogU1JDX1VSSSA9ICJnaXQ6Ly9n
aXRsYWIuZ25vbWUub3JnL0dOT01FL2dpLWRvY2dlbi5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNo
PW1haW4iCiAKLVBWID0gIjIwMjIuMiIKLVNSQ1JFViA9ICJiZGRkMDI0YjA4NjUwZWZkZDI0NzA0
YzY3MGY1ODZlYjEyY2VjOWM5IgorUFYgPSAiMjAyMy4xIgorU1JDUkVWID0gIjYzYjRmYWQ0MTgx
ZTc5M2YzNGI3Nzc3YTg5ZTVjYjU4ZmU4YWM3ZTYiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAK
LS0gCjIuMzcuMwoK

--===============5291934305031760629==
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
meta-yocto-bsp       = "tmp-auh-upgrades:132cd9bd349138bfc559aac5d88cb57b5c4f5fcb"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 72 Local 45 Mirrors 0 Missed 27 Current 268 (62% match, 92% complete)
Removing 1 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 283 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 726 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_fetch)
NOTE: Running task 730 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_fetch)
NOTE: Running task 732 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_fetch)
NOTE: Running task 777 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_fetch)
NOTE: recipe python3-markdown-3.4.1-r0: task do_fetch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_fetch: Started
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_fetch: Succeeded
NOTE: Running task 852 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_unpack)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 853 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_unpack)
NOTE: Running task 854 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_unpack)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: Running task 855 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_unpack)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_unpack: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_unpack: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 856 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_patch)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 857 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_patch)
NOTE: Running task 858 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_patch)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_patch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/xz/5.4.0-r0/temp/log.do_packagedata_setscene.2243655
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 323 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_package_setscene)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_patch: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: Running task 859 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 860 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_patch)
NOTE: Running task 861 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 862 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: Running task 863 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 864 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_lic)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_lic: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_lic unihash changed to 6fd19e4faf8c673a804c1e94ee810b32d237e9293a6e6f34e53140633d83da74
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.4.0-r0: task do_package_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 325 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 327 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 328 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 329 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 332 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-arm-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-arm-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 334 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 335 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-arm-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-arm-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1118 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata)
NOTE: Running task 1153 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile_ptest_base)
NOTE: Running task 1154 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: Running task 1155 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1166 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1168 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1171 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_install)
NOTE: Running task 1195 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1228 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_install: Started
NOTE: Running task 1229 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: recipe xz-5.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1240 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_configure)
NOTE: Running task 1241 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_configure)
NOTE: recipe python3-markdown-3.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1242 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_configure)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1243 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: Running task 1244 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install_ptest_base)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_configure: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_configure: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_configure: Succeeded
NOTE: Running task 1245 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_compile)
NOTE: Running task 1246 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_compile)
NOTE: recipe python3-markdown-3.4.1-r0: task do_configure: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Started
NOTE: Running task 1247 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1248 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_compile)
NOTE: Running task 1249 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_compile: Started
NOTE: Running task 1250 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_package)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Started
NOTE: Running task 1251 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_install: Succeeded
NOTE: Running task 1252 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_package)
NOTE: recipe python3-pygments-2.13.0-r0: task do_package: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_compile: Succeeded
NOTE: Running task 1253 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_install)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1254 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_install)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_install: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 1255 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_install)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Succeeded
NOTE: Running task 1256 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: Running task 1257 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_packagedata)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_install: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1258 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_install)
NOTE: Running task 1259 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_package)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 1260 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_install: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1261 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_package_write_rpm)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1262 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1263 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_sysroot)
NOTE: Running task 1264 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package_write_rpm)
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_install: Succeeded
NOTE: Running task 1265 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_package)
NOTE: recipe python3-markdown-3.4.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 1266 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_packagedata)
NOTE: Running task 1267 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_packagedata)
NOTE: recipe python3-pygments-2.13.0-r0: task do_package: Succeeded
NOTE: Running task 1268 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_packagedata)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_packagedata: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 1269 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_package_write_rpm)
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata: Failed
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package_write_rpm: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_package: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1269 tasks of which 1212 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 39 ERROR messages, returning a non-zero exit code.
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-src went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-dbg went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-staticdev went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-dev went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-doc went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-locale went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-pygments/2.13.0-r0/temp/log.do_packagedata.2250371
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_packagedata) failed with exit code '1'

--===============5291934305031760629==
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
meta-yocto-bsp       = "tmp-auh-upgrades:132cd9bd349138bfc559aac5d88cb57b5c4f5fcb"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 72 Local 45 Mirrors 0 Missed 27 Current 268 (62% match, 92% complete)
Removing 1 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 283 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 726 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_fetch)
NOTE: Running task 730 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_fetch)
NOTE: Running task 732 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_fetch)
NOTE: Running task 778 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_fetch)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_fetch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_fetch: Started
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 852 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_unpack)
NOTE: Running task 853 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_unpack)
NOTE: Running task 854 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_unpack)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: Running task 855 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_unpack)
NOTE: recipe python3-markdown-3.4.1-r0: task do_unpack: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_unpack: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 856 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_patch)
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_unpack: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: Running task 857 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_patch)
NOTE: Running task 858 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_patch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/xz/5.4.0-r0/temp/log.do_packagedata_setscene.2261090
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 323 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_package_setscene)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_patch: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_patch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_patch: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_patch: Succeeded
NOTE: Running task 859 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 860 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 861 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markdown-3.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: Running task 862 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_patch)
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: Running task 863 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 864 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_lic)
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_lic: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_lic unihash changed to 6fd19e4faf8c673a804c1e94ee810b32d237e9293a6e6f34e53140633d83da74
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.4.0-r0: task do_package_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 325 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 327 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 328 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 329 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 332 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-powerpc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-powerpc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 334 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 335 of 340 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-powerpc-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-powerpc-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1117 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata)
NOTE: Running task 1153 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile_ptest_base)
NOTE: Running task 1154 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: Running task 1155 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1166 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1168 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1171 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_install)
NOTE: Running task 1196 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1228 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1229 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: recipe xz-5.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1240 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_configure)
NOTE: Running task 1241 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_configure)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1242 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_configure)
NOTE: Running task 1243 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Succeeded
NOTE: Running task 1244 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install_ptest_base)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_configure: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_configure: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: Running task 1245 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_compile)
NOTE: recipe python3-markdown-3.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1246 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_configure: Succeeded
NOTE: Running task 1247 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_compile)
NOTE: Running task 1248 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_compile)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1249 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1250 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_package)
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_compile: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1251 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_install: Succeeded
NOTE: Running task 1252 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_package)
NOTE: recipe python3-pygments-2.13.0-r0: task do_package: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_compile: Succeeded
NOTE: Running task 1253 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_install)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1254 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_install: Started
NOTE: Running task 1255 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_install)
NOTE: Running task 1256 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_install: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: Running task 1257 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_install: Succeeded
NOTE: Running task 1258 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_package_write_rpm)
NOTE: Running task 1259 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_package)
NOTE: recipe python3-markdown-3.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1260 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_install)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 1261 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_install: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1262 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package_write_rpm)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 1263 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_package)
NOTE: Running task 1264 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markdown-3.4.1-r0: task do_install: Succeeded
NOTE: Running task 1265 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.4.1.bb:do_package)
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package: Succeeded
NOTE: Running task 1266 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_packagedata)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 1267 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_packagedata)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_package: Succeeded
NOTE: Running task 1268 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_packagedata)
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1269 of 1276 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_package_write_rpm)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata: Failed
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: recipe python3-markdown-3.4.1-r0: task do_package: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1269 tasks of which 1212 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 39 ERROR messages, returning a non-zero exit code.
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.4.1-r0 to 0:5.4.0-r0) [version-going-backwards]
ERROR: xz-5.4.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-src went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-dbg went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-staticdev went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-dev went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-doc went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments-locale went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: QA Issue: Package version for package python3-pygments went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.13.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-pygments/2.13.0-r0/temp/log.do_packagedata.2267989
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_packagedata) failed with exit code '1'

--===============5291934305031760629==--

