Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8813C6FD3C
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.10759.1663251512236926679
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=G2djU3mY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 010101834183fe66-0babe1af-475a-4572-916e-a7e0dcf4061e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YdqvC19cu9CeBNRXEjvyfyp3cAEScnPu1urTm2tsAyI=;
	b=G2djU3mYg8m4Pk0SqxmxLvAjhNIph9fU3gFLHp7Xm+VlxD9vYDmB2e7H9u0OHmQu
	qfBSIKlfYn9aengIMSr9/SPh1KT8BMhZTJOB0CdntiXP9JRU156lBbmcCbqbhgpQKG6
	ce/d/SJ/3mcI8qK9Xzrpz0zqJWtKmlhgooF9FPBk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YdqvC19cu9CeBNRXEjvyfyp3cAEScnPu1urTm2tsAyI=;
	b=RqOEjSDqpZVSzJaVF3t/OlUGIIgfng8EDr6h4Du6mwobjjbecIzi5ggOl65fYfHo
	bV/a7LxZzmA2Mgv1URJYpcIbHbAmchc+3svxJlq6GI/OKBxxtZqCW4d6dhCPBXNyoBh
	GnKJt3TnHrw6LCXI3KBTrAI8WbYoZccHGaj+RMKY=
Content-Type: multipart/mixed; boundary="===============0274997810744656633=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3: upgrading to 3.10.7 FAILED
Message-ID: 
 <010101834183fe66-0babe1af-475a-4572-916e-a7e0dcf4061e-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:33 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170730

