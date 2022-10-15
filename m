Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5318CC64E77
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web08.24457.1665871394803757749
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HL6g03az;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010183ddac354b-cdb9eb49-9ba4-4a12-9459-7b0d9c573523-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bpyAx3LEPaoEvZGmtbbC/1Np6fqjnOi/wKEpTb3EUdQ=;
	b=HL6g03azfM8GQOxQ4fUWrZCayTqaWh4mq5lwoHwixeeKBoU7GsALP7+ecuJeuGBS
	bjLa8LRhzL6PyYnv5GCXPZQEtrWWDYaOHDl0IwYnDv4rfPGIENFTaw+zzZ4P6jpsDh4
	3X1KQXowSP9leyBj/SMsWsSKOpOx+YUvOKJNpDZA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bpyAx3LEPaoEvZGmtbbC/1Np6fqjnOi/wKEpTb3EUdQ=;
	b=IPm+9MQ/xEUWCovKFnVfgok1PgTOP9JOvzO9Ur1/SBJbBlNk/h3fNxhZNvv2wdYm
	AmBIIW4yQOB25htXxc0gTl+jRe3wwi5mXXejQv5+CG6zwh++3GRFV/F3qlRmmXoZCJO
	0C+21LD6GsAsTXm+bxthd+1qLjJL4jWiO3EU6Fbo=
Content-Type: multipart/mixed; boundary="===============5919299528627874106=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3: upgrading to 3.10.8 FAILED
Message-ID: <01010183ddac354b-cdb9eb49-9ba4-4a12-9459-7b0d9c573523-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171793

