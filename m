Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F29C3ABAC
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:55 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.1805.1746113613072496211
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=W2m3z+xB;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=r0AO94jY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101968c7b7b2f-2698bfef-34ee-40ef-b4bf-7327d3415c5e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113625;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VrlN0nQYx2vDP5hLIvb9nWB19qQw0idwF8ciFinmaFw=;
	b=W2m3z+xBMqA+219Wf+zhDGqSdic/vjG6UKsZ6SNjPuGhiLIe22TxsDapKhueWSQv
	L8Uv3v4XF4CGqaUWBKpdwL1zfNVcemjOtQmM7HIDdLp5IyfiD0Xiur2fsra7H+xqx/Z
	jTxvOEEKkMEmEBwYzfDc6NL2AP5RuKSU6zvAFhts=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113625;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VrlN0nQYx2vDP5hLIvb9nWB19qQw0idwF8ciFinmaFw=;
	b=r0AO94jYcQizZ4VzyckasT0EWSKSh+j5gQP7FrosQuO285y/e32Nq72OFfL5PUEt
	ygjkAiF6/tW9ixJ7YqKsviwDv8FuyWQaDQQzm9dUS9DjaXoLBBmo+XdilA3QuSMIvpJ
	77Nk2lwk7docCM3OWkr5DKxGLAhkNc3g/Q9bJpDM=
Content-Type: multipart/mixed; boundary="===============6453375471634924443=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] repo: upgrading to 2.54 SUCCEEDED
Message-ID: <010101968c7b7b2f-2698bfef-34ee-40ef-b4bf-7327d3415c5e-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215837

--===============6453375471634924443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.54* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.53-2.54.patch
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
From 57eccf7c6a58d2e71b42a00e4369e59f170f4f61 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 10:05:24 +0000
Subject: [PATCH] repo: upgrade 2.53 -> 2.54

