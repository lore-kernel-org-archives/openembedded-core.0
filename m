Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F145C77B6D
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:36 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.144503.1671136351713779831
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bqo7vzVD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010185177d1e80-9b3c5de3-a826-4929-95dc-55c0184a3481-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136354;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XlmDm8d1saevhmotS1ZZB5zuYrxtVOhtIRy6IqgKg/k=;
	b=bqo7vzVDLBHhEpmzGPsZRKQ4Nnx8M1ht+4bm0pJAoKFcDC9IArFdhVVkbXJf2PLg
	UGeDE2AViNzX12eMSg+VONOsByDhAfso+6wLBL+sqztYKcsnsyrbOYjCJj1e0sW3okq
	lv6b7b5KQwQKKUWaLVCpCbjEpcqzgM30SbslPC6I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136354;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XlmDm8d1saevhmotS1ZZB5zuYrxtVOhtIRy6IqgKg/k=;
	b=fcumPF968TUcTHau2oTq2N8SDCrxNjXhaxU7SLReUkVNomMTtQjQ/9spTvtFpovR
	DPiCIfl6tJsheFpmVSwk0gJx+BaCuzULHiqyjHWNpDBL7HXRnG5mbu8NgHjTyT/OWf2
	l6n3i5XdvB+e28+Q5+uHnHu6zNTSPWckOAWgwmL8=
Content-Type: multipart/mixed; boundary="===============5630023313373192621=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libmpc: upgrading to 1.3.0 FAILED
Message-ID: <01010185177d1e80-9b3c5de3-a826-4929-95dc-55c0184a3481-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174716

