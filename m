Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2047CC48BF7
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:34:01 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.88857.1705340030103123407
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WlsUos9m;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hKsTuGur;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018d0e2fc8dd-d543bf99-ac90-4ce3-a653-9bc12ce4ccf5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AYCF1REQY3m9UfwR7kXSXyZB9nkatVVAz+QvyBoZ4H4=;
	b=WlsUos9m9NbDiBhjoYxv08n9KRoYhp0uvCsGauUXtz2GwvYoiO1Henkzjx3MdaYY
	xzgu6JIktWGeiG3slzUB0xfH+Qj83T/oDkmPIlHcG1F3keHUo8lRFs5BZS797BCnTC8
	jqvylsK6bQfJ3OWwO0nmwWWTS0k2kD+/QqBXwlaY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AYCF1REQY3m9UfwR7kXSXyZB9nkatVVAz+QvyBoZ4H4=;
	b=hKsTuGur2nrLHYV+SChLPIsStBlVZiGBr/q9KZ3lns+3x5seNxN7k9SaHCabxwj0
	uIBdJVN9r6Na32lMFjmypuqPGdKU76seTwi/KAJCgsfQS1tDiB6sMs2IM23o1WkrQLB
	k4Ka/FR8gSz+EmuHaR7YeFoozORPrbxluR7tE9TQ=
Content-Type: multipart/mixed; boundary="===============1359553255892322178=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 3.0.8 SUCCEEDED
Message-ID: <0101018d0e2fc8dd-d543bf99-ac90-4ce3-a653-9bc12ce4ccf5-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193724

--===============1359553255892322178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cython* to *3.0.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cython-upgrade-3.0.7-3.0.8.patch
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
From 50cc3da80c455dc8e37308fd7f02ebab4e1ddbd8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 07:04:42 +0000
Subject: [PATCH] python3-cython: upgrade 3.0.7 -> 3.0.8