---
 meta/recipes-devtools/repo/{repo_2.53.bb => repo_2.54.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.53.bb => repo_2.54.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.53.bb b/meta/recipes-devtools/repo/repo_2.54.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.53.bb
rename to meta/recipes-devtools/repo/repo_2.54.bb
index 77817c25e4..07ee583172 100644
--- a/meta/recipes-devtools/repo/repo_2.53.bb
+++ b/meta/recipes-devtools/repo/repo_2.54.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "4b94e773efd36754f6c8649ad55b90d19a61107f"
+SRCREV = "97dc5c1bd9527c2abe2183b16a4b7ef037dc34a7"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============6453375471634924443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 928 .bb files complete (0 cached, 928 parsed). 1898 targets, 50 skipped, 0 masked, 0 errors.
Removing 16 recipes from the core2-64 sysroot...done.
Removing 59 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7071386bef43121057bb01b502a95fc48c1b1250"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 455 Local 445 Mirrors 0 Missed 10 Current 230 (97% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 255 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.49.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 270 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 271 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 274 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.49.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 284 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_populate_lic_setscene)
NOTE: Running setscene task 300 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.49.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 301 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.49.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 309 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 311 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 315 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.49.0.bb:do_create_spdx_setscene)
NOTE: recipe repo-2.54-r0: task do_populate_lic_setscene: Started
NOTE: recipe git-2.49.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe git-2.49.0-r0: task do_package_qa_setscene: Started
NOTE: recipe git-2.49.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe git-2.49.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe git-2.49.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe git-2.49.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe repo-2.54-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 318 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_recipe_qa_setscene)
NOTE: recipe git-2.49.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe repo-2.54-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 342 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe repo-2.54-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe git-2.49.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 344 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe git-2.49.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe git-2.49.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 345 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.49.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.49.0-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 362 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 365 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 366 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe git-2.49.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 380 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.49.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe git-2.49.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 392 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 399 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe git-2.49.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3/3.13.2/temp/log.do_packagedata_setscene.1551816
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 421 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 423 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 457 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 828 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_fetch)
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.54-r0: task do_fetch: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 484 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 491 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_packagedata_setscene)
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 507 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe repo-2.54-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 993 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_unpack)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 523 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.54-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 538 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe repo-2.54-r0: task do_unpack: Succeeded
NOTE: Running task 1105 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_patch)
NOTE: recipe repo-2.54-r0: task do_patch: Started
NOTE: recipe repo-2.54-r0: task do_patch: Succeeded
NOTE: Running task 1106 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_deploy_source_date_epoch)
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe repo-2.54-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.54-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_deploy_source_date_epoch unihash changed to 69f8356a893a1272ce4dbf29e2b6aa7602f7e3f22882c8119e05a6ccd4f744ba
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 575 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 579 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 601 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 607 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 650 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 651 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 653 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 662 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 667 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 668 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 671 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 674 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 677 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 680 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 682 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1747 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1770 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata)
NOTE: recipe repo-2.54-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1890 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_collect_spdx_deps)
NOTE: recipe python3-3.13.2-r0: task do_packagedata: Started
NOTE: recipe repo-2.54-r0: task do_collect_spdx_deps: Started
NOTE: recipe repo-2.54-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1924 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_configure)
NOTE: recipe repo-2.54-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe repo-2.54-r0: task do_configure: Started
NOTE: recipe repo-2.54-r0: task do_configure: Succeeded
NOTE: Running task 1925 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_compile)
NOTE: recipe repo-2.54-r0: task do_compile: Started
NOTE: recipe repo-2.54-r0: task do_compile: Succeeded
NOTE: Running task 1926 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_install)
NOTE: recipe python3-3.13.2-r0: task do_packagedata: Succeeded
NOTE: recipe repo-2.54-r0: task do_install: Started
NOTE: recipe repo-2.54-r0: task do_install: Succeeded
NOTE: Running task 1932 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_package)
NOTE: Running task 1933 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_populate_sysroot)
NOTE: recipe repo-2.54-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.54-r0: task do_package: Started
NOTE: recipe repo-2.54-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.54-r0: task do_package: Succeeded
NOTE: Running task 1934 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_packagedata)
NOTE: recipe repo-2.54-r0: task do_packagedata: Started
NOTE: recipe repo-2.54-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_packagedata unihash changed to 52095cdb724179c0d47a9124d72330e419be2d75cad69087466405ad1b981f19
NOTE: Setscene tasks completed
NOTE: Running task 1935 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_create_spdx)
NOTE: Running task 1936 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_package_write_ipk)
NOTE: Running task 1937 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_package_write_deb)
NOTE: Running task 1938 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_package_write_rpm)
NOTE: Running task 1939 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_package_qa)
NOTE: recipe repo-2.54-r0: task do_create_spdx: Started
NOTE: recipe repo-2.54-r0: task do_package_write_ipk: Started
NOTE: recipe repo-2.54-r0: task do_package_write_deb: Started
NOTE: recipe repo-2.54-r0: task do_package_write_rpm: Started
NOTE: recipe repo-2.54-r0: task do_package_qa: Started
NOTE: recipe repo-2.54-r0: task do_create_spdx: Succeeded
NOTE: Running task 1940 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_create_package_spdx)
NOTE: recipe repo-2.54-r0: task do_create_package_spdx: Started
NOTE: recipe repo-2.54-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_package_qa unihash changed to 67618b40c19d9ed3874e27f410de6b3e4ce2496e018663aab72f3c8630f5f4b4
NOTE: recipe repo-2.54-r0: task do_package_write_ipk: Succeeded
NOTE: recipe repo-2.54-r0: task do_package_write_deb: Succeeded
NOTE: recipe repo-2.54-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_package_write_ipk unihash changed to 9e93a7032e1e6eecc38ce60a3e4e08f8738b344ac58168ce67a2fd52a83dac53
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_package_write_deb unihash changed to 2e12f56bb89573e6490b7428140498377e95aff72c879f65e880f5d46426eeba
NOTE: recipe repo-2.54-r0: task do_create_package_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_package_write_rpm unihash changed to 2b7546c5af13340c35de66bd1e84011fe5ef83ae0da29161ac5496f855b9bea8
NOTE: Running noexec task 1941 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.54.bb:do_build)
NOTE: Tasks Summary: Attempted 1941 tasks of which 1921 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 70 ERROR messages, returning a non-zero exit code.
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ensurepip went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tomllib went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zipapp went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zoneinfo went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.13.3-r0 to 0:3.13.2-r0) [version-going-backwards]
ERROR: python3-3.13.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6453375471634924443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.53" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.54"
packages/core2-64-poky-linux/repo: PKGV changed from 2.53 [default] to 2.54 [default]
packages/core2-64-poky-linux/repo: PV changed from "2.53" to "2.54"
packages/core2-64-poky-linux/repo/repo-dbg: PKGV changed from 2.53 [default] to 2.54 [default]
packages/core2-64-poky-linux/repo/repo-dbg: PV changed from "2.53" to "2.54"
packages/core2-64-poky-linux/repo/repo-dev: PKGV changed from 2.53 [default] to 2.54 [default]
packages/core2-64-poky-linux/repo/repo-dev: PV changed from "2.53" to "2.54"
packages/core2-64-poky-linux/repo/repo-doc: PKGV changed from 2.53 [default] to 2.54 [default]
packages/core2-64-poky-linux/repo/repo-doc: PV changed from "2.53" to "2.54"
packages/core2-64-poky-linux/repo/repo-locale: PKGV changed from 2.53 [default] to 2.54 [default]
packages/core2-64-poky-linux/repo/repo-locale: PV changed from "2.53" to "2.54"
packages/core2-64-poky-linux/repo/repo-src: PKGV changed from 2.53 [default] to 2.54 [default]
packages/core2-64-poky-linux/repo/repo-src: PV changed from "2.53" to "2.54"
packages/core2-64-poky-linux/repo/repo-staticdev: PKGV changed from 2.53 [default] to 2.54 [default]
packages/core2-64-poky-linux/repo/repo-staticdev: PV changed from "2.53" to "2.54"
packages/core2-64-poky-linux/repo/repo: PKGSIZE changed from 44907 to 44986 (+0%)
packages/core2-64-poky-linux/repo/repo: PKGV changed from 2.53 [default] to 2.54 [default]
packages/core2-64-poky-linux/repo/repo: PV changed from "2.53" to "2.54"