--===============5919299528627874106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3* to *3.10.8* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-upgrade-3.10.6-3.10.8.patch
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
--===============5919299528627874106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:2c16ad11b30587dba0176a68912de31ecb549572"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 178 Local 60 Mirrors 0 Missed 118 Current 147 (33% match, 63% complete)
Removing 44 stale sstate objects for arch qemux86...done.
Removing 13 stale sstate objects for arch core2-32...done.
Removing 7 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 156 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 157 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 168 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 171 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 176 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 177 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 181 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 186 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 189 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 192 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 196 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 199 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 206 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 207 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 210 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 213 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 222 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 225 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 230 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 238 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 241 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 244 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 251 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 258 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 261 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 262 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 263 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 264 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 267 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 273 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 276 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 277 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 280 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 285 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 290 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_stash_locale_setscene)
NOTE: Running setscene task 291 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 294 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 295 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running noexec task 264 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_fetch)
NOTE: Running task 297 of 1194 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.8.bb:do_fetch)
NOTE: Running noexec task 323 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_fetch)
NOTE: Running task 534 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_fetch)
NOTE: Running task 535 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 547 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.8.bb:do_fetch)
NOTE: Running task 554 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 601 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.12.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.65-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-locale-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 602 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_fetch)
NOTE: recipe xz-5.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.12.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 603 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch)
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 604 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: recipe readline-8.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 605 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_fetch)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 606 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_fetch)
NOTE: Running task 607 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_fetch)
NOTE: Running task 608 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 609 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_fetch)
NOTE: Running task 610 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_fetch)
NOTE: Running task 611 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: Running task 612 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_fetch)
NOTE: Running task 613 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: Running task 614 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: Running task 615 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_fetch)
NOTE: Running task 616 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_fetch)
NOTE: Running task 617 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_fetch)
NOTE: Running task 619 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_fetch)
NOTE: recipe libpam-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.65-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 309 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 310 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 620 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_fetch)
NOTE: Running task 621 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_fetch)
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 622 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_fetch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 623 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 624 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: recipe ncurses-6.3+20220423-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-2.36-r0: task do_stash_locale_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.39.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_fetch: Started
NOTE: recipe python3-3.10.8-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 311 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_fetch: Started
NOTE: Running setscene task 312 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-native-3.10.8-r0: task do_fetch: Started
NOTE: Running task 626 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_fetch)
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_fetch: Started
NOTE: recipe psmisc-23.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 627 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_fetch)
NOTE: recipe libgcc-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 628 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_fetch)
NOTE: Running task 630 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_fetch)
NOTE: Running task 631 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 632 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_fetch: Started
NOTE: recipe sed-4.8-r0: task do_fetch: Started
NOTE: recipe bash-5.1.16-r0: task do_fetch: Started
NOTE: Running setscene task 313 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 314 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 633 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_unpack)
NOTE: recipe readline-8.1.2-r0: task do_fetch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Started
NOTE: recipe sed-4.8-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.28-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 634 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: Running setscene task 315 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-native-3.10.8-r0: task do_fetch: Succeeded
NOTE: Running task 635 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_unpack)
NOTE: Running task 636 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_unpack)
NOTE: Running task 637 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_unpack)
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Started
NOTE: recipe shadow-4.12.1-r0: task do_fetch: Started
NOTE: recipe gawk-5.1.1-r0: task do_fetch: Started
NOTE: Running task 638 of 1194 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.8.bb:do_unpack)
NOTE: recipe python3-3.10.8-r0: task do_fetch: Succeeded
NOTE: Running task 639 of 1194 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.2.6-r0: task do_fetch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Succeeded
NOTE: Running task 640 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_unpack)
NOTE: Running task 641 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.8.bb:do_unpack)
NOTE: Running task 642 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: recipe bash-5.1.16-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_fetch: Started
NOTE: recipe make-4.3-r0: task do_fetch: Started
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.65-r0: task do_fetch: Started
NOTE: Running task 643 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_unpack)
NOTE: recipe shadow-4.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 644 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: Running task 645 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_unpack)
NOTE: recipe make-4.3-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.12-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_fetch: Started
NOTE: recipe libpam-1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.65-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.2-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_fetch: Succeeded
NOTE: Running task 646 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_unpack)
NOTE: Running task 647 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_unpack)
NOTE: Running task 648 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_unpack)
NOTE: Running task 649 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: Running task 650 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_unpack)
NOTE: Running task 651 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: Running task 652 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_unpack)
NOTE: Running task 653 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_unpack)
NOTE: Running task 654 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_unpack)
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 655 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_unpack)
NOTE: Running task 656 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_unpack)
NOTE: Running setscene task 316 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Succeeded
NOTE: Running task 657 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: recipe psmisc-23.5-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe sqlite3-3_3.39.3-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.0.5-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.39.3-r0: task do_fetch: Succeeded
NOTE: Running task 658 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_unpack)
NOTE: recipe ncurses-6.3+20220423-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 659 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 660 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_unpack)
NOTE: Running task 661 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_fetch)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: Running task 662 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: Running task 663 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_unpack)
NOTE: Running task 664 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_fetch)
NOTE: recipe psmisc-23.5-r0: task do_fetch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Started
NOTE: Running setscene task 317 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 318 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_12.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 665 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: Running task 666 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_unpack)
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: Running task 667 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe cracklib-2.9.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_unpack: Started
NOTE: Running setscene task 319 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_unpack: Started
NOTE: Running setscene task 320 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 668 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_unpack)
NOTE: Running task 669 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: Running task 670 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_fetch)
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_unpack: Started
NOTE: recipe xz-5.2.6-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Started
NOTE: recipe cracklib-2.9.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 671 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_fetch)
NOTE: recipe bash-5.1.16-r0: task do_unpack: Started
NOTE: Running task 672 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: recipe gawk-5.1.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Started
NOTE: Running task 673 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: recipe python3-3.10.8-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Started
NOTE: recipe libcap-2.65-r0: task do_unpack: Started
NOTE: recipe python3-native-3.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe readline-8.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-native-3.10.8-r0: task do_unpack: Started
NOTE: Running task 674 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe xz-5.2.6-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Succeeded
NOTE: recipe make-4.3-r0: task do_unpack: Started
NOTE: recipe shadow-4.12.1-r0: task do_unpack: Started
NOTE: recipe zlib-1.2.12-r0: task do_unpack: Started
NOTE: Running task 675 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_patch)
NOTE: Running task 676 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_patch)
NOTE: Running task 677 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: recipe util-linux-2.38.1-r0: task do_unpack: Started
NOTE: Running task 678 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_patch)
NOTE: recipe libpam-1.5.2-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Started
NOTE: recipe perl-5.36.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.2-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.0.5-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe sed-4.8-r0: task do_unpack: Succeeded
NOTE: Running task 679 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_patch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Started
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.39.3-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 680 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_patch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-initial-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 681 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: recipe glibc-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 682 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_unpack)
NOTE: recipe libcap-2.65-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 683 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_fetch)
NOTE: Running task 684 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_unpack)
NOTE: Running task 685 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_patch)
NOTE: recipe make-4.3-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe flex-2.6.4-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: Running task 686 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_patch)
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_fetch: Started
NOTE: recipe gawk-5.1.1-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_patch: Started
NOTE: recipe flex-2.6.4-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Started
NOTE: Running task 687 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: recipe glibc-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.3-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Started
NOTE: Running task 688 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_fetch)
NOTE: recipe python3-native-3.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_patch: Started
NOTE: Running task 689 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_unpack)
NOTE: Running task 690 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Started
NOTE: Running task 691 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.8-r0: task do_fetch: Succeeded
NOTE: Running task 692 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: recipe libcap-2.65-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Started
NOTE: recipe perl-5.36.0-r0: task do_fetch: Started
NOTE: recipe sed-4.8-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Started
NOTE: recipe make-4.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 693 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_unpack)
NOTE: recipe libgcc-initial-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_unpack: Succeeded
NOTE: Running task 697 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 698 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: recipe shadow-4.12.1-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_unpack: Succeeded
NOTE: Running setscene task 322 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: Running task 703 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_patch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Succeeded
NOTE: Running task 704 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_unpack)
NOTE: Running task 705 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_patch)
NOTE: Running task 706 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_patch)
NOTE: Running task 707 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_patch)
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.8-r0: task do_patch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_unpack: Started
NOTE: recipe gawk-5.1.1-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.39.3-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 709 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: recipe xz-5.2.6-r0: task do_patch: Succeeded
NOTE: Running task 711 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: recipe libpam-1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_unpack: Started
NOTE: recipe glibc-2.36-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_patch: Succeeded
NOTE: Running task 714 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Succeeded
NOTE: Running task 716 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_unpack: Started
NOTE: recipe shadow-4.12.1-r0: task do_patch: Started
NOTE: Running task 718 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: recipe readline-8.1.2-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_patch: Started
NOTE: recipe bash-5.1.16-r0: task do_patch: Started
NOTE: Running task 719 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_patch)
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.39.3-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: recipe libcap-2.65-r0: task do_patch: Succeeded
NOTE: Running task 721 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe flex-2.6.4-r0: task do_unpack: Succeeded
NOTE: Running task 724 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe glibc-2.36-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_patch: Started
NOTE: Running task 725 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: recipe libxcrypt-4.4.28-r0: task do_patch: Started
NOTE: Running task 727 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: Running task 729 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Started
NOTE: Running task 731 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_patch)
NOTE: recipe psmisc-23.5-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: Running task 732 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_patch)
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 734 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 736 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.36-r0: task do_unpack: Started
NOTE: Running task 737 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_patch: Started
NOTE: recipe openssl-3.0.5-r0: task do_patch: Started
NOTE: recipe shadow-4.12.1-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: Running task 738 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libpam-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe libxcrypt-4.4.28-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_unpack: Succeeded
NOTE: recipe make-4.3-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_unpack: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_patch: Succeeded
NOTE: Running task 744 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_patch)
NOTE: Running task 746 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_patch)
NOTE: Running task 748 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_patch)
NOTE: Running task 749 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_patch)
NOTE: recipe flex-2.6.4-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: recipe cracklib-2.9.8-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe bash-5.1.16-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_patch: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 757 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_patch: Started
NOTE: recipe cracklib-2.9.8-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_unpack: Succeeded
NOTE: Running task 760 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_patch)
NOTE: recipe util-linux-2.38.1-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_patch: Succeeded
NOTE: recipe python3-3.10.8-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 324 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running task 764 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.8.bb:do_patch)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-3.10.8-r0: task do_patch: Started
NOTE: recipe perl-5.36.0-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe python3-native-3.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 768 of 1194 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.8.bb:do_patch)
NOTE: recipe python3-native-3.10.8-r0: task do_patch: Started
NOTE: recipe python3-3.10.8-r0: task do_patch: Succeeded
NOTE: Running task 769 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 770 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.8.bb:do_populate_lic)
NOTE: recipe python3-3.10.8-r0: task do_populate_lic: Started
NOTE: recipe python3-3.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-3.10.8-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-3.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glibc-2.36-r0: task do_unpack: Succeeded
NOTE: Running task 777 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_patch)
NOTE: recipe glibc-2.36-r0: task do_patch: Started
NOTE: recipe python3-native-3.10.8-r0: task do_patch: Failed
NOTE: recipe glibc-2.36-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 777 tasks of which 645 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.8.bb:do_patch
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-native-3.10.8-r0 do_patch: Applying patch '0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-native/3.10.8-r0/Python-3.10.8'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-native/3.10.8-r0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch 0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-native/3.10.8-r0/temp/log.do_patch.1700962
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.8.bb:do_patch) failed with exit code '1'