---
 meta/recipes-devtools/python/python-cython.inc                  | 2 +-
 .../python/{python3-cython_3.0.7.bb => python3-cython_3.0.8.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_3.0.7.bb => python3-cython_3.0.8.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index bc1953c504..d116eb826d 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "fb299acf3a578573c190c858d49e0cf9d75f4bc49c3f24c5a63804997ef09213"
+SRC_URI[sha256sum] = "8333423d8fd5765e7cceea3a9985dd1e0a5dfeb2734629e1a2ed2d6233d39de6"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_3.0.7.bb b/meta/recipes-devtools/python/python3-cython_3.0.8.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_3.0.7.bb
rename to meta/recipes-devtools/python/python3-cython_3.0.8.bb
-- 
2.42.0


--===============1359553255892322178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (0 cached, 914 parsed). 1851 targets, 49 skipped, 0 masked, 0 errors.
Removing 24 recipes from the core2-64 sysroot...done.
Removing 57 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-93c808296192a0ea9109d69449177e0a620ca1b5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:93c808296192a0ea9109d69449177e0a620ca1b5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 443 Local 428 Mirrors 0 Missed 15 Current 218 (96% match, 97% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 233 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyparsing_3.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 234 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyparsing_3.1.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 235 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyparsing_3.1.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 236 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyparsing_3.1.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 238 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 239 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 240 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 242 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 243 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pyparsing-3.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pyparsing-3.1.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-setuptools-69.0.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pyparsing-3.1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-setuptools-69.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-setuptools-69.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-69.0.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pyparsing-3.1.1-r0: task do_package_write_ipk_setscene: Started
NOTE: Running task 380 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cython_3.0.8.bb:do_recipe_qa)
NOTE: recipe python3-3.11.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pyparsing-3.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-69.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 315 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-cython-3.0.8-r0: task do_recipe_qa: Started
NOTE: recipe python3-setuptools-69.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pyparsing-3.1.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-setuptools-69.0.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pyparsing-3.1.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pyparsing-3.1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-setuptools-69.0.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 316 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyparsing_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pyparsing-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-69.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cython-3.0.8-r0: task do_recipe_qa: Succeeded
NOTE: Running task 401 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cython_3.0.8.bb:do_fetch)
NOTE: recipe python3-3.11.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 318 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-69.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyparsing-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 350 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cython-3.0.8-r0: task do_fetch: Started
NOTE: recipe python3-cython-3.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 408 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cython_3.0.8.bb:do_unpack)
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cython-3.0.8-r0: task do_unpack: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 365 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 370 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 371 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cython-3.0.8-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 385 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 401 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 402 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 419 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 422 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/elfutils/0.189/temp/log.do_packagedata_setscene.3519470
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 428 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_package_setscene)
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 429 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 430 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 432 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 437 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 933 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cython_3.0.8.bb:do_patch)
NOTE: Running task 951 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 453 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cython-3.0.8-r0: task do_patch: Started
NOTE: Running setscene task 454 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 456 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 458 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 459 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 461 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 463 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1035 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1036 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 466 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1063 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-cython-3.0.8-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Started
NOTE: Running task 1069 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cython_3.0.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1070 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cython_3.0.8.bb:do_populate_lic)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 468 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 470 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-cython-3.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cython-3.0.8-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1072 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-cython-3.0.8-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cython_3.0.8.bb:do_populate_lic unihash changed to e4af6e49966d448486abbc9825f8e63d806e51e8e503c26ebdd1607d84773a62
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1083 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-cython-3.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1084 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1085 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 471 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 479 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 502 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 519 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 533 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 535 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe curl-8.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 543 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 548 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 559 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 565 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 584 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 585 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 601 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 606 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1232 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e644ec3722734ea60494db1182afab8d0334f493c3dc1fb845b731f7ca727b46
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 619 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 621 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 622 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 624 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 626 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 627 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 630 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 634 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 640 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 642 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 648 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 650 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 651 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 654 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 656 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 659 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 661 of 661 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1665 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cython_3.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1799 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata)
NOTE: Running task 1825 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cython_3.0.8.bb:do_collect_spdx_deps)
NOTE: recipe python3-cython-3.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata: Started
NOTE: recipe python3-cython-3.0.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cython-3.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1841 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cython_3.0.8.bb:do_configure)
NOTE: recipe python3-cython-3.0.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-cython-3.0.8-r0: task do_configure: Started
NOTE: recipe python3-cython-3.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1842 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cython_3.0.8.bb:do_compile)
NOTE: recipe python3-cython-3.0.8-r0: task do_compile: Started
NOTE: recipe python3-cython-3.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1843 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cython_3.0.8.bb:do_install)
NOTE: recipe python3-cython-3.0.8-r0: task do_install: Started
NOTE: recipe python3-cython-3.0.8-r0: task do_install: Succeeded
NOTE: Running task 1844 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cython_3.0.8.bb:do_package)
NOTE: Running task 1845 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cython_3.0.8.bb:do_populate_sysroot)
NOTE: recipe python3-cython-3.0.8-r0: task do_package: Started
NOTE: recipe python3-cython-3.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cython-3.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-cython-3.0.8-r0: task do_package: Succeeded
NOTE: Running task 1846 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cython_3.0.8.bb:do_packagedata)
NOTE: recipe python3-cython-3.0.8-r0: task do_packagedata: Started
NOTE: recipe python3-cython-3.0.8-r0: task do_packagedata: Succeeded
NOTE: Running task 1847 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cython_3.0.8.bb:do_create_spdx)
NOTE: Running task 1848 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cython_3.0.8.bb:do_package_write_ipk)
NOTE: Running task 1849 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cython_3.0.8.bb:do_package_write_deb)
NOTE: Running task 1850 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cython_3.0.8.bb:do_package_write_rpm)
NOTE: Running task 1851 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cython_3.0.8.bb:do_package_qa)
NOTE: recipe python3-cython-3.0.8-r0: task do_create_spdx: Started
NOTE: recipe python3-cython-3.0.8-r0: task do_package_write_ipk: Started
NOTE: recipe python3-cython-3.0.8-r0: task do_package_write_deb: Started
NOTE: recipe python3-cython-3.0.8-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cython-3.0.8-r0: task do_package_qa: Started
NOTE: recipe python3-cython-3.0.8-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-cython-3.0.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 1852 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cython_3.0.8.bb:do_create_runtime_spdx)
NOTE: recipe python3-cython-3.0.8-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-cython-3.0.8-r0: task do_package_qa: Succeeded
NOTE: recipe python3-cython-3.0.8-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-cython-3.0.8-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-cython-3.0.8-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1853 of 1853 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cython_3.0.8.bb:do_build)
NOTE: Tasks Summary: Attempted 1853 tasks of which 1822 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-src went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-dbg went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-binutils went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package libelf went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package libasm went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package libdw went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package libdebuginfod went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-ptest went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-staticdev went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-dev went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-doc went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-de went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-en+boldquot went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-en+quot went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-es went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-ja went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-pl went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-uk went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1359553255892322178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.11/site-packages/Cython-3.0.7.dist-info -> /usr/lib/python3.11/site-packages/Cython-3.0.8.dist-info, added "/usr/lib/python3.11/site-packages/Cython/Tests/__pycache__/TestShadow.cpython-311.pyc /usr/lib/python3.11/site-packages/Cython/Tests/TestShadow.py"
Changes to packages/core2-64-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.11/site-packages/Cython-3.0.7.dist-info moved to /usr/lib/python3.11/site-packages/Cython-3.0.8.dist-info
  /usr/lib/python3.11/site-packages/Cython/Tests/__pycache__/TestShadow.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cython/Tests/TestShadow.py was added

