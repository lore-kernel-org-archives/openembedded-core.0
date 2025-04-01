Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C2E3C369AA
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:23 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.18055.1743511397201627120
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=E1qnoiSl;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=AuIV8Ljc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010195f160a0cf-d439efd9-cfa6-4d2a-a506-523738e8febf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/LhyU2ciWjr2Y7+wbujlMLTgEy62MZbN+2Cjd/uAc4A=;
	b=E1qnoiSlbhMGzYGdN/M2pw22BTzvAyn8esZo7L6ooN5MIQtXGeQl2t2yYfma/+Qo
	Jbn5RBWdiZovkutDABKx4SKXKVtnv4x/H4ZtEFaIWgU00f/NzYcd2vUPCOkbp8akjST
	jsmjNYDIqF6TaxlO9aEJz5Ac1y4JyaOVoaw/l1ms=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/LhyU2ciWjr2Y7+wbujlMLTgEy62MZbN+2Cjd/uAc4A=;
	b=AuIV8LjcjtkNIuK5O56tW4rNu6uQbF+huRPBaFSIUXjdVEbQs08pwisVRd4RzEmR
	YC6GyD/gEmMdz05BBb5X6g1QixLh4P1D35ENCHx9TpQ0GyJMDx8IDzrrhe12yiYKZyz
	oqLvPi0vKATvauYa2SnY+4aDWko/J3wnfizDO5wM=
Content-Type: multipart/mixed; boundary="===============4425925493087392742=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-flit-core: upgrading to 3.12.0 FAILED
Message-ID: <01010195f160a0cf-d439efd9-cfa6-4d2a-a506-523738e8febf-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214061

--===============4425925493087392742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-flit-core* to *3.12.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-flit-core-upgrade-3.11.0-3.12.0.patch
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

-- >8 --
From 5dcd18cbbc3fdfcb715fd4fc77c576deb998db8c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 08:51:05 +0000
Subject: [PATCH] python3-flit-core: upgrade 3.11.0 -> 3.12.0