--===============0274997810744656633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3* to *3.10.7* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-upgrade-3.10.6-3.10.7.patch
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
--===============0274997810744656633==
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
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-10368b370b2cf8feaa9f8ac8c69ffe6bd6d5d57c"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:10368b370b2cf8feaa9f8ac8c69ffe6bd6d5d57c"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 167 Local 49 Mirrors 0 Missed 118 Current 158 (29% match, 63% complete)
Removing 19 stale sstate objects for arch core2-32...done.
Removing 45 stale sstate objects for arch qemux86...done.
Removing 7 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 184 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 185 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 193 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 196 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 199 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 205 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 212 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 217 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 226 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 229 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 234 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 242 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 245 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 248 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 255 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 262 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 265 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 266 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 267 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 268 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 271 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 277 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 280 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 281 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 284 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 289 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 294 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_stash_locale_setscene)
NOTE: Running setscene task 295 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 298 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 299 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 310 of 325 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.02.11.bb:do_populate_sysroot_setscene)
NOTE: Running noexec task 245 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_fetch)
NOTE: Running task 278 of 1194 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.7.bb:do_fetch)
NOTE: Running noexec task 305 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_fetch)
NOTE: Running task 509 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_fetch)
NOTE: Running task 510 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 525 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_fetch)
NOTE: Running task 526 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_fetch)
NOTE: Running task 527 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.7.bb:do_fetch)
NOTE: Running task 529 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: Running task 545 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.12.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.65-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.39.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 600 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 601 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: Running task 602 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_fetch)
NOTE: Running task 603 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch)
NOTE: Running task 604 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_fetch)
NOTE: Running task 605 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_fetch)
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.12.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe libcap-2.65-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe sed-4.8-r0: task do_fetch: Started
NOTE: Running task 606 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_fetch)
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-2.36-r0: task do_stash_locale_setscene: Started
NOTE: Running task 607 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_fetch)
NOTE: Running task 608 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_fetch)
NOTE: Running task 609 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_fetch)
NOTE: Running task 610 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_fetch)
NOTE: recipe xz-5.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 611 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_fetch)
NOTE: Running task 612 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_fetch)
NOTE: Running task 613 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: recipe openssl-3.0.5-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_fetch: Started
NOTE: Running task 614 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: Running task 615 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_fetch)
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Started
NOTE: recipe libpam-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe autoconf-archive-native-2022.02.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 616 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_fetch)
NOTE: recipe make-4.3-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 617 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_fetch)
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 618 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_fetch)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Started
NOTE: recipe readline-8.1.2-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.12-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 312 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 620 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_fetch)
NOTE: Running task 622 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.2.bb:do_fetch)
NOTE: recipe libcap-2.65-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 313 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 314 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-native-3.10.7-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.10.7-r0: task do_fetch: Started
NOTE: Running setscene task 315 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 316 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 317 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_fetch: Succeeded
NOTE: recipe make-4.3-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.12.1-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 623 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_unpack)
NOTE: recipe libcap-2.65-r0: task do_fetch: Succeeded
NOTE: Running setscene task 318 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 624 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_unpack)
NOTE: Running task 625 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_unpack)
NOTE: Running task 626 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: Running task 627 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_unpack)
NOTE: recipe zlib-1.2.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-native-3.10.7-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_fetch: Started
NOTE: Running task 628 of 1194 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.7.bb:do_unpack)
NOTE: Running task 629 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_unpack)
NOTE: Running task 630 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_unpack)
NOTE: recipe libffi-3.4.2-r0: task do_fetch: Started
NOTE: Running task 631 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe python3-3.10.7-r0: task do_fetch: Succeeded
NOTE: Running task 632 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.7.bb:do_unpack)
NOTE: recipe sed-4.8-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_fetch: Started
NOTE: recipe psmisc-23.5-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.2-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Succeeded
NOTE: Running task 633 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_unpack)
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_fetch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.12.1-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Started
NOTE: recipe autoconf-archive-native-2022.02.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.28-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_fetch: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_fetch: Started
NOTE: recipe libpam-1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.36-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 320 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.39.2-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 321 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_12.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 637 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_unpack)
NOTE: Running task 649 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 655 of 1194 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 656 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_unpack)
NOTE: Running task 667 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: Running task 668 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_unpack)
NOTE: Running task 669 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_unpack)
NOTE: Running task 670 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_unpack)
NOTE: Running task 671 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 672 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_unpack)
NOTE: Running task 673 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_unpack)
NOTE: Running task 674 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_unpack)
NOTE: Running task 675 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: Running task 676 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_unpack)
NOTE: recipe sqlite3-3_3.39.2-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Started
NOTE: Running task 677 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: Running task 678 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: Running task 679 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_unpack)
NOTE: Running task 680 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_unpack)
NOTE: Running task 681 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.2.bb:do_unpack)
NOTE: recipe ncurses-6.3+20220423-r0: task do_fetch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 682 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_fetch)
NOTE: recipe readline-8.1.2-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_unpack: Started
NOTE: recipe make-4.3-r0: task do_unpack: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe zlib-1.2.12-r0: task do_unpack: Started
NOTE: recipe libcap-2.65-r0: task do_unpack: Started
NOTE: Running task 683 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_fetch)
NOTE: Running task 684 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 685 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Started
NOTE: recipe readline-8.1.2-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.8-r0: task do_unpack: Started
NOTE: recipe libgcc-initial-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_unpack: Started
NOTE: Running task 686 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_unpack: Started
NOTE: Running task 687 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_fetch)
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 688 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_fetch)
NOTE: Running task 689 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_patch)
NOTE: recipe xz-5.2.6-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.2-r0: task do_unpack: Started
NOTE: recipe python3-native-3.10.7-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.10.7-r0: task do_unpack: Started
NOTE: recipe glibc-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Succeeded
NOTE: recipe make-4.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 322 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 690 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_patch)
NOTE: Running task 691 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: Running task 692 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_patch)
NOTE: recipe sqlite3-3_3.39.2-r0: task do_unpack: Started
NOTE: recipe libcap-2.65-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.8-r0: task do_fetch: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe libpam-1.5.2-r0: task do_unpack: Started
NOTE: recipe openssl-3.0.5-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: Running task 693 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_patch)
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe glibc-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Started
NOTE: Running task 694 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_fetch)
NOTE: recipe shadow-4.12.1-r0: task do_unpack: Started
NOTE: recipe bash-5.1.16-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-native-3.10.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.38.1-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.2-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_unpack: Started
NOTE: Running task 695 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_patch)
NOTE: recipe psmisc-23.5-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: recipe make-4.3-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Started
NOTE: recipe libcap-2.65-r0: task do_patch: Started
NOTE: Running task 696 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.39.2-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-initial-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 697 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_patch)
NOTE: Running task 698 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: recipe sed-4.8-r0: task do_unpack: Succeeded
NOTE: Running setscene task 323 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running task 701 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_unpack)
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 702 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.2.bb:do_patch)
NOTE: recipe cracklib-2.9.8-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_fetch: Started
NOTE: Running task 703 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_patch)
NOTE: Running task 704 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_unpack)
NOTE: Running task 705 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 706 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_patch)
NOTE: Running task 707 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: Running task 708 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: recipe flex-2.6.4-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_patch: Started
NOTE: Running task 709 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: recipe xz-5.2.6-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.39.2-r0: task do_patch: Started
NOTE: recipe glibc-2.36-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.8-r0: task do_unpack: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 710 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: recipe zlib-1.2.12-r0: task do_patch: Started
NOTE: recipe python3-native-3.10.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Succeeded
NOTE: Running task 711 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 713 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_patch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Succeeded
NOTE: recipe sed-4.8-r0: task do_patch: Started
NOTE: recipe glibc-2.36-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.12.1-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.65-r0: task do_patch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_unpack: Started
NOTE: Running task 715 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_unpack)
NOTE: Running task 716 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.39.2-r0: task do_patch: Succeeded
NOTE: Running task 718 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: Running task 719 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_patch)
NOTE: recipe readline-8.1.2-r0: task do_patch: Succeeded
NOTE: recipe libxcrypt-4.4.28-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.8-r0: task do_patch: Succeeded
NOTE: Running task 722 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: Running task 724 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_patch)
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 726 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: Running task 728 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: Running task 729 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe bash-5.1.16-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 731 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_patch)
NOTE: Running task 732 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: recipe libxcrypt-4.4.28-r0: task do_patch: Started
NOTE: recipe libffi-3.4.2-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: recipe libpam-1.5.2-r0: task do_patch: Started
NOTE: recipe shadow-4.12.1-r0: task do_patch: Started
NOTE: Running task 734 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_patch)
NOTE: recipe openssl-3.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 736 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_patch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.36-r0: task do_unpack: Started
NOTE: Running task 737 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_patch)
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: Running task 739 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe make-4.3-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: recipe bash-5.1.16-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_unpack: Succeeded
NOTE: Running task 743 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_patch: Started
NOTE: Running task 744 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: Running task 745 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_patch)
NOTE: recipe openssl-3.0.5-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_patch: Started
NOTE: recipe zlib-1.2.12-r0: task do_patch: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.12.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_patch: Started
NOTE: Running task 751 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_patch)
NOTE: recipe coreutils-9.1-r0: task do_patch: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_patch: Started
NOTE: recipe psmisc-23.5-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_patch: Succeeded
NOTE: Running task 754 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_patch)
NOTE: recipe coreutils-9.1-r0: task do_patch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_patch: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_patch: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_patch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_patch: Succeeded
NOTE: Running task 762 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_patch)
NOTE: recipe gmp-6.2.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_patch: Started
NOTE: recipe python3-native-3.10.7-r0: task do_unpack: Succeeded
NOTE: Running task 765 of 1194 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.7.bb:do_patch)
NOTE: recipe util-linux-2.38.1-r0: task do_patch: Succeeded
NOTE: recipe python3-native-3.10.7-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glibc-2.36-r0: task do_unpack: Succeeded
NOTE: Running task 774 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_patch)
NOTE: recipe python3-3.10.7-r0: task do_unpack: Succeeded
NOTE: Running task 775 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.7.bb:do_patch)
NOTE: recipe glibc-2.36-r0: task do_patch: Started
NOTE: recipe python3-3.10.7-r0: task do_patch: Started
NOTE: recipe python3-native-3.10.7-r0: task do_patch: Failed
NOTE: recipe glibc-2.36-r0: task do_patch: Succeeded
NOTE: recipe python3-3.10.7-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 775 tasks of which 661 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.7.bb:do_patch
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-native-3.10.7-r0 do_patch: Applying patch '0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-native/3.10.7-r0/Python-3.10.7'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-native/3.10.7-r0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch 0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-native/3.10.7-r0/temp/log.do_patch.754833
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.7.bb:do_patch) failed with exit code '1'