--===============5630023313373192621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libmpc* to *1.3.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libmpc-upgrade-1.2.1-1.3.0.patch
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
--===============5630023313373192621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1672 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (887 cached, 1 parsed). 1672 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:93d887459f84d8065bca87bf7221372dfcc7fab2"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 56 Local 27 Mirrors 0 Missed 29 Current 112 (48% match, 82% complete)
Removing 6 stale sstate objects for arch core2-32...done.
Removing 1 stale sstate objects for arch x86_64...done.
Removing 5 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 137 of 168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 141 of 168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 145 of 168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 146 of 168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_12.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 147 of 168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 148 of 168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 149 of 168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 150 of 168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 172 of 680 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.0.bb:do_fetch)
NOTE: Running noexec task 245 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_fetch)
NOTE: Running noexec task 263 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_12.2.bb:do_fetch)
NOTE: Running noexec task 470 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_fetch)
NOTE: Running noexec task 563 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_fetch)
NOTE: Running task 569 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.0.bb:do_fetch)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-1.3.0-r0: task do_fetch: Started
NOTE: recipe glibc-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libmpc-native-1.3.0-r0: task do_fetch: Started
NOTE: Running task 578 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.0.bb:do_unpack)
NOTE: recipe libmpc-native-1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 579 of 680 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.0.bb:do_unpack)
NOTE: Running task 580 of 680 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 581 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: recipe mpfr-4.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 582 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.1.1.bb:do_fetch)
NOTE: Running task 584 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-source_12.2.bb:do_unpack)
NOTE: Running task 585 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_fetch)
NOTE: Setscene tasks completed
NOTE: Running task 586 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_fetch)
NOTE: recipe libmpc-1.3.0-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe gcc-source-12.2.0-12.2.0-r0: task do_unpack: Started
NOTE: recipe libmpc-1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libmpc-native-1.3.0-r0: task do_unpack: Started
NOTE: recipe mpfr-4.1.1-r0: task do_fetch: Started
NOTE: Running task 587 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.0.bb:do_patch)
NOTE: recipe libmpc-native-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe mpfr-4.1.1-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Started
NOTE: Running task 588 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: Running task 589 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.1.1.bb:do_unpack)
NOTE: recipe libmpc-native-1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.36-r0: task do_fetch: Started
NOTE: Running task 590 of 680 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.0.bb:do_patch)
NOTE: Running task 591 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_unpack)
NOTE: recipe libmpc-1.3.0-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: recipe mpfr-4.1.1-r0: task do_unpack: Started
NOTE: recipe libmpc-native-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Started
NOTE: recipe libmpc-1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 592 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libmpc-native-1.3.0-r0: task do_patch: Started
NOTE: Running task 593 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.0.bb:do_populate_lic)
NOTE: recipe glibc-2.36-r0: task do_fetch: Succeeded
NOTE: recipe libmpc-native-1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 594 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_unpack)
NOTE: Running task 595 of 680 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libmpc-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmpc-1.3.0-r0: task do_populate_lic: Started
NOTE: recipe mpfr-4.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 596 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.1.1.bb:do_patch)
NOTE: recipe glibc-2.36-r0: task do_unpack: Started
NOTE: recipe libmpc-native-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 597 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_patch)
NOTE: recipe mpfr-4.1.1-r0: task do_patch: Started
NOTE: recipe libmpc-1.3.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libmpc-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpfr-4.1.1-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_patch: Started
NOTE: recipe libmpc-native-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 599 of 680 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.0.bb:do_configure)
NOTE: recipe libmpc-native-1.3.0-r0: task do_configure: Started
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 600 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_patch)
NOTE: recipe gmp-6.2.1-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.36-r0: task do_unpack: Succeeded
NOTE: Running task 603 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_patch)
NOTE: recipe glibc-2.36-r0: task do_patch: Started
NOTE: recipe glibc-2.36-r0: task do_patch: Succeeded
NOTE: recipe libmpc-native-1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 605 of 680 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.0.bb:do_compile)
NOTE: recipe libmpc-native-1.3.0-r0: task do_compile: Started
NOTE: recipe libmpc-native-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 606 of 680 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.0.bb:do_install)
NOTE: recipe libmpc-native-1.3.0-r0: task do_install: Started
NOTE: recipe libmpc-native-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 607 of 680 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.0.bb:do_populate_sysroot)
NOTE: recipe libmpc-native-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libmpc-native-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 608 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gcc-source-12.2.0-12.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 609 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-source_12.2.bb:do_patch)
NOTE: recipe gcc-source-12.2.0-12.2.0-r0: task do_patch: Started
NOTE: recipe gcc-source-12.2.0-12.2.0-r0: task do_patch: Succeeded
NOTE: Running task 611 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-source_12.2.bb:do_preconfigure)
NOTE: recipe gcc-source-12.2.0-12.2.0-r0: task do_preconfigure: Started
NOTE: recipe gcc-source-12.2.0-12.2.0-r0: task do_preconfigure: Succeeded
NOTE: Running task 616 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_configure)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf/autoconf_2.71.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh
 /build/build/poky/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.0.bb:do_populate_sysroo
 t', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.1.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['binutils-cross-i686', 'libtool-native', 'quilt-native', 'texinfo-dummy-native', 'linux-libc-headers', 'zlib-native', 'autoconf-native', 'automake-native', 'flex-native', 'gnu-config-native', 'patch-native', 'xz-native', 'zstd-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 'm4-native', 'attr-native', 'gettext-minimal-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| Previously configured separate build directory detected, cleaning /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gcc-cross-i686/12.2.0-r0/gcc-12.2.0/build.x86_64-linux.i686-poky-linux
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing python function gcc_multilib_setup
| DEBUG: Python function gcc_multilib_setup finished
| DEBUG: Executing shell function do_configure
| NOTE: Running ../../../../../../work-shared/gcc-12.2.0-r0/gcc-12.2.0/configure  --build=x86_64-linux 		  --host=x86_64-linux 		  --target=i686-poky-linux 		  --prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gcc-cross-i686/12.2.0-r0/recipe-sysroot-native/usr 		  --exec_prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gcc-cross-i686/12.2.0-r0/recipe-sysroot-native/usr 		  --bindir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gcc-cross-i686/12.2.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux 		  --sbindir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gcc-cross-i686/12.2.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux 		  --libexecdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gcc-cross-i686/12.2.0-r0/recipe-sysroot-native/usr/libexec/i686-poky-linux 		  --datadir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-li
 nux/gcc-cross-i686/12.2.0-r0/recipe-sysroot-native/usr/share 		  --sysconfdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gcc-cross-i686/12.2.0-r0/recipe-sysroot-native/etc 		  --sharedstatedir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gcc-cross-i686/12.2.0-r0/recipe-sysroot-native/com 		  --localstatedir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gcc-cross-i686/12.2.0-r0/recipe-sysroot-native/var 		  --libdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gcc-cross-i686/12.2.0-r0/recipe-sysroot-native/usr/lib/i686-poky-linux 		  --includedir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gcc-cross-i686/12.2.0-r0/recipe-sysroot-native/usr/include 		  --oldincludedir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gcc-cross-i686/12.2.0-r0/recipe-sysroot-native/usr/include 		  --infodir=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/x86_64-linux/gcc-cross-i686/12.2.0-r0/recipe-sysroot-native/usr/share/info 		  --mandir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gcc-cross-i686/12.2.0-r0/recipe-sysroot-native/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gcc-cross-i686/12.2.0-r0/recipe-sysroot-native     --enable-clocale=generic     --with-gnu-ld     --enable-shared     --enable-languages=c,c++     --enable-threads=posix     --disable-multilib     --enable-default-pie     --enable-c99     --enable-long-long     --enable-symvers=gnu     --enable-libstdcxx-pch     --program-prefix=i686-poky-linux-     --without-local-prefix     --disable-install-libiberty         --disable-libssp     --enable-libitm     --enable-lto     --disable-bootstrap     --with-system-zlib     --with-linker-hash-style=sysv     --enable-linker-build-id     --wit
 h-ppl=no     --with-cloog=no     --enable-checking=release     --enable-cheaders=c_global     --without-isl               --with-gxx-include-dir=/not/exist/usr/include/c++/12.2.0     --with-sysroot=/not/exist     --with-build-sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gcc-cross-i686/12.2.0-r0/recipe-sysroot                --enable-targets=all 	--enable-standard-branch-protection  --enable-poison-system-directories=error     --with-system-zlib  --disable-static  --disable-nls --with-glibc-version=2.28  --enable-initfini-array --enable-__cxa_atexit
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-pc-linux-gnu
| checking target system type... i686-poky-linux-gnu
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c
| checking whether ln works... yes
| checking whether ln -s works... yes
| checking for a sed that does not truncate output... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sed
| checking for gawk... gawk
| checking for libatomic support... yes
| checking for libsanitizer support... yes
| checking for libvtv support... yes
| checking for libphobos support... yes
| checking for x86_64-linux-gcc... gcc
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... no
| checking for suffix of object files... o
| checking whether we are using the GNU C compiler... yes
| checking whether gcc  accepts -g... yes
| checking for gcc  option to accept ISO C89... none needed
| checking for gcc  option to accept ISO C99... none needed
| checking whether we are using the GNU C++ compiler... yes
| checking whether g++  accepts -g... yes
| checking whether g++ accepts -static-libstdc++ -static-libgcc... yes
| checking for x86_64-linux-gnatbind... no
| checking for gnatbind... no
| checking for x86_64-linux-gnatmake... no
| checking for gnatmake... no
| checking whether compiler driver understands Ada... no
| checking for x86_64-linux-gdc... no
| checking for gdc... no
| checking whether the D compiler works... no
| checking how to compare bootstrapped objects... cmp --ignore-initial=16 $$f1 $$f2
| checking whether g++  supports C++11 features by default... yes
| checking for objdir... .libs
| checking for the correct version of gmp.h... yes
| checking for the correct version of mpfr.h... yes
| checking for the correct version of mpc.h... no
| configure: error: Building GCC requires GMP 4.2+, MPFR 3.1.0+ and MPC 0.8.0+.
| Try the --with-gmp, --with-mpfr and/or --with-mpc options to specify
| their locations.  Source code for these libraries can be found at
| their respective hosting sites as well as at
| https://gcc.gnu.org/pub/gcc/infrastructure/.  See also
| http://gcc.gnu.org/install/prerequisites.html for additional info.  If
| you obtained GMP, MPFR and/or MPC from a vendor distribution package,
| make sure that you have installed both the libraries and the header
| files.  They may be located in separate packages.
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gcc-cross-i686/12.2.0-r0/gcc-12.2.0/build.x86_64-linux.i686-poky-linux/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gcc-cross-i686/12.2.0-r0/temp/run.do_configure.3486780:231 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gcc-cross-i686/12.2.0-r0/temp/run.do_configure.3486780, line 231
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gcc-cross-i686/12.2.0-r0/temp/run.do_configure.3486780, line 207
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gcc-cross-i686/12.2.0-r0/temp/run.do_configure.3486780, line 194
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gcc-cross-i686/12.2.0-r0/temp/run.do_configure.3486780, line 244
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 616 tasks of which 581 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gcc-cross-i686-12.2.0-r0 do_configure: configure failed
ERROR: gcc-cross-i686-12.2.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gcc-cross-i686/12.2.0-r0/temp/run.do_configure.3486780', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gcc-cross-i686/12.2.0-r0/temp/log.do_configure.3486780
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_configure) failed with exit code '1'