---
 ...{python3-flit-core_3.11.0.bb => python3-flit-core_3.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-flit-core_3.11.0.bb => python3-flit-core_3.12.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-flit-core_3.11.0.bb b/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-flit-core_3.11.0.bb
rename to meta/recipes-devtools/python/python3-flit-core_3.12.0.bb
index 1d44b58830..e40ffd0d0f 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.11.0.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "https://github.com/pypa/flit/issues"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=41eb78fa8a872983a882c694a8305f08"
 
-SRC_URI[sha256sum] = "58d0a07f684c315700c9c54a661a1130995798c3e495db0db53ce6e7d0121825"
+SRC_URI[sha256sum] = "1c80f34dd96992e7758b40423d2809f48f640ca285d0b7821825e50745ec3740"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============4425925493087392742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1888 entries from dependency cache.
Parsing recipes...done.
Parsing of 924 .bb files complete (923 cached, 1 parsed). 1886 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8e8c496fc5912aba444160986877aad13df429cd"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 392 Local 181 Mirrors 0 Missed 211 Current 266 (46% match, 67% complete)
Removing 52 stale sstate objects for arch qemux86_64...done.
Removing 10 stale sstate objects for arch x86_64...done.
Removing 26 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 356 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 359 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 363 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 364 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 375 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 377 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 378 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 389 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 398 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 404 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 408 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.31.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 411 of 658 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 415 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 416 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 417 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cmake-native-3.31.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 422 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cmake-native-3.31.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-2.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 430 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 433 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 434 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 438 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 445 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 449 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 455 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 456 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 457 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 460 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 462 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 465 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 469 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 474 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 477 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 480 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 486 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 493 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 496 of 658 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 507 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 508 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 513 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 516 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 517 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.8.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 522 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 523 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 525 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 530 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 532 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 536 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 537 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-native-5.40.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 541 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 542 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 543 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.7.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 546 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 547 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 548 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 550 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 552 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-native-5.40.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 555 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 557 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 558 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 562 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 563 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 564 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 565 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 570 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_create_spdx_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 571 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 572 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 573 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.75-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 574 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_create_spdx_setscene)
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 575 of 658 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 577 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 579 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 580 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.75-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 582 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 585 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 587 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 592 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 593 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 594 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 597 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 598 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 599 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-native-2.13.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 602 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 604 of 658 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 606 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 611 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 612 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 613 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 614 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 615 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 618 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 622 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 628 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 633 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-native-2.13.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 636 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 639 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-native-2.40.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 650 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 651 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 652 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-native-2.40.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 653 of 658 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 654 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running setscene task 656 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-native-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: Running task 316 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_recipe_qa)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_recipe_qa: Started
NOTE: Running task 527 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_fetch)
NOTE: Running noexec task 586 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_fetch)
NOTE: Running noexec task 594 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_fetch)
NOTE: Running task 596 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: recipe util-linux-native-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 612 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 664 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 684 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_unpack)
NOTE: Running task 690 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: Running task 720 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: Running task 736 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_fetch)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_fetch: Succeeded
NOTE: Running task 766 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_unpack)
NOTE: Running task 767 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: Running task 799 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 811 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe openssl-3.4.1-r0: task do_fetch: Started
NOTE: Running task 815 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe openssl-3.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 823 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_unpack)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: Running task 854 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_patch)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_unpack: Succeeded
NOTE: Running task 861 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 867 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_fetch)
NOTE: Running task 869 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 874 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: Running task 878 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_fetch)
NOTE: Running task 882 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_fetch)
NOTE: Running task 883 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_fetch)
NOTE: Running task 884 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_fetch)
NOTE: Running task 886 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe openssl-3.4.1-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Started
NOTE: Running task 887 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_patch: Started
NOTE: recipe nettle-3.10.1-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.51-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: Running task 889 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_fetch)
NOTE: recipe nettle-3.10.1-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: Running task 890 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: Running task 892 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_fetch)
NOTE: Running task 893 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: Running task 900 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_unpack)
NOTE: recipe xz-5.6.4-r0: task do_fetch: Started
NOTE: recipe xz-5.6.4-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Succeeded
NOTE: Running task 902 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_fetch)
NOTE: Running task 903 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_unpack)
NOTE: recipe expat-2.7.1-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe expat-2.7.1-r0: task do_fetch: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 904 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_unpack)
NOTE: Running task 907 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_collect_spdx_deps)
NOTE: Running task 908 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_unpack)
NOTE: Running task 909 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_unpack)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 911 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Started
NOTE: recipe gdbm-1.24-r0: task do_fetch: Started
NOTE: Running task 912 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gdbm-1.24-r0: task do_fetch: Succeeded
NOTE: Running task 913 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 914 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe expat-2.7.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.10.1-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgpg-error-1.51-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: Running task 915 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_unpack)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 919 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_fetch)
NOTE: Running task 920 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_patch)
NOTE: Running task 921 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_patch)
NOTE: recipe nettle-3.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 922 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_patch)
NOTE: recipe xz-5.6.4-r0: task do_unpack: Started
NOTE: recipe libunistring-1.3-r0: task do_fetch: Started
NOTE: recipe openssl-3.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 923 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_patch)
NOTE: recipe expat-2.7.1-r0: task do_patch: Started
NOTE: recipe libunistring-1.3-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_unpack: Succeeded
NOTE: Running task 925 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_patch: Started
NOTE: Running task 926 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_patch)
NOTE: recipe nettle-3.10.1-r0: task do_patch: Started
NOTE: recipe xz-5.6.4-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 928 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_patch)
NOTE: Running task 932 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 943 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_write_config)
NOTE: recipe openssl-3.4.1-r0: task do_patch: Started
NOTE: recipe gdbm-1.24-r0: task do_unpack: Started
NOTE: Running task 944 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_configure)
NOTE: recipe expat-2.7.1-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_patch: Started
NOTE: Running task 945 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: recipe xz-5.6.4-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 948 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_patch)
NOTE: Running task 951 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 952 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_fetch)
NOTE: Running task 953 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: recipe gdbm-1.24-r0: task do_unpack: Succeeded
NOTE: Running task 954 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_patch)
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Started
NOTE: recipe libunistring-1.3-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_configure: Started
NOTE: Running task 955 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_patch)
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Started
NOTE: recipe xz-5.6.4-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: Running task 958 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_generate_toolchain_file)
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: recipe curl-8.12.1-r0: task do_fetch: Started
NOTE: Running task 964 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: recipe gdbm-1.24-r0: task do_patch: Started
NOTE: recipe curl-8.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 966 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_configure: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Started
NOTE: recipe nettle-3.10.1-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 969 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_compile)
NOTE: Running task 970 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Succeeded
NOTE: Running task 971 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_fetch)
NOTE: recipe expat-2.7.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libgpg-error-1.51-r0: task do_patch: Succeeded
NOTE: Running task 973 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: Running task 976 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_fetch)
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe openssl-3.4.1-r0: task do_patch: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 981 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: Running task 982 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_fetch)
NOTE: Running task 984 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_fetch)
NOTE: Running task 987 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_fetch)
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Started
NOTE: Running task 989 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe libunistring-1.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_compile: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.18-r0: task do_fetch: Started
NOTE: recipe curl-8.12.1-r0: task do_unpack: Started
NOTE: Running task 990 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_patch)
NOTE: Running task 992 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: Running task 993 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_unpack)
NOTE: recipe json-c-0.18-r0: task do_fetch: Succeeded
NOTE: Running task 994 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_unpack)
NOTE: recipe libcap-2.75-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_fetch: Started
NOTE: recipe libcap-2.75-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_fetch: Started
NOTE: Running task 996 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_fetch)
NOTE: recipe libtasn1-4.20.0-r0: task do_fetch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gnutls-3.8.9-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe json-c-0.18-r0: task do_unpack: Started
NOTE: Running task 1020 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: Running task 1033 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_unpack)
NOTE: Running task 1038 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_fetch)
NOTE: Running task 1039 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_fetch)
NOTE: Running task 1040 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_fetch)
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 1042 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_fetch)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe json-c-0.18-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_fetch: Succeeded
NOTE: Running task 1044 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: Running task 1045 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_patch)
NOTE: Running task 1046 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_unpack)
NOTE: Running task 1047 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_unpack)
NOTE: recipe libunistring-1.3-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.75-r0: task do_unpack: Started
NOTE: Running task 1050 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.7-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: Running task 1052 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_fetch)
NOTE: Running task 1053 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_patch)
NOTE: recipe libffi-3.4.7-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe json-c-0.18-r0: task do_patch: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_unpack: Started
NOTE: Running task 1060 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_unpack)
NOTE: Running task 1061 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_unpack)
NOTE: Running task 1062 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_unpack)
NOTE: recipe gnutls-3.8.9-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Started
NOTE: recipe libcap-2.75-r0: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Started
NOTE: Running task 1063 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_patch)
NOTE: recipe curl-8.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 1064 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_patch)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_unpack: Started
NOTE: recipe python3-3.13.2-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.7-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1065 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_patch)
NOTE: recipe json-c-0.18-r0: task do_patch: Succeeded
NOTE: Running task 1066 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_unpack)
NOTE: Running task 1067 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_unpack)
NOTE: recipe python3-3.13.2-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.75-r0: task do_patch: Started
NOTE: Running task 1068 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_unpack)
NOTE: recipe libffi-3.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 1069 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_patch)
NOTE: recipe curl-8.12.1-r0: task do_patch: Started
NOTE: recipe libcap-2.75-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: Running task 1071 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_patch)
NOTE: Running task 1072 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_generate_toolchain_file)
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_compile: Succeeded
NOTE: Running task 1076 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: Running task 1077 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_install)
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_patch: Started
NOTE: Running task 1078 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_patch)
NOTE: recipe python3-3.13.2-r0: task do_unpack: Started
NOTE: recipe curl-8.12.1-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.18-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1094 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_fetch)
NOTE: Running task 1096 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_fetch)
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe json-c-0.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Started
NOTE: Running task 1099 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_install: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_patch: Succeeded
NOTE: Running task 1101 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.8.bb:do_fetch)
NOTE: recipe lzlib-1.15-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_patch: Succeeded
NOTE: recipe file-5.46-r0: task do_fetch: Started
NOTE: recipe lzlib-1.15-r0: task do_fetch: Succeeded
NOTE: Running task 1104 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_fetch)
NOTE: Running task 1105 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_unpack)
NOTE: recipe libffi-3.4.7-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Started
NOTE: Running task 1110 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1111 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: recipe libarchive-3.7.8-r0: task do_fetch: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_install: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.7.8-r0: task do_fetch: Succeeded
NOTE: Running task 1112 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: recipe lzlib-1.15-r0: task do_unpack: Started
NOTE: Running task 1113 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_populate_sysroot)
NOTE: recipe elfutils-0.192-r0: task do_fetch: Started
NOTE: Running task 1114 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.8.bb:do_unpack)
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_fetch: Succeeded
NOTE: Running task 1116 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: Running task 1117 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: Running task 1118 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: recipe file-5.46-r0: task do_fetch: Succeeded
NOTE: Running task 1119 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_unpack: Succeeded
NOTE: Running task 1120 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1121 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_patch)
NOTE: Running task 1122 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_patch)
NOTE: recipe libarchive-3.7.8-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot: Started
NOTE: Running task 1123 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_unpack)
NOTE: Running task 1124 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_fetch)
NOTE: recipe lzlib-1.15-r0: task do_patch: Started
NOTE: Running task 1125 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1126 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_patch)
NOTE: recipe gnutls-3.8.9-r0: task do_patch: Started
NOTE: recipe elfutils-0.192-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Started
NOTE: recipe file-5.46-r0: task do_unpack: Started
NOTE: recipe bash-5.2.37-r0: task do_fetch: Started
NOTE: recipe lzlib-1.15-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_fetch: Started
NOTE: Running task 1128 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_patch: Started
NOTE: recipe bash-5.2.37-r0: task do_fetch: Succeeded
NOTE: Running task 1129 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_unpack)
NOTE: recipe coreutils-9.6-r0: task do_fetch: Succeeded
NOTE: Running task 1130 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_unpack)
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.7.8-r0: task do_unpack: Succeeded
NOTE: Running task 1131 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_patch)
NOTE: Running task 1132 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.8.bb:do_patch)
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1135 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_fetch)
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_unpack: Started
NOTE: Running task 1137 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_recipe_qa)
NOTE: recipe coreutils-9.6-r0: task do_unpack: Started
NOTE: recipe libarchive-3.7.8-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.1-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.9-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1140 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_fetch)
NOTE: Running task 1141 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_unpack)
NOTE: recipe python3-flit-core-3.12.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1142 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.7.8-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.1-r0: task do_unpack: Started
NOTE: Running task 1143 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_spdx)
NOTE: recipe base-passwd-3.6.6-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: Running task 1145 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_unpack)
NOTE: Running task 1146 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: Running task 1147 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: Running task 1153 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_fetch)
NOTE: recipe libgcrypt-1.11.0-r0: task do_patch: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1155 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_patch: Succeeded
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_spdx: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-3.12.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: Running task 1160 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_fetch)
NOTE: recipe shadow-4.17.3-r0: task do_fetch: Started
NOTE: recipe file-5.46-r0: task do_unpack: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Started
NOTE: Running task 1163 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_unpack: Succeeded
NOTE: Running task 1164 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_patch)
NOTE: recipe python3-flit-core-3.12.0-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: recipe python3-flit-core-3.12.0-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_unpack: Succeeded
NOTE: recipe file-5.46-r0: task do_patch: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1166 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_collect_spdx_deps)
NOTE: recipe bash-5.2.37-r0: task do_patch: Started
NOTE: recipe python3-3.13.2-r0: task do_unpack: Succeeded
NOTE: Running task 1167 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_patch)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1168 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_configure)
NOTE: Running task 1169 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_patch)
NOTE: Running task 1170 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_patch)
NOTE: Running task 1171 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_unpack)
NOTE: Running task 1172 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_patch)
NOTE: Running task 1174 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_unpack)
NOTE: recipe file-5.46-r0: task do_patch: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1185 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: Running task 1197 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_fetch)
NOTE: Running task 1200 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_fetch)
NOTE: Running task 1201 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_patch: Started
NOTE: recipe python3-flit-core-3.12.0-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_patch: Started
NOTE: recipe shadow-4.17.3-r0: task do_unpack: Started
NOTE: recipe coreutils-9.6-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_configure: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_patch: Started
NOTE: Running task 1210 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe python3-flit-core-3.12.0-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Started
NOTE: Running task 1218 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_patch)
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Started
NOTE: Running task 1219 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_patch)
NOTE: recipe binutils-2.44-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe binutils-2.44-r0: task do_fetch: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_configure: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1232 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_unpack)
NOTE: Running task 1241 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: Running task 1255 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_compile)
NOTE: recipe python3-flit-core-3.12.0-r0: task do_patch: Started
NOTE: recipe elfutils-0.192-r0: task do_patch: Started
NOTE: Running noexec task 1269 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1294 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_unpack)
NOTE: recipe binutils-2.44-r0: task do_unpack: Started
NOTE: recipe bash-5.2.37-r0: task do_patch: Succeeded
NOTE: recipe python3-flit-core-3.12.0-r0: task do_patch: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_compile: Started
NOTE: Running task 1296 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1297 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_populate_lic)
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-3.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-flit-core-3.12.0-r0: task do_populate_lic: Started
NOTE: recipe coreutils-9.6-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_patch: Succeeded
NOTE: recipe python3-flit-core-3.12.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-flit-core-3.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1302 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_patch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1303 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_install)
NOTE: recipe shadow-4.17.3-r0: task do_unpack: Succeeded
NOTE: Running task 1304 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_patch)
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1305 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_unpack)
NOTE: recipe elfutils-0.192-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_patch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_install: Started
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Started
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1308 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_patch)
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Started
NOTE: recipe shadow-4.17.3-r0: task do_patch: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_patch: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_install: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1312 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: Running task 1313 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_populate_sysroot)
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1314 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe unzip-1_6.0-r0: task do_patch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1315 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1316 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1317 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_create_spdx)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_create_spdx: Started
NOTE: recipe python3-packaging-native-24.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1318 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-packaging-native-24.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1319 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_configure)
NOTE: Running task 1320 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_configure)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_configure: Started
NOTE: recipe python3-packaging-native-24.2-r0: task do_configure: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-packaging-native-24.2-r0: task do_configure: Succeeded
NOTE: Running task 1321 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_compile)
NOTE: Running task 1322 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_compile)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_compile: Started
NOTE: recipe python3-packaging-native-24.2-r0: task do_compile: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_compile: Succeeded
NOTE: recipe python3-packaging-native-24.2-r0: task do_compile: Succeeded
NOTE: Running task 1323 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_install)
NOTE: Running task 1324 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_install)
NOTE: recipe unzip-1_6.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_install: Started
NOTE: recipe python3-packaging-native-24.2-r0: task do_install: Started
NOTE: recipe binutils-2.44-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 1326 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_patch)
NOTE: Running task 1327 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_populate_sysroot)
NOTE: recipe python3-packaging-native-24.2-r0: task do_install: Succeeded
NOTE: recipe binutils-2.44-r0: task do_patch: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot: Started
NOTE: Running task 1328 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_populate_sysroot)
NOTE: recipe python3-packaging-native-24.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1329 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1330 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_create_spdx)
NOTE: recipe python3-packaging-native-24.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-build-native-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1331 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_collect_spdx_deps)
NOTE: recipe binutils-2.44-r0: task do_patch: Succeeded
NOTE: recipe python3-build-native-1.2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-build-native-1.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1333 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_configure)
NOTE: recipe python3-build-native-1.2.2-r0: task do_configure: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 1334 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_compile)
NOTE: recipe python3-build-native-1.2.2-r0: task do_compile: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1335 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_install)
NOTE: recipe python3-build-native-1.2.2-r0: task do_install: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 1336 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_populate_sysroot)
NOTE: recipe python3-build-native-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1337 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1338 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1339 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_create_spdx)
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_create_spdx: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1340 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_configure)
NOTE: Running task 1341 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_configure)
NOTE: Running task 1342 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_collect_spdx_deps)
NOTE: Running task 1343 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_collect_spdx_deps)
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_configure: Started
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_configure: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_configure: Succeeded
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_configure: Succeeded
NOTE: Running task 1344 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_compile)
NOTE: Running task 1345 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_compile)
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_compile: Started
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-jinja2-native/3.1.6/recipe-sysroot-native/usr/lib/python3.13/site-packages/build/__main__.py", line 178, in _handle_build_error
|     yield
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-jinja2-native/3.1.6/recipe-sysroot-native/usr/lib/python3.13/site-packages/build/__main__.py", line 429, in main
|     built = build_call(
|         args.srcdir,
|     ...<5 lines>...
|         args.installer,
|     )
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-jinja2-native/3.1.6/recipe-sysroot-native/usr/lib/python3.13/site-packages/build/__main__.py", line 238, in build_package
|     out = _build(isolation, srcdir, outdir, distribution, config_settings, skip_dependency_check, installer)
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-jinja2-native/3.1.6/recipe-sysroot-native/usr/lib/python3.13/site-packages/build/__main__.py", line 172, in _build
|     return _build_in_current_env(srcdir, outdir, distribution, config_settings, skip_dependency_check)
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-jinja2-native/3.1.6/recipe-sysroot-native/usr/lib/python3.13/site-packages/build/__main__.py", line 151, in _build_in_current_env
|     missing = builder.check_dependencies(distribution, config_settings or {})
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-jinja2-native/3.1.6/recipe-sysroot-native/usr/lib/python3.13/site-packages/build/_builder.py", line 243, in check_dependencies
|     return {u for d in dependencies for u in check_dependency(d)}
|                                              ~~~~~~~~~~~~~~~~^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-jinja2-native/3.1.6/recipe-sysroot-native/usr/lib/python3.13/site-packages/build/_util.py", line 53, in check_dependency
|     if req.specifier and not req.specifier.contains(dist.version, prereleases=True):
|                              ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-jinja2-native/3.1.6/recipe-sysroot-native/usr/lib/python3.13/site-packages/packaging/specifiers.py", line 917, in contains
|     item = Version(item)
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-jinja2-native/3.1.6/recipe-sysroot-native/usr/lib/python3.13/site-packages/packaging/version.py", line 200, in __init__
|     match = self._regex.search(version)
| TypeError: expected string or bytes-like object, got 'NoneType'
| 
| ERROR expected string or bytes-like object, got 'NoneType'
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-jinja2-native/3.1.6/temp/run.do_compile.3594577:159 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-jinja2-native/3.1.6/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-jinja2-native/3.1.6/jinja2-3.1.6'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-jinja2-native/3.1.6/temp/run.do_compile.3594577, line 159
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-jinja2-native/3.1.6/temp/run.do_compile.3594577, line 154
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-jinja2-native/3.1.6/temp/run.do_compile.3594577, line 163
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_compile: Failed
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.45.1/recipe-sysroot-native/usr/lib/python3.13/site-packages/build/__main__.py", line 178, in _handle_build_error
|     yield
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.45.1/recipe-sysroot-native/usr/lib/python3.13/site-packages/build/__main__.py", line 429, in main
|     built = build_call(
|         args.srcdir,
|     ...<5 lines>...
|         args.installer,
|     )
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.45.1/recipe-sysroot-native/usr/lib/python3.13/site-packages/build/__main__.py", line 238, in build_package
|     out = _build(isolation, srcdir, outdir, distribution, config_settings, skip_dependency_check, installer)
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.45.1/recipe-sysroot-native/usr/lib/python3.13/site-packages/build/__main__.py", line 172, in _build
|     return _build_in_current_env(srcdir, outdir, distribution, config_settings, skip_dependency_check)
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.45.1/recipe-sysroot-native/usr/lib/python3.13/site-packages/build/__main__.py", line 151, in _build_in_current_env
|     missing = builder.check_dependencies(distribution, config_settings or {})
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.45.1/recipe-sysroot-native/usr/lib/python3.13/site-packages/build/_builder.py", line 243, in check_dependencies
|     return {u for d in dependencies for u in check_dependency(d)}
|                                              ~~~~~~~~~~~~~~~~^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.45.1/recipe-sysroot-native/usr/lib/python3.13/site-packages/build/_util.py", line 53, in check_dependency
|     if req.specifier and not req.specifier.contains(dist.version, prereleases=True):
|                              ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.45.1/recipe-sysroot-native/usr/lib/python3.13/site-packages/packaging/specifiers.py", line 917, in contains
|     item = Version(item)
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.45.1/recipe-sysroot-native/usr/lib/python3.13/site-packages/packaging/version.py", line 200, in __init__
|     match = self._regex.search(version)
| TypeError: expected string or bytes-like object, got 'NoneType'
| 
| ERROR expected string or bytes-like object, got 'NoneType'
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.45.1/temp/run.do_compile.3594584:159 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.45.1/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.45.1/wheel-0.45.1'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.45.1/temp/run.do_compile.3594584, line 159
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.45.1/temp/run.do_compile.3594584, line 154
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.45.1/temp/run.do_compile.3594584, line 163
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1345 tasks of which 1137 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401085041.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401085041.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-jinja2-native/3.1.6/temp/log.do_compile.3594577
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.45.1/temp/log.do_compile.3594584
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-jinja2-native-3.1.6-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-jinja2-native/3.1.6/temp/run.do_compile.3594577' failed with exit code 1
ERROR: python3-wheel-native-0.45.1-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.45.1/temp/run.do_compile.3594584' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-jinja2-native/3.1.6/temp/log.do_compile.3594577
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_compile) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.45.1/temp/log.do_compile.3594584
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_compile) failed with exit code '1'