--===============1359553255892322178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-cython: PKGV changed from 3.0.7 [default] to 3.0.8 [default]
packages/core2-64-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/C/Cython/Cython-3.0.7.tar.gz;downloadfilename=Cython-3.0.7.tar.gz" to "https://files.pythonhosted.org/packages/source/C/Cython/Cython-3.0.8.tar.gz;downloadfilename=Cython-3.0.8.tar.gz"
packages/core2-64-poky-linux/python3-cython: PV changed from "3.0.7" to "3.0.8"
packages/core2-64-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 23050848 to 23058248 (+0%)
packages/core2-64-poky-linux/python3-cython/python3-cython-dbg: PV changed from "3.0.7" to "3.0.8"
packages/core2-64-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 3.0.7 [default] to 3.0.8 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-dev: PV changed from "3.0.7" to "3.0.8"
packages/core2-64-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 3.0.7 [default] to 3.0.8 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-doc: PV changed from "3.0.7" to "3.0.8"
packages/core2-64-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 3.0.7 [default] to 3.0.8 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-locale: PV changed from "3.0.7" to "3.0.8"
packages/core2-64-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 3.0.7 [default] to 3.0.8 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 22892612 to 22890639 (-0%)
packages/core2-64-poky-linux/python3-cython/python3-cython-src: PV changed from "3.0.7" to "3.0.8"
packages/core2-64-poky-linux/python3-cython/python3-cython-src: PKGV changed from 3.0.7 [default] to 3.0.8 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "3.0.7" to "3.0.8"
packages/core2-64-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 3.0.7 [default] to 3.0.8 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.11/site-packages/Cython-3.0.7.dist-info -> /usr/lib/python3.11/site-packages/Cython-3.0.8.dist-info, added "/usr/lib/python3.11/site-packages/Cython/Tests/__pycache__/TestShadow.cpython-311.pyc /usr/lib/python3.11/site-packages/Cython/Tests/TestShadow.py"
packages/core2-64-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 14437138 to 14446834 (+0%)
packages/core2-64-poky-linux/python3-cython/python3-cython: PV changed from "3.0.7" to "3.0.8"
packages/core2-64-poky-linux/python3-cython/python3-cython: PKGV changed from 3.0.7 [default] to 3.0.8 [default]
Changes to packages/core2-64-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.11/site-packages/Cython-3.0.7.dist-info moved to /usr/lib/python3.11/site-packages/Cython-3.0.8.dist-info
  /usr/lib/python3.11/site-packages/Cython/Tests/__pycache__/TestShadow.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cython/Tests/TestShadow.py was added

--===============1359553255892322178==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-3.0.7-3.0.8.patch"

RnJvbSA1MGNjM2RhODBjNDU1ZGM4ZTM3MzA4ZmQ3ZjAyZWJhYjRlMWRkYmQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMDc6MDQ6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWN5dGhvbjogdXBncmFkZSAzLjAuNyAtPiAzLjAuOAoKLS0tCiBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1jeXRob24uaW5jICAgICAgICAgICAgICAgICAgfCAyICst
CiAuLi4vcHl0aG9uL3tweXRob24zLWN5dGhvbl8zLjAuNy5iYiA9PiBweXRob24zLWN5dGhvbl8z
LjAuOC5iYn0gfCAwCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jeXRob25f
My4wLjcuYmIgPT4gcHl0aG9uMy1jeXRob25fMy4wLjguYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLWN5dGhvbi5pbmMgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1jeXRob24uaW5jCmluZGV4IGJjMTk1M2M1MDQu
LmQxMTZlYjgyNmQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uLWN5dGhvbi5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24t
Y3l0aG9uLmluYwpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElD
RU5TRS50eHQ7bWQ1PTYxYzNlZTg5NjE1NzU4NjFmYTg2YzdlNjJiYzlmNjljIgogUFlQSV9QQUNL
QUdFID0gIkN5dGhvbiIKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gImZiMjk5YWNmM2E1Nzg1NzNjMTkwYzg1OGQ0OWUwY2Y5ZDc1ZjRi
YzQ5YzNmMjRjNWE2MzgwNDk5N2VmMDkyMTMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODMzMzQy
M2Q4ZmQ1NzY1ZTdjY2VlYTNhOTk4NWRkMWUwYTVkZmViMjczNDYyOWUxYTJlZDJkNjIzM2QzOWRl
NiIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIkN5dGhvbi0oP1A8cHZlcj4uKilcLnRhciIKIAog
aW5oZXJpdCBweXBpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtY3l0aG9uXzMuMC43LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWN5dGhvbl8zLjAuOC5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjAuNy5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjAuOC5iYgot
LSAKMi40Mi4wCgo=

--===============1359553255892322178==--