--===============6453375471634924443==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-repo-upgrade-2.53-2.54.patch"

RnJvbSA1N2VjY2Y3YzZhNThkMmU3MWI0MmEwMGU0MzY5ZTU5ZjE3MGY0ZjYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxMDowNToyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi41MyAtPiAyLjU0CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBv
L3tyZXBvXzIuNTMuYmIgPT4gcmVwb18yLjU0LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9yZXBvL3tyZXBvXzIuNTMuYmIgPT4gcmVwb18yLjU0LmJifSAoOTQlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi41My5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9yZXBvL3JlcG9fMi41NC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNTMuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi41NC5iYgppbmRleCA3NzgxN2MyNWU0Li4wN2Vl
NTgzMTcyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNTMu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjU0LmJiCkBAIC0xMSw3
ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2
Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogCiBTUkNfVVJJID0gImdpdDovL2dlcnJpdC5nb29n
bGVzb3VyY2UuY29tL2dpdC1yZXBvLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbjt0YWc9
diR7UFZ9IFwKICAgICAgICAgICAgIgotU1JDUkVWID0gIjRiOTRlNzczZWZkMzY3NTRmNmM4NjQ5
YWQ1NWI5MGQxOWE2MTEwN2YiCitTUkNSRVYgPSAiOTdkYzVjMWJkOTUyN2MyYWJlMjE4M2IxNmE0
YjdlZjAzN2RjMzRhNyIKIAogTUlSUk9SUyArPSAiZ2l0Oi8vZ2Vycml0Lmdvb2dsZXNvdXJjZS5j
b20vZ2l0LXJlcG8uZ2l0IGdpdDovL2dpdGh1Yi5jb20vR2Vycml0Q29kZVJldmlldy9naXQtcmVw
by5naXQiCiAKLS0gCjIuNDcuMQoK

--===============6453375471634924443==--