--===============5919299528627874106==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-upgrade-3.10.6-3.10.8.patch"

RnJvbSAyNGZiYmIxZmY1NTdmNzkxY2FmMjYzZDczOGZiODJkNjM3NzdmZjU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTE6MTU6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zOiB1cGdyYWRlIDMuMTAuNiAtPiAzLjEwLjgKCi0tLQogLi4uLXNlYXJjaC1zeXN0ZW0t
Zm9yLWhlYWRlcnMtbGlicmFyaWVzLnBhdGNoIHwgIDIgKy0KIC4uLi11c2UtcHJlZml4LXZhbHVl
LWZyb20tYnVpbGQtY29uZmlndS5wYXRjaCB8ICAyICstCiAuLi5lLXRoZS1yYWNlLWNvbmRpdGlv
bi1pbi10ZXN0U29ja05hbWUucGF0Y2ggfCA0NyAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi5maWct
YXBwZW5kLVNUQUdJTkdfTElCRElSLXB5dGhvbi1zeXMucGF0Y2ggfCAgMiArLQogLi4udHV0aWxz
LXByZWZpeC1pcy1pbnNpZGUtc3RhZ2luZy1hcmVhLnBhdGNoIHwgIDIgKy0KIC4uLi97cHl0aG9u
M18zLjEwLjYuYmIgPT4gcHl0aG9uM18zLjEwLjguYmJ9ICB8IDQ2ICsrKysrKysrKysrKysrKyst
LQogNiBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspLCA1NCBkZWxldGlvbnMoLSkKIGRl
bGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAw
MS1NaXRpZ2F0ZS10aGUtcmFjZS1jb25kaXRpb24taW4tdGVzdFNvY2tOYW1lLnBhdGNoCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uM18zLjEwLjYuYmIgPT4gcHl0
aG9uM18zLjEwLjguYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLzAwMDEtRG9uLXQtc2VhcmNoLXN5c3RlbS1mb3ItaGVhZGVycy1saWJy
YXJpZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1E
b24tdC1zZWFyY2gtc3lzdGVtLWZvci1oZWFkZXJzLWxpYnJhcmllcy5wYXRjaAppbmRleCBjNzkw
YzdiODg2Li5iOGI1Y2U5ZDBmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMvMDAwMS1Eb24tdC1zZWFyY2gtc3lzdGVtLWZvci1oZWFkZXJzLWxpYnJhcmll
cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1E
b24tdC1zZWFyY2gtc3lzdGVtLWZvci1oZWFkZXJzLWxpYnJhcmllcy5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gNzU4OWFiMDNhZDNmN2NiNGJiMDkyYzMxMjczZmYyMjM3MWFjNzdlNCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjlkNGM3NjMzNjdjODJkODc0OTljY2YyYzRkN2I4
MzlkY2RmMGE2YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEplcmVteSBQdWhsbWFu
IDxqcHVobG1hbkBtdmlzdGEuY29tPgogRGF0ZTogV2VkLCA0IE1hciAyMDIwIDAwOjA2OjQyICsw
MDAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvbid0IHNlYXJjaCBzeXN0ZW0gZm9yIGhlYWRlcnMvbGli
cmFyaWVzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMv
MDAwMS1MaWItc3lzY29uZmlnLnB5LXVzZS1wcmVmaXgtdmFsdWUtZnJvbS1idWlsZC1jb25maWd1
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtTGliLXN5
c2NvbmZpZy5weS11c2UtcHJlZml4LXZhbHVlLWZyb20tYnVpbGQtY29uZmlndS5wYXRjaAppbmRl
eCA2NDEwMTdlZGQ1Li4xNDQ5ODNmNWU2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1MaWItc3lzY29uZmlnLnB5LXVzZS1wcmVmaXgtdmFsdWUt
ZnJvbS1idWlsZC1jb25maWd1LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy8wMDAxLUxpYi1zeXNjb25maWcucHktdXNlLXByZWZpeC12YWx1ZS1mcm9tLWJ1
aWxkLWNvbmZpZ3UucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQ4MmNiOTZlZWQxMDk4OTIw
YWQzY2RjYjM2ZmViMzIxMzc2MTgwNjYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGNi
ZjQwMWVjZWM1ZWZhNWRkZjAzZmU0NDkxNzc5ZGJlZmUxMTczN2YgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0
ZTogRnJpLCAxMCBTZXAgMjAyMSAxMjoyODozMSArMDIwMAogU3ViamVjdDogW1BBVENIXSBMaWIv
c3lzY29uZmlnLnB5OiB1c2UgcHJlZml4IHZhbHVlIGZyb20gYnVpbGQgY29uZmlndXJhdGlvbgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtTWl0
aWdhdGUtdGhlLXJhY2UtY29uZGl0aW9uLWluLXRlc3RTb2NrTmFtZS5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLU1pdGlnYXRlLXRoZS1yYWNlLWNvbmRp
dGlvbi1pbi10ZXN0U29ja05hbWUucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IGUxOWRmMDhmODcuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLzAwMDEtTWl0aWdhdGUtdGhlLXJhY2UtY29uZGl0aW9uLWluLXRlc3RTb2NrTmFt
ZS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQ3ICswLDAgQEAKLVVwc3RyZWFtLVN0YXR1czog
UGVuZGluZwotU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+
Ci0KLUZyb20gODEwM2I5MDE0OGU4NzY4NDU2YzNhYjcwN2RlMTA1ZDYzZDlkNWIyMCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29t
PgotRGF0ZTogRnJpLCAxNyBKdW4gMjAyMiAxMTo1Mzo1OSArMDEwMAotU3ViamVjdDogW1BBVENI
XSBNaXRpZ2F0ZSB0aGUgcmFjZSBjb25kaXRpb24gaW4gdGVzdFNvY2tOYW1lCi0KLWZpbmRfdW51
c2VkX3BvcnQoKSBoYXMgYW4gaW5oZXJlbnQgcmFjZSBjb25kaXRpb24sIGJ1dCB3ZSBjYW4ndCB1
c2UKLWJpbmRfcG9ydCgpIGFzIHRoYXQgdXNlcyAuZ2V0c29ja25hbWUoKSB3aGljaCB0aGlzIHRl
c3QgaXMgZXhlcmNpc2luZy4KLQotVHJ5IGJpbmRpbmcgdG8gdW51c2VkIHBvcnRzIGEgZmV3IHRp
bWVzIGJlZm9yZSBmYWlsaW5nLgotLS0tCi0gTGliL3Rlc3QvdGVzdF9zb2NrZXQucHkgfCAxNSAr
KysrKysrKysrKysrLS0KLSAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL0xpYi90ZXN0L3Rlc3Rfc29ja2V0LnB5IGIvTGliL3Rl
c3QvdGVzdF9zb2NrZXQucHkKLWluZGV4IGM5ODE5MDM4MjQuLmIxNjMwZDE4YjYgMTAwNjQ0Ci0t
LS0gYS9MaWIvdGVzdC90ZXN0X3NvY2tldC5weQotKysrIGIvTGliL3Rlc3QvdGVzdF9zb2NrZXQu
cHkKLUBAIC0xMzkwLDEwICsxMzkwLDIxIEBAIGRlZiB0ZXN0U3RyaW5nVG9JUHY2KHNlbGYpOgot
IAotICAgICBkZWYgdGVzdFNvY2tOYW1lKHNlbGYpOgotICAgICAgICAgIyBUZXN0aW5nIGdldHNv
Y2tuYW1lKCkKLS0gICAgICAgIHBvcnQgPSBzb2NrZXRfaGVscGVyLmZpbmRfdW51c2VkX3BvcnQo
KQotICAgICAgICAgc29jayA9IHNvY2tldC5zb2NrZXQoc29ja2V0LkFGX0lORVQsIHNvY2tldC5T
T0NLX1NUUkVBTSkKLSAgICAgICAgIHNlbGYuYWRkQ2xlYW51cChzb2NrLmNsb3NlKQotLSAgICAg
ICAgc29jay5iaW5kKCgiMC4wLjAuMCIsIHBvcnQpKQotKwotKyAgICAgICAgIyBTaW5jZSBmaW5k
X3VudXNlZF9wb3J0KCkgaXMgaW5oZXJlbnRseSBzdWJqZWN0IHRvIHJhY2UgY29uZGl0aW9ucywg
d2UKLSsgICAgICAgICMgY2FsbCBpdCBhIGNvdXBsZSB0aW1lcyBpZiBuZWNlc3NhcnkuCi0rICAg
ICAgICBmb3IgaSBpbiBpdGVydG9vbHMuY291bnQoKToKLSsgICAgICAgICAgICBwb3J0ID0gc29j
a2V0X2hlbHBlci5maW5kX3VudXNlZF9wb3J0KCkKLSsgICAgICAgICAgICB0cnk6Ci0rICAgICAg
ICAgICAgICAgIHNvY2suYmluZCgoIjAuMC4wLjAiLCBwb3J0KSkKLSsgICAgICAgICAgICBleGNl
cHQgT1NFcnJvciBhcyBlOgotKyAgICAgICAgICAgICAgICBpZiBlLmVycm5vICE9IGVycm5vLkVB
RERSSU5VU0Ugb3IgaSA9PSA1OgotKyAgICAgICAgICAgICAgICAgICAgcmFpc2UKLSsgICAgICAg
ICAgICBlbHNlOgotKyAgICAgICAgICAgICAgICBicmVhawotKwotICAgICAgICAgbmFtZSA9IHNv
Y2suZ2V0c29ja25hbWUoKQotICAgICAgICAgIyBYWFgobm5vcndpdHopOiBodHRwOi8vdGlueXVy
bC5jb20vb3M1anogc2VlbXMgdG8gaW5kaWNhdGUKLSAgICAgICAgICMgaXQgcmVhc29uYWJsZSB0
byBnZXQgdGhlIGhvc3QncyBhZGRyIGluIGFkZGl0aW9uIHRvIDAuMC4wLjAuCi0tLSAKLTIuMjUu
MQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAw
MS1kaXN0dXRpbHMtc3lzY29uZmlnLWFwcGVuZC1TVEFHSU5HX0xJQkRJUi1weXRob24tc3lzLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtZGlzdHV0aWxz
LXN5c2NvbmZpZy1hcHBlbmQtU1RBR0lOR19MSUJESVItcHl0aG9uLXN5cy5wYXRjaAppbmRleCAz
NjhhNzI1ZmY3Li42Mzk4NjVmYTVkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMvMDAwMS1kaXN0dXRpbHMtc3lzY29uZmlnLWFwcGVuZC1TVEFHSU5HX0xJ
QkRJUi1weXRob24tc3lzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy8wMDAxLWRpc3R1dGlscy1zeXNjb25maWctYXBwZW5kLVNUQUdJTkdfTElCRElSLXB5
dGhvbi1zeXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGMyNDY3NGUwYTUyMzY3MzU5YTFh
M2Q5NTBiYWI4YmMzZDI4MjI3OWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQ2Yzk1
MDhmYTY4MjI0ZGE5YzU1M2E3NThmMzA5MjU4MmQzZTA5OTUgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERh
dGU6IFRodSwgMzEgSmFuIDIwMTkgMTY6NDY6MzAgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gZGlz
dHV0aWxzL3N5c2NvbmZpZzogYXBwZW5kCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMvMTItZGlzdHV0aWxzLXByZWZpeC1pcy1pbnNpZGUtc3RhZ2luZy1h
cmVhLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzEyLWRpc3R1
dGlscy1wcmVmaXgtaXMtaW5zaWRlLXN0YWdpbmctYXJlYS5wYXRjaAppbmRleCBhMDZlOWI1NmMx
Li4zZDM2MThhNTAwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMvMTItZGlzdHV0aWxzLXByZWZpeC1pcy1pbnNpZGUtc3RhZ2luZy1hcmVhLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8xMi1kaXN0dXRpbHMtcHJl
Zml4LWlzLWluc2lkZS1zdGFnaW5nLWFyZWEucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDFj
YzRjYWI4ZDU3OWJiY2NiOGE0ZmMxM2EyODE1OGE1OGM2MDNjYjQgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDVkOGE1MzI3MjU5NjgzMTczNTUwY2ZkOTlmNzk5YTVlOTUwNjU2MGEgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29t
PgogRGF0ZTogVHVlLCAxNCBNYXkgMjAxMyAxNTowMDoyNiAtMDcwMAogU3ViamVjdDogW1BBVENI
XSBweXRob24zOiBBZGQgdGFyZ2V0IGFuZCBuYXRpdmUgcmVjaXBlcwpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zXzMuMTAuNi5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uM18zLjEwLjguYmIKc2ltaWxhcml0eSBpbmRleCA5MCUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zXzMuMTAuNi5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zXzMuMTAuOC5i
YgppbmRleCAxZjhiNjBhN2E1Li4zMzA3NjUwN2NjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjNfMy4xMC42LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uM18zLjEwLjguYmIKQEAgLTEsMTAgKzEsNDcgQEAKKyMgRklYTUU6
IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9v
bCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRo
ZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNF
TlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUg
Y29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdM
aWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5n
ZXM6CisjCisjIC0tLSBMSUNFTlNFCisjICsrKyBMSUNFTlNFCisjIEBAIC0yLDEyICsyLDEyIEBA
CisjICA9PT09PT09PT09PT09PT09PT09PT09PT09PQorIyAgCisjICBQeXRob24gd2FzIGNyZWF0
ZWQgaW4gdGhlIGVhcmx5IDE5OTBzIGJ5IEd1aWRvIHZhbiBSb3NzdW0gYXQgU3RpY2h0aW5nCisj
IC1NYXRoZW1hdGlzY2ggQ2VudHJ1bSAoQ1dJLCBzZWUgaHR0cDovL3d3dy5jd2kubmwpIGluIHRo
ZSBOZXRoZXJsYW5kcworIyArTWF0aGVtYXRpc2NoIENlbnRydW0gKENXSSwgc2VlIGh0dHBzOi8v
d3d3LmN3aS5ubCkgaW4gdGhlIE5ldGhlcmxhbmRzCisjICBhcyBhIHN1Y2Nlc3NvciBvZiBhIGxh
bmd1YWdlIGNhbGxlZCBBQkMuICBHdWlkbyByZW1haW5zIFB5dGhvbidzCisjICBwcmluY2lwYWwg
YXV0aG9yLCBhbHRob3VnaCBpdCBpbmNsdWRlcyBtYW55IGNvbnRyaWJ1dGlvbnMgZnJvbSBvdGhl
cnMuCisjICAKKyMgIEluIDE5OTUsIEd1aWRvIGNvbnRpbnVlZCBoaXMgd29yayBvbiBQeXRob24g
YXQgdGhlIENvcnBvcmF0aW9uIGZvcgorIyAtTmF0aW9uYWwgUmVzZWFyY2ggSW5pdGlhdGl2ZXMg
KENOUkksIHNlZSBodHRwOi8vd3d3LmNucmkucmVzdG9uLnZhLnVzKQorIyArTmF0aW9uYWwgUmVz
ZWFyY2ggSW5pdGlhdGl2ZXMgKENOUkksIHNlZSBodHRwczovL3d3dy5jbnJpLnJlc3Rvbi52YS51
cykKKyMgIGluIFJlc3RvbiwgVmlyZ2luaWEgd2hlcmUgaGUgcmVsZWFzZWQgc2V2ZXJhbCB2ZXJz
aW9ucyBvZiB0aGUKKyMgIHNvZnR3YXJlLgorIyAgCisjIEBAIC0xOSw3ICsxOSw3IEBACisjICBj
cmVhdGVkIHNwZWNpZmljYWxseSB0byBvd24gUHl0aG9uLXJlbGF0ZWQgSW50ZWxsZWN0dWFsIFBy
b3BlcnR5LgorIyAgWm9wZSBDb3Jwb3JhdGlvbiB3YXMgYSBzcG9uc29yaW5nIG1lbWJlciBvZiB0
aGUgUFNGLgorIyAgCisjIC1BbGwgUHl0aG9uIHJlbGVhc2VzIGFyZSBPcGVuIFNvdXJjZSAoc2Vl
IGh0dHA6Ly93d3cub3BlbnNvdXJjZS5vcmcgZm9yCisjICtBbGwgUHl0aG9uIHJlbGVhc2VzIGFy
ZSBPcGVuIFNvdXJjZSAoc2VlIGh0dHBzOi8vb3BlbnNvdXJjZS5vcmcgZm9yCisjICB0aGUgT3Bl
biBTb3VyY2UgRGVmaW5pdGlvbikuICBIaXN0b3JpY2FsbHksIG1vc3QsIGJ1dCBub3QgYWxsLCBQ
eXRob24KKyMgIHJlbGVhc2VzIGhhdmUgYWxzbyBiZWVuIEdQTC1jb21wYXRpYmxlOyB0aGUgdGFi
bGUgYmVsb3cgc3VtbWFyaXplcworIyAgdGhlIHZhcmlvdXMgcmVsZWFzZXMuCisjIAorIworCiBT
VU1NQVJZID0gIlRoZSBQeXRob24gUHJvZ3JhbW1pbmcgTGFuZ3VhZ2UiCiBIT01FUEFHRSA9ICJo
dHRwOi8vd3d3LnB5dGhvbi5vcmciCiBERVNDUklQVElPTiA9ICJQeXRob24gaXMgYSBwcm9ncmFt
bWluZyBsYW5ndWFnZSB0aGF0IGxldHMgeW91IHdvcmsgbW9yZSBxdWlja2x5IGFuZCBpbnRlZ3Jh
dGUgeW91ciBzeXN0ZW1zIG1vcmUgZWZmZWN0aXZlbHkuIgogTElDRU5TRSA9ICJQU0YtMi4wIgog
U0VDVElPTiA9ICJkZXZlbC9weXRob24iCiAKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJ
Q0VOU0U7bWQ1PTRiODgwMWU3NTJhMmM3MGFjNDFhNWY5YWEyNDNmNzY2IgorTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YTE4MjJkZjhkMGYwNjg2MjhjYTYwOTBhZWRjNWJm
YzgiCiAKIFNSQ19VUkkgPSAiaHR0cDovL3d3dy5weXRob24ub3JnL2Z0cC9weXRob24vJHtQVn0v
UHl0aG9uLSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXApAQCAt
MzUsNyArNzIsMTAgQEAgU1JDX1VSSSA9ICJodHRwOi8vd3d3LnB5dGhvbi5vcmcvZnRwL3B5dGhv
bi8ke1BWfS9QeXRob24tJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtc2V0
dXAucHktRG8tbm90LWRldGVjdC1tdWx0aWFyY2gtcGF0aHMtd2hlbi1jcm9zcy1jby5wYXRjaCBc
CiAgICAgICAgICAgIGZpbGU6Ly9kZXRlcm1pbmlzdGljX2ltcG9ydHMucGF0Y2ggXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1Bdm9pZC1zaGViYW5nLW92ZXJmbG93LW9uLXB5dGhvbi1jb25maWcu
cHkucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1NaXRpZ2F0ZS10aGUtcmFjZS1jb25k
aXRpb24taW4tdGVzdFNvY2tOYW1lLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMDEtTGli
LXN5c2NvbmZpZy5weS11c2UtcHJlZml4LXZhbHVlLWZyb20tYnVpbGQtY29uZmlndS5wYXRjaCBc
CisgICAgICAgICAgIGZpbGU6Ly8wMDAxLWRpc3R1dGlscy1zeXNjb25maWctYXBwZW5kLVNUQUdJ
TkdfTElCRElSLXB5dGhvbi1zeXMucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vMTItZGlzdHV0
aWxzLXByZWZpeC1pcy1pbnNpZGUtc3RhZ2luZy1hcmVhLnBhdGNoIFwKKyAgICAgICAgICAgZmls
ZTovLzAwMDEtRG9uLXQtc2VhcmNoLXN5c3RlbS1mb3ItaGVhZGVycy1saWJyYXJpZXMucGF0Y2gg
XAogICAgICAgICAgICAiCiAKIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgXApAQCAt
NDQsNyArODQsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAiIFwKICAgICAgICAg
ICAgZmlsZTovLzEyLWRpc3R1dGlscy1wcmVmaXgtaXMtaW5zaWRlLXN0YWdpbmctYXJlYS5wYXRj
aCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLURvbi10LXNlYXJjaC1zeXN0ZW0tZm9yLWhlYWRl
cnMtbGlicmFyaWVzLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImY3OTVmZjg3ZDExZDRiMGM3YzMzYmM4ODUxYjBjMjg2NDhkOGE0NTgzYWEyMTAwYTk4YzIyYjQz
MjZiNmQzZjMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmEzMGVjZGU1OWM0NzA0ODAxM2ViNWE2
NThjOWI1ZGVjMjc3MjAzZDI3OTM2NjdmNTc4ZGY3NjcxZjdmMDNmMyIKIAogIyBleGNsdWRlIHBy
ZS1yZWxlYXNlcyBmb3IgYm90aCBweXRob24gMi54IGFuZCAzLngKIFVQU1RSRUFNX0NIRUNLX1JF
R0VYID0gIltQcF15dGhvbi0oP1A8cHZlcj5cZCsoXC5cZCspKykudGFyIgotLSAKMi4zMS4xCgo=

--===============5919299528627874106==--