--===============5630023313373192621==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libmpc-upgrade-1.2.1-1.3.0.patch"

RnJvbSA4ZDNkM2QxMDE5NzRmNjdkMjNjNmRiMWI1ODBlMWZjMTc4YTc2OGEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTk6NDg6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJtcGM6IHVwZ3JhZGUgMS4yLjEgLT4gMS4zLjAKCi0tLQogLi4uL3JlY2lwZXMtc3VwcG9ydC9s
aWJtcGMve2xpYm1wY18xLjIuMS5iYiA9PiBsaWJtcGNfMS4zLjAuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGlibXBjL3tsaWJtcGNfMS4yLjEuYmIgPT4gbGlibXBjXzEuMy4wLmJifSAo
NzIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1wYy9saWJtcGNfMS4y
LjEuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJtcGMvbGlibXBjXzEuMy4wLmJiCnNpbWls
YXJpdHkgaW5kZXggNzIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1wYy9s
aWJtcGNfMS4yLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1wYy9saWJt
cGNfMS4zLjAuYmIKaW5kZXggMTVkMzgyYzRhZC4uYWMwMTMzMTMzMiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGlibXBjL2xpYm1wY18xLjIuMS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9saWJtcGMvbGlibXBjXzEuMy4wLmJiCkBAIC01LDcgKzUsNyBAQCBERVBFTkRT
ID0gImdtcCBtcGZyIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORy5MRVNTRVI7
bWQ1PWU2YTYwMGZkNWUxZDljYmRlMmQ5ODM2ODAyMzNhZDAyIgogU1JDX1VSSSA9ICIke0dOVV9N
SVJST1J9L21wYy9tcGMtJHtQVn0udGFyLmd6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTc1
MDNkMmMzOTVkZmNmMTA2YjYyMmRjMTQyNjgzYzExOTk0MzFkMDk1MzY3YzZhYWNiYTZlZWMzMDM0
MDQ1OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwZTNiMTIxODFkMzcyMDcyMzBmNWE3YTdkZGNm
YzIyYWJmYzVmYzljMDU4MjVlMWE2NTQwMWE0ODlhNDMyYTJhIgogCiBTID0gIiR7V09SS0RJUn0v
bXBjLSR7UFZ9IgogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgotLSAKMi4zNy4z
Cgo=

--===============5630023313373192621==--