--===============0274997810744656633==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-upgrade-3.10.6-3.10.7.patch"

RnJvbSAxYTAwNDgzZTU4YTY1YzQ5ZGI0NzkwYjVjNmIxYWNjZjE3Yzk5ZTI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMTA6Mzg6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zOiB1cGdyYWRlIDMuMTAuNiAtPiAzLjEwLjcKCi0tLQogLi4uLXNlYXJjaC1zeXN0ZW0t
Zm9yLWhlYWRlcnMtbGlicmFyaWVzLnBhdGNoIHwgIDIgKy0KIC4uLi11c2UtcHJlZml4LXZhbHVl
LWZyb20tYnVpbGQtY29uZmlndS5wYXRjaCB8ICAyICstCiAuLi5lLXRoZS1yYWNlLWNvbmRpdGlv
bi1pbi10ZXN0U29ja05hbWUucGF0Y2ggfCA0NyAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi5maWct
YXBwZW5kLVNUQUdJTkdfTElCRElSLXB5dGhvbi1zeXMucGF0Y2ggfCAgMiArLQogLi4udHV0aWxz
LXByZWZpeC1pcy1pbnNpZGUtc3RhZ2luZy1hcmVhLnBhdGNoIHwgIDIgKy0KIC4uLi97cHl0aG9u
M18zLjEwLjYuYmIgPT4gcHl0aG9uM18zLjEwLjcuYmJ9ICB8ICA3ICsrLQogNiBmaWxlcyBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKyksIDUzIGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLU1pdGlnYXRlLXRoZS1y
YWNlLWNvbmRpdGlvbi1pbi10ZXN0U29ja05hbWUucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3tweXRob24zXzMuMTAuNi5iYiA9PiBweXRob24zXzMuMTAuNy5iYn0g
KDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMv
MDAwMS1Eb24tdC1zZWFyY2gtc3lzdGVtLWZvci1oZWFkZXJzLWxpYnJhcmllcy5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLURvbi10LXNlYXJjaC1zeXN0
ZW0tZm9yLWhlYWRlcnMtbGlicmFyaWVzLnBhdGNoCmluZGV4IGM3OTBjN2I4ODYuLjU2MzY3ZDVk
MjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAx
LURvbi10LXNlYXJjaC1zeXN0ZW0tZm9yLWhlYWRlcnMtbGlicmFyaWVzLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLURvbi10LXNlYXJjaC1zeXN0
ZW0tZm9yLWhlYWRlcnMtbGlicmFyaWVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3NTg5
YWIwM2FkM2Y3Y2I0YmIwOTJjMzEyNzNmZjIyMzcxYWM3N2U0IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSAwYjFkZDVlMTI5ZDQwMTAyZTQyMjBiOWEwOTkzMDBjMzE4OGY0MGY5IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSmVyZW15IFB1aGxtYW4gPGpwdWhsbWFuQG12aXN0
YS5jb20+CiBEYXRlOiBXZWQsIDQgTWFyIDIwMjAgMDA6MDY6NDIgKzAwMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gRG9uJ3Qgc2VhcmNoIHN5c3RlbSBmb3IgaGVhZGVycy9saWJyYXJpZXMKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLUxpYi1zeXNjb25m
aWcucHktdXNlLXByZWZpeC12YWx1ZS1mcm9tLWJ1aWxkLWNvbmZpZ3UucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1MaWItc3lzY29uZmlnLnB5LXVzZS1w
cmVmaXgtdmFsdWUtZnJvbS1idWlsZC1jb25maWd1LnBhdGNoCmluZGV4IDY0MTAxN2VkZDUuLmUx
YTU2NzczNmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My8wMDAxLUxpYi1zeXNjb25maWcucHktdXNlLXByZWZpeC12YWx1ZS1mcm9tLWJ1aWxkLWNvbmZp
Z3UucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEt
TGliLXN5c2NvbmZpZy5weS11c2UtcHJlZml4LXZhbHVlLWZyb20tYnVpbGQtY29uZmlndS5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZDgyY2I5NmVlZDEwOTg5MjBhZDNjZGNiMzZmZWIzMjEz
NzYxODA2NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjYwZDcwNDYwZjZjODYzOTc4
ODcwMjRkOTBiNGU4YTMxMjExMzk5ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFs
ZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBGcmksIDEwIFNlcCAy
MDIxIDEyOjI4OjMxICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIExpYi9zeXNjb25maWcucHk6IHVz
ZSBwcmVmaXggdmFsdWUgZnJvbSBidWlsZCBjb25maWd1cmF0aW9uCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1NaXRpZ2F0ZS10aGUtcmFjZS1j
b25kaXRpb24taW4tdGVzdFNvY2tOYW1lLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLzAwMDEtTWl0aWdhdGUtdGhlLXJhY2UtY29uZGl0aW9uLWluLXRlc3RTb2Nr
TmFtZS5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZTE5ZGYwOGY4Ny4uMDAw
MDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1N
aXRpZ2F0ZS10aGUtcmFjZS1jb25kaXRpb24taW4tdGVzdFNvY2tOYW1lLnBhdGNoCisrKyAvZGV2
L251bGwKQEAgLTEsNDcgKzAsMCBAQAotVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCi1TaWduZWQt
b2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KLQotRnJvbSA4MTAzYjkw
MTQ4ZTg3Njg0NTZjM2FiNzA3ZGUxMDVkNjNkOWQ1YjIwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQotRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+Ci1EYXRlOiBGcmksIDE3
IEp1biAyMDIyIDExOjUzOjU5ICswMTAwCi1TdWJqZWN0OiBbUEFUQ0hdIE1pdGlnYXRlIHRoZSBy
YWNlIGNvbmRpdGlvbiBpbiB0ZXN0U29ja05hbWUKLQotZmluZF91bnVzZWRfcG9ydCgpIGhhcyBh
biBpbmhlcmVudCByYWNlIGNvbmRpdGlvbiwgYnV0IHdlIGNhbid0IHVzZQotYmluZF9wb3J0KCkg
YXMgdGhhdCB1c2VzIC5nZXRzb2NrbmFtZSgpIHdoaWNoIHRoaXMgdGVzdCBpcyBleGVyY2lzaW5n
LgotCi1UcnkgYmluZGluZyB0byB1bnVzZWQgcG9ydHMgYSBmZXcgdGltZXMgYmVmb3JlIGZhaWxp
bmcuCi0tLS0KLSBMaWIvdGVzdC90ZXN0X3NvY2tldC5weSB8IDE1ICsrKysrKysrKysrKystLQot
IDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQotCi1kaWZm
IC0tZ2l0IGEvTGliL3Rlc3QvdGVzdF9zb2NrZXQucHkgYi9MaWIvdGVzdC90ZXN0X3NvY2tldC5w
eQotaW5kZXggYzk4MTkwMzgyNC4uYjE2MzBkMThiNiAxMDA2NDQKLS0tLSBhL0xpYi90ZXN0L3Rl
c3Rfc29ja2V0LnB5Ci0rKysgYi9MaWIvdGVzdC90ZXN0X3NvY2tldC5weQotQEAgLTEzOTAsMTAg
KzEzOTAsMjEgQEAgZGVmIHRlc3RTdHJpbmdUb0lQdjYoc2VsZik6Ci0gCi0gICAgIGRlZiB0ZXN0
U29ja05hbWUoc2VsZik6Ci0gICAgICAgICAjIFRlc3RpbmcgZ2V0c29ja25hbWUoKQotLSAgICAg
ICAgcG9ydCA9IHNvY2tldF9oZWxwZXIuZmluZF91bnVzZWRfcG9ydCgpCi0gICAgICAgICBzb2Nr
ID0gc29ja2V0LnNvY2tldChzb2NrZXQuQUZfSU5FVCwgc29ja2V0LlNPQ0tfU1RSRUFNKQotICAg
ICAgICAgc2VsZi5hZGRDbGVhbnVwKHNvY2suY2xvc2UpCi0tICAgICAgICBzb2NrLmJpbmQoKCIw
LjAuMC4wIiwgcG9ydCkpCi0rCi0rICAgICAgICAjIFNpbmNlIGZpbmRfdW51c2VkX3BvcnQoKSBp
cyBpbmhlcmVudGx5IHN1YmplY3QgdG8gcmFjZSBjb25kaXRpb25zLCB3ZQotKyAgICAgICAgIyBj
YWxsIGl0IGEgY291cGxlIHRpbWVzIGlmIG5lY2Vzc2FyeS4KLSsgICAgICAgIGZvciBpIGluIGl0
ZXJ0b29scy5jb3VudCgpOgotKyAgICAgICAgICAgIHBvcnQgPSBzb2NrZXRfaGVscGVyLmZpbmRf
dW51c2VkX3BvcnQoKQotKyAgICAgICAgICAgIHRyeToKLSsgICAgICAgICAgICAgICAgc29jay5i
aW5kKCgiMC4wLjAuMCIsIHBvcnQpKQotKyAgICAgICAgICAgIGV4Y2VwdCBPU0Vycm9yIGFzIGU6
Ci0rICAgICAgICAgICAgICAgIGlmIGUuZXJybm8gIT0gZXJybm8uRUFERFJJTlVTRSBvciBpID09
IDU6Ci0rICAgICAgICAgICAgICAgICAgICByYWlzZQotKyAgICAgICAgICAgIGVsc2U6Ci0rICAg
ICAgICAgICAgICAgIGJyZWFrCi0rCi0gICAgICAgICBuYW1lID0gc29jay5nZXRzb2NrbmFtZSgp
Ci0gICAgICAgICAjIFhYWChubm9yd2l0eik6IGh0dHA6Ly90aW55dXJsLmNvbS9vczVqeiBzZWVt
cyB0byBpbmRpY2F0ZQotICAgICAgICAgIyBpdCByZWFzb25hYmxlIHRvIGdldCB0aGUgaG9zdCdz
IGFkZHIgaW4gYWRkaXRpb24gdG8gMC4wLjAuMC4KLS0tIAotMi4yNS4xCi0KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLWRpc3R1dGlscy1zeXNj
b25maWctYXBwZW5kLVNUQUdJTkdfTElCRElSLXB5dGhvbi1zeXMucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1kaXN0dXRpbHMtc3lzY29uZmlnLWFwcGVu
ZC1TVEFHSU5HX0xJQkRJUi1weXRob24tc3lzLnBhdGNoCmluZGV4IDM2OGE3MjVmZjcuLmFlNjhl
N2I2YmMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8w
MDAxLWRpc3R1dGlscy1zeXNjb25maWctYXBwZW5kLVNUQUdJTkdfTElCRElSLXB5dGhvbi1zeXMu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtZGlz
dHV0aWxzLXN5c2NvbmZpZy1hcHBlbmQtU1RBR0lOR19MSUJESVItcHl0aG9uLXN5cy5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gYzI0Njc0ZTBhNTIzNjczNTlhMWEzZDk1MGJhYjhiYzNkMjgy
Mjc5YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTNjOGUwNjVhZTk3Njk3ZDY3MjRm
N2RlNTBiOTZmY2IyYjVhNDcxMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhh
bmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVGh1LCAzMSBKYW4g
MjAxOSAxNjo0NjozMCArMDEwMAogU3ViamVjdDogW1BBVENIXSBkaXN0dXRpbHMvc3lzY29uZmln
OiBhcHBlbmQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My8xMi1kaXN0dXRpbHMtcHJlZml4LWlzLWluc2lkZS1zdGFnaW5nLWFyZWEucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMTItZGlzdHV0aWxzLXByZWZpeC1pcy1p
bnNpZGUtc3RhZ2luZy1hcmVhLnBhdGNoCmluZGV4IGEwNmU5YjU2YzEuLmYwNmFjYzgyNDkgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8xMi1kaXN0dXRp
bHMtcHJlZml4LWlzLWluc2lkZS1zdGFnaW5nLWFyZWEucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLzEyLWRpc3R1dGlscy1wcmVmaXgtaXMtaW5zaWRlLXN0
YWdpbmctYXJlYS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMWNjNGNhYjhkNTc5YmJjY2I4
YTRmYzEzYTI4MTU4YTU4YzYwM2NiNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMTE2
YjAyMzBiMzJkNGJjMGNhYTMxODZjZDJmZjBlZDg5Zjk1ZGFkYSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDE0
IE1heSAyMDEzIDE1OjAwOjI2IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIHB5dGhvbjM6IEFkZCB0
YXJnZXQgYW5kIG5hdGl2ZSByZWNpcGVzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjNfMy4xMC42LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zXzMuMTAuNy5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjNfMy4xMC42LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjNfMy4xMC43LmJiCmluZGV4IDFiMjg3Mjg3
MzIuLmZmMmRkOGUzN2IgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uM18zLjEwLjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zXzMuMTAuNy5iYgpAQCAtMzUsNyArMzUsMTAgQEAgU1JDX1VSSSA9ICJodHRwOi8vd3d3LnB5
dGhvbi5vcmcvZnRwL3B5dGhvbi8ke1BWfS9QeXRob24tJHtQVn0udGFyLnh6IFwKICAgICAgICAg
ICAgZmlsZTovLzAwMDEtc2V0dXAucHktRG8tbm90LWRldGVjdC1tdWx0aWFyY2gtcGF0aHMtd2hl
bi1jcm9zcy1jby5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9kZXRlcm1pbmlzdGljX2ltcG9y
dHMucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1Bdm9pZC1zaGViYW5nLW92ZXJmbG93
LW9uLXB5dGhvbi1jb25maWcucHkucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1NaXRp
Z2F0ZS10aGUtcmFjZS1jb25kaXRpb24taW4tdGVzdFNvY2tOYW1lLnBhdGNoIFwKKyAgICAgICAg
ICAgZmlsZTovLzAwMDEtTGliLXN5c2NvbmZpZy5weS11c2UtcHJlZml4LXZhbHVlLWZyb20tYnVp
bGQtY29uZmlndS5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDAxLWRpc3R1dGlscy1zeXNj
b25maWctYXBwZW5kLVNUQUdJTkdfTElCRElSLXB5dGhvbi1zeXMucGF0Y2ggXAorICAgICAgICAg
ICBmaWxlOi8vMTItZGlzdHV0aWxzLXByZWZpeC1pcy1pbnNpZGUtc3RhZ2luZy1hcmVhLnBhdGNo
IFwKKyAgICAgICAgICAgZmlsZTovLzAwMDEtRG9uLXQtc2VhcmNoLXN5c3RlbS1mb3ItaGVhZGVy
cy1saWJyYXJpZXMucGF0Y2ggXAogICAgICAgICAgICAiCiAKIFNSQ19VUkk6YXBwZW5kOmNsYXNz
LW5hdGl2ZSA9ICIgXApAQCAtNDQsNyArNDcsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRp
dmUgPSAiIFwKICAgICAgICAgICAgZmlsZTovLzEyLWRpc3R1dGlscy1wcmVmaXgtaXMtaW5zaWRl
LXN0YWdpbmctYXJlYS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLURvbi10LXNlYXJj
aC1zeXN0ZW0tZm9yLWhlYWRlcnMtbGlicmFyaWVzLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JD
X1VSSVtzaGEyNTZzdW1dID0gImY3OTVmZjg3ZDExZDRiMGM3YzMzYmM4ODUxYjBjMjg2NDhkOGE0
NTgzYWEyMTAwYTk4YzIyYjQzMjZiNmQzZjMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmVlZDg0
MTViNzUxNmZiMmYyNjA5MDZkYjVkNDhkZDRjMDZhY2MwY2IyNGE3ZDZjYzE1Mjk2YTYwNGRjZGM0
OCIKIAogIyBleGNsdWRlIHByZS1yZWxlYXNlcyBmb3IgYm90aCBweXRob24gMi54IGFuZCAzLngK
IFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIltQcF15dGhvbi0oP1A8cHZlcj5cZCsoXC5cZCspKyku
dGFyIgotLSAKMi4zMS4xCgo=

--===============0274997810744656633==--

