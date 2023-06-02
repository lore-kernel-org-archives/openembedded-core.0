Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64329CCA46B
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:46 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.7627.1685693431792338926
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YlU0YgWQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101887b287c62-daddce28-5d39-4017-abd2-50edce4a9584-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693431;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rfdg6gTbHWjdBJP7rISy1+4G9rosfZcWJFOFNoi4D7w=;
	b=YlU0YgWQKPWBeK9LH0jcWHRCgUdiTXJ3wJ9LMZeePO2KGCoV5m3NkCDLp4JJqS3t
	BMFlEuno5icAa7mlEn1PA189IybDD5TKZeBZKkHsxhXvxc5hpLKfvLn1QuOVMftiGeP
	Uucu4jTbHiq1fxnzXhM/3epvXut2Wt/RMGX/A/oo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693431;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rfdg6gTbHWjdBJP7rISy1+4G9rosfZcWJFOFNoi4D7w=;
	b=A1y7RvMgGfSQBV3+QvBLRD7nWv6WV2+DIpXrbKZmDIR20oKdw9TGrdT03BBKwKcQ
	2kWBpIUQafKRe1LIhUgBqljnpTKfIi6l/sH+hP0xbm1jQ1DF/OiKrJQuoV6DHMJGnAM
	PgB4pqdnlekVJ75pkbRT4azyzQF9t/R1tyXePKaE=
Content-Type: multipart/mixed; boundary="===============5776754225804723911=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux: upgrading to 2.39 FAILED
Message-ID: <010101887b287c62-daddce28-5d39-4017-abd2-50edce4a9584-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:30 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182169

