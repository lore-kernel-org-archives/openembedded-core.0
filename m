Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF38D47CDA
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:52 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1466.1768526743287474582
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=A0irQYtN;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ewA6MRJ+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019bc4689350-ec26ce22-e547-48e7-bebb-f2156a1c4b3c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sh/RhOqb59+CiDwvqKrmWQdMQsbY/KtWp25EZm4MrYM=;
	b=A0irQYtNP3h399QcwoyKyl0Ed7Q/xZjKylWcYCcy8atuI7UcbHS41ilwiNI9AxPq
	NzTSrPCdhyVjA4e/V/fSuO8c+8/7fP+Gk/Pb4AsaJEqE3VfzZ6ev38LxGZmqBoYLsmB
	/JnWTQCvHp/jHATZ6B5dYRcUwBFQX+tEf7CwfpZ0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sh/RhOqb59+CiDwvqKrmWQdMQsbY/KtWp25EZm4MrYM=;
	b=ewA6MRJ+d0oPX5XDejfDxI1xSJTeOABgPwQUGTcg9ncpx9EuOe9Q6SVyMKKfR5g9
	c1tSU1kyPiBbkedHkHaRMyVnxdt5ArE9eQdTf7MmDP81/DcEfPecUbp2cwkIu7l2paP
	9DnSDvM4n9jdcntOe6nB0laRd6Rd+6dhSJHlQPNw=
Content-Type: multipart/mixed; boundary="===============4785597608475731398=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-build: upgrading to 1.4.0 SUCCEEDED
Message-ID: <0101019bc4689350-ec26ce22-e547-48e7-bebb-f2156a1c4b3c-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229465

--===============4785597608475731398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-build* to *1.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-build-upgrade-1.3.0-1.4.0.patch
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
From 447068850461cc9b8b133211f4239cd28bc00c7d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jan 2026 20:47:56 +0000
Subject: [PATCH] python3-build: upgrade 1.3.0 -> 1.4.0