--===============4425925493087392742==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-flit-core-upgrade-3.11.0-3.12.0.patch"

RnJvbSA1ZGNkMThjYmJjM2ZkZmNiNzE1ZmQ0ZmM3N2M1NzZkZWI5OThkYjhjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwODo1MTowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZmxpdC1jb3JlOiB1cGdyYWRlIDMuMTEuMCAtPiAzLjEyLjAKCi0tLQogLi4ue3B5dGhv
bjMtZmxpdC1jb3JlXzMuMTEuMC5iYiA9PiBweXRob24zLWZsaXQtY29yZV8zLjEyLjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1mbGl0LWNvcmVfMy4xMS4w
LmJiID0+IHB5dGhvbjMtZmxpdC1jb3JlXzMuMTIuMC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZmxpdC1jb3JlXzMuMTEuMC5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1mbGl0LWNvcmVfMy4xMi4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1mbGl0LWNvcmVfMy4xMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZmxpdC1jb3JlXzMuMTIuMC5iYgppbmRleCAxZDQ0YjU4
ODMwLi5lNDBmZmQwZDBmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtZmxpdC1jb3JlXzMuMTEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtZmxpdC1jb3JlXzMuMTIuMC5iYgpAQCAtOCw3ICs4LDcgQEAgQlVHVFJB
Q0tFUiA9ICJodHRwczovL2dpdGh1Yi5jb20vcHlwYS9mbGl0L2lzc3VlcyIKIExJQ0VOU0UgPSAi
QlNELTMtQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NDFl
Yjc4ZmE4YTg3Mjk4M2E4ODJjNjk0YTgzMDVmMDgiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1
OGQwYTA3ZjY4NGMzMTU3MDBjOWM1NGE2NjFhMTEzMDk5NTc5OGMzZTQ5NWRiMGRiNTNjZTZlN2Qw
MTIxODI1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFjODBmMzRkZDk2OTkyZTc3NThiNDA0MjNk
MjgwOWY0OGY2NDBjYTI4NWQwYjc4MjE4MjVlNTA3NDVlYzM3NDAiCiAKIGluaGVyaXQgcHlwaSBw
eXRob25fZmxpdF9jb3JlCiAKLS0gCjIuNDcuMQoK

--===============4425925493087392742==--