--===============5776754225804723911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *util-linux* to *2.39* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-util-linux-upgrade-2.38.1-2.39.patch
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
--===============5776754225804723911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1800 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (895 cached, 2 parsed). 1800 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7a9a06c99634224e9d52b624023c63dbaa61711a"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 326 Local 63 Mirrors 0 Missed 263 Current 242 (19% match, 53% complete)
Removing 67 stale sstate objects for arch core2-32...done.
Removing 91 stale sstate objects for arch qemux86...done.
Removing 25 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 268 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 269 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 293 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 305 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 316 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 319 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 326 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 327 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 330 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 334 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 341 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 354 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 359 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 362 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 365 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 370 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 382 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 383 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 386 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 387 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 389 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 390 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 394 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 398 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 403 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 406 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 414 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 419 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 422 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 426 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 429 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 432 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 435 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 438 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 449 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 469 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 474 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 475 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 478 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 485 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 491 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 492 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 497 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 500 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 507 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 512 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 513 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 516 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 521 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 522 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 523 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 534 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 537 of 568 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 563 of 568 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.37-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.68-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-locale-2.37-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.68-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.76.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.33-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 197 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_patch)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 265 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_patch)
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.76.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 567 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 341 of 2018 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch)
NOTE: recipe libxml2-native-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 348 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_fetch)
NOTE: Running task 383 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_fetch)
NOTE: Running task 385 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.1-r0: task do_patch: Started
NOTE: Running task 407 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_fetch)
NOTE: Running task 408 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 409 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: Running task 454 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: Running task 455 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_fetch)
NOTE: Running task 468 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_fetch)
NOTE: Running task 481 of 2018 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.bb:do_fetch)
NOTE: Running task 497 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch)
NOTE: Running task 498 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_fetch)
NOTE: Running task 499 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_fetch)
NOTE: Running task 500 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_fetch)
NOTE: Running task 501 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 502 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_fetch)
NOTE: Running task 503 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_fetch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-native-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-2.37-r1: task do_patch: Started
NOTE: recipe zlib-1.2.13-r0: task do_fetch: Started
NOTE: Running task 564 of 2018 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_fetch)
NOTE: Running task 566 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_fetch)
NOTE: Running task 567 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_fetch)
NOTE: Running task 568 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-native-2.38.1-r0: task do_fetch: Started
NOTE: recipe openssl-3.1.0-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.13-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
WARNING: util-linux-libuuid-native-2.38.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-native-2.38.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz_bad-checksum_60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Started
NOTE: Running task 622 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.1-r0: task do_patch: Succeeded
NOTE: recipe libxcrypt-4.4.33-r0: task do_fetch: Started
NOTE: Running task 631 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: Running noexec task 638 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_configure)
NOTE: Running noexec task 639 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_compile)
NOTE: Running task 640 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_install)
NOTE: recipe openssl-3.1.0-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_fetch: Started
NOTE: Running task 641 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_unpack)
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_fetch: Succeeded
NOTE: Running task 642 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_unpack)
NOTE: recipe libedit-20221030-3.1-r0: task do_fetch: Succeeded
NOTE: Running task 643 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: Running task 644 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_unpack)
NOTE: Running task 645 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_unpack)
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 648 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_unpack)
NOTE: Running task 655 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_fetch)
NOTE: Running task 656 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: Running task 657 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_unpack)
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.33-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.39-r0: task do_fetch: Started
NOTE: recipe perl-5.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 677 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running setscene task 568 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 678 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_unpack)
NOTE: recipe python3-3.11.2-r0: task do_fetch: Started
NOTE: Running task 682 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: recipe zlib-1.2.13-r0: task do_unpack: Started
NOTE: Running task 684 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: Running task 685 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_fetch)
NOTE: Running task 686 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.bb:do_fetch)
NOTE: Running task 691 of 2018 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_fetch)
NOTE: Running task 697 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_fetch)
NOTE: Running task 707 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_fetch)
NOTE: Running task 708 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_fetch)
NOTE: Running task 718 of 2018 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_write_config)
NOTE: Running task 726 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_fetch)
NOTE: Running task 727 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_fetch)
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 733 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_write_config)
NOTE: Running task 734 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_fetch)
NOTE: Running task 736 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_fetch)
NOTE: Running task 737 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_fetch)
NOTE: Running task 741 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_write_config)
NOTE: Running task 744 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_fetch)
NOTE: Running task 745 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: Running task 746 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 747 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: Running task 748 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_fetch)
NOTE: Running task 749 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: Running task 751 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: Running task 755 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_fetch)
NOTE: Running task 756 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_fetch)
NOTE: Running task 758 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: Running task 759 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_fetch)
NOTE: Running task 762 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_fetch)
NOTE: Running task 763 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: Running task 764 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe libxml2-native-2.10.4-r0: task do_fetch: Started
NOTE: Running task 765 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.1-r0: task do_install: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.39-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 766 of 2018 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.bb:do_unpack)
NOTE: recipe libxml2-native-2.10.4-r0: task do_fetch: Succeeded
NOTE: Running task 767 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: Running task 768 of 2018 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_unpack)
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_fetch: Succeeded
NOTE: Running task 769 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_unpack)
NOTE: Running task 770 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_unpack)
NOTE: recipe zlib-1.2.13-r0: task do_unpack: Succeeded
NOTE: Running task 771 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_patch)
WARNING: util-linux-libuuid-native-2.38.1-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz - will attempt other sources if available
NOTE: recipe xz-5.4.3-r0: task do_fetch: Succeeded
NOTE: Running task 772 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_unpack)
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 773 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: recipe libpam-1.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 774 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_unpack)
NOTE: recipe openssl-3.1.0-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_unpack: Started
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Started
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe libcap-2.68-r0: task do_fetch: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Started
NOTE: Running task 775 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_unpack)
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Started
NOTE: Running task 776 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_patch)
NOTE: recipe util-linux-2.39-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.37-r1: task do_patch: Succeeded
NOTE: Running task 777 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.68-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Succeeded
NOTE: Running task 778 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.76.2-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.4-r0: task do_fetch: Started
NOTE: Running task 780 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.39-r0: task do_fetch: Succeeded
NOTE: Running task 781 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: Running task 782 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_unpack)
NOTE: Running task 783 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_unpack)
NOTE: Running task 786 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_fetch)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-native-1_2.76.2-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: Running task 787 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: Running task 788 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_patch)
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Started
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Started
NOTE: Running task 789 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.bb:do_unpack)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Started
NOTE: Running task 790 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_patch)
NOTE: recipe shadow-4.13-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: Running task 791 of 2018 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_unpack)
NOTE: recipe perl-5.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe glib-2.0-native-1_2.76.2-r0: task do_write_config: Started
NOTE: Running task 792 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_unpack)
NOTE: Setscene tasks completed
NOTE: Running task 793 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_unpack)
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 794 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_fetch)
NOTE: Running task 795 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe readline-8.2-r0: task do_fetch: Started
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: Running task 797 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_unpack)
NOTE: recipe libxcb-1.15-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_fetch: Started
NOTE: Running task 803 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.2-r0: task do_fetch: Succeeded
NOTE: Running task 804 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: recipe shadow-4.13-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 805 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.4-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: recipe kmod-30-r0: task do_fetch: Started
NOTE: Running task 806 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_patch)
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-native-1_2.76.2-r0: task do_write_config: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: Running task 807 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_unpack)
NOTE: Running task 808 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_unpack)
NOTE: Running task 809 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_unpack)
NOTE: Running task 810 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libxml2-native-2.10.4-r0: task do_unpack: Started
NOTE: Running task 829 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_unpack)
NOTE: Running task 830 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_unpack)
NOTE: Running task 833 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: Running task 834 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_unpack)
NOTE: recipe util-linux-native-2.39-r0: task do_unpack: Started
NOTE: Running task 835 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: Running task 836 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: Running task 841 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: recipe zlib-1.2.13-r0: task do_patch: Started
NOTE: recipe xz-5.4.3-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_patch: Started
NOTE: Running task 864 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_unpack: Started
NOTE: Running task 865 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.2-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: recipe libcap-2.68-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_fetch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_patch: Started
NOTE: Running task 866 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_patch)
NOTE: recipe xz-5.4.3-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_unpack: Started
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Started
NOTE: Running task 867 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_unpack)
NOTE: recipe perl-5.36.1-r0: task do_fetch: Started
NOTE: recipe util-linux-2.39-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.4-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: Running task 868 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Started
NOTE: Running task 870 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_patch)
NOTE: recipe shadow-4.13-r0: task do_unpack: Started
NOTE: Running task 871 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: recipe util-macros-1_1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_unpack: Started
NOTE: recipe perl-5.36.1-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: Running task 872 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_patch)
NOTE: recipe zlib-1.2.13-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_unpack: Started
NOTE: Running task 873 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_patch)
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 874 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_unpack)
NOTE: Running task 875 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.76.2-r0: task do_unpack: Started
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: Running task 881 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: Running task 882 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_write_config)
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: recipe readline-8.2-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_unpack: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_patch: Succeeded
NOTE: Running task 883 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_patch)
NOTE: Running task 884 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: Running task 904 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_unpack: Started
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Succeeded
NOTE: Running task 905 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_patch: Started
NOTE: Running task 906 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_patch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.68-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_patch: Started
NOTE: recipe gdbm-1.23-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Started
NOTE: Running task 910 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: Running task 911 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_patch)
NOTE: Running task 912 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: Running task 913 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: Running task 920 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_fetch)
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_write_config: Started
NOTE: Running task 928 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_patch)
NOTE: Running task 931 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_warn_musl)
NOTE: Running task 932 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_write_config)
NOTE: recipe base-passwd-3.6.1-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.2-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Succeeded
NOTE: Running task 933 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_patch)
NOTE: Running task 934 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_patch)
NOTE: recipe libxcrypt-4.4.33-r0: task do_patch: Started
NOTE: Running task 935 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 936 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_patch)
NOTE: recipe openssl-3.1.0-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: Running task 937 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_patch)
NOTE: Running task 940 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: Running task 942 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_write_config: Succeeded
NOTE: Running task 943 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_patch: Succeeded
NOTE: Running task 944 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_unpack)
NOTE: recipe libxcb-1.15-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Started
NOTE: Running task 948 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: Running task 953 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Started
NOTE: Running task 954 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_patch)
NOTE: Running task 963 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_fetch)
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Started
NOTE: recipe libffi-3.4.4-r0: task do_patch: Succeeded
NOTE: Running task 965 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libcap-2.68-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_patch: Started
NOTE: recipe libpam-1.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 978 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: recipe base-passwd-3.6.1-r0: task do_patch: Started
NOTE: Running task 979 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_patch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Succeeded
NOTE: recipe readline-8.2-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Succeeded
NOTE: Running task 994 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Started
NOTE: recipe gawk-5.2.1-r0: task do_fetch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 996 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_patch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_warn_musl: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: Running task 998 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_unpack)
NOTE: Running task 1007 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_fetch)
NOTE: recipe systemd-1_253.3-r0: task do_warn_musl: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_patch: Started
NOTE: Running task 1027 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Succeeded
NOTE: Running task 1028 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_patch)
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_write_config: Started
NOTE: Running task 1031 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: recipe libxcb-1.15-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_patch: Succeeded
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Started
NOTE: Running task 1033 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_unpack)
NOTE: recipe grep-3.11-r0: task do_fetch: Started
NOTE: Running task 1035 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe procps-4.0.3-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_patch: Succeeded
NOTE: recipe kmod-30-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: Running task 1037 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: Running task 1039 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_unpack)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1040 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_write_config: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_patch: Started
NOTE: Running task 1041 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 1042 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_patch)
NOTE: recipe cracklib-2.9.11-r0: task do_patch: Started
NOTE: recipe shadow-4.13-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_unpack: Started
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1043 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_patch)
NOTE: Running task 1044 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: Running task 1046 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: recipe psmisc-23.6-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_patch: Started
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Started
NOTE: recipe libcap-2.68-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Started
NOTE: recipe readline-8.2-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 1049 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Started
NOTE: Running task 1052 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
WARNING: util-linux-libuuid-native-2.38.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-native-2.38.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz_bad-checksum_60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f
NOTE: recipe kmod-30-r0: task do_unpack: Started
NOTE: Running task 1054 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-native-2.38.1-r0: task do_fetch: Failed
NOTE: Running task 1056 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe zstd-1.5.4-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Started
NOTE: recipe libxml2-native-2.10.4-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_fetch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: recipe shadow-4.13-r0: task do_patch: Started
NOTE: recipe grep-3.11-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_patch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_fetch: Succeeded
WARNING: util-linux-libuuid-2.38.1-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz - will attempt other sources if available
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_patch: Succeeded
NOTE: recipe util-linux-native-2.39-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-native-1_2.76.2-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: recipe shadow-4.13-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Succeeded
NOTE: recipe kmod-30-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.39-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_unpack: Succeeded
WARNING: util-linux-libuuid-2.38.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-2.38.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz_bad-checksum_60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_fetch: Failed
NOTE: recipe linux-libc-headers-6.1-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 1057 tasks of which 880 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 2 tasks failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch
Summary: There were 9 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-libuuid-native-2.38.1-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz
ERROR: util-linux-libuuid-native-2.38.1-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz\' has sha256 checksum \'60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f\' when \'32b30a336cda903182ed61feb3e9b908b762a5e66fe14e43efb88d37162075cb\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/util-linux-libuuid-native/2.38.1-r0/temp/log.do_fetch.386464
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch) failed with exit code '1'
ERROR: util-linux-libuuid-2.38.1-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz
ERROR: util-linux-libuuid-2.38.1-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz\' has sha256 checksum \'60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f\' when \'32b30a336cda903182ed61feb3e9b908b762a5e66fe14e43efb88d37162075cb\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/util-linux-libuuid/2.38.1-r0/temp/log.do_fetch.386554
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch) failed with exit code '1'