---
 .../python/{python3-build_1.3.0.bb => python3-build_1.4.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-build_1.3.0.bb => python3-build_1.4.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-build_1.3.0.bb b/meta/recipes-devtools/python/python3-build_1.4.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-build_1.3.0.bb
rename to meta/recipes-devtools/python/python3-build_1.4.0.bb
index 2bf08ca08b..910f08374b 100644
--- a/meta/recipes-devtools/python/python3-build_1.3.0.bb
+++ b/meta/recipes-devtools/python/python3-build_1.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/build"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
 
-SRC_URI[sha256sum] = "698edd0ea270bde950f53aed21f3a0135672206f3911e0176261a31e0e07b397"
+SRC_URI[sha256sum] = "f1b91b925aa322be454f8330c6fb48b465da993d1e7e7e6fa35027ec49f3c936"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============4785597608475731398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1956 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-7174465f355966a4a2ddd96abc14a7c26b4cb7bb"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:7174465f355966a4a2ddd96abc14a7c26b4cb7bb"
meta-yocto-bsp       
meta-poky            = "master:c23c19e0b300812bad314f1d0a901965315271ae"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 432 Local 323 Mirrors 0 Missed 109 Current 244 (74% match, 83% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 294 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 325 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 358 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 359 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 360 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 361 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 365 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 367 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 369 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 370 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 373 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 376 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025c-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-build-1.4.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.45.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-build-1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-build-1.4.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 377 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 381 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 383 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pytest-9.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 385 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_recipe_qa_setscene)
NOTE: recipe python3-build-1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-2.45.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 388 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 392 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 394 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 397 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 398 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 399 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 400 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 401 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe tzdata-2025c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 405 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 408 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-2.45.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 412 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 413 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 414 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.194-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 416 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 417 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 418 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pytest-9.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 422 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 423 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 425 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-2.45.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 427 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 439 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 443 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.194-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 447 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 448 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 450 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-build-1.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 453 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-build-1.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 457 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 466 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 469 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 470 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 475 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 477 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 480 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 481 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 482 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 485 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 487 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 489 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 490 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.58-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 491 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.13.11-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 494 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 496 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 498 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 500 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 501 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.46-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 502 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.58-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 503 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 506 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.77-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 507 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 508 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 509 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 511 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 512 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 513 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 514 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 516 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 517 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 518 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.77-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 519 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 520 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 521 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 522 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 524 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 534 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 535 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 537 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 540 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 542 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 543 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.58-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 544 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 546 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_package_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.58-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 548 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 551 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 553 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 554 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 555 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 556 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 557 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 558 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 559 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 560 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 561 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 562 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 564 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 566 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.58-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.8.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.58-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 568 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 569 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 570 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 571 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 577 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 788 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 804 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_fetch)
NOTE: Running task 808 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_fetch)
NOTE: Running task 809 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_fetch)
NOTE: Running task 810 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_fetch)
NOTE: Running task 845 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_write_config)
NOTE: Running task 865 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: Running task 878 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_fetch)
NOTE: Running task 880 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_fetch)
NOTE: Running task 884 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_fetch)
NOTE: Running task 889 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_fetch)
NOTE: Running task 890 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_fetch)
NOTE: Running task 894 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: Running task 896 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_fetch)
NOTE: Running task 898 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_fetch)
NOTE: recipe python3-3.13.11-r0: task do_package_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Started
NOTE: recipe nettle-3.10.2-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.58-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.77-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: Running task 899 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_fetch: Started
NOTE: recipe json-c-0.18-r0: task do_fetch: Started
NOTE: recipe nettle-3.10.2-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.58-r0: task do_fetch: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_fetch: Started
NOTE: Running task 900 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_unpack)
NOTE: recipe libcap-2.77-r0: task do_fetch: Succeeded
NOTE: Running task 901 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_unpack)
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_fetch: Started
NOTE: Running task 902 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_unpack)
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.11-r0: task do_fetch: Started
NOTE: Running task 903 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_unpack)
NOTE: recipe json-c-0.18-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_fetch: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_fetch: Succeeded
NOTE: Running task 904 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: Running task 905 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_unpack)
NOTE: recipe libgcrypt-1.11.2-r0: task do_fetch: Succeeded
NOTE: Running task 906 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_unpack)
NOTE: Running task 910 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_fetch)
NOTE: recipe python3-packaging-25.0-r0: task do_fetch: Succeeded
NOTE: Running task 911 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_unpack)
NOTE: recipe gnutls-3.8.11-r0: task do_fetch: Succeeded
NOTE: Running task 912 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_unpack)
NOTE: Running task 913 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_unpack)
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Succeeded
NOTE: Running task 920 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe libcap-2.77-r0: task do_unpack: Started
NOTE: recipe nettle-3.10.2-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.58-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe file-5.46-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_unpack: Started
NOTE: recipe json-c-0.18-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_unpack: Started
NOTE: recipe python3-packaging-25.0-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 921 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_unpack)
NOTE: recipe gnutls-3.8.11-r0: task do_unpack: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: Running task 922 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: recipe json-c-0.18-r0: task do_unpack: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 923 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_patch)
NOTE: Running task 924 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_patch)
NOTE: Running task 925 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: recipe libtasn1-4.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 926 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_patch)
NOTE: recipe nettle-3.10.2-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.77-r0: task do_unpack: Succeeded
NOTE: Running task 927 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_patch)
NOTE: Running task 928 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_patch)
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: recipe json-c-0.18-r0: task do_patch: Started
NOTE: recipe python3-packaging-25.0-r0: task do_patch: Started
NOTE: recipe file-5.46-r0: task do_fetch: Succeeded
NOTE: Running task 929 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.58-r0: task do_unpack: Succeeded
NOTE: Running task 930 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_patch)
NOTE: recipe libtasn1-4.20.0-r0: task do_patch: Started
NOTE: recipe libcap-2.77-r0: task do_patch: Started
NOTE: recipe nettle-3.10.2-r0: task do_patch: Started
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.77-r0: task do_patch: Succeeded
NOTE: Running task 931 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_patch)
NOTE: Running task 933 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_fetch)
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: recipe json-c-0.18-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_patch: Succeeded
NOTE: Running task 934 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_generate_toolchain_file)
NOTE: Running task 936 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_fetch)
NOTE: recipe libgpg-error-1.58-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.1-r0: task do_patch: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_patch: Succeeded
NOTE: Running task 938 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Started
NOTE: recipe json-c-0.18-r0: task do_generate_toolchain_file: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 939 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.5.bb:do_fetch)
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 945 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_fetch)
NOTE: Running task 952 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_unpack)
NOTE: recipe json-c-0.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 954 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_unpack)
NOTE: Running task 955 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_unpack)
NOTE: Running task 956 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 957 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_unpack)
NOTE: recipe libarchive-3.8.5-r0: task do_fetch: Started
NOTE: recipe lzlib-1.15-r0: task do_unpack: Started
NOTE: recipe libarchive-3.8.5-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_fetch: Started
NOTE: Running task 958 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.5.bb:do_unpack)
NOTE: recipe libgcrypt-1.11.2-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.58-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 961 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_patch)
NOTE: recipe lzlib-1.15-r0: task do_unpack: Succeeded
NOTE: recipe file-5.46-r0: task do_unpack: Started
NOTE: Running task 970 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Started
NOTE: Running task 971 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_patch)
NOTE: Running task 973 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe elfutils-0.194-r0: task do_fetch: Succeeded
NOTE: Running task 974 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_unpack)
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.11-r0: task do_unpack: Succeeded
NOTE: Running task 975 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_patch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 976 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: Running task 977 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: recipe libarchive-3.8.5-r0: task do_unpack: Started
NOTE: recipe lzlib-1.15-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: Running task 978 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_patch)
NOTE: recipe elfutils-0.194-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: Running task 979 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_fetch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.11-r0: task do_patch: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: recipe lzlib-1.15-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Started
NOTE: Running task 980 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_fetch)
NOTE: recipe bash-5.3-r0: task do_fetch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Succeeded
NOTE: Running task 985 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_prepare_recipe_sysroot)
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: recipe bash-5.3-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.8.5-r0: task do_unpack: Succeeded
NOTE: Running task 1007 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: Running task 1008 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_unpack)
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1009 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.5.bb:do_patch)
NOTE: Running task 1014 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_fetch)
NOTE: recipe coreutils-9.9-r0: task do_fetch: Started
NOTE: recipe coreutils-9.9-r0: task do_fetch: Succeeded
NOTE: Running task 1015 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_unpack)
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1016 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_configure)
NOTE: Running noexec task 1017 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_compile)
NOTE: Running task 1018 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_install)
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe libarchive-3.8.5-r0: task do_patch: Started
NOTE: recipe bash-5.3-r0: task do_unpack: Started
NOTE: Running task 1021 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_fetch)
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1023 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1027 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe gnutls-3.8.11-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.9-r0: task do_unpack: Started
NOTE: Running task 1029 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_fetch)
NOTE: recipe python3-build-1.4.0-r0: task do_fetch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Started
NOTE: recipe libarchive-3.8.5-r0: task do_patch: Succeeded
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_fetch: Started
NOTE: recipe python3-build-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1031 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_unpack)
NOTE: Running task 1034 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_unpack)
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: Running task 1035 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_unpack)
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1049 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_fetch)
NOTE: Running task 1050 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1051 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: Running task 1052 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe file-5.46-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 1053 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_patch)
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Started
NOTE: Running task 1054 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_unpack)
NOTE: recipe python3-build-1.4.0-r0: task do_unpack: Started
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_unpack: Started
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Succeeded
NOTE: recipe python3-build-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Started
NOTE: Running task 1055 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1067 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_unpack)
NOTE: Running task 1070 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1071 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_patch)
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Started
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Started
NOTE: recipe file-5.46-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-build-1.4.0-r0: task do_patch: Started
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_patch: Started
NOTE: recipe bash-5.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: Running task 1072 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_patch)
NOTE: Running task 1073 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_fetch)
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: Running task 1074 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_patch)
NOTE: Running task 1082 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1083 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1084 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_patch)
NOTE: recipe python3-build-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1107 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_fetch)
NOTE: recipe bash-5.3-r0: task do_patch: Started
NOTE: Running task 1108 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_fetch)
NOTE: recipe musl-locales-1.0+git-r0: task do_fetch: Started
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.9-r0: task do_unpack: Succeeded
NOTE: Running task 1109 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_fetch: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Succeeded
NOTE: recipe file-5.46-r0: task do_patch: Succeeded
NOTE: Running task 1111 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: Running task 1113 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1116 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 1134 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_unpack)
NOTE: Running noexec task 1166 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1168 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_package)
NOTE: recipe coreutils-9.9-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: Running task 1170 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1171 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1172 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_unpack)
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 1173 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Started
NOTE: recipe binutils-2.45.1-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1174 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: Running task 1175 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe binutils-2.45.1-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.9-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_unpack: Succeeded
NOTE: Running task 1176 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_unpack)
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Started
NOTE: Running task 1177 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_patch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1201 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1202 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Started
NOTE: Running task 1203 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_unpack)
NOTE: recipe bash-5.3-r0: task do_patch: Succeeded
NOTE: recipe binutils-2.45.1-r0: task do_unpack: Started
NOTE: recipe elfutils-0.194-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1206 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_check_backend)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1208 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-pytest-9.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_check_backend: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_check_backend: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1210 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: Running task 1211 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1212 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_patch)
NOTE: recipe unzip-1_6.0-r0: task do_patch: Started
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 1213 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
WARNING: musl-locales-1.0+git-r0 do_fetch: Failed to fetch URL git://git.adelielinux.org/adelie/musl-locales;protocol=https;branch=main, attempting MIRRORS if available
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Started
NOTE: recipe shadow-4.18.0-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1216 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1218 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe shadow-4.18.0-r0: task do_patch: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_patch: Started
NOTE: recipe elfutils-0.194-r0: task do_patch: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_fetch: Succeeded
NOTE: Running task 1221 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_patch: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_unpack: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_unpack: Succeeded
NOTE: Running task 1223 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_patch)
NOTE: recipe musl-locales-1.0+git-r0: task do_patch: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_patch: Succeeded
NOTE: Running task 1224 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_generate_toolchain_file)
NOTE: recipe musl-locales-1.0+git-r0: task do_generate_toolchain_file: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_package unihash changed to 1ec2ed5ac824f1dcf0bd27c12d96284f8521221a32dd3e09740a40d2896c9a3f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata became valid
NOTE: Running setscene task 576 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_patch: Succeeded
NOTE: recipe python3-3.13.11-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 578 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 588 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 589 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 590 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 591 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 592 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 593 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 595 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 596 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 597 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 598 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 601 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 604 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 607 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/openssl/3.5.4/temp/log.do_packagedata_setscene.809355
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 609 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_package_setscene)
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 610 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 612 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe python3-3.13.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_package_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1228 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 615 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 618 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 624 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 626 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 629 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/ncurses/6.5/temp/log.do_packagedata_setscene.809713
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 630 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_package_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe binutils-2.45.1-r0: task do_unpack: Succeeded
NOTE: Running task 1280 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_patch)
NOTE: recipe binutils-2.45.1-r0: task do_patch: Started
NOTE: recipe binutils-2.45.1-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 631 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 635 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 637 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 638 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 641 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 643 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 644 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 646 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 649 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 656 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 658 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 665 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 666 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 668 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 672 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 674 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1433 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1434 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1435 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1436 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1512 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1515 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1518 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1531 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata)
NOTE: Running task 1532 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1541 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1548 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata)
NOTE: Running task 1559 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1560 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1561 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1562 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.58-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1567 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-c-0.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata: Started
NOTE: recipe python3-packaging-25.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzlib-1.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1568 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_configure)
NOTE: recipe lzlib-1.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1569 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_configure)
NOTE: recipe libseccomp-2.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1570 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_configure)
NOTE: recipe libgpg-error-1.58-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1571 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_configure)
NOTE: Running task 1572 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_configure)
NOTE: recipe zstd-1.5.7-r0: task do_configure: Started
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1573 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_configure)
NOTE: recipe lzlib-1.15-r0: task do_configure: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-c-0.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1574 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_configure)
NOTE: recipe gmp-6.3.0-r0: task do_configure: Started
NOTE: Running task 1575 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_configure)
NOTE: Running task 1576 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_configure)
NOTE: Running task 1577 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_configure)
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_configure: Succeeded
NOTE: recipe libgpg-error-1.58-r0: task do_configure: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_configure: Started
NOTE: Running task 1578 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1579 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_compile)
NOTE: recipe ncurses-6.5-r0: task do_packagedata: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_packagedata: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_configure: Started
NOTE: Running task 1583 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_configure)
NOTE: Running task 1594 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzlib-1.15-r0: task do_configure: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_configure: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Started
NOTE: recipe libpam-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Started
NOTE: recipe json-c-0.18-r0: task do_configure: Started
NOTE: Running task 1595 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_compile)
NOTE: Running task 1596 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_configure)
NOTE: recipe zstd-1.5.7-r0: task do_compile: Started
NOTE: recipe bash-5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sed-4.9-r0: task do_configure: Started
NOTE: recipe python3-build-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1597 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_configure)
NOTE: recipe python3-packaging-25.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1598 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_configure)
NOTE: recipe lzlib-1.15-r0: task do_compile: Started
NOTE: recipe libpam-1.7.1-r0: task do_configure: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_configure: Started
NOTE: recipe python3-packaging-25.0-r0: task do_configure: Started
NOTE: recipe bash-5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1599 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_configure)
NOTE: recipe python3-packaging-25.0-r0: task do_configure: Succeeded
NOTE: Running task 1600 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_configure_ptest_base)
NOTE: recipe bash-5.3-r0: task do_configure: Started
NOTE: recipe python3-packaging-25.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-packaging-25.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1601 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_compile)
NOTE: recipe python3-build-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1602 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_configure)
NOTE: recipe python3-packaging-25.0-r0: task do_compile: Started
NOTE: recipe python3-build-1.4.0-r0: task do_configure: Started
NOTE: recipe python3-build-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1603 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_compile)
NOTE: recipe python3-build-1.4.0-r0: task do_compile: Started
NOTE: recipe python3-packaging-25.0-r0: task do_compile: Succeeded
NOTE: Running task 1604 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_compile_ptest_base)
NOTE: recipe python3-packaging-25.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-packaging-25.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1605 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_install)
NOTE: recipe python3-build-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1606 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_install)
NOTE: recipe python3-packaging-25.0-r0: task do_install: Started
NOTE: recipe python3-build-1.4.0-r0: task do_install: Started
NOTE: recipe lzlib-1.15-r0: task do_compile: Succeeded
NOTE: Running task 1607 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_install)
NOTE: recipe lzlib-1.15-r0: task do_install: Started
NOTE: recipe python3-packaging-25.0-r0: task do_install: Succeeded
NOTE: recipe python3-build-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1608 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1609 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_install_ptest_base)
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-25.0-r0: task do_install_ptest_base: Started
NOTE: recipe lzlib-1.15-r0: task do_install: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1613 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_package)
NOTE: Running task 1614 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package)
NOTE: recipe python3-build-1.4.0-r0: task do_package: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package: Started
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1615 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_configure)
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_configure: Started
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1616 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_compile)
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_compile: Started
NOTE: recipe json-c-0.18-r0: task do_configure: Succeeded
NOTE: recipe python3-build-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1617 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_configure_ptest_base)
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_compile: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1618 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_package unihash changed to 9c4cfb2a60b539db22b29f8cfd23b7bd05d96d813cf7b30d3f225867e89a4c04
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_packagedata became valid
NOTE: recipe json-c-0.18-r0: task do_configure_ptest_base: Started
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_packagedata_setscene)
NOTE: Running task 1619 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_configure_ptest_base)
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_install: Started
NOTE: recipe json-c-0.18-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1620 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_compile)
NOTE: recipe python3-build-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_configure_ptest_base: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package unihash changed to 199d6964aca6ebd79c06381421c92852996e10483c6744ea3f0eeb4d3b993359
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_packagedata became valid
NOTE: recipe json-c-0.18-r0: task do_compile: Started
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_packagedata_setscene)
NOTE: recipe python3-build-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1655 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_package)
NOTE: Running task 1656 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_compile)
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_package: Started
NOTE: recipe libpam-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1658 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 1659 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_compile)
NOTE: Running task 1660 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_package)
NOTE: recipe python3-pytest-9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_package: Started
NOTE: recipe json-c-0.18-r0: task do_compile: Succeeded
NOTE: Running task 1661 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_compile_ptest_base)
NOTE: recipe python3-pytest-9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1662 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-c-0.18-r0: task do_compile_ptest_base: Started
NOTE: recipe json-c-0.18-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1663 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_install)
NOTE: recipe json-c-0.18-r0: task do_install: Started
NOTE: recipe json-c-0.18-r0: task do_install: Succeeded
NOTE: Running task 1664 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_install_ptest_base)
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1665 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_install)
NOTE: Running task 1666 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-c-0.18-r0: task do_install_ptest_base: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Started
NOTE: recipe json-c-0.18-r0: task do_install_ptest_base: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1668 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package)
NOTE: Running task 1670 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_package)
NOTE: recipe libpam-1.7.1-r0: task do_compile: Succeeded
NOTE: Running task 1671 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_compile_ptest_base)
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_package unihash changed to 8151b28a8ac30151d5de6aea8d82aa5303bbe561be5a76788109b7d85c7b6b05
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_package_qa became valid
NOTE: Running setscene task 666 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_package_write_ipk_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Started
NOTE: recipe json-c-0.18-r0: task do_package: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Succeeded
NOTE: Running setscene task 668 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_package_write_deb_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running setscene task 669 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_package_qa_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-build-1.4.0-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 670 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_package_qa_setscene)
NOTE: recipe python3-build-1.4.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-build-1.4.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 673 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-build-1.4.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-build-1.4.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 675 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running task 1672 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_install)
NOTE: recipe python3-build-1.4.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running task 1673 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_compile)
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running task 1674 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe fts-1.2.7-r0: task do_configure: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Started
NOTE: recipe lzlib-1.15-r0: task do_package: Succeeded
NOTE: Running task 1675 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_compile)
NOTE: recipe libpam-1.7.1-r0: task do_install: Started
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_package unihash changed to 87ab17675473531b086da1a641a8d5e97f44c5bb740700ff21ea807f83392469
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata became valid
NOTE: Running setscene task 664 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_compile: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1678 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1679 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_configure)
NOTE: Running task 1680 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_install)
NOTE: recipe musl-locales-1.0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1681 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe unzip-1_6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_configure: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1682 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_configure)
NOTE: Running task 1683 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_configure)
NOTE: recipe fts-1.2.7-r0: task do_compile: Succeeded
NOTE: Running task 1684 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1685 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_configure: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_configure: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r0: task do_configure: Started
NOTE: Running task 1687 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_package)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_configure: Succeeded
NOTE: Running task 1688 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_compile)
NOTE: recipe acl-2.3.2-r0: task do_configure: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_configure: Succeeded
NOTE: Running task 1689 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_configure_ptest_base)
NOTE: Running task 1690 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Started
NOTE: recipe libpam-1.7.1-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_compile: Started
NOTE: Running task 1691 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_install_ptest_base)
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_install: Succeeded
NOTE: Running task 1692 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_compile)
NOTE: Running task 1694 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_package)
NOTE: recipe libpam-1.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe acl-2.3.2-r0: task do_compile: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_configure: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package: Started
NOTE: Running task 1695 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_compile)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_compile: Started
NOTE: recipe libpam-1.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1696 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot)
NOTE: recipe libseccomp-2.6.0-r0: task do_configure: Succeeded
NOTE: Running task 1697 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1698 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_compile)
NOTE: recipe libseccomp-2.6.0-r0: task do_compile: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package unihash changed to 8da4f812529b845054dacc57f83a5bcb4994734e95fb9e63ce2b6a2a91aa4846
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1699 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package)
NOTE: Running task 1701 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_compile)
NOTE: recipe libpam-1.7.1-r0: task do_package: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_compile: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot unihash changed to e79e70578a50a531e7c0f6f675cacfd007f1974ed3830adb119b40d435d23aa0
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot as unihash 78819eecdc21dc7598edcf3cc8fdbe38dc7e8bf9f164c6f136194ae56f10b269 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '0261d11a44041a9cb2313c8b763023aea0885dff72805d4ad4f4204da10e2cfe', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '2ab1a3e4bb3292bf2843fdaa37e5041c502e9d703792ead2a82d90ab6277a47a'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot unihash 2ab1a3e4bb3292bf2843fdaa37e5041c502e9d703792ead2a82d90ab6277a47a unchanged by server
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_populate_sysroot became valid
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_compile: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_compile: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_compile: Succeeded
NOTE: Running setscene task 672 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1702 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_compile_ptest_base)
NOTE: Running task 1703 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1704 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Started
NOTE: recipe unzip-1_6.0-r0: task do_compile: Started
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_package unihash changed to 92755fcefe519b829ccfdd5cb9fc447bff7083a78b63e6e9fe0459a38b61d68c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata became valid
NOTE: recipe libcap-2.77-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_compile: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running task 1705 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_configure)
NOTE: Running task 1706 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_install)
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1707 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_install)
NOTE: recipe libcap-2.77-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: Running task 1708 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.18.0-r0: task do_configure: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_install: Started
NOTE: recipe acl-2.3.2-r0: task do_install: Started
NOTE: recipe libcap-2.77-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1710 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_package unihash changed to 225f9f1e379b6156512b9e99914568e88825b7a2a9619b89ed05e0afe2fa3be9
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata became valid
NOTE: recipe libcap-2.77-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running task 1711 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_configure)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_configure: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_configure: Succeeded
NOTE: Running task 1713 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_package unihash changed to 8defa7c7d313ffa16423973066f6eb5c9ec91a322701aa7e7941789959b28838
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata became valid
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running task 1714 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_compile)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_install: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1715 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_install)
NOTE: recipe acl-2.3.2-r0: task do_install: Succeeded
NOTE: Running task 1716 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_install_ptest_base)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1718 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-pytest-9.0.2-r0: task do_install: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_install: Started
NOTE: Running task 1719 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_package)
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_package: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_install: Succeeded
NOTE: Running task 1720 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_package)
NOTE: recipe musl-locales-1.0+git-r0: task do_install: Succeeded
NOTE: Running task 1721 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_package)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package: Started
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_package: Started
NOTE: Running task 1723 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_package)
NOTE: recipe acl-2.3.2-r0: task do_package: Started
NOTE: recipe libgpg-error-1.58-r0: task do_configure: Succeeded
NOTE: Running task 1724 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.58-r0: task do_configure_ptest_base: Started
NOTE: recipe libgpg-error-1.58-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1725 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_compile)
NOTE: recipe libgpg-error-1.58-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package unihash changed to dcd95875f4e38d8f1a7110d419a2ee93589f68950a0695f8fd5f7662aaecdda0
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata became valid
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package: Succeeded
NOTE: Running task 1727 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_populate_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_package unihash changed to 006a0de1a902aa18ad2c74b853c3c4636aabea85c761e38f0066cb230a6a0695
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_packagedata became valid
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_packagedata_setscene)
NOTE: recipe python3-build-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_package unihash changed to 0fe7d8ccf1b463ddf6c8aa920fae190c5028fbce74b773627b4d4b3f6a429053
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_write_ipk became valid
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_compile: Succeeded
NOTE: Running setscene task 673 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 674 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 675 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_qa_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-build-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running task 1728 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_install)
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_populate_sysroot unihash changed to 64631801bec0290cb50e65f57e2ea97f8590fab37bbfcf894ceb5432a1f45865
NOTE: Running setscene task 675 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_compile: Succeeded
NOTE: Running task 1730 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_collect_spdx_deps)
NOTE: Running task 1731 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_compile_ptest_base)
NOTE: Running task 1732 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_collect_spdx_deps)
NOTE: recipe libcap-2.77-r0: task do_install: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-build-1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-packaging-25.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1734 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_populate_sysroot)
NOTE: recipe python3-build-1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1735 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_create_spdx)
NOTE: recipe python3-packaging-25.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1736 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-packaging-25.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-build-1.4.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1737 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_populate_sysroot)
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-build-1.4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1740 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-packaging-25.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_populate_sysroot unihash changed to abaf095ae7280dd943e4211b4aa860a6ff1b091ebf982cdcfafcc0437c333388
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1741 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_create_spdx)
NOTE: recipe musl-locales-1.0+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_package unihash changed to e73e4ffc54f612a13d070000fe55629b02a775b926ec398dedbe6b4d65981aa7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata became valid
NOTE: recipe python3-packaging-25.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_populate_sysroot unihash changed to 3a76207ca56c11153a985c00e2482bf97a43cc8a0df48699a4277a1ac1635493
NOTE: Running task 1742 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_create_spdx)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1743 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_install)
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_create_spdx: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_install: Started
NOTE: recipe python3-packaging-25.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1747 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_package_write_rpm)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_package_write_rpm unihash changed to 17193e5b583e16dc452422ddfc92d98607206e0defc6f00dc4ef9b94fbc8daa6
NOTE: recipe python3-build-1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyproject-hooks-1.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1750 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_create_package_spdx)
NOTE: recipe libcap-2.77-r0: task do_install: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_package: Succeeded
NOTE: recipe python3-build-1.4.0-r0: task do_create_package_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_package unihash changed to 6e892ae1d29030ab29dcb32c7ba4e5528d7dcf68b8564784dcd4abbc0318ed3f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata became valid
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_install: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1753 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_install_ptest_base)
NOTE: recipe python3-build-1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_install_ptest_base: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_package_write_rpm unihash changed to ab157789ba36be598a1240b2a7a85cf91a6aba1fb95964ad30289890da7cce04
NOTE: recipe python3-build-1.4.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe bash-5.3-r0: task do_configure: Succeeded
NOTE: Running task 1754 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_configure_ptest_base)
NOTE: recipe bash-5.3-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1755 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_compile)
NOTE: recipe bash-5.3-r0: task do_compile: Started
NOTE: recipe libpam-1.7.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package unihash changed to 2810b745ec1d44117f40a913f57c1e612384cadc12ba46faef5efa685f78d2dd
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata became valid
NOTE: Running setscene task 663 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_compile: Succeeded
NOTE: Running task 1756 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe libgpg-error-1.58-r0: task do_compile: Succeeded
NOTE: Running task 1757 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_compile_ptest_base)
NOTE: recipe unzip-1_6.0-r0: task do_install: Started
NOTE: recipe libgpg-error-1.58-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.58-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1758 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1759 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_compile)
NOTE: recipe unzip-1_6.0-r0: task do_install: Succeeded
NOTE: Running task 1760 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe libgpg-error-1.58-r0: task do_install: Started
NOTE: recipe gmp-6.3.0-r0: task do_compile: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe unzip-1_6.0-r0: task do_package: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_configure: Succeeded
NOTE: Running task 1764 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_compile)
NOTE: recipe libtasn1-4.20.0-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_configure: Succeeded
NOTE: Running task 1765 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_configure_ptest_base)
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1766 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_compile)
NOTE: recipe sed-4.9-r0: task do_compile: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1768 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_package)
NOTE: recipe libgpg-error-1.58-r0: task do_install: Succeeded
NOTE: Running task 1769 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_install_ptest_base)
NOTE: recipe libseccomp-2.6.0-r0: task do_package: Started
NOTE: recipe libgpg-error-1.58-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.58-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1771 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1772 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_package)
NOTE: recipe libgcrypt-1.11.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.58-r0: task do_package: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1773 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_configure)
NOTE: recipe libgcrypt-1.11.2-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_package unihash changed to 40c599a22bbe59e9c7eaf5c2c4d88897becd301f15db97fe61562893c1c1be74
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata became valid
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sed-4.9-r0: task do_compile: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 1775 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_compile_ptest_base)
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package became valid
NOTE: Setscene tasks completed
NOTE: Running task 1789 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_write_rpm)
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1791 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_install)
NOTE: recipe sed-4.9-r0: task do_install: Started
NOTE: recipe bash-5.3-r0: task do_compile: Succeeded
NOTE: Running task 1792 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.58-r0: task do_package: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_package unihash changed to 4856e3483202619d7bf65dccc162e520378f948d89cdd6044fc8eaf0756f52c9
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_packagedata became valid
NOTE: recipe bash-5.3-r0: task do_compile_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_write_rpm unihash changed to 0d30796f2549d82af2c03e646ab7b23347d148ed4c7ccf4ac70194060ce22fc1
NOTE: Running setscene task 667 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_packagedata_setscene)
NOTE: Running task 1793 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_install)
NOTE: recipe libgpg-error-1.58-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_install: Started
NOTE: recipe libgpg-error-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libtasn1-4.20.0-r0: task do_compile: Succeeded
NOTE: Running task 1795 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_install)
NOTE: recipe libtasn1-4.20.0-r0: task do_install: Started
NOTE: recipe zstd-1.5.7-r0: task do_compile: Succeeded
NOTE: Running task 1796 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_install)
NOTE: recipe sed-4.9-r0: task do_install: Succeeded
NOTE: Running task 1797 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_install_ptest_base)
NOTE: recipe zstd-1.5.7-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_package: Succeeded
NOTE: Running task 1798 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_package unihash changed to bc94078da43e14fcb47fe26e8b125ce0947e730a4312bc17a4982ab4a5da8c2b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata became valid
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libtasn1-4.20.0-r0: task do_install: Succeeded
NOTE: Running task 1800 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot)
NOTE: Running task 1801 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_package)
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_package: Started
NOTE: recipe gmp-6.3.0-r0: task do_compile: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1802 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot unihash changed to 288071efaa26c00c4014022f00949033910bd075e4e4cd114f0453010334f8cf
NOTE: Setscene tasks completed
NOTE: recipe gmp-6.3.0-r0: task do_install: Started
NOTE: recipe bash-5.3-r0: task do_install: Succeeded
NOTE: Running task 1803 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_install_ptest_base)
NOTE: recipe bash-5.3-r0: task do_install_ptest_base: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_package unihash changed to 4ce2044ff9c8c55c3638b866cdc771dd2e3761ede673f2fdbeee8e4703e4c4f5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata became valid
NOTE: recipe gmp-6.3.0-r0: task do_install: Succeeded
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running task 1805 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1806 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1807 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package)
NOTE: Running task 1808 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpfr-4.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.3.0-r0: task do_package: Started
NOTE: recipe coreutils-9.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe nettle-3.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1810 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_configure)
NOTE: Running task 1811 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package)
NOTE: Running task 1812 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_configure)
NOTE: recipe coreutils-9.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1813 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_configure)
NOTE: recipe nettle-3.10.2-r0: task do_configure: Started
NOTE: recipe mpfr-4.2.2-r0: task do_configure: Started
NOTE: recipe bash-5.3-r0: task do_package: Started
NOTE: recipe coreutils-9.9-r0: task do_configure: Started
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to f661134cc23b01bfa87582216efc4578a9b5f786bd381c55802637c17f6340ec
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package unihash changed to 61a20b8c10b733e898f578d171ae959dea2cc03b70fabe33136e3818ba6729a7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata became valid
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe nettle-3.10.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1816 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.10.2-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.10.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1817 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_compile)
NOTE: recipe nettle-3.10.2-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1818 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.11.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1819 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_compile)
NOTE: recipe libgcrypt-1.11.2-r0: task do_compile: Started
NOTE: recipe bash-5.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package unihash changed to 40d76e91b7d618d0ade6c93bf126e4f9902a57e609ddb91a7c3cd4ad92b19f6f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata became valid
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe zstd-1.5.7-r0: task do_install: Succeeded
NOTE: Running task 1822 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1823 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1824 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_package)
NOTE: recipe file-5.46-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.8.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.7-r0: task do_package: Started
NOTE: recipe file-5.46-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1825 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_configure)
NOTE: recipe file-5.46-r0: task do_configure: Started
NOTE: recipe libarchive-3.8.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1826 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.5.bb:do_configure)
NOTE: recipe libarchive-3.8.5-r0: task do_configure: Started
NOTE: recipe mpfr-4.2.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1827 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_compile)
NOTE: recipe mpfr-4.2.2-r0: task do_compile: Started
NOTE: recipe zstd-1.5.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_package unihash changed to 693420ec46c05973dd233241dfe902e554e72312a7e540841798dd53f067f6c9
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata became valid
NOTE: Running setscene task 670 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe nettle-3.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1829 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.10.2-r0: task do_compile_ptest_base: Started
NOTE: recipe mpfr-4.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1830 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_install)
NOTE: recipe mpfr-4.2.2-r0: task do_install: Started
NOTE: recipe nettle-3.10.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1831 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_install)
NOTE: recipe nettle-3.10.2-r0: task do_install: Started
NOTE: recipe mpfr-4.2.2-r0: task do_install: Succeeded
NOTE: Running task 1833 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1834 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_package)
NOTE: recipe libmpc-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpfr-4.2.2-r0: task do_package: Started
NOTE: recipe libmpc-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1835 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_configure)
NOTE: recipe libmpc-1.3.1-r0: task do_configure: Started
NOTE: recipe nettle-3.10.2-r0: task do_install: Succeeded
NOTE: Running task 1836 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_install_ptest_base)
NOTE: recipe nettle-3.10.2-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_compile: Succeeded
NOTE: Running task 1837 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.11.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1838 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_install)
NOTE: recipe libgcrypt-1.11.2-r0: task do_install: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_install: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1839 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_install_ptest_base)
NOTE: Running task 1841 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1842 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_package)
NOTE: recipe libgcrypt-1.11.2-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.8.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.10.2-r0: task do_package: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1844 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_package)
NOTE: recipe gnutls-3.8.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_package: Succeeded
NOTE: Running task 1845 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_configure)
NOTE: recipe libgcrypt-1.11.2-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_package unihash changed to 806132841eb831260468f710d1301cb1f8de1377970481d280773780a85dbf28
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata became valid
NOTE: recipe gnutls-3.8.11-r0: task do_configure: Started
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe file-5.46-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1847 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_compile)
NOTE: recipe file-5.46-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_package unihash changed to 8a93442f877348ec7c8cf822af8e743d2ece4988381091b782de5971d308f954
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata became valid
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe file-5.46-r0: task do_compile: Succeeded
NOTE: Running task 1849 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_install)
NOTE: recipe libmpc-1.3.1-r0: task do_configure: Succeeded
NOTE: recipe file-5.46-r0: task do_install: Started
NOTE: Running task 1850 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_compile)
NOTE: recipe libmpc-1.3.1-r0: task do_compile: Started
NOTE: recipe nettle-3.10.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_package unihash changed to f3010c438a2ebcf6701d2f5fa17fccc84ded3c7e818d2b85e31473339cf0c274
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata became valid
NOTE: Running setscene task 665 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe file-5.46-r0: task do_install: Succeeded
NOTE: Running task 1853 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_package)
NOTE: recipe file-5.46-r0: task do_package: Started
NOTE: recipe libmpc-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1854 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_install)
NOTE: recipe libmpc-1.3.1-r0: task do_install: Started
NOTE: recipe libmpc-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 1856 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1857 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_package)
NOTE: recipe gcc-15.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmpc-1.3.1-r0: task do_package: Started
NOTE: recipe gcc-15.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1858 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_configure)
NOTE: recipe gcc-15.2.0-r0: task do_configure: Started
NOTE: recipe file-5.46-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_package unihash changed to 84f18bbf2dfcefc1c83a7fe3d81246845ec15356686d96e6edbaada665ae7caa
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata became valid
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libmpc-1.3.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_package unihash changed to 0d1d72e13fca7eb038d8809621b2c790d561bdbb79652adb5247049cf910b43b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata became valid
NOTE: Running setscene task 672 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gcc-15.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1861 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_compile)
NOTE: recipe gcc-15.2.0-r0: task do_compile: Started
NOTE: recipe libarchive-3.8.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1862 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.5.bb:do_compile)
NOTE: recipe libarchive-3.8.5-r0: task do_compile: Started
NOTE: recipe libarchive-3.8.5-r0: task do_compile: Succeeded
NOTE: Running task 1863 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.5.bb:do_install)
NOTE: recipe libarchive-3.8.5-r0: task do_install: Started
NOTE: recipe libarchive-3.8.5-r0: task do_install: Succeeded
NOTE: Running task 1864 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.5.bb:do_populate_sysroot)
NOTE: Running task 1865 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.5.bb:do_package)
NOTE: recipe libarchive-3.8.5-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.8.5-r0: task do_package: Started
NOTE: recipe libarchive-3.8.5-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.5.bb:do_populate_sysroot unihash changed to bb3d62ee0aac7d88475e106f73af85309b0b5439c75cc842f74ba836394e28d8
NOTE: Setscene tasks completed
NOTE: recipe libarchive-3.8.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.5.bb:do_package unihash changed to ebb9290b2a4b2ea15b5a8f1457689e6a834b99a113a021bdb0232df11f61c327
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.5.bb:do_packagedata became valid
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.5.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe coreutils-9.9-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1867 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.9-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1868 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_compile)
NOTE: recipe coreutils-9.9-r0: task do_compile: Started
NOTE: recipe coreutils-9.9-r0: task do_compile: Succeeded
NOTE: Running task 1869 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.9-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1870 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_install)
NOTE: recipe coreutils-9.9-r0: task do_install: Started
NOTE: recipe coreutils-9.9-r0: task do_install: Succeeded
NOTE: Running task 1871 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.9-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1872 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_package)
NOTE: recipe coreutils-9.9-r0: task do_package: Started
NOTE: recipe gnutls-3.8.11-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1873 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.8.11-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.8.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1874 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_compile)
NOTE: recipe gnutls-3.8.11-r0: task do_compile: Started
NOTE: recipe coreutils-9.9-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_package unihash changed to ec1543722927e6a8827cef423d93ffd1f8a477bf0e2e40e08db85ebb55e406f0
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata became valid
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gnutls-3.8.11-r0: task do_compile: Succeeded
NOTE: Running task 1876 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.11-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.8.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1877 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_install)
NOTE: recipe gnutls-3.8.11-r0: task do_install: Started
NOTE: recipe gnutls-3.8.11-r0: task do_install: Succeeded
NOTE: Running task 1878 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.11-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.8.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1879 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_populate_sysroot)
NOTE: Running task 1880 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_package)
NOTE: recipe gnutls-3.8.11-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.8.11-r0: task do_package: Started
NOTE: recipe gnutls-3.8.11-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_populate_sysroot unihash changed to 98e6579f86876a024c362b3fe028f900b8dee224a55d6ec217f8f926699a6831
NOTE: Setscene tasks completed
NOTE: Running task 1881 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1882 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_configure)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.11-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_package unihash changed to d4b1328017737efb0f6fdec09e496978d8732aecb5bb5eaf27288126274fd14c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_packagedata became valid
NOTE: Running setscene task 671 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1884 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_compile)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1885 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_install)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_install: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1886 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot)
NOTE: Running task 1887 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_package)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1888 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.194-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.194-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1889 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_configure)
NOTE: recipe elfutils-0.194-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package: Succeeded
NOTE: Running task 1890 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata unihash changed to 543d9724f92f8427d13adeed455aba0fbb39bb4c7acc0dd7a1e64890ae9df979
NOTE: Setscene tasks completed
NOTE: recipe elfutils-0.194-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1891 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.194-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.194-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1892 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_compile)
NOTE: recipe elfutils-0.194-r0: task do_compile: Started
NOTE: recipe elfutils-0.194-r0: task do_compile: Succeeded
NOTE: Running task 1893 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.194-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.194-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1894 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_install)
NOTE: recipe elfutils-0.194-r0: task do_install: Started
NOTE: recipe elfutils-0.194-r0: task do_install: Succeeded
NOTE: Running task 1895 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.194-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.194-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1896 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_populate_sysroot)
NOTE: Running task 1897 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_package)
NOTE: recipe elfutils-0.194-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.194-r0: task do_package: Started
NOTE: recipe elfutils-0.194-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1898 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.45.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.45.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1899 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_configure)
NOTE: recipe binutils-2.45.1-r0: task do_configure: Started
NOTE: recipe binutils-2.45.1-r0: task do_configure: Succeeded
NOTE: Running task 1900 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_compile)
NOTE: recipe binutils-2.45.1-r0: task do_compile: Started
NOTE: recipe elfutils-0.194-r0: task do_package: Succeeded
NOTE: Running task 1901 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata)
NOTE: recipe elfutils-0.194-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata: Succeeded
NOTE: recipe gcc-15.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1902 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_install)
NOTE: recipe gcc-15.2.0-r0: task do_install: Started
NOTE: recipe binutils-2.45.1-r0: task do_compile: Succeeded
NOTE: Running task 1903 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_install)
NOTE: recipe binutils-2.45.1-r0: task do_install: Started
NOTE: recipe binutils-2.45.1-r0: task do_install: Succeeded
NOTE: Running task 1904 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_package)
NOTE: recipe binutils-2.45.1-r0: task do_package: Started
NOTE: recipe gcc-15.2.0-r0: task do_install: Succeeded
NOTE: Running task 1905 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_package)
NOTE: recipe gcc-15.2.0-r0: task do_package: Started
NOTE: recipe binutils-2.45.1-r0: task do_package: Succeeded
NOTE: Running task 1906 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata)
NOTE: recipe binutils-2.45.1-r0: task do_packagedata: Started
NOTE: recipe binutils-2.45.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata unihash changed to 5af88fd51b69062e3432c83074f459b701cfea1aa24e05f2d7400dc93eb8c2e8
NOTE: Setscene tasks completed
NOTE: recipe gcc-15.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_package unihash changed to 51cdd6a3bf5f75a1bad2f7fc66b44c0ea6845a6a873e0c18fd25628ab8ae3916
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata became valid
NOTE: Running setscene task 672 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_package_qa_setscene)
NOTE: Running setscene task 673 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 675 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_package_write_deb_setscene)
NOTE: recipe python3-3.13.11-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.13.11-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.13.11-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 676 of 676 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1910 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_package_write_rpm)
NOTE: recipe python3-3.13.11-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.13.11-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_package_write_rpm unihash changed to 123daf4bc48fb4e5b6aba4004c7397262948008934feaada21e871cc726b41f0
NOTE: Running noexec task 1912 of 1912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1912 tasks of which 1544 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 39 ERROR messages, returning a non-zero exit code.
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ossl-module-fips went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-src went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-dbg went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libtinfo went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libncursesw went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libncurses went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libticw went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libtic went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libpanelw went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libpanel went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libmenuw went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libmenu went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libformw went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libform went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-staticdev went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-dev went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-doc went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-locale went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-tools went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-terminfo-base went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-terminfo went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4785597608475731398==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-build-upgrade-1.3.0-1.4.0.patch"

RnJvbSA0NDcwNjg4NTA0NjFjYzliOGIxMzMyMTFmNDIzOWNkMjhiYzAwYzdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSmFuIDIwMjYgMjA6NDc6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWJ1aWxkOiB1cGdyYWRlIDEuMy4wIC0+IDEuNC4wCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtYnVpbGRfMS4zLjAuYmIgPT4gcHl0aG9uMy1idWlsZF8xLjQuMC5iYn0gICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtYnVpbGRfMS4zLjAuYmIgPT4gcHl0
aG9uMy1idWlsZF8xLjQuMC5iYn0gKDg2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRfMS4zLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRfMS40LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4NiUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJ1aWxkXzEuMy4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRf
MS40LjAuYmIKaW5kZXggMmJmMDhjYTA4Yi4uOTEwZjA4Mzc0YiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJ1aWxkXzEuMy4wLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1idWlsZF8xLjQuMC5iYgpAQCAtMyw3ICsz
LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5cGEvYnVpbGQiCiBMSUNFTlNF
ID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTMxMDQzOWFm
Mjg3YjBmYjQ3ODBiMmFkNjkwN2MyNTZjIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjk4ZWRk
MGVhMjcwYmRlOTUwZjUzYWVkMjFmM2EwMTM1NjcyMjA2ZjM5MTFlMDE3NjI2MWEzMWUwZTA3YjM5
NyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmMWI5MWI5MjVhYTMyMmJlNDU0ZjgzMzBjNmZiNDhi
NDY1ZGE5OTNkMWU3ZTdlNmZhMzUwMjdlYzQ5ZjNjOTM2IgogCiBpbmhlcml0IHB5cGkgcHl0aG9u
X2ZsaXRfY29yZQogCi0tIAoyLjQ3LjEKCg==