--===============5776754225804723911==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-upgrade-2.38.1-2.39.patch"

RnJvbSBhMjhjM2ViZjI1MDdmYmQyMTAxY2VlMzk4NTc4ZjNkNjlhZjhhZDZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAwODo0NjowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHV0
aWwtbGludXg6IHVwZ3JhZGUgMi4zOC4xIC0+IDIuMzkKCi0tLQogbWV0YS9yZWNpcGVzLWNvcmUv
dXRpbC1saW51eC91dGlsLWxpbnV4LmluYyAgIHwgIDggKystCiAuLi4vMDAwMS1jaGVjay1mb3It
c3lzLXBpZGZkLmgucGF0Y2ggICAgICAgICAgfCA1MyAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi5j
b25maWd1cmUuYWMtSW1wcm92ZS1jaGVjay1mb3ItbWFnaWMucGF0Y2ggfCA0MCAtLS0tLS0tLS0t
LS0tLQogLi4udGlsLWxpbnV4XzIuMzguMS5iYiA9PiB1dGlsLWxpbnV4XzIuMzkuYmJ9IHwgMjIg
KysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgOTggZGVsZXRpb25z
KC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGls
LWxpbnV4LzAwMDEtY2hlY2stZm9yLXN5cy1waWRmZC5oLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2
NDQgbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtY29uZmlndXJl
LmFjLUltcHJvdmUtY2hlY2stZm9yLW1hZ2ljLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNv
cmUvdXRpbC1saW51eC97dXRpbC1saW51eF8yLjM4LjEuYmIgPT4gdXRpbC1saW51eF8yLjM5LmJi
fSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1s
aW51eC5pbmMgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5jCmlu
ZGV4IDM4NjhiMWM0MWQuLjIwNGFkMDIwYjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3Jl
L3V0aWwtbGludXgvdXRpbC1saW51eC5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1s
aW51eC91dGlsLWxpbnV4LmluYwpAQCAtMTIsNyArMTIsNyBAQCBMSUNFTlNFOiR7UE59LWxpYmZk
aXNrID0gIkxHUEwtMi4xLW9yLWxhdGVyIgogTElDRU5TRToke1BOfS1saWJtb3VudCA9ICJMR1BM
LTIuMS1vci1sYXRlciIKIExJQ0VOU0U6JHtQTn0tbGlic21hcnRjb2xzID0gIkxHUEwtMi4xLW9y
LWxhdGVyIgogCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9SRUFETUUubGljZW5zaW5nO21k
NT0wZmQ1YzA1MGM2MTg3ZDJiZjBhNDQ5MmI3ZjRlMzNkYSBcCitMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9SRUFETUUubGljZW5zaW5nO21kNT0xMmFlNzc2OGE2NWVjOGYyZTQ0ZDkzMGRmOWNi
NDNmYSBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9DT1BZSU5HO21kNT1iMjM0ZWU0ZDY5
ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9Eb2N1
bWVudGF0aW9uL2xpY2Vuc2VzL0NPUFlJTkcuR1BMLTIuMC1vci1sYXRlcjttZDU9YjIzNGVlNGQ2
OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vRG9j
dW1lbnRhdGlvbi9saWNlbnNlcy9DT1BZSU5HLkxHUEwtMi4xLW9yLWxhdGVyO21kNT00ZmJkNjUz
ODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyBcCkBAIC0yMyw3ICsyMyw3IEBAIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL1JFQURNRS5saWNlbnNpbmc7bWQ1PTBmZDVjMDUwYzYxODdkMmJmMGE0
NDkyYjdmNGUzM2RhCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9saWJibGtpZC9DT1BZSU5H
O21kNT02OTNiY2JiZTE2ZDNhNGE0YjM3YmM5MDZiYzAxY2MwNCBcCiAgICAgICAgICAgICAgICAg
ICAgIGZpbGU6Ly9saWJmZGlzay9DT1BZSU5HO21kNT02OTNiY2JiZTE2ZDNhNGE0YjM3YmM5MDZi
YzAxY2MwNCBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9saWJzbWFydGNvbHMvQ09QWUlO
RzttZDU9NjkzYmNiYmUxNmQzYTRhNGIzN2JjOTA2YmMwMWNjMDQgXAotIgorICAgICAgICAgICAg
ICAgICAgICAiCiAKIEZJTEVTRVhUUkFQQVRIUzpwcmVwZW5kIDo9ICIke1RISVNESVJ9L3V0aWwt
bGludXg6IgogTUFKT1JfVkVSU0lPTiA9ICIke0AnLicuam9pbihkLmdldFZhcignUFYnKS5zcGxp
dCgnLicpWzA6Ml0pfSIKQEAgLTM1LDggKzM1LDYgQEAgU1JDX1VSSSA9ICIke0tFUk5FTE9SR19N
SVJST1J9L2xpbnV4L3V0aWxzL3V0aWwtbGludXgvdiR7TUFKT1JfVkVSU0lPTn0vdXRpbC1saW4K
ICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgIGZpbGU6Ly9kaXNwbGF5
X3Rlc3RuYW1lX2Zvcl9zdWJ0ZXN0LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL2F2b2lkX3Bh
cmFsbGVsX3Rlc3RzLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtY2hlY2stZm9yLXN5
cy1waWRmZC5oLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtY29uZmlndXJlLmFjLUlt
cHJvdmUtY2hlY2stZm9yLW1hZ2ljLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiNjA0OTJhMTliNDRlNmNmOWEzZGRmZjY4MzI1YjMzM2I4YjUyYjZjNTljZTNl
YmQ2YTBlY2FhNGM1MTE3ZTg0ZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzMmIzMGEzMzZjZGE5
MDMxODJlZDYxZmViM2U5YjkwOGI3NjJhNWU2NmZlMTRlNDNlZmI4OGQzNzE2MjA3NWNiIgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtY2hl
Y2stZm9yLXN5cy1waWRmZC5oLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91
dGlsLWxpbnV4LzAwMDEtY2hlY2stZm9yLXN5cy1waWRmZC5oLnBhdGNoCmRlbGV0ZWQgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAxOWY1N2YxNGJjLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBl
cy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLWNoZWNrLWZvci1zeXMtcGlkZmQuaC5w
YXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDUzICswLDAgQEAKLUZyb20gNTQ4YmM1NjhmM2M3MzVl
NTNmYjViMGE1YWI2NDczYTNmMTQ1N2I5MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206
IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci1EYXRlOiBTdW4sIDcgQXVnIDIwMjIgMTQ6
Mzk6MTkgLTA3MDAKLVN1YmplY3Q6IFtQQVRDSF0gY2hlY2sgZm9yIHN5cy9waWRmZC5oCi0KLVRo
aXMgaGVhZGVyIGluIG5ld2VyIGdsaWJjIGRlZmluZXMgdGhlIHNpZ25hdHVyZXMgb2YgZnVuY3Rp
b25zCi1waWRmZF9zZW5kX3NpZ25hbCgpIGFuZCBwaWRmZF9vcGVuKCkgYW5kIHdoZW4gdGhlc2Ug
ZnVuY3Rpb25zIGFyZQotZGVmaW5lZCBieSBsaWJjIHRoZW4gd2UgbmVlZCB0byBpbmNsdWRlIHRo
ZSByZWxldmFudCBoZWFkZXIgdG8gZ2V0Ci10aGUgZGVmaW5pdGlvbnMuIENsYW5nIDE1KyBoYXMg
c3RhcnRlZCB0byBlcnJvciBvdXQgd2hlbiBmdW5jdGlvbgotc2lnbmF0dXJlcyBhcmUgbWlzc2lu
Zy4KLQotRml4ZXMgZXJyb3JzIGxpa2UKLW1pc2MtdXRpbHMva2lsbC5jOjQwMjo2OiBlcnJvcjog
Y2FsbCB0byB1bmRlY2xhcmVkIGZ1bmN0aW9uICdwaWRmZF9zZW5kX3NpZ25hbCc7IElTTyBDOTkg
YW5kIGxhdGVyIGRvIG5vdCBzdXBwb3J0IGltcGxpY2l0IGZ1bmN0aW9uIGRlY2xhcmF0aW9ucyBb
LVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KLSAgICAgICAgaWYgKHBpZGZkX3NlbmRf
c2lnbmFsKHBmZCwgY3RsLT5udW1zaWcsICZpbmZvLCAwKSA8IDApCi0KLVVwc3RyZWFtLVN0YXR1
czogU3VibWl0dGVkIFtodHRwczovL2dpdGh1Yi5jb20vdXRpbC1saW51eC91dGlsLWxpbnV4L3B1
bGwvMTc2OV0KLVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci0t
LS0KLSBjb25maWd1cmUuYWMgICAgICAgICAgfCAxICsKLSBpbmNsdWRlL3BpZGZkLXV0aWxzLmgg
fCA0ICsrKy0KLSAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQotCi1kaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCBhNTEx
ZTkzZGUuLmZkN2Q5MjQ1ZiAxMDA2NDQKLS0tLSBhL2NvbmZpZ3VyZS5hYwotKysrIGIvY29uZmln
dXJlLmFjCi1AQCAtMzQyLDYgKzM0Miw3IEBAIEFDX0NIRUNLX0hFQURFUlMoWyBcCi0gCXN5cy9t
a2Rldi5oIFwKLSAJc3lzL21vdW50LmggXAotIAlzeXMvcGFyYW0uaCBcCi0rCXN5cy9waWRmZC5o
IFwKLSAJc3lzL3ByY3RsLmggXAotIAlzeXMvcmVzb3VyY2UuaCBcCi0gCXN5cy9zZW5kZmlsZS5o
IFwKLWRpZmYgLS1naXQgYS9pbmNsdWRlL3BpZGZkLXV0aWxzLmggYi9pbmNsdWRlL3BpZGZkLXV0
aWxzLmgKLWluZGV4IGVkZGVkZTk3Ni4uZDllMzNjYmM1IDEwMDY0NAotLS0tIGEvaW5jbHVkZS9w
aWRmZC11dGlscy5oCi0rKysgYi9pbmNsdWRlL3BpZGZkLXV0aWxzLmgKLUBAIC00LDggKzQsMTAg
QEAKLSAjaWZkZWYgSEFWRV9TWVNfU1lTQ0FMTF9ICi0gIyBpbmNsdWRlIDxzeXMvc3lzY2FsbC5o
PgotICMgaWYgZGVmaW5lZChTWVNfcGlkZmRfc2VuZF9zaWduYWwpICYmIGRlZmluZWQoU1lTX3Bp
ZGZkX29wZW4pCi0rIyAgaWZkZWYgSEFWRV9TWVNfUElERkRfSAotKyMgICBpbmNsdWRlIDxzeXMv
cGlkZmQuaD4KLSsjICBlbmRpZgotICMgIGluY2x1ZGUgPHN5cy90eXBlcy5oPgotLQotICMgIGlm
bmRlZiBIQVZFX1BJREZEX1NFTkRfU0lHTkFMCi0gc3RhdGljIGlubGluZSBpbnQgcGlkZmRfc2Vu
ZF9zaWduYWwoaW50IHBpZGZkLCBpbnQgc2lnLCBzaWdpbmZvX3QgKmluZm8sCi0gCQkJCSAgICB1
bnNpZ25lZCBpbnQgZmxhZ3MpCi0tLSAKLTIuMzcuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS1jb25maWd1cmUuYWMtSW1wcm92ZS1j
aGVjay1mb3ItbWFnaWMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwt
bGludXgvMDAwMS1jb25maWd1cmUuYWMtSW1wcm92ZS1jaGVjay1mb3ItbWFnaWMucGF0Y2gKZGVs
ZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwNjExZmU1NzguLjAwMDAwMDAwMDAKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtY29uZmlndXJlLmFj
LUltcHJvdmUtY2hlY2stZm9yLW1hZ2ljLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNDAgKzAs
MCBAQAotRnJvbSAyNjMzODFkZGQ0NmVlYTIyOTNjNzBiYzgxMTI3M2I2NmJjNTIwODdiIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogTWF0ZXVzeiBNYXJjaW5pZWMgPG1hdGV1c3ptYXIy
QGdtYWlsLmNvbT4KLURhdGU6IEZyaSwgMTkgQXVnIDIwMjIgMTQ6NDc6NDkgKzAyMDAKLVN1Ympl
Y3Q6IFtQQVRDSF0gY29uZmlndXJlLmFjOiBJbXByb3ZlIGNoZWNrIGZvciBtYWdpYwotCi1DaGVj
ayB3aGV0aGVyIG1hZ2ljLmggaGVhZGVyIGV4aXN0cyBiZWZvcmUgZGVmaW5pbmcgSEFWRV9NQUdJ
Qy4KLQotRGVzcGl0ZSBsaWJyYXJ5IGF2YWlsYWJpbGl0eSB0aGVyZSBzdGlsbCBjYW4gYmUgbWlz
c2luZyBoZWFkZXIuCi1DdXJyZW50IHRlc3QgZG9lc24ndCBjb3ZlciB0aGF0IHBvc3NpYmlsaXR5
IHdoaWNoIHdpbGwgbGVhZCBjb21waWxhdGlvbgotdG8gZmFpbCBpbiBjYXNlIG9mIHNlcGFyYXRl
IHN5c3Jvb3QuCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQKLVtodHRwczovL2dpdGh1Yi5j
b20vdXRpbC1saW51eC91dGlsLWxpbnV4L2NvbW1pdC8yNjMzODFkZGQ0NmVlYTIyOTNjNzBiYzgx
MTI3M2I2NmJjNTIwODdiXQotCi1TaWduZWQtb2ZmLWJ5OiBNYXRldXN6IE1hcmNpbmllYyA8bWF0
ZXVzem1hcjJAZ21haWwuY29tPgotU2lnbmVkLW9mZi1ieTogVG9tYXN6IER6aWVuZHppZWxza2kg
PHRvbWFzei5kemllbmR6aWVsc2tpQGdtYWlsLmNvbT4KLS0tLQotIGNvbmZpZ3VyZS5hYyB8IDYg
KysrKy0tCi0gMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
LQotZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggZGFhOGYw
ZGNhLi45NjhhMGRhZjAgMTAwNjQ0Ci0tLS0gYS9jb25maWd1cmUuYWMKLSsrKyBiL2NvbmZpZ3Vy
ZS5hYwotQEAgLTE1NzAsOCArMTU3MCwxMCBAQCBBQ19BUkdfV0lUSChbbGlibWFnaWNdLAotICkK
LSBBU19JRihbdGVzdCAieCR3aXRoX2xpYm1hZ2ljIiA9IHhub10sIFtoYXZlX21hZ2ljPW5vXSwg
WwotICAgQUNfQ0hFQ0tfTElCKFttYWdpY10sIFttYWdpY19vcGVuXSwgWwotLSAgICBBQ19ERUZJ
TkUoW0hBVkVfTUFHSUNdLCBbMV0sIFtEZWZpbmUgdG8gMSBpZiB5b3UgaGF2ZSB0aGUgbGlibWFn
aWMgcHJlc2VudC5dKQotLSAgICBNQUdJQ19MSUJTPSItbG1hZ2ljIgotKyAgICBBQ19DSEVDS19I
RUFERVIobWFnaWMuaCwgWwotKyAgICAgIEFDX0RFRklORShbSEFWRV9NQUdJQ10sIFsxXSwgW0Rl
ZmluZSB0byAxIGlmIHlvdSBoYXZlIHRoZSBsaWJtYWdpYyBwcmVzZW50Ll0pCi0rICAgICAgTUFH
SUNfTElCUz0iLWxtYWdpYyIKLSsgICAgXSkKLSAgIF0pCi0gXSkKLSBBQ19TVUJTVChbTUFHSUNf
TElCU10pCi0tLSAKLTIuMzcuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGls
LWxpbnV4L3V0aWwtbGludXhfMi4zOC4xLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51
eC91dGlsLWxpbnV4XzIuMzkuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4XzIuMzguMS5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4XzIuMzkuYmIKaW5kZXggOWVh
N2EwNGU4YS4uZThmOGE0MmRhYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1s
aW51eC91dGlsLWxpbnV4XzIuMzguMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxp
bnV4L3V0aWwtbGludXhfMi4zOS5iYgpAQCAtMSwzICsxLDI1IEBACisjIEZJWE1FOiB0aGUgTElD
X0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFk
ZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFu
ZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1
ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBt
ZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1V
cGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIwor
IyAtLS0gUkVBRE1FLmxpY2Vuc2luZworIyArKysgUkVBRE1FLmxpY2Vuc2luZworIyBAQCAtOSw2
ICs5LDggQEAKKyMgICAgICogR1BMLTIuMCAgICAgICAgICAgIC0gR05VIEdlbmVyYWwgUHVibGlj
IExpY2Vuc2UgdmVyc2lvbiAyCisjICAKKyMgICAgICogTEdQTC0yLjEtb3ItbGF0ZXIgIC0gR05V
IExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIDIuMSBvciBhbnkgbGF0ZXIgdmVyc2lvbgor
IyArCisjICsgICAqIEJTRC0yLUNsYXVzZSAgICAgICAtIFNpbXBsaWZpZWQgQlNEIExpY2Vuc2UK
KyMgIAorIyAgICAgKiBCU0QtMy1DbGF1c2UgICAgICAgLSBCU0QgMy1DbGF1c2UgIk5ldyIgb3Ig
IlJldmlzZWQiIExpY2Vuc2UKKyMgIAorIyAKKyMKKwogcmVxdWlyZSB1dGlsLWxpbnV4LmluYwog
CiAjZ3RrLWRvYyBpcyBub3QgZW5hYmxlZCBhcyBpdCByZXF1aXJlcyB4bWx0byB3aGljaCByZXF1
aXJlcyB1dGlsLWxpbnV4Ci0tIAoyLjM5LjIKCg==

--===============5776754225804723911==--