--===============4785597608475731398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-build/python3-build: FILELIST: directory renamed /usr/lib/python3.13/site-packages/build-1.3.0.dist-info -> /usr/lib/python3.13/site-packages/build-1.4.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/build-1.3.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/build-1.4.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-build (sysroot):
  /usr/lib/python3.13/site-packages/build-1.3.0.dist-info moved to /usr/lib/python3.13/site-packages/build-1.4.0.dist-info
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was removed
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.13/site-packages/build-1.3.0.dist-info moved to /usr/lib/python3.13/site-packages/build-1.4.0.dist-info

--===============4785597608475731398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-build: PKGV changed from 1.3.0 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/python3-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/build/build-1.3.0.tar.gz;downloadfilename=build-1.3.0.tar.gz" to "https://files.pythonhosted.org/packages/source/b/build/build-1.4.0.tar.gz;downloadfilename=build-1.4.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-build: PV changed from "1.3.0" to "1.4.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build-dbg: PKGV changed from 1.3.0 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-dbg: PV changed from "1.3.0" to "1.4.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build-dev: PKGV changed from 1.3.0 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-dev: PV changed from "1.3.0" to "1.4.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build-doc: PKGV changed from 1.3.0 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-doc: PV changed from "1.3.0" to "1.4.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build-locale: PKGV changed from 1.3.0 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-locale: PV changed from "1.3.0" to "1.4.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build-src: PKGV changed from 1.3.0 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-src: PV changed from "1.3.0" to "1.4.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build-staticdev: PKGV changed from 1.3.0 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-staticdev: PV changed from "1.3.0" to "1.4.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build: PKGV changed from 1.3.0 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build: PV changed from "1.3.0" to "1.4.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build: PKGSIZE changed from 136213 to 144319 (+6%)
packages/x86-64-v3-poky-linux/python3-build/python3-build: FILELIST: directory renamed /usr/lib/python3.13/site-packages/build-1.3.0.dist-info -> /usr/lib/python3.13/site-packages/build-1.4.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/build-1.3.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/build-1.4.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-build (sysroot):
  /usr/lib/python3.13/site-packages/build-1.3.0.dist-info moved to /usr/lib/python3.13/site-packages/build-1.4.0.dist-info
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was removed
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.13/site-packages/build-1.3.0.dist-info moved to /usr/lib/python3.13/site-packages/build-1.4.0.dist-info

--===============4785597608475731398==--

